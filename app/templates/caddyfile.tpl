# ---------------------------------------------
# GENERATED FILE 
# DO NOT EDIT
# ---------------------------------------------
{
    email koenigphil@gmail.com
    log {
        output stdout
    }
} 
go {
    root * /srv
    tls koenigphil@gmail.com
    
## Redirection
{{range . }}
    redir /{{.F}} {{.T}}
{{end}}

}
## END OF GENERATION