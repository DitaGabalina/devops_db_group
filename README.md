# devops_db_group

DevOps kursa lielā mājasdarba pirmkods, DB grupa

Skat. wiki

## Realizējamās komponentes

Serveri (EC2 t3.small Instances):

- Web servers

  - Apache web serveris, PHP un/vai Node.js
  - Pieejams no publiskās vides

- DB serveri

  - divas Cassandra nodes

- Tīkls:
  - Web servera savienojums ar DB serveri

## Izmitināšana

Komponentes izveido ar Terraform iekš AWS mākoņa.
