FROM directus/directus:11.3.5

# Primeiro executamos comandos que precisam de privilégios root
USER root

# Instala dependências adicionais se necessário
RUN apk add --no-cache sqlite

# Cria diretórios necessários
RUN mkdir -p /directus/database \
    /directus/uploads \
    /directus/extensions

# Define as permissões
RUN chown -R node:node /directus/database \
    /directus/uploads \
    /directus/extensions

# Depois mudamos para o usuário node
USER node

# Expõe a porta
EXPOSE 8055

# Define as variáveis de ambiente padrão
ENV DB_CLIENT="sqlite3" \
    DB_FILENAME="/directus/database/data.db" \
    WEBSOCKETS_ENABLED="true"

# Script de inicialização
COPY --chown=node:node docker-entrypoint.sh /directus/
RUN chmod +x /directus/docker-entrypoint.sh

# Comando para iniciar o Directus
ENTRYPOINT ["/directus/docker-entrypoint.sh"] 