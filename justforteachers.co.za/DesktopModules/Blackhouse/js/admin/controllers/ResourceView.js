app.controller('ResourceView', ['$scope', "ResourcesApi", 'ResourcesTemp', '$location', function ($scope, ResourcesApi, ResourcesTemp, $location) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];    

    ResourcesApi.get.resourceView($location.search().resourceid, function (data) {
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