#!/bin/bash
if [ -e /etc/httpd ]; then
  exit 0                   
fi   
yum -y install httpd mod_ssl                                                              # Install apache and SSL support
systemctl start httpd                                                                     # Start apache
sed -i 's/^/#/g' /etc/httpd/conf.d/welcome.conf                                           # Comment out the default welcome page
echo "<html><body><h1>Hi there NTI 300</h1></body></html>" > /var/www/html/index.html     # Create custom welcome page
systemctl restart httpd                                                                   # Restart apache so our changes take effect
