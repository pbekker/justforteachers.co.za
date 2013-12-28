app.directive('valueSetter', function ($parse) {
    return function (scope, element, attrs) {
        if (attrs.ngModel) {
            $parse(attrs.ngModel).assign(scope, element.val());
        }
    };
})