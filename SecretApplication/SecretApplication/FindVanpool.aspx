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
                height: 600px;
                width: 100%;
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

            #infowindow-content .title {
                font-weight: bold;
            }

            #infowindow-content {
                display: none;
            }

            #map #infowindow-content {
                display: inline;
            }

            .pac-card {
                margin: 10px 10px 0 0;
                border-radius: 2px 0 0 2px;
                box-sizing: border-box;
                -moz-box-sizing: border-box;
                outline: none;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
                background-color: #fff;
                font-family: Roboto;
            }

            #pac-container {
                padding-bottom: 12px;
                margin-right: 12px;
            }

            .pac-controls {
                display: inline-block;
                padding: 5px 11px;
            }

                .pac-controls label {
                    font-family: Roboto;
                    font-size: 13px;
                    font-weight: 300;
                }

            #pac-input {
                background-color: #fff;
                font-family: Roboto;
                font-size: 15px;
                font-weight: 300;
                margin-left: 12px;
                padding: 0 11px 0 13px;
                text-overflow: ellipsis;
                width: 400px;
            }

                #pac-input:focus {
                    border-color: #4d90fe;
                }

            #title {
                color: #fff;
                background-color: #4d90fe;
                font-size: 25px;
                font-weight: 500;
                padding: 6px 12px;
            }
        </style>
    </head>
    <body>
        <div class="pac-card" id="pac-card">
            <div>
                <div id="title">
                    Autocomplete search
                </div>
            </div>
            <div id="pac-container">
                <input id="pac-input" type="text"
                    placeholder="Enter a location">
            </div>
        </div>
        <div id="map"></div>
        <div id="infowindow-content">
            <img src="" width="16" height="16" id="place-icon">
            <span id="place-name" class="title"></span>
            <br>
            <span id="place-address"></span>
        </div>
        <asp:HiddenField runat="server" ID="JS_Test_Long" />
        <asp:HiddenField runat="server" ID="JS_Test_Lat" />
        <script>
            // This example requires the Places library. Include the libraries=places
            // parameter when you first load the API. For example:
            // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">
            var map;
            var longValue = <%=Long%>;
            var latValue = <%=Lat%>;
            var locFerndale = { lat: 42.4606, lng: -83.1346 };
            var locDetroit = { lat: <%=Lat%>, lng: <%=Long%> };
            
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: locDetroit,
                    zoom: 10
                });

                var card = document.getElementById('pac-card');
                var input = document.getElementById('pac-input');

                var autocomplete = new google.maps.places.Autocomplete(input);

                var infowindow = new google.maps.InfoWindow();
                var infowindowContent = document.getElementById('infowindow-content');

                var marker = new google.maps.Marker({
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
                    infowindow.close();
                    marker.setVisible(false);
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
                    } else {
                        map.setCenter(place.geometry.location);
                        map.setZoom(17);  // Why 17? Because it looks good.
                    }
                    marker.setPosition(place.geometry.location);
                    marker.setVisible(true);

                    address = '';
                    if (place.address_components) {
                        address = [
                            (place.address_components[0] && place.address_components[0].short_name || ''),
                            (place.address_components[1] && place.address_components[1].short_name || ''),
                            (place.address_components[2] && place.address_components[2].short_name || '')
                        ].join(' ');
                    }

                    infowindow.open(map, marker);
                });

                infowindow.setContent(place.name);


                // Sets a listener on a radio button to change the filter type on Places
                // Autocomplete.
                function setupClickListener(id, types) {
                    var radioButton = document.getElementById(id);
                    radioButton.addEventListener('click', function () {
                        autocomplete.setTypes(types);
                    });
                }

                setupClickListener('changetype-all', []);
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAS0LV6iVW-gd-sjBRIu-fpFamhk4WaNzk&libraries=places&callback=initMap"
            async defer></script>
    </body>
    </html>
</asp:Content>
