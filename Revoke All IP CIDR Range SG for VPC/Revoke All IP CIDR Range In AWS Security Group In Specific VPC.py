import json
import boto3

def lambda_handler(event, context):
    ec2 = boto3.resource('ec2')
    vpc = ec2.Vpc("vpc-06a3d8f2cdafb8a6e")
    open_ingress_cidr = ['0.0.0.0/0' , '::/0']
    security_groups = vpc.security_groups.all()
    for group in security_groups:
        print(group.id)
        for rule in group.ip_permissions:
            print(rule)
            if rule['IpRanges']:
                for i in rule['IpRanges']:
                    if i['CidrIp'] in open_ingress_cidr:
                        group.revoke_ingress(IpPermissions=[rule])
