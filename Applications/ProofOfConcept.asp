<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="rating" content="General">
    <link rel="canonical" href="/VUE:ProofOfConcept" />
    <meta name="designer" content="Richard Kenny">
    <meta name="copyright" content="2021">
    <meta name="reply-to" content="info@USGolfers.com">
    <meta name="owner" content="Richard Kenny">
    <title>Vue-Via-ASP - Input-Range The First Component</title>
    <meta property="og:title" content="Vue-Via-ASP - Input-Range The First Component" />
    <meta name="description" content="Vue-Via-ASP - Keeping the Classics Alive and Functional"/>
    <meta name="keywords" content="VUEjs, VUE@Next, ASP, Classic ASP, Javascript, RequireJs, JSON, JSON5" />
     <!-- Google Tag Manager (noscript) -->
    <noscript><iframe 
        src="https://www.googletagmanager.com/ns.html?id=GTM-56ZDMRG"
        height="0" 
        width="0" 
        style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!-- Google Tag Manager -->
    <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-56ZDMRG');</script>
    <!-- End Google Tag Manager -->
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-10742640-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        
        gtag('config', 'UA-10742640-1', {
            cookie_flags: 'max-age=7200;secure;samesite=none'
        });
    </script>
       
    <style>
        body{
            font-family:Arial, Helvetica, sans-serif;
            display:grid;
            margin:0px auto;
            justify-items:center;
        }
        #App{
            display:grid;
            justify-content:center;
            max-width:600px;
        }
        .adsbygoogle{
            display:block; 
            text-align:center;
            outline:1px solid black;
            min-width:400px;
            max-width:600px;
            max-height:150px;
        }
        .adsbygoogle[visible=false]{
            display:none; 
        }
    </style>
    <script type="application/javascript" src="/dist/less.js" ></script>
    <script src="/dist/require/require.js"></script>
    <script src="/utilities/vue-helpers.js"></script>
    <script src="/dist/vue.global.js"></script>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <script>
        var jData = {
            isSecure:(document.location.protocol == "https:"),
            iMin:-40,
            iMax:80,
            iValue:-20
        };
        const { createApp, defineAsyncComponent } = Vue;
        const app = createApp({
            data:function(){
                return jData;
            }
        });
        require(["/api/component:input-range"],
            function(data){
                if( data.styles ){
                    fnRenderStyles( "input-range", data.styles );
                }
                app.component('input-range', Vue.defineComponent(data));
        });

        window.onload = function(){
            const vmMain = app.mount('#App');
        }
    </script>
</head>
<body>
    <h2>Vue Via ASP</h2>
    <h1>Proof Of Concept - The Input-Range Component</h1>
    <main id="App">
        <div>
            <p><b>Vue Via ASP</b> is an experiment in connecting Classic ASP with the more recent 
            Vue framework to understand the efforts in transitioning an
            existing Classic ASP web site to one primarily employing Vue components.
            This <b>Proof Of Concept</b> is the first of a series of Apps building on each other,
            reusing previous components and introducing new ones. 
            </p>
            <p>
                The <b>Proof Of Concept</b> begins with an <b>input-range</b> component, 
                a simple div containing an input type:range slider, optional previous and next value buttons
                and an optional dynamic label.
                <br>The component receives the following properties : 
                label, dataName, min, max, step, start, overlay, buttons, onchange.
            </p>
            <p>
                Next Up : Examples with Lifecycle Methods by incorporating <b>client.js</b>.
            </p>
        </div>
        <ins v-if="isSecure" 
            class="adsbygoogle"
            :visible="isSecure?'true':'false'"
            data-ad-layout="in-article"
            data-ad-format="fluid"
            data-ad-client="ca-pub-6451221234398399"
            data-ad-slot="7436685820"></ins>
        <div>The range component provides a perfect first component in that it
            represents the reflective nature of Vue. 
            Changes to the Min and Max input range elements
            are reflected in the Value input range element.
        </div>
        <input-range
            label="Min"
            :dataName="iMin"
            :min="-100"
            :max="iMax ? iMax : 0"
            :step="10"
            :start="iMin"
            :overlay="true"
            buttons="true"
            :onchange="(value)=>{
                iMin = value;
                iValue = Math.max(iMin,iValue);
            }"
        ></input-range>
        <input-range
            label="Max"
            :dataName="iMax"
            :min="iMin ? iMin : 0"
            :max="100"
            :step="10"
            :start="iMax"
            :overlay="true"
            :buttons="true"
            :onchange="(value)=>{
                iMax = value;
                iValue = Math.min(iMax,iValue);
            }"
        ></input-range>
        <input-range
            label="iValue"
            :dataName="iValue"
            :min="iMin"
            :max="iMax"
            :step="10"
            :start="iValue"
            :overlay="true"
            :onchange="(value)=>{iValue = value;}"
        ></input-range>
        <div>
            The input-range component consists of 2 files:
            <p>index.js - providing the prop definitions</p>
            <p>template.html - providing the markup and functionality</p>
            <p>With this simple proof of concept all the code handling events and assignment
            is inline in the template or passsed to it from the App.</p>
        </div>
        <div>
            The App has been setup with 3 members:
            <p>iMin - to hold the Min input-range value</p>
            <p>iMax - to hold the Max input-range value</p>
            <p>iValue - to hold the Value input-range value</p>
            <p>
                When any values change the App member is updated and the change of state 
                forces a redraw of any elements which are affected by the change. 
            </p>
        </div>
        <div>
            Some useful links:
            <br><a target="_new" href="https://docs.microsoft.com/en-us/previous-versions/iis/6.0-sdk/ms524929(v=vs.90)   ">Classic ASP (MicroSoft)</a>
            <br><a target="_new" href="https://v3.vuejs.org/guide/introduction.html">VUE 3</a>
            <br><a target="_new" href="https://developer.mozilla.org/en-US/docs/Learn/JavaScript">Javascript (Mozilla)</a>
            <br><a target="_new" href="http://lesscss.org/">Less</a>
            <br><a target="_new" href="https://requirejs.org/">RequireJS</a>
        </div>
    </main>
    <footer>VUE Via ASP - An Experiment</footer>
    <script>
        if( jData.isSecure ){
            (adsbygoogle = window.adsbygoogle || []).push({});
        }
    </script>
</body>
