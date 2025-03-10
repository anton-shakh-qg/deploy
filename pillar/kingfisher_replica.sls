prometheus:
  node_exporter:
    smartmon: True

vm:
  nr_hugepages: 8325

postgres:
  public_access: True
  version: 11
  configuration: kingfisher-replica1
  backup:
    configuration: kingfisher-replica1
    process_max: 6
  replication:
    primary_slot_name: replica1

ssh:
  postgres:
    # Allow kingfisher-process1 connect to take PostgreSQL backups.
    - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ6FdpCTb9AL7OXNm3XFO1db1fd2EtnXmWruTIeFjgvp7EzJidH0DdBmhjPaNLiIIgEReoHj5ibb2GYhCR1jGLGGEXhuvv/7UtFI9sbwCtlDsxMZFQSGCBNuZIHDexXKx3OwvtysTYDytwy8PbfeZwD5pOR+LvmGC8Abs95cacwMWW7D5uHU3sgbit+hS1KgDWII1EIuYztcVMvkfQeyl827pdtEzgz8tRWJLwQ9YXQbC/xXdA3AJQE6dcGBtemP4M0Hv97U2bPnROHcXlLkNGYhNoBz3AFB0Q/p0UvOPJ9T3GHHsxwrrrlow8lhJZWGnjAdbyuFRHAA3eqDPRy9NL

firewall:
  additional_ssh_ipv4:
    # Allow kingfisher-process1 connect to take PostgreSQL backups.
    - 95.217.76.74
  additional_ssh_ipv6:
    # Allow kingfisher-process1 connect to take PostgreSQL backups.
    - 2a01:4f9:4a:1bd3::2
