app.controller('ResourcesFeatured', ['$scope', "ResourcesApi", function ($scope, ResourcesApi) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];

    ResourcesApi.get.featuredPayLoad(function (data) {
        $scope.defaults = data.resourceList;
    });

    $scope.selectResource = function (resource) {
        var gotoresource = resource.ResourceId;
        window.open("?mid=789&ctl=resourceView&resourceid=" + gotoresource, "_self");
    }

}]);