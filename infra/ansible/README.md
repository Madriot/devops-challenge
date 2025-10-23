#### Description

A collection of playbooks that install all necessary tools on the management VM and configure a Github Actions self-hosted agent.

#### Prerequisites

- ansible-playbooks
- asnible-vault
- jmespath

#### Provisioned tools

- Kubectl
- Helm
- Terraform
- Azure CLI
- Podman
- Github Actions self-hosted agent

#### How to run

```
cd infra/ansible

ansible-playbook -i hosts.ini main.yml 
```

#### Security consideration

For security reasons, the hosts.ini file is not included in this public repository. If you plan to use this code, please create your own hosts.ini file (see hosts.ini.example).

The `vault.yml` stores all secrets required by the playbooks. **Do not commit this file unencrypted**, or your secrets may be exposed. Even if encrypted, storing this file in a public repository poses a high risk. Ensure you use a strong, secure password.