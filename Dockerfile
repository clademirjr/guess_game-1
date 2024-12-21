FROM python:3.10-slim

WORKDIR /app

# Instalar dependências do sistema (se necessário)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar requirements.txt e instalar dependências Python
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copiar a aplicação para o contêiner
COPY . /app

# Garantir que o Flask aceite conexões externas, ajustando o comando de execução
# Alterado para 0.0.0.0 para permitir conexões de fora do contêiner (NGINX)
CMD ["python", "run.py", "--host=0.0.0.0", "--port=5000"]
