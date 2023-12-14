import requests

# Definindo os endpoints
BASE_URL = "http://localhost:8000"
CLIENTES_ENDPOINT = "api/clientes/"
TOKEN_ENDPOINT = "api/clientes/token/"
LOGOUT_ENDPOINT = "api/clientes/logout/"

class APIRequester:
    def __init__(self):
        self.base_url = BASE_URL

    def get_all_clientes(self):
        endpoint = CLIENTES_ENDPOINT
        return self.get(endpoint)

    def create_cliente(self, data):
        endpoint = CLIENTES_ENDPOINT
        return self.post(endpoint, json=data)

    def get_cliente(self, pk):
        endpoint = f"{CLIENTES_ENDPOINT}{pk}/"
        return self.get(endpoint)

    def update_cliente(self, pk, data):
        endpoint = f"{CLIENTES_ENDPOINT}{pk}/"
        return self.put(endpoint, json=data)

    def delete_cliente(self, pk):
        endpoint = f"{CLIENTES_ENDPOINT}{pk}/"
        return self.delete(endpoint)

    def login(self, data):
        endpoint = TOKEN_ENDPOINT
        return self.post(endpoint, json=data)

    def logout(self, data):
        endpoint = LOGOUT_ENDPOINT
        return self.post(endpoint, json=data)

# ------------------------------- Essas de baixo não importam ------------------------------- #

    def get(self, endpoint, params=None):
        url = f"{self.base_url}/{endpoint}"
        response = requests.get(url, params=params)
        return response.json() if response.ok else None

    def post(self, endpoint, data=None, json=None):
        url = f"{self.base_url}/{endpoint}"
        response = requests.post(url, data=data, json=json)
        return response.json() if response.ok else None

    def put(self, endpoint, data=None, json=None):
        url = f"{self.base_url}/{endpoint}"
        response = requests.put(url, data=data, json=json)
        return response.json() if response.ok else None

    def delete(self, endpoint):
        url = f"{self.base_url}/{endpoint}"
        response = requests.delete(url)
        return response.ok

# Corpos de requisição
novo_cliente_data = {
    "id": 1,
    "nome": "João Silva",
    "email": "joao@example.com",
    "password": "senhasecreta",
    "rg": "123456",
    "cpf": "78901234567",
    "data_nascimento": "1990-01-01",
    "cep": "12345-678",
    "endereco": "Rua Principal",
    "numero_casa": "123",
    "cidade": "Cidade",
    "bairro": "Bairro",
    "telefone": "987654321"
}

update_data = {"nome": "João Silva Atualizado"}

login_data = {
    "email": "joao@example.com",
    "password": "senhasecreta"
}

logout_data = {"refresh_token": "seu_refresh_token"}

def main():
    requester = APIRequester()

    # Exemplo de uso:
    
    # GET de todos os clientes
    all_clientes = requester.get_all_clientes()
    if all_clientes:
        print("\nTodos os clientes:", all_clientes)

    # POST para criar um cliente
    created_cliente = requester.create_cliente(novo_cliente_data)
    if created_cliente:
        print("\nCliente criado:", created_cliente)

    # GET, PUT e DELETE em um cliente específico
    cliente_id = 1
    cliente_info = requester.get_cliente(cliente_id)
    if cliente_info:
        print(f"\nInformações do cliente {cliente_id}:", cliente_info)

    # Atualizar informações do cliente
    updated_cliente = requester.update_cliente(cliente_id, update_data)
    if updated_cliente:
        print(f"\nCliente {cliente_id} atualizado:", updated_cliente)
        
    
    # POST de login
    login_response = requester.login(login_data)
    if login_response and "refresh_token" in login_response:
        refresh_token = login_response["refresh_token"]
        print("\nResposta do login:", login_response)
        print(f"Refresh Token armazenado: {refresh_token}")

        # POST de logout usando o refresh_token armazenado
        logout_data["refresh_token"] = refresh_token
        logout_response = requester.logout(logout_data)
        if logout_response:
            print("\nResposta do logout:", logout_response)
    else:
        print("\nFalha no login. Não foi possível obter o refresh_token.")

    # Excluir o cliente
    deleted = requester.delete_cliente(cliente_id)
    if deleted:
        print(f"\nCliente {cliente_id} excluído com sucesso.")

if __name__ == "__main__":
    main()
