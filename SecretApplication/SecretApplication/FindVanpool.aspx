<%@ Page Title="FindVanpool" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FindVanpool.aspx.cs" Inherits="SecretApplication.FindVanpool" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <html>
<head>
    <title>Place Autocomplete</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            position: absolute;
            top: 80px;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: 0;
        }
         /* Optional: Makes the sample page fill the window. */
         html, body {
             height: 100%;
             margin: 0;
             padding: 0;
         }

         #description {
             font-family: Roboto;
             font-size: 15px;
             font-weight: 300;
         }

        #right-panel {
            position: fixed;
            left: 0;
            top: 100px;
            width: 8em;
            margin-top: -2.5em;
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
            z-index: 1;
            background-color: black;
            box-shadow: 5px 5px 5px grey;
            opacity: .8;
        }


        #right-panel select, #right-panel input {
            font-size: 15px;
        }

        #right-panel select {
            width: 100%;
        }

        #right-panel i {
            font-size: 12px;
        }

        #right-panel {
            height: 100%;
            float: right;
            width: 390px;
            overflow: auto;
        }

         #infowindow-content .title {
             font-weight: bold;
         }

         #infowindow-content {
             display:none;
         }

         #map #infowindow-content {
             display: inline;
         }


         #title {
             color: #fff;
             background-color: #4d90fe;
             font-size: 25px;
             font-weight: 500;
             padding: 6px 12px;
         }

         #pac-input{
             position: relative;
             width: 200%;
             top: 20px;
             opacity:1;
         }

    </style>
</head>

<body>
    <div id="right-panel">
            <input id="pac-input" type="text"
                    placeholder="Enter a location">
    </div>

    <div id="map">
    </div>

    <script>
        var map;

        var defaultLocation =
            {
                lat: 42.395387,
                lng: -83.055951
            };

        var markers = [];

        var startLocation;
        var endLocation;

        function initMap() {
            var directionsService = new google.maps.DirectionsService;
            var directionsDisplay = new google.maps.DirectionsRenderer;

            var busLocations = <%=JSON%>
            map = new google.maps.Map(document.getElementById('map'), {
                center: defaultLocation,
                zoom: 12
            });

            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('right-panel'));

            var card = document.getElementById('pac-card');
            var input = document.getElementById('pac-input');

            var autocomplete = new google.maps.places.Autocomplete(input);

            var infowindow = new google.maps.InfoWindow();
            var infowindowContent = document.getElementById('infowindow-content');

            startMarker = new google.maps.Marker({
                map: map,
                anchorPoint: new google.maps.Point(0, -29)
            });

            var place;
            var address;

            map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

            // Bind the map's bounds (viewport) property to the autocomplete object,
            // so that the autocomplete requests use the current map bounds for the
            // bounds option in the request.
            autocomplete.bindTo('bounds', map);

            // Set the data fields to return when the user selects a place.
            autocomplete.setFields(
                ['address_components', 'geometry', 'icon', 'name']);

            autocomplete.addListener('place_changed', function () {
                startMarker.setVisible(false);
                place = autocomplete.getPlace();

                if (!place.geometry) {
                    // User entered the name of a Place that was not suggested and
                    // pressed the Enter key, or the Place Details request failed.
                    window.alert("No details available for input: '" + place.name + "'");
                    return;
                }

                // If the place has a geometry, then present it on a map.
                if (place.geometry.viewport) {
                    map.fitBounds(place.geometry.viewport);
                }
                else {
                    map.setCenter(place.geometry.location);
                    map.setZoom(17);  // Why 17? Because it looks good.
                }

                startLocation = place.geometry.location;

                var homeMarker = new google.maps.Marker({
                    position: place.geometry.location,
                    map: map,
                    icon: 'https://raw.githubusercontent.com/Concept211/Google-Maps-Markers/master/images/marker_black18.png'
                });

                for (var i = 0; i < busLocations.length; i++) {
                    addMarker({
                        coords: busLocations[i],
                        icon: 'https://dl1.cbsistatic.com/i/r/2017/02/17/afbe9daa-08a0-4a9e-98aa-37699cac0cc1/thumbnail/64x64/d1af080184c627411edd0d61a4c835b0/imgingest-2415093497429433498.png',
                        display: directionsDisplay,
                        service: directionsService
                    });
                };
                startMarker.setVisible(true);

                map.setZoom(14);
            });
        }

        function addMarker(prop) {
            var busMarker = new google.maps.Marker({
                position: prop.coords, // busLocations[i],// busLocations[i],
                map: map
            });

            if (prop.icon) {
                busMarker.setIcon = prop.icon;
            }

            busMarker.addListener('click', function () {
                endLocation = prop.coords;
                calculateAndDisplayRoute(prop.service, prop.display);
            });
        }

        function calculateAndDisplayRoute(directionsService, directionsDisplay) {
            //var start = startLocation;
            //var end = endLocation;

            directionsService.route({
                origin: startLocation,
                destination: endLocation,
                travelMode: 'DRIVING'
            }, function (response, status) {
                if (status === 'OK') {
                    directionsDisplay.setDirections(response);
                } else {
                    window.alert('Directions request failed due to ' + status);
                }
            });
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS0LV6iVW-gd-sjBRIu-fpFamhk4WaNzk&libraries=places&callback=initMap"
            async defer></script>
</body>
</html>
</asp:Content>