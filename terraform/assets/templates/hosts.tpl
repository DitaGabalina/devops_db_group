[servers]
%{ for dns in servers ~}
${dns}
%{ endfor ~}

