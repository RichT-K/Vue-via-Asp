<script runat="server" language="javascript" src="/utilities/json5.server.js"></script>
<script runat="server" language="javascript" src="/utilities/file.server.js"></script>
<script runat="server" language="javascript">
    fnAPI( Request, Response, Unhandled );
    function fnAPI( Request, Response, callback ){
        var url = Request.ServerVariables("HTTP_X_ORIGINAL_URL");
        var jPath = parsePath( String(url) );
        if( jPath.component ){
            // All components are served as javascript
            Response.AddHeader("contenttype","application/javascript");
            // Later we'll add alternate sources (DB, Cache)
            // ie : fnCache_Component(  jPath, Request, Response, or call other source  )
            fnAPI_FileComponent( jPath, Request, Response, callback );
        }
        else{
            Response.Status = 404;
        }
        callback( jPath, Request, Response );
    }
    function fnAPI_FileComponent( jPath, Request, Response, callback ){
        // Always javascript 
        var jComponent = jPath.component;
        var componentRoot = "/components/";
        var componentPath = jComponent.value;
        if( jPath[componentPath] ){
            // Sub-paths ie: /components/editor/fabric-slideshow
            componentRoot += (componentPath+"/"+jPath[componentPath].value);
            componentPath = "";
        }
        componentRoot += componentPath;
        var jObject = {};
        try{
            // Required
            __loadPathFile( Server.MapPath( componentRoot+"/index.js" ), function( content ){
                jObject = JSON.parse(content);
                if(jObject.data){
                    var jData = jObject.data;
                    jObject.data = function(){
                        return jData;
                    }
                }
            });
            if(!jObject.template){
                // Required if not supplied
                __loadPathFile( Server.MapPath( componentRoot+"/template.html" ), function( content ){
                    jObject.template = content;
                });
            }
            if(!jObject.styles){
                try{
                    // Not Required if not supplied
                    __loadPathFile( Server.MapPath( componentRoot+"/styles.css" ), function( content ){
                        jObject.styles = content || "";
                    });
                }catch(e){ /* no worries */ }
            }
            try{
                // Not Required never supplied
                delete jObject.scripts;
                __loadPathFile( Server.MapPath( componentRoot+"/client.js" ), function( content ){
                    jObject.scripts = content || "";
                });
            }catch(e){ /* no worries */ }
            Response.Write( "define(function(){return " + JSON.stringify(jObject)+";})");
        }catch(e){
            Response.Status="504,Component Not Found"
            callback({
                    data:{
                        error:e,
                        name:componentRoot
                    },
                    template:"<fatal>{{name}} : {{error.description}}</fatal>"
                }, Request, Response);
        }
    }
    function parsePath( path ){
        var aPath = path.split("/");
        // Remove "" and "api" from "/api/..."
        aPath.shift();aPath.shift();
        var jPath = {};
        for( var index=0; index < aPath.length; index++ ){
            var aParts = aPath[index].split(":");
            if(aParts.length > 1 ){
                var key = aParts.shift().toLowerCase();
                jPath[key] = {
                    key: key,
                    value : aParts[0],
                    values : aParts
                };
            }
        }
        return jPath;
    }
    function Unhandled(jParcel, Request, Response ){
        // We'll be ready for an alternate server by always passing Request and Response
        // Temporarily: For simplicity we'll transfer all unhandled requests to the documentation
        if( String(Response.Status).substr(0,3) != "200" ){
            Server.Transfer("/api/documentation.html");
            Response.End
        }
    }
</script>

