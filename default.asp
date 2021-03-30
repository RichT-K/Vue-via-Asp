<script runat="server" language="javascript">
    var url = String(Request.ServerVariables("HTTP_X_ORIGINAL_URL"));
    if(url.indexOf("/components/")==0){
        Server.Transfer("/components/default.asp");
    }
    TryAsVueApp( url );
    Home(url, Request);

    function TryAsVueApp( path ){
        if( path.indexOf("/VUE:")  != 0 ){
            return;
        }
        var appName = path.substr(1).split("/")[0].split(":")[1];
        var jApplications = {
            "ProofOfConcept":"/Applications/ProofOfConcept.asp"
        }
        if( !jApplications[appName] ){
            return;
        }
        Server.Transfer(jApplications[appName]);
        return;
    }
</script>
<script runat="server" language="javascript">
    function Home(path, Request){
        Response.Write("<br>HTTP_X_ORIGINAL_URL:"+ path.replace(/\&/g,"&amp;"));
        Response.Write("<br>Request.QueryString:"+String(Request.QueryString()).replace(/\&/g,"&amp;"));

        Response.Write("<hr><br>200 Links:");
        Response.Write("<br><a href='/'>/ (Home)</a>");
        Response.Write("<br><a href='/components'>/components</a>");
        Response.Write("<hr><br>404 Links:");
        Response.Write("<br><a href='/test'>/test</a>");
        Response.Write("<br><a href='/test?parameter-1=A&amp;parameter-2=B'>/test?parameter-1=A&amp;parameter-2=B</a>");
    }
</script>

