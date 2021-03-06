
Ad-hoc commands:
----------------
http://docs.ansible.com/ansible/latest/intro_adhoc.html


ansible <pattern_goes_here> -m <module_name> -a <arguments>

pattern:
  - set of groups
  - all | *
  - hostname1.example.com
  - *.example.com
  - one*.com
  - 192.0.100.11
  - 192.0.100.*
  - OR: webservers:dbservers
  - exclude group:  webservers:!backup-site
  - intersection (must be in both groups): webservers:&primary-site
  - regex: ~(web|db).*\example\.com

  webservers:dbservers:&staging:!backup-site
  => all machines in webservers and dbservers group if in group staging but not in group backup-site


Playbook commands:
------------------
ansible-playbook test.yml-ö


Config:
-------
-> first one will be taken, no merging:
* ANSIBLE_CONFIG (an environment variable)
* ansible.cfg (in the current directory)
* .ansible.cfg (in the home directory)
* /etc/ansible/ansible.cfg

  Comments:
  # some basic default values...
  inventory = /etc/ansible/hosts  ; This points to the file that lists your hosts


Role structure:
---------------
roles/
   common/
     files/
     templates/
     tasks/
     handlers/
     vars/
     defaults/
     meta/
   webservers/
     files/
     templates/
     tasks/
     handlers/
     vars/
     defaults/
     meta/
