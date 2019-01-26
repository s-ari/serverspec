# Run serverspec

```
rake spec list=<SERVERS_LIST>.yml user=<SSH_USER> key_file=<SSH_KEY>
```

* Sample of a <SERVERS_LIST>.yml

```
server01:
  :ip_address: 10.0.0.28
  :roles:
    - print
    - dns
    - docker
  :server_id: 101
  :test_vars: vars
```


* Directory structure

```
serverspec/
|-- README.md
|-- Rakefile
|-- Rakefile.org
|-- list.yml
`-- spec
    |-- dns      # Roles of spce files
    |   `-- dns_spec.rb
    |-- docker
    |   `-- docker_spec.rb
    |-- print
    |   `-- print_spec.rb
    |-- spec_helper.rb
    `-- spec_helper.rb.org
```
