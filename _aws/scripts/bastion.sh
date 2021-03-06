aws ec2 run-instances
    --image-id ami-c1a6bda2
    --key-name dekcrackaws           # the SSH key pair we created earlier
    --security-group-ids sg-xxxxxxxx # our previous SG allowing access to the DB
    --subnet-id subnet-xxxxxxxx      # one of our public subnets
    --count 1
    --instance-type t2.micro         # the smallest instance type allowed
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=bastion}]'

# Add your key to your SSH agent
ssh-add -K dekcrackaws.pem

# Verify that your private key is successfully loaded in your local SSH agent
ssh-add –L

# Use the -A option to enable forwarding of the authentication agent connection
ssh –A ec2-user@<bastion-public-IP-address>

# Once you are connected to the bastion, you can SSH into a private subnet instance
# without copying any SSH key on the bastion
ssh ec2-user@<instance-private-IP-address>
