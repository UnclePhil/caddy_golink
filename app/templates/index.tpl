<html>
<head> 
    <title>GOLinks</title> 
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div id="header">    
            <H1>GOLinks</H1>
        </div>
        <div id="redir">    
            <ul>
                {{range . }}
                <li class="link"><a href="./{{.F}}" target="_blank">./{{.F}}</a> to {{.T}}</li>
                {{end}}
            </ul>
        </div>
        <div id="footer">
            <p>Made with <3 by UnclePhil</p>
        </div>
    </div>
</body> 
</html>