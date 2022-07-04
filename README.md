# devops_db_group

DevOps kursa lielā mājasdarba pirmkods, DB grupa

Skat. [wiki](https://github.com/DitaGabalina/devops_db_group/wiki)

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

Komponentes izveido ar Terraform iekš AWS mākoņa. Lai konfigurētu terraform izmantošanu Jūsu projakta vajadzībām, jāveic tā konfigurēšana, 
* norādot jūsu AWS atslēgu, reģionu un pieejamības zonas datnē terraform.tfvars. Iespējams pielāgot arī izveiojamo instanču veidu.
* ģenerējot ssh atslēgas un to ielādēšanas skriptu

Skat. [Terraform startēšanas pielāgošana](https://github.com/DitaGabalina/devops_db_group/wiki/Terraform-start%C4%93%C5%A1anas-piel%C4%81go%C5%A1ana)
