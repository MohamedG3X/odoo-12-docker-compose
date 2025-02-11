# Use Odoo 12 official image
FROM odoo:12

# Set the working directory
WORKDIR /var/lib/odoo

# Copy custom addons (if any)
COPY addons /mnt/extra-addons

# Set proper permissions
RUN chown -R odoo /mnt/extra-addons

# Expose Odoo port
EXPOSE 8069

# Start Odoo
CMD ["odoo", "--db_host=$ODOO_DB_HOST", "--db_user=$ODOO_DB_USER", "--db_password=$ODOO_DB_PASS"]
