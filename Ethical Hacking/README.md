The install script will install some tools that we will use in the course - some of them may change though.

### One liners:
Curl: `curl https://raw.githubusercontent.com/d0txecute/Cybersecurity-Club/main/Ethical%20Hacking/install.sh | sudo bash`
Bash: `wget curl https://raw.githubusercontent.com/d0txecute/Cybersecurity-Club/main/Ethical%20Hacking/install.sh | sudo bash`

### OpenVAS
Install Guide: https://immauss.github.io/openvas/

Default username: admin
Default Password (Change this): password123
Default port: 8880

To access the web interface:
Run: `docker run openvas`
Goto: https://127.0.0.1:8880

To Update: `docker restart openvas`
