# Single deployment
eb create -db.engine postgres -db.i db.t2.micro -db.user joinify-user --envvars SECRET_KEY_BASE=shDFG23JHK --single joinify-demo

# Deployment with load balancer -- m4.2xlarge DB + c3.large appserver

eb create -db.engine postgres -db.i db.m4.2xlarge -db.user joinifyuser --envvars SECRET_KEY_BASE=shDFG23JHK -i m3.medium joinify-lb

db password: blahblah

# Tsung template link
https://cs291.s3.amazonaws.com/Tsung.json

# Copy tsung xml file to tsung server
scp -i ../joinify.pem joinify.xml ec2-user@35.163.22.185:~

# Run tsung test
tsung -f joinify_10x.xml -k start

# Rsync command to save tsung logs
rsync -auve 'ssh -i joinify.pem' ec2-user@35.163.22.185:.tsung/log/ .

ssh -i joinify.pem ec2-user@35.163.22.185
# Delete all event rows
Event.destroy_all

# Tsung template link
https://cs291.s3.amazonaws.com/Tsung.json

# Reset unique id for events table
ActiveRecord::Base.connection.reset_pk_sequence!('comments')

1) single app server no load balancer
2) 4 app servers
3) 8 app servers

Optomization

1) single app server no load balancer
2) 4 app servers
3) 8 app servers
