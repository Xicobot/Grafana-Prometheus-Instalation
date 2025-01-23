# Guide to Install and Use Apache Exporter with `apt install`

## **1. Installing Apache and Apache Exporter**

### **Prerequisites**
1. Make sure you have access to a server running a Debian/Ubuntu-based distribution.
2. Update the system to ensure all packages are up to date:
   ```bash
   apt update && sudo apt upgrade -y
   ```

### **Installing Apache**
If Apache is not installed:
   ```bash
   apt install apache2 -y
   ```

Start and enable Apache to run automatically:
   ```bash
   systemctl start apache2
   systemctl enable apache2
   ```

### **Installing Apache Exporter**
Install the `apache-exporter` package from the available repositories:
   ```bash
   apt install prometheus-apache-exporter -y
   ```

---

## **2. Configuring Apache for Apache Exporter**

### **Enable the Apache Status Module**
1. Enable the Apache status module:
   ```bash
   a2enmod status
   systemctl restart apache2
   ```

2. Configure the Apache status file:
   Edit the main Apache configuration file or your virtual host configuration file (default: `/etc/apache2/sites-available/000-default.conf`):
   ```bash
   nano /etc/apache2/sites-available/000-default.conf
   ```

   Add the following inside the `<VirtualHost *:80>` block:
   ```apache
   <Location "/server-status">
       SetHandler server-status
       Require all granted
   </Location>
   ```

   Save the file and restart Apache:
   ```bash
   systemctl restart apache2
   ```

3. Verify that the status module is working:
   ```bash
   curl http://localhost/server-status?auto
   ```

---

## **3. Configuring Apache Exporter**

1. Verify that the service is active:
   ```bash
   systemctl status prometheus-apache-exporter
   ```

2. By default, Apache Exporter will be listening on `:9117`. To verify, run:
   ```bash
   curl http://localhost:9117/metrics
   ```

3. If additional parameters need to be configured, you can edit the service file at `/etc/default/prometheus-apache-exporter` (if it exists) or configure it directly.

---

## **4. Stress Testing Apache to Generate Metric Peaks**

### **Using Apache Benchmark (ab)**

1. Install Apache Benchmark:
   ```bash
   apt install apache2-utils -y
   ```

2. Perform a load test on your server:
   ```bash
   ab -n 10000 -c 100 http://localhost/
   ```
   - `-n 10000`: Total number of requests.
   - `-c 100`: Number of concurrent requests.

3. This will generate load on the server, and you should see an increase in Apache Exporter metrics (accessible at `http://localhost:9117/metrics`).

### **Using Siege**

1. Install Siege:
   ```bash
   apt install siege -y
   ```

2. Simulate load on your server:
   ```bash
   siege -c 50 -t 1m http://localhost/
   ```
   - `-c 50`: Number of concurrent users.
   - `-t 1m`: Test duration (1 minute).

---

## **5. Viewing Metrics in Apache Exporter**

Open in your browser:
   ```bash
   http://<your-server>:9117/metrics
   ```

Look for metrics such as:
- `apache_up`: Server status.
- `apache_requests_total`: Total requests.
- `apache_scoreboard`: Apache process states.
- `apache_cpu_load`: CPU load.

---

With this, you will have installed Apache Exporter, configured Apache to expose metrics, and generated activity spikes to visualize them. You can integrate these metrics into tools like Prometheus or Grafana for better monitoring and visibility.
