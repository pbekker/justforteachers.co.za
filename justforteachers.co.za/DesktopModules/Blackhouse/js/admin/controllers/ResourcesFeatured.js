app.controller('ResourcesFeatured', ['$scope', "ResourcesApi", function ($scope, ResourcesApi) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];

    ResourcesApi.get.featuredPayLoad(function (data) {
        $scope.defaults = data.resourceList;
    });

}]);