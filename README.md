# bc-qr-reader

QR Code reader directive for AngularJS. 

It uses part of [https://github.com/peekabustudios/webcam-directive](webcam-directive) to access the camera and [https://github.com/LazarSoft/jsqrcode](Lazarsoft QR reader) to process the QR code.

## Installation

    npm install --save grunt-contrib-concat grunt-contrib-clean grunt-contrib-coffee
    npm install https://github.com/Blockchain/bc-qr-reader.git

## Usage

Include `dist/bc-qr-reader.js`

    bc-qr-reader(active="cameraRequested", on-result="processURLfromQR" on-error="onError" camera-status="cameraIsOn")

## Development

    git clone https://github.com/Blockchain/bc-qr-reader.git --recursive