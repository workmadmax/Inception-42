# Use a penúltima versão do Debian como base
FROM debian:buster

# Instale as dependências necessárias
RUN apt-get update && apt-get install -y nginx openssl

# Crie o diretório para os arquivos de certificado e chave
RUN mkdir -p /etc/nginx/ssl

# Gere um certificado autoassinado
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"

# Copie o arquivo de configuração do NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exponha a porta 443 para o tráfego HTTPS
EXPOSE 443

# Defina as configurações de TLSv1.2 e TLSv1.3 no arquivo de configuração do NGINX
RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.3;/g' /etc/nginx/nginx.conf

# Inicie o NGINX quando o container for iniciado
CMD ["nginx", "-g", "daemon off;"]