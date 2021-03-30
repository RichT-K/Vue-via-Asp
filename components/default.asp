<script runat="server" language="javascript" src="/server/src/includes/json5.server.js"></script>
<script runat="server" language="javascript">
    var jComponents = {
        "comp-1":{
            template:''
        }
        ,"comp-2":{
            
        }
    }
    var url = String(Request.ServerVariables("HTTP_X_ORIGINAL_URL"));
    var component = String(Request.QueryString("component")).toLowerCase();
    if( jComponents[component] ){
        Response.Write( "jComponents["+component+"]:" + JSON.stringify(jComponents[component]) );
        Response.End();
    }

    Response.Write("<br>In The Components Directory")
    Response.Write("<br>HTTP_X_ORIGINAL_URL:"+ String(Request.ServerVariables("HTTP_X_ORIGINAL_URL")).replace(/\&/g,"&amp;"));
    Response.Write("<br>Request.QueryString:"+String(Request.QueryString()).replace(/\&/g,"&amp;"));
    Response.Write("<hr><br><a href='/'>Home</a>");

    Response.Write("<hr><br>200 Links:");
    Response.Write("<br><a href='/'>/ (Home)</a>");
    Response.Write("<br><a href='/components?component=Comp-1'>/components/?component=Comp-1</a>");
    Response.Write("<br><a href='/components?component=Comp-2'>/components/?component=Comp-2</a>");

</script>
