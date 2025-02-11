# Use the official Odoo 12 image as the base
FROM odoo:12

# Set environment variables (Railway will override them at runtime)
ENV DB_HOST="postgres.railway.internal"
ENV DB_PORT="5432"
ENV DB_USER="BFC"
ENV DB_PASSWORD="LOLO12lolo"

# Expose Odoo's default port
EXPOSE 8069

# Start Odoo correctly (without --db_name)
CMD ["bash", "-c", "odoo --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD"]
