walletApp.directive('bcQrReader', ($timeout) ->
  {
    restrict: "E"
    replace: 'true'
    scope: {
      onResult: '='
      onError: '='
      active: '='
      cameraStatus: '='
    }
    template: '<div><webcam on-stream="onStream(stream)" on-error="onError(err)" ng-if="active" channel="channel"></webcam><canvas id="qr-canvas"></canvas></div>'
    link: (scope, elem, attrs) ->
      scope.channel = {}
      
      qrcode.callback = scope.onResult
      
      scope.onError = (error) ->
        console.log("Error!")
        console.log(error)
      
      scope.onStream = (stream) ->
        # Evil (TODO: use a directive to manipulate the DOM or try to use scope.channel):
        canvas = document.getElementById("qr-canvas")
        scope.qrStream = stream
        
        scope.lookForQR()
        scope.cameraStatus = true
    
      scope.lookForQR = () ->    
        try 
          canvas = document.getElementById("qr-canvas")
          video = document.getElementsByTagName("video")[0]
      
          if video.videoWidth > 0
            # This won't be set at the first iteration.
            canvas.width =  video.videoWidth
            canvas.height = video.videoHeight
           
            canvas.getContext("2d").drawImage(video,0,0)
      
          qrcode.decode()
        catch e
          # $log.error e
          $timeout((->
            scope.lookForQR()
          ), 250)
  }
)