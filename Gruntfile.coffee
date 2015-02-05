module.exports = (grunt) ->
  
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    
    clean: {
      dist: ["dist"]
      build: ["build"]
    }

    concat:
      options:
        separator: ";"
      
      bc_qr_reader:  
        src: [
          'src/jsqrcode/src/grid.js'
          'src/jsqrcode/src/version.js'
          'src/jsqrcode/src/detector.js'
          'src/jsqrcode/src/formatinf.js'
          'src/jsqrcode/src/errorlevel.js'
          'src/jsqrcode/src/bitmat.js'
          'src/jsqrcode/src/datablock.js'
          'src/jsqrcode/src/bmparser.js'
          'src/jsqrcode/src/datamask.js'
          'src/jsqrcode/src/rsdecoder.js'
          'src/jsqrcode/src/gf256poly.js'
          'src/jsqrcode/src/gf256.js'
          'src/jsqrcode/src/decoder.js'
          'src/jsqrcode/src/qrcode.js'
          'src/jsqrcode/src/findpat.js'
          'src/jsqrcode/src/alignpat.js'
          'src/jsqrcode/src/databr.js'
          'src/webcam.js'
          'build/src/bc-qr-reader.js'
        ]
        dest: "build/bc-qr-reader-concat.js" 
        
    coffee:
      coffee_to_js:
        options:
          bare: true
          sourceMap: false
        expand: true
        flatten: false
        src: ["src/bc-qr-reader.js.coffee"]
        dest: 'build'
        ext: ".js"
        
    surround:
      wraps: 
        options: 
          prepend: '(function() { if (/internet explorer/i.test(window.navigator.userAgent) || /MSIE/i.test(window.navigator.userAgent)) { return; }',
          append: '})()'
        files: [{
          src: 'build/bc-qr-reader-concat.js'
          dest: 'dist/bc-qr-reader.js'
        }]
      
    
    
  
  # If the parent project also uses Grunt, these will be ignored unless you refer to ../../      
  grunt.loadNpmTasks('../../grunt-contrib-concat')
  grunt.loadNpmTasks('../../grunt-contrib-coffee')
  grunt.loadNpmTasks('../../grunt-contrib-clean')
  grunt.loadNpmTasks('../../grunt-surround')
  
  # When developing locally:
  # grunt.loadNpmTasks('grunt-contrib-concat')
  # grunt.loadNpmTasks('grunt-contrib-coffee')
  # grunt.loadNpmTasks('grunt-contrib-clean')
  # grunt.loadNpmTasks('grunt-surround')
    
  grunt.registerTask "compile", ["coffee"]  
    
  grunt.registerTask "install", [
    "clean"
    "compile"
    "concat"
    "surround"
  ]

  return