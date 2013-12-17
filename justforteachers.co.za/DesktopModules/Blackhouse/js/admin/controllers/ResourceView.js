app.controller('ResourceView', ['$scope', "ResourcesApi", 'ResourcesTemp', function ($scope, ResourcesApi, ResourcesTemp) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];


    parseQueryString = function () {
        var str = window.location.search;
        var objURL = {};
        str.replace(
            new RegExp("([^?=&]+)(=([^&]*))?", "g"),
            function ($0, $1, $2, $3) {
                objURL[$1] = $3;
            }
        );
        return objURL;
    };

    var params = parseQueryString();

    ResourcesApi.get.resourceView(params["resourceid"], function (data) {
        $scope.defaults = data;
    });


    $scope.$watch(function () { return ResourcesTemp.selectedResourceId; }, function () {

        if (ResourcesTemp.selectedResourceId) {
            ResourcesApi.get.resourceView(ResourcesTemp.selectedResourceId, function (data) {
                $scope.defaults = data;
            });
        }
    });



}]);