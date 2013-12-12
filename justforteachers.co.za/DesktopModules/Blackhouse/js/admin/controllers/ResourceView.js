app.controller('ResourceView', ['$scope', "ResourcesApi", 'ResourcesTemp', function ($scope, ResourcesApi, ResourcesTemp) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];

    ResourcesApi.get.resourceView(id, function (data) {
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