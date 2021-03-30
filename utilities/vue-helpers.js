function fnRenderStyles( styleID, styles, options ){
    options=options||{};
    if( !styleID ){
        return;
    }
    var styleBlock = document.querySelector("#"+styleID);
    if(!styleBlock){
        var head=document.querySelector("head");
        styleBlock = document.createElement("style");
        styleBlock.id = styleID;
        head.appendChild(styleBlock);
        //console.log( styleBlock, document.querySelector("#"+styleID) );
    }
    if( !styles ){
        return;
    }
    if(styleBlock){
        less.render(styles).then(function(output) {
            styleBlock.innerText = output.css;
        });
        return;
        styleBlock.innerText = styles.replace(/\t|\r|\n/g,"").replace(/ +/g," ");
    }
}
