app.controller('ResourcesUpload', ['$scope', "ResourcesApi", function ($scope, ResourcesApi) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{preview:""}];

    ResourcesApi.get.creationPayload(function (data) {
        console.log("Success: ", data);
        $scope.defaults = data;
    });

    $scope.add = function () {
        if (!$scope.files.length) {
            $scope.imageRequired = true;
        } else {
            ResourcesApi.post.createResource($scope.data, $scope.files, function (data) {
            console.log("Success: ", arguments);
            });
        }
    }

    $scope.$on('filesAdded', function (scope, files) {
        $scope.imageRequired = false;
        $scope.files = files;
    });

    $scope.dateOptions = {
        'year-format': "'yy'",
        'starting-day': 1
    };

}]);