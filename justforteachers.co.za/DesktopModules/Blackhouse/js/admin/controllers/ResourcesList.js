app.controller('ResourcesList', ['$scope', "ResourcesApi", "ResourcesTemp", function ($scope, ResourcesApi, ResourcesTemp) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];
    $scope.moduleId;


    ResourcesApi.get.listPayLoad(function (data) {
        $scope.defaults = data.resourceList;
    });


    $scope.selectResource = function (resource) {
        ResourcesTemp.selectResourceId = resource.ResourceId;
        window.open(window.location + "?mid=" + $scope.moduleId + "&ctl=resourceView&resourceid=" + ResourcesTemp.selectResourceId, "_self");
    }

    //$scope.add = function () {
    //    if (!$scope.files.length) {
    //        $scope.imageRequired = true;
    //    } else {
    //        ResourcesApi.post.createResource($scope.data, $scope.files, function (data) {



    //            console.log("Success: ", arguments);
    //        });
    //    }
    //}

    //$scope.$on('filesAdded', function (scope, files) {
    //    $scope.imageRequired = false;
    //    $scope.files = files;
    //});

    //$scope.dateOptions = {
    //    'year-format': "'yy'",
    //    'starting-day': 1
    //};

}]);