FROM odoo:17.0

USER root
ARG ODOO_ADMIN_PASSWORD
ARG POSTGRES_PASSWORD

RUN pip3 install num2words xlwt
RUN mkdir -p /etc/odoo /mnt/extra-addons /var/lib/odoo/filestore

# Create a clean config that points to the 'db' container
RUN echo "[options]" > /etc/odoo/odoo.conf && \
    echo "addons_path = /usr/lib/python3/dist-packages/odoo/addons,/mnt/extra-addons" >> /etc/odoo/odoo.conf && \
    echo "data_dir = /var/lib/odoo" >> /etc/odoo/odoo.conf && \
    echo "db_host = db" >> /etc/odoo/odoo.conf && \
    echo "db_user = odoo" >> /etc/odoo/odoo.conf && \
    echo "db_password = ${POSTGRES_PASSWORD}" >> /etc/odoo/odoo.conf && \
    echo "admin_passwd = ${ODOO_ADMIN_PASSWORD}" >> /etc/odoo/odoo.conf

RUN chown -R odoo:odoo /etc/odoo /mnt/extra-addons 
RUN chmod 755 /etc/odoo /mnt/extra-addons /var/lib/odoo/filestore

USER odoo