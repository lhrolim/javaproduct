var app = angular.module('pilaocommerce');

app.factory('alertService', function ($rootScope, $timeout) {

    return {

        confirmMsg: function (msg, callbackFunction, cancelcallback) {
            this.confirm(callbackFunction, msg, cancelcallback);
        },

        confirm: function (msg,callbackFunction, cancelcallback) {
            bootbox.confirm({
                message: msg == null ? defaultDeleteMsg : msg,
                title: 'Confirm',
                className: 'smallmodal',
                callback: function (result) {
                    if (result == false) {
                        if (cancelcallback != undefined) {
                            cancelcallback();
                            return;
                        }
                        return;
                    }
                    callbackFunction();
                }
            });
            return false;
        },

        alert: function (msg) {
            bootbox.setDefaults({ locale: i18NService.getCurrentLanguage() });
            bootbox.alert({
                message: msg,
                title: 'Alert',
                className: 'smallmodal',
            });
        },


    };

});

