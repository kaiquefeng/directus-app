FROM directus/directus:11.3.5

# Primeiro executamos comandos que precisam de privilégios root
USER root

# Instala dependências para PostgreSQL
RUN apk add --no-cache postgresql-client

# Cria diretórios necessários
RUN mkdir -p /directus/uploads \
    /directus/extensions

# Define as permissões
RUN chown -R node:node /directus/uploads \
    /directus/extensions

# Depois mudamos para o usuário node
USER node

# Expõe a porta
EXPOSE 8055

# Script de inicialização
COPY --chown=node:node docker-entrypoint.sh /directus/
RUN chmod +x /directus/docker-entrypoint.sh

# Comando para iniciar o Directus
ENTRYPOINT ["/directus/docker-entrypoint.sh"] 