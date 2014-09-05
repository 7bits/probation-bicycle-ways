<g:applyLayout name="main">
    <html>
        <head>
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'rotator.css')}"/>
            <g:javascript src="spin.js"/>
        </head>

        <body>
            <div id="loader_background" style="display: none">
                <div id="rotator">
                    <ul>
                        <li class="show"><g:img id="logo" dir="images/bicycle" file="1.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="2.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="3.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="4.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="5.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="6.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="7.png" width="68" height="41" /></li>
                        <li><g:img id="logo" dir="images/bicycle" file="8.png" width="68" height="41" /></li>
                    </ul>
                </div>
            </div>
        </body>
    </html>
</g:applyLayout>