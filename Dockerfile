# Use the official Odoo 12 image as the base
FROM odoo:12

# Set environment variables with default values if not provided
ENV DB_HOST=${DB_HOST:-"postgres.railway.internal"}
ENV DB_PORT=${DB_PORT:-5432}
ENV DB_USER=${DB_USER:-"postgres"}
ENV DB_PASSWORD=${DB_PASSWORD:-"your_default_password"}
ENV DB_NAME=${DB_NAME:-"railway"}

# Expose Odoo's default port
EXPOSE 8069

# Start Odoo with correctly formatted database parameters
CMD ["bash", "-c", "odoo --db_host=${DB_HOST} --db_port=${DB_PORT} --db_user=${DB_USER} --db_password=${DB_PASSWORD} --db_name=${DB_NAME}"]
