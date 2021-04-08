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

