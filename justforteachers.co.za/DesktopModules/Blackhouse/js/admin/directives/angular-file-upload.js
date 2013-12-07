app.directive('fileUpload', ['$rootScope', function ($rootScope) {

    var mimeTypes = "*";

    return {
        scope: true,
        template: "<div class='file-upload'>"
                + "<label class='file-upload-label' ng-class='dropClass'>"
                + "<input type='file' accept='{{mimeTypes}}' class='file-upload-input' multiple>"
                + "<span class='file-upload-label' ng-show='!files.length'>{{fileUploadlabel}}</span>"
                + "<img class='file-upload-preview' ng-src='{{fileSrc}}' ng-show='files.length'>"
                + "</label>"
                + "<ul class='file-previews'>"
                + "<li ng-repeat='file in files'>{{file | json}}</li>"
                + "</ul>"
                + "</div>",
        replace: true,
        link: function (scope, element, attrs) {

            scope.mimeTypes = mimeTypes;
            scope.fileUploadlabel = 'Drop image here';
            scope.files = [];
            scope.fileSrc = '';

            function dragEnterLeave(event) {
                event.stopPropagation()
                event.preventDefault()
            }

            function filesAdded(files) {
                if (files.length) {
                    scope.$apply(function () {
                        scope.files = [];

                        for (var i in files) {
                            var file = files[i];
                            if (file.type) { //  && file.type.indexOf('image/') != -1
                                scope.files.push(file);
                            } else {
                                console.log("thats not a file bru");
                            }
                        }

                        $rootScope.$broadcast('filesAdded', scope.files);
                    })
                }
            }

            function errorHandler(event) {
                switch (event.target.error.code) {
                    case event.target.error.NOT_FOUND_ERR:
                        console.log('File Not Found!');
                        break;
                    case event.target.error.NOT_READABLE_ERR:
                        console.log('File is not readable');
                        break;
                    case event.target.error.ABORT_ERR:
                        console.log('User aborted');
                        break; // noop
                    default:
                        console.log('An error occurred reading this file.');
                };
            }

            function previewFiles(file) {
                //var reader = new FileReader();
                //reader.onerror = errorHandler;
                //reader.onload = function (e) {
                //    scope.$apply(function () {
                //        scope.fileSrc = reader.result;
                //    });
                //}
                //reader.readAsDataURL(file);
            }

            scope.$watchCollection('files', function (files) {
                console.log(files);
                previewFiles(files);
            });


            element.bind('dragenter', dragEnterLeave);
            element.bind('dragleave', dragEnterLeave);

            element.bind('dragover', function (event) {
                event.stopPropagation()
                event.preventDefault()
                var ok = event.dataTransfer && event.dataTransfer.types && event.dataTransfer.types.indexOf('Files') >= 0
                scope.dropClass = ok ? 'over' : 'not-available';
            });

            element.bind('drop', function (event) {
                event.stopPropagation()
                event.preventDefault()
                scope.dropClass = 'drop';
                filesAdded(event.dataTransfer.files)
            });

            element.find('input').bind('change', function (event) {
                var files = event.target.files;
                filesAdded(files);
            });
        }
    };
}]);
