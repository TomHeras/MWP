<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioMW.aspx.cs" Inherits="MWP.InicioMW" %>



<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MWRacing - Repuestos de Motos</title>
    <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            background: #1a1a1d;
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        header {
            background: #c3073f;
            color: #fff;
            padding: 60px 0;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 3em;
        }
        main {
            flex: 1;
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            background: #fff;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            border-radius: 8px;
        }
        section {
            margin-bottom: 30px;
        }
        section h2 {
            color: #c3073f;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.1em;
            margin-bottom: 10px;
        }
        #map {
            height: 400px;
            width: 100%;
            margin-top: 20px;
            box-sizing: border-box;
        }
        #directions {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #c3073f;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            width: fit-content;
        }
        footer {
            text-align: center;
            padding: 15px;
            background: #c3073f;
            color: #fff;
            width: 100%;
            z-index: 10;
        }
        @media (max-width: 600px) {
            header h1 {
                font-size: 2em;
            }
            main {
                margin: 10px;
                padding: 15px;
            }
            #map {
                height: 300px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>MWRacing</h1>
    </header>
    <main>
        <section>
            <h2>Nuestra Misión</h2>
            <p>
                En MWRacing, nuestra misión es proporcionar repuestos de alta calidad para motos, garantizando la satisfacción y seguridad de nuestros clientes.
            </p>
        </section>
        <section>
            <h2>Nuestra Visión</h2>
            <p>
                Ser líderes en el mercado de repuestos de motos, ofreciendo productos innovadores y un servicio excepcional.
            </p>
        </section>
        <section>
            <h2>Nuestro Equipo</h2>
            <p>
                Propietario: Walter Gajer
            </p>
            <p>
                Encargado del Mostrador: Juan Pablo Gajer
            </p>
            <p>
                Mecánico: Franco Gajer
            </p>
        </section>
        <section>
            <h2>Nuestra Ubicación</h2>
            <div id="map"></div>
            <a id="directions" href="https://www.google.com/maps/dir/?api=1&destination=-34.743006396815126,-58.41384444291295" target="_blank">Cómo llegar</a>
        </section>
    </main>
    <footer>
        <p>&copy; 2025 MWRacing. Todos los derechos reservados.</p>
    </footer>
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <script>
        var map = L.map('map').setView([-34.743006396815126, -58.41384444291295], 15);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        L.marker([-34.743006396815126, -58.41384444291295]).addTo(map)
            .bindPopup('Aquí está nuestro local.')
            .openPopup();

        // Geolocalización para la ubicación actual
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var currentLocation = [position.coords.latitude, position.coords.longitude];

                // Icono personalizado rojo
                var redIcon = L.icon({
                    iconUrl: 'https://maps.gstatic.com/mapfiles/ms2/micons/red-dot.png',
                    iconSize: [32, 32],
                    iconAnchor: [16, 32]
                });

                L.marker(currentLocation, { icon: redIcon }).addTo(map)
                    .bindPopup('Tu ubicación actual.')
                    .openPopup();
            });
        } else {
            alert("Geolocalización no es soportada por este navegador.");
        }

        map.whenReady(function () {
            map.invalidateSize();
        });
    </script>
</body>
</html>