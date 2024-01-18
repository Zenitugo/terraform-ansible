#!/bin/bash

name=$(hostname)
ip=$(hostname -i)

echo -e "<h1>Deployed with Tearraform</h1>
      <h2>Automated with Ansible</h2>

      <p>Welcome to $name server with $ip address</p>" > /home/ubuntu/index.html.j2