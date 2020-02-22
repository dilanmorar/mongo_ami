# mongo_ami

TODO: Enter the cookbook description here.

This cookbook was created in the aim of creating an image with mongodb installed on it.

## Cookbook
This cookbook was created using chef `chef generate cookbook mongo_ami` to have mongo installed. It also contains a Berksfile which has the chef supermarket and the metadata and is used to manage the dependencies of the cookbook and a berks-cookbooks `berks vendor`. It also has a mongod.conf to have a bindIp as 0.0.0.0 and port 27017.

## Packer
Packer is used to create immutable images of our machines. I used packer to create an AMI in AWS. I specified the configuration of this in the packer.json.

## Building the image
You first need to create an image. To do this when in the mongo_ami folder, in the command line type:
```
packer build packer.json
```
