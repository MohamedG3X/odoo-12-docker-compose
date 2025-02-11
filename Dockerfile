# Use the official Odoo 12 image
FROM odoo:12

# Switch to root to set up directories
USER root

# Create and set permissions for extra addons directory
RUN mkdir -p /mnt/extra-addons && chown -R odoo:odoo /mnt/extra-addons

# Switch back to Odoo user
USER odoo

# Set working directory
WORKDIR /var/lib/odoo

# Copy custom addons if any
COPY addons /mnt/extra-addons

# Expose Odoo port
EXPOSE 8069

# Start Odoo with environment variables
CMD ["bash", "-c", "odoo --db_host=$DB_HOST --db_port=$DB_PORT --db_user=$DB_USER --db_password=$DB_PASSWORD --db_name=$DB_NAME"]
