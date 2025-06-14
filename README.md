
powerdns-docker
===============

Deploy a full PowerDNS setup effortlessly! This Docker Compose configuration spins up the PowerDNS Authoritative Server and PowerDNS-Admin with a MySQL backend — all in one simple, streamlined package.

* * *

Prerequisites
-------------

*   **Docker** and **Docker Compose** installed on your system.
*   If you want to use port `53` (the standard DNS port) on your host machine, make sure to **disable any local DNS resolver** such as `systemd-resolved` or `dnsmasq` to avoid port conflicts.

### To disable `systemd-resolved` on Ubuntu:

    sudo systemctl disable systemd-resolved --now
    sudo systemctl stop systemd-resolved


### To disable `dnsmasq`:

    sudo systemctl disable dnsmasq --now
    sudo systemctl stop dnsmasq


* * *

Getting Started
---------------

### 1\. Create a `.env` file

In the project directory, create a `.env` file with the following content. Customize passwords and API keys as needed:

    PDNS_DB_HOST=database
    PDNS_DB_USER=powerdns-auth
    PDNS_DB_PASS=yourpassword
    PDNS_DB_NAME=powerdns-auth
    PDNS_API_KEY=supersecretapikey

    ADMIN_DB_USER=pda
    ADMIN_DB_PASS=yourpassword
    ADMIN_DB_NAME=pda

    MYSQL_EXTERNAL_PORT=3306


### 2\. Start the containers

Run this command to start all services in detached mode:

    docker compose up -d


### 3\. Access the PowerDNS-Admin UI

Open your browser and go to:

    http://<server-ip>:9191


### 4\. Create the admin account

*   The first user you create in the UI will become the admin.
*   Follow the on-screen prompts to complete the admin account setup.

### 5\. Connect PowerDNS-Admin to the PowerDNS Authoritative API

In PowerDNS-Admin settings, configure the connection to the authoritative server API at:

    http://auth:8081


Use the API key you defined in the `.env` file (`supersecretapikey` by default).
And set the version to be PowerDNS Authoritative Server version: **4.7.3**

* * *

You’re now ready to manage your DNS zones with this streamlined PowerDNS Docker setup!

**Enjoy managing your DNS!**
