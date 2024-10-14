# Create a directory `ansible` in /etc/ directory
 - `cd /etc/`
 - `mkdir ansible`
 - `cd ansible`

- Create `ansible.cfg` and `host` files. Add their respective contents

# Test connection
 - `sudo ansible -m ping all` OR `sudo ansible -m ping webservers`


# To run the test.yaml playbook, run:
 - `sudo ansible-playbook test.yaml -kK`

# For dry run, use:
 - `sudo ansible-playbook test.yaml -kK --check`

# To check playbook syntax, run:
 - `sudo ansible-playbook test.yaml -kK --syntax-check`

# To check playbook changes on dry run:
 - `sudo ansible-playbook test.yaml -kK --check --diff`