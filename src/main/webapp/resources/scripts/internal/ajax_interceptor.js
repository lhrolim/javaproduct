var app = angular.module('pilaocommerce');


var defaultOptions = {
	    lines: 13, // The number of lines to draw
	    length: 20, // The length of each line
	    width: 10, // The line thickness
	    radius: 30, // The radius of the inner circle
	    corners: 1, // Corner roundness (0..1)
	    rotate: 0, // The rotation offset
	    direction: 1, // 1: clockwise, -1: counterclockwise
	    color: '#000', // #rgb or #rrggbb or array of colors
	    speed: 1, // Rounds per second
	    trail: 60, // Afterglow percentage
	    shadow: false, // Whether to render a shadow
	    hwaccel: false, // Whether to use hardware acceleration
	    className: 'spinner', // The CSS class to assign to the spinner
	    zIndex: 2e9, // The z-index (defaults to 2000000000)
	    top: 'auto', // Top position relative to parent in px
	    left: 'auto', // Left position relative to parent in px,
	    opacity: 1 / 4
	};

var spinner= new Spinner(defaultOptions);


app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.interceptors.push(function ($q, $rootScope, $timeout,$log) {
        var activeRequests = 0;
        
        var started = function (config) {
//            lockCommandBars();
//            lockTabs();
        	
        	spinner.spin(document.getElementById("mainspinner"));
            activeRequests++;
            

        };
        var endedok = function (response) {
        	activeRequests--;
            if (activeRequests == 0) {
            	spinner.stop();
                $('#loading-indicator').hide();
            }
        };
        
        var endederror = function (response) {
        	activeRequests--;
            if (activeRequests == 0) {
            	spinner.stop();
                $('#loading-indicator').hide();
            }
        };

        return {
            // optional method
            'request': function (config) {
                started(config);

                return config || $q.when(config);
            },

            // optional method
            'response': function (response) {
                endedok(response);
                return response || $q.when(response);
            },

            // optional method
            'responseError': function (rejection) {
                endederror(rejection);
                return $q.reject(rejection);
            }
        };
    });

    $httpProvider.defaults.transformRequest.push(function (data, headers) {
        if (data == undefined) {
            return data;
        }
        if (sessionStorage.mockerror || sessionStorage.mockmaximo) {
            var jsonOb = JSON.parse(data);
            if (sessionStorage.mockerror == "true") {
                jsonOb['%%mockerror'] = true;
            }
            if (sessionStorage.mockmaximo == "true") {
                jsonOb['%%mockmaximo'] = true;
            }
            return JSON.stringify(jsonOb);
        }
        return data;
    });
}]);


window.onpopstate = function (e) {
    if (e.state) {
        document.getElementById("content").innerHTML = e.state.html;
        document.title = e.state.pageTitle;
    }
};