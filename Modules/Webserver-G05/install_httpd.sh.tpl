#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo aws s3 cp s3://${env}-group05-finalproject/images/safeer.jpeg /var/www/html 
sudo aws s3 cp s3://${env}-group05-finalproject/images/aman.jpeg /var/www/html 
sudo aws s3 cp s3://${env}-group05-finalproject/images/akash.jpeg /var/www/html 
sudo aws s3 cp s3://${env}-group05-finalproject/images/amish.jpg /var/www/html 


echo "<html>
  <head>
<title>TerraformCI-CD</title>
 </head>
 <body>
<center>
    <h1>Created by Group05</h1>
</center>

<table border="5" bordercolor="grey" align="center">
    <tr>
        <th colspan="3">Irina Geiman</th> 
    </tr>
    <tr>
        <th>Group05</th>
        <th>Our private IP is $myip</th>
            
    </tr>
    <tr>
        <td><img src="safeer.jpeg" alt="safeer" border=3 height=200 width=300></img></th>
        <td><img src="aman.jpeg" alt="aman" border=3 height=200 width=300></img></th>

    </tr>
    <tr>
        <td>><img src="amish.jpg" alt="amish" border=3 height=200 width=300></img></th>
        <td><img src="akash.jpeg" alt="akash" border=3 height=200 width=300></img></th>

    </tr>
</table>
  </body>
  <html>" > /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd