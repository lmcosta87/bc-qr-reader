# bc-qr-reader

QR Code reader directive for AngularJS.

It uses [webcam-directive](https://github.com/jonashartmann/webcam-directive) to access the camera and [Lazarsoft QR reader](https://github.com/LazarSoft/jsqrcode) to process the QR code.

## Install

```sh
bower install --save blockchain/bc-qr-reader
```

## Demo

Follow the installation instructions above and open demo/index.html in a browser.

## Usage

Include `dist/bc-qr-reader.js` as well as `bower_components/webcam-directive/app/scripts/webcam.js`. Add the `webcam` module to your application.

```html
<bc-qr-reader
  active="cameraRequested"  
  on-result="processURLfromQR"
  on-error="onError"
  camera-status="cameraIsOn"
></bc-qr-reader>
```

## Development

```sh
npm install
cd src && git clone https://github.com/sjors/jsqrcode
```

## Update bower package

```sh
npm install
grunt dist
```
