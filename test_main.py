import pytest
from app import app  # This should work after fixing the __init__.py import

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.data == b"Hello, Jenkins Pipeline!"
    assert response.status_code == 200
