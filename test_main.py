import pytest
from app import app  # Ensure this is correct

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    response = client.get('/')
    assert response.data == b"Hello, Jenkins Pipeline!"
    assert response.status_code == 200
