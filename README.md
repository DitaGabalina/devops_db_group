# devops_db_group
DevOps kursa lielā mājasdarba pirmkods, DB grupa

# Realizējamās komponentes
Serveri (EC2 Instances):
- Web servers
-- TODO Apspriest kādu web serveri izvēlamies, Apache, vai kādu citu - Django, u.c. idejas, labi būtu ja kādam pieredze kaut neliela ar konkrēto platformu
-- TODO Apspriest, iespējams pat varētu likt 2 web serverus, lai uzstādītu load balancer
- DB Serveris
-- TODO Apspriest vai tas ir MySQL, PostgreSQL vai kāds cits variants. Iespējams iet koā ar izvēli par Web serveri.

Tīkls:
- Piekļuve Load Balancer vai web serverim no ārpuses
- Web servera savienojums ar DB serveri
