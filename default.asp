<script runat="server" language="javascript">
    Response.Write('<meta charset="utf-8" />');
    var url = String(Request.ServerVariables("HTTP_X_ORIGINAL_URL"));
    TryAsVue( url );
    Home();

    function TryAsVue( url ){
        if( url.indexOf("/VUE:")  != 0 ){
            return;
        }
        var appName = url.substr(1).split("/")[0].split(":")[1];
        var jApplications = {
            "App":"/Applications/App.asp"
        }
        if( !jApplications[appName] ){
            return;
        }
        Response.Write("Run App :" + appName);
        return;
    }
</script>
<script runat="server" language="javascript">
    function Home(){
        Response.Write("<br>HTTP_X_ORIGINAL_URL:"+ url.replace(/\&/g,"&amp;"));
        Response.Write("<br>Request.QueryString:"+String(Request.QueryString()).replace(/\&/g,"&amp;"));

        Response.Write("<hr><br>200 Links:");
        Response.Write("<br><a href='/'>/ (Home)</a>");
        Response.Write("<hr><br>404 Links:");
        Response.Write("<br><a href='/test'>/test</a>");
        Response.Write("<br><a href='/test?parameter-1=A&amp;parameter-2=B'>/test?parameter-1=A&amp;parameter-2=B</a>");
    }
</script>

