# Grafana-Prometheus-Instalation

This document describes how to install and configure Prometheus and Grafana on a Debian/Ubuntu-based system.

## Prerequisites

- A Debian/Ubuntu-based system.
- Access to an account with administrative privileges.
- Internet connection.

---

## Installing Prometheus

1. **Update system repositories**:

   ```bash
   apt update
   apt upgrade -y
   ```

2. **Install Prometheus**:

   Run the following command to install Prometheus from the official repositories:

   ```bash
   apt install prometheus -y
   ```

3. **Verify Prometheus status**:

   Ensure the service is active and running:

   ```bash
   systemctl status prometheus
   ```

   If it is not active, you can start it with:

   ```bash
   systemctl start prometheus
   ```

4. **Enable auto-start**:

   ```bash
   sudo systemctl enable prometheus
   ```

5. **Configuration files**:

   The main configuration file is located at:

   ```
   /etc/prometheus/prometheus.yml
   ```

   You can edit it to add custom monitoring targets:

   ```bash
   nano /etc/prometheus/prometheus.yml
   ```

6. **Access Prometheus web interface**:

   The web interface will be available at:

   ```
   http://<SERVER_IP>:9090
   ```

---

## Installing Grafana

1. **Add Grafana repository**:

   Import the GPG key and add the official repository:

   ```bash
   apt install -y software-properties-common
   wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
   echo "deb https://packages.grafana.com/oss/deb stable main" | tee /etc/apt/sources.list.d/grafana.list
   ```

2. **Update repositories and install Grafana**:

   ```bash
   apt update
   apt install grafana -y
   ```

3. **Start Grafana service**:

   ```bash
   systemctl start grafana-server
   ```

4. **Enable auto-start**:

   ```bash
   systemctl enable grafana-server
   ```

5. **Access Grafana web interface**:

   The web interface will be available at:

   ```
   http://<SERVER_IP>:3000
   ```

   Default credentials are:
   - Username: `admin`
   - Password: `admin`

   You will be prompted to change the password upon first login.

---

## Initial Configuration

### Configuring Prometheus in Grafana

1. Log in to the Grafana interface.
2. Go to **Configuration > Data Sources**.
3. Click **Add data source**.
4. Select **Prometheus**.
5. Set the Prometheus URL:

   ```
   http://<SERVER_IP>:9090
   ```

6. Click **Save & Test** to verify the connection.

### Creating Dashboards

1. Go to **Create > Dashboard**.
2. Add a new panel and select metrics from Prometheus.
3. Customize your graphs as needed.
4. The code for the Grafana dashboard, which extracts the metrics, is as follows:1860


---

## Additional Notes
- **Scripts**: Also, i've created a script to automatice this process, check it out [here!](/scripts) (You must be with administrative privileges.)
- **Security**: Configure firewalls and authentication to secure your services.
- **Official Documentation**:
  - [Prometheus](https://prometheus.io/docs/)
  - [Grafana](https://grafana.com/docs/)

---

You are all set! Prometheus and Grafana are now installed and configured on your server.
