function __loadPathFile( path, callback ){
    var fs = new ActiveXObject("Scripting.FileSystemObject");
    var ts = fs.OpenTextFile(path, 1);
    callback( ts.ReadAll() );
}
