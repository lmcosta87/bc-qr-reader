# bc-qr-reader

QR Code reader directive for AngularJS. 

It uses part of [https://github.com/peekabustudios/webcam-directive](webcam-directive) to access the camera and [https://github.com/LazarSoft/jsqrcode](Lazarsoft QR reader) to process the QR code.

## Install

    bower install --save blockchain/bc-qr-reader

## Usage

Include `dist/bc-qr-reader.js`

    bc-qr-reader(active="cameraRequested", on-result="processURLfromQR" on-error="onError" camera-status="cameraIsOn")

## Development

    npm install
    cd src && git clone https://github.com/Sjors/jsqrcode

## Update bower package

    npm install
    grunt dist
