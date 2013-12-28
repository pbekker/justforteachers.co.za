var app = angular.module('app', [
    'ngRoute',
    'ngAnimate',
    'ngSanitize',
    'chieffancypants.loadingBar',
    'ui.bootstrap'

]).config(function($locationProvider){
    $locationProvider.html5Mode(true).hashPrefix('!');
});