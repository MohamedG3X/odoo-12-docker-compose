# Use Odoo 12 official image
FROM odoo:12

# Ensure the addons directory exists before changing ownership
RUN mkdir -p /mnt/extra-addons

# Set proper ownership
USER root
RUN chown -R odoo /mnt/extra-addons

# Switch back to Odoo user
USER odoo

# Set the working directory
WORKDIR /var/lib/odoo

# Copy custom addons (if any)
COPY addons /mnt/extra-addons

# Expose Odoo port
EXPOSE 8069

# Start Odoo with correct database variables (Shell format for env expansion)
CMD odoo --db_host="$DB_HOST" --db_port="$DB_PORT" --db_user="$DB_USER" --db_password="$DB_PASSWORD" --db_name="$DB_NAME"

