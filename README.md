# group5_acs730_project

Final Project Group05: Two-Tier web application automation with Terraform
******************************
Objective of the Project:
*****************************
This project aims to evaluate our abilities in using source control, deployment automation, and configuration management technologies to build a two-tier static web application hosting and configuration solution.
This Project was given to us by the Professor Irina Geiman to tests our knowledgebase of Terraform in addition to our familiarity with load balancers and autoscaling groups in scalable cloud architecture, AWS identity and access management, and effective use of source control and GitHub Actions to automate security scanning.
******************************
Pre-Requiremnets:
****************************
Step 1:

You need to clone the repository to your local Cloud 9 Enviormnet.

Command: git clone git@github.com:amandhal/group5_acs730_project.git

Step:2

After this you need to create 3 keys for your 3 enviornments (Dev>Staging>Prod)

Follow the steps:

1: First go the .ssh folder 

Command: cd ~/.ssh

2: Key generation for 3 seprate enviorments

Command:

ssh-keygen -t rsa Group-No-5-dev

ssh-keygen -t rsa Group-No-5-staging

ssh-keygen -t rsa Group-No-5-prod

Step3:

Go into AWS portal in search bar type "S3" and create 3 buckets there name should be as follows:


prod-group05-finalproject

dev-group05-finalproject

staging-group05-finalproject

In the each s3 bucket you need to creat a folder with name of "images" and upload 4 images with name as follows:

safeer.jpeg

aman.jpeg

akash.jpeg

amih.jpg

Note:

If you are unable to create bucket succesfully if the name is already taken:

you can create 3 buckets with any name you need update  config.tf file Infrastrucure section this is the directory hirechay:

group5_acs730_project>>Infrastructure>>Prod>>Network-01

group5_acs730_project>>Infrastructure>>Prod>>WebServer-01

group5_acs730_project>>Infrastructure>>dev>>Network-01

group5_acs730_project>>Infrastructure>>dev>>WebServer-01

group5_acs730_project>>Infrastructure>>stagging>>Network-01

group5_acs730_project>>Infrastructure>>stagging>>WebServer-01


If you do not want to update the images you need to replace the images name in http script with your respective images name in "install_httpd.sh"


*********************
Infrastructure Deployment
*********************

Before deploying we are going to define the Alias of terraform = tf for this you need to follow the below command:

sudo vi ~/.bashrc
	
	hit insert key or "i"
	
	Then type "tf=terraform"
	
	Hit "ESC" key and then type "wq!" and hit enter
		
After doing this we don't have type terraform again and again.

In order to deploy the infrastructure succesfully kindly follow the below  execution flow

Step1: Deploying the Dev Enviormnet

a) Network Infrastructure
	1)Open terminal ../group5_acs730_project/Infrastructure/dev/Network-01
	
	2) tf init
	
	3) tf fmt
	
	4) tf plan
		
	5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
b) Web-Server Provioning 
		
		1)Open terminal ../group5_acs730_project/Infrastructure/dev/WebServer-01
		
		2) tf init
		
		3) tf fmt
		
		4) tf plan
		
		5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
Step2: Deploying the Staging Enviormnet

a) Network Infrastructure
		
		1)Open terminal ../group5_acs730_project/Infrastructure/Staging/Network-01
		
		2) tf init
		
		3) tf fmt
		
		4) tf plan
		
		5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
b) Web-Server Provioning 
		
		1)Open terminal ../group5_acs730_project/Infrastructure/Staging/WebServer-01
		
		2) tf init
		
		3) tf fmt
		
		4) tf plan
		
		5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
		
Step3: Deploying the prod Enviormnet

a) Network Infrastructure

		1)Open terminal ../group5_acs730_project/Infrastructure/prod/Network-01
		
		2) tf init
		
		3) tf fmt
		
		4) tf plan
		
		5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
b) Web-Server Provioning 

		1)Open terminal ../group5_acs730_project/Infrastructure/prod/WebServer-01
		
		2) tf init
		
		3) tf fmt
		
		4) tf plan
		
		5) tf apply and then type 'yes' or you can tf apply --auto-approve
		
All Servers form different enviorments have been succesfully deployed

*****************************
Destruction Proccess
*****************************


Step1: Destroying the Dev Enviormnet

a) Network Infrastructure

		1)Open terminal ../group5_acs730_project/Infrastructure/dev/Network-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		
		
b) Web-Server De-Provioning  

		1)Open terminal ../group5_acs730_project/Infrastructure/dev/WebServer-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		

Step2: Destroying the staging Enviormnet

a) Network Infrastructure

		1)Open terminal ../group5_acs730_project/Infrastructure/staging/Network-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		
b) Web-Server De-Provioning  

		1)Open terminal ../group5_acs730_project/Infrastructure/staging/WebServer-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		

Step2: Destroying the prod Enviormnet

a) Network Infrastructure

		1)Open terminal ../group5_acs730_project/Infrastructure/prod/Network-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		
		
b) Web-Server De-Provioning 

		1)Open terminal ../group5_acs730_project/Infrastructure/prod/WebServer-01
		
		2) tf destroy and then type 'yes' or you can tf destroy --auto-approve
		
		
Kindly contact us we are loved to answer your querries.

csahmad@myseneca.ca
amdungrani@myseneca.ca
asingla7@myseneca.ca
adhal@myseneca.ca

Team Flowrs:)
