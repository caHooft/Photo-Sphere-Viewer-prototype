﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PrototypeViewer</title>
    <script src="Script/jquery/jquery-1.11.1.js"></script>

    <!-- Photo Sphere Viewer stuff -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/three/build/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uevent@2/browser.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4/dist/photo-sphere-viewer.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/photo-sphere-viewer@4.2.1/dist/photo-sphere-viewer.js"></script>


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
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="viewer"></div>
        
        
        <script>

            var viewer = new PhotoSphereViewer.Viewer
            ({
                container: document.querySelector('#viewer'),
                panorama: '360images/QG13/00/IMG_20201030_154626_00_002.jpg'
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

