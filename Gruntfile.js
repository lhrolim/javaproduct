module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    
     clean: {
	    folder: "src/main/webapp/resources/styles/vendor/",
	    folder2: "src/main/webapp/resources/scripts/vendor/"
    },
    
    
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'src/main/webapp/scripts/<%= pkg.name %>.js',
        dest: 'build/<%= pkg.name %>.min.js'
      }
    },
  
  	bowercopy:{
  		
  		options:{
  			 destPrefix: 'src/main/webapp/resources/scripts/vendor'
  		},
  		
  		
  		 jquery: {
             files: {
                 'jquery.js': 'jquery/dist/jquery.js',
             }
         },
         
         angular: {
             files: {
                 'angular.js': 'angularjs/angular.js',
             }
         },
         
         bootstrap: {
             files: {
                 'bootstrap.js': 'bootstrap/dist/js/bootstrap.js',
             }
         },
         
         bootstrap_css: {
        	 options:{
        		 destPrefix: 'src/main/webapp/resources/styles/vendor'
        	 },
        	 
             files: {
                 'bootstrap.min.css': 'bootstrap/dist/css/bootstrap.min.css',
                 'bootstrap-theme.min.css': 'bootstrap/dist/css/bootstrap-theme.min.css',
             }
         }
  	}
  
  
  });

  
  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-bowercopy');grunt

  // Default task(s).
  grunt.registerTask('defaultdev', ['clean','bowercopy']);
  grunt.registerTask('default', ['clean','bowercopy','uglify']);

};