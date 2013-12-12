app.controller('ResourcesApproval', ['$scope', "ResourcesApi", function ($scope, ResourcesApi) {

    $scope.files = [];
    $scope.defaults = undefined;
    $scope.returnedFiles = [{ preview: "" }];

    ResourcesApi.get.approvalPayload(function (data) {
        console.log("Success: ", data);
        console.log("info: ", data.resourceList);
        $scope.defaults = data.resourceList;
    });

}]);