# Ansible playbook to install Elasticsearch on CentOS 7

## Install Ansible

First off, create a new virtual Python 2.7 environment to install Ansible and
dependencies in by running the following command:

```
$ virtualenv venv
```

Then, activate the environment by running:

``` 
$ source venv/bin/activate
```

Then, use pip to install Ansible and dependencies:

```
$ pip install -r requirements.txt
```

Then lastly, run `ansible --version` to confirm that Ansible is installed
correctly.

## Create the inventory file

Copy the `hosts` file in the `inventory/development` folder into a new
subfolder in the `inventory` folder.

Open up the file with your favourite text editor and change the three lines
starting with IP addresses. Add or remove lines as needed to fit your
collection of hosts.

Change the `ansible_user` and `ansible_private_key_file` as needed.
If your SSH key is already on the remote host, then you can remove the
`ansible_private_key_file`. Same goes for `ansible_user`, if you have a
matching user on the remote host.

## Run the playbook

```
$ ansible-playbook -i inventory/development playbook.yml
```

This installs Oracle Java JRE and Elasticsearch.
