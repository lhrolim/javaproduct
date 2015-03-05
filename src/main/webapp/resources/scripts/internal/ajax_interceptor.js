var app = angular.module('pilaocommerce');

app.config(['$httpProvider', function ($httpProvider) {
    $httpProvider.interceptors.push(function ($q, $rootScope, $timeout,$log) {
        var activeRequests = 0;
        var started = function (config) {
//            lockCommandBars();
//            lockTabs();
            activeRequests++;
            

        };
        var endedok = function (response) {
        	activeRequests--;
            if (activeRequests == 0) {
//                unLockCommandBars();
//                unLockTabs();
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