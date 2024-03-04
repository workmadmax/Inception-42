# Use a penúltima versão do Debian como base
FROM debian:buster

# Instale as dependências necessárias
RUN apt-get update && apt-get install -y nginx

# Copie o arquivo de configuração do NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exponha a porta 80 para o tráfego HTTP
EXPOSE 80

# Exponha a porta 443 para o tráfego HTTPS
EXPOSE 443

# Defina as configurações de TLSv1.2 e TLSv1.3 no arquivo de configuração do NGINX
RUN sed -i 's/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/g' /etc/nginx/nginx.conf

# Inicie o NGINX quando o container for iniciado
CMD ["nginx", "-g", "daemon off;"]