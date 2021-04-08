<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PrototypeViewer</title>
    <script src="Script/jquery/jquery-1.11.1.js"></script>

    <!-- Photo Sphere Viewer stuff 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
    
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4.2.1/dist/photo-sphere-viewer.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/plugins/markers.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>!-->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/plugins/markers.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/plugins/markers.min.js"></script>


    <!-- pannellum stuff -->
    <link href="Script/css/pannellum.css" rel="stylesheet" />    
    <script src="Script/js/pannellum.js"></script>
    <script src="Script/js/libpannellum.js"></script>
    
    
    
    <style>
        html, body 
        {
            height: 100%;
            margin: 0;
        }

        #viewer 
        {
            width: 100vw;
            height: 50vh;
        }

                #showCoordinate 
        {
            width: 100%;
            margin-top: 3px;
            height: 15vh;
            border: 3px solid black;
        }
    </style>

    <script>       
        var PrintCoordinate = function (hotSpotDiv, args)
        {
            var pitch = args.pitch;
            jQuery("label[for='pitch']").html("<strong>Pitch: </strong>" + pitch);
            var yaw = args.yaw;
            jQuery("label[for='yaw']").html("<strong>Yaw: </strong>" + yaw);
        };
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="viewer"></div>
        
        <div id="photosphere"></div>

        <script type="text/template" id="lorem-content">
        <h1>HTML Ipsum Presents</h1>

        <p><strong>Pellentesque habitant morbi tristique</strong> senectus et netus et malesuada fames ac turpis egestas.
        Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam
        egestas semper. <em>Aenean ultricies mi vitae est.</em> Mauris placerat eleifend leo. Quisque sit amet est et
        sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, <code>commodo vitae</code>, ornare sit amet,
        wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac
        dui. <a href="#">Donec non enim</a> in turpis pulvinar facilisis. Ut felis.</p>
    
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d54469.108394396746!2d6.9617553450295855!3d44.151844842645815!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12cdaf6678af879d%3A0xcabc15aee7b89386!2sParc%20national%20du%20Mercantour!5e0!3m2!1sfr!2sfr!4v1611498421096!5m2!1sfr!2sfr" width="100%" height="300" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>

        <h2>Header Level 2</h2>

        <ol>
        <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
        <li>Aliquam tincidunt mauris eu risus.</li>
        </ol>

        <blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet
        congue. Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis,
        tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.</p></blockquote>

        <h3>Header Level 3</h3>

        <ul>
        <li>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</li>
        <li>Aliquam tincidunt mauris eu risus.</li>
        </ul>
        </script>
        
        <script>


            var viewer = new PhotoSphereViewer.Viewer
            ({
                container: document.querySelector('#viewer'),
                panorama: '360images/QG13/00/IMG_20201030_154626_00_002.jpg',
                navbar:
                [
                    'autorotate',
                    'zoom',
                    {
                        id: 'my-button',
                        content: 'Custom',
                        title: 'Hello world',
                        className: 'custom-button',
                        onClick: () => {
                            alert('Hello from custom button');
                        }
                    },
                    'caption',
                    'fullscreen'
                ]
                ,
                plugins:
                [
                    [PhotoSphereViewer.MarkersPlugin,
                        {
                        // list of markers
                            markers:
                            [
                                {
                                    // image marker that opens the panel when clicked
                                    id: 'image',
                                    longitude: 0.32,
                                    latitude: 0.11,
                                    image: 'https://photo-sphere-viewer.js.org/assets/pin-blue.png',
                                    width: 32,
                                    height: 32,
                                    anchor: 'bottom center',
                                    tooltip: 'A image marker. <b>Click me!</b>',
                                    content: document.getElementById('lorem-content').innerHTML
                                },
                              {
                                  // html marker with custom style
                                  id: 'text',
                                  longitude: 0,
                                  latitude: 0,
                                  html: 'HTML <b>marker</b> &hearts;',
                                  anchor: 'bottom right',
                                  scale: [0.5, 1.5],
                                  style:
                                    {
                                      maxWidth: '100px',
                                      color: 'white',
                                      fontSize: '20px',
                                      fontFamily: 'Helvetica, sans-serif',
                                      textAlign: 'center'
                                  },
                                  tooltip:
                                  {
                                      content: 'An HTML marker',
                                      position: 'right'
                                  }
                              },
                              {
                                  // circle marker
                                  id: 'circle',
                                  circle: 20,
                                  x: 2500,
                                  y: 1000,
                                  tooltip: 'A circle marker'
                              }
                            ]
                        }
                    ]
                ]
                });

            const markersPlugin = viewer.getPlugin(PhotoSphereViewer.MarkersPlugin);

            markersPlugin.on('select-marker', (e, marker) =>
            {
                markersPlugin.updateMarker
                ({
                    id: marker.id,
                    image: 'assets/pin-blue.png'
                });
            });

            viewer.on('click', (e, data) =>
            {
                console.log(`${data.rightclick ? 'right clicked' : 'clicked'} at longitude: ${data.longitude} latitude: ${data.latitude}`);
            });

            /*
            pannellum.viewer('panorama',
                {
                "type": "equirectangular",
                "panorama": "360images/QG13/00/IMG_20201030_154626_00_002.jpg",
                autoLoad: true,
                });
                */

        </script>
        
    </form>
</body>
</html>

