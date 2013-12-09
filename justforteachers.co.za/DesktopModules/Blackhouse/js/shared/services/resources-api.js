app.factory('ResourcesApi', ['$http', function ($http) {

    $http.defaults.useXDomain = true;

    var baseURL = "http://localhost:27645/api"
        uploadURL = baseURL + "/resourceupload",
        resourcelistURL = baseURL + "/resourcelist"

    return {
        get: {
            creationPayload: function (callback) {
                $http.get(uploadURL).success(callback);
            },

            listPayLoad: function (callback) {
                $http.get(resourcelistURL).success(callback);
            }
        },
        post: {
            createResource: function (data, files, success) {
                var xhr = new XMLHttpRequest();
                xhr.open('POST', uploadURL, true);
                //xhr.responseType = 'text';
                xhr.onload = function (e) {

                    console.log(e);

                    if (this.status == 200) {
                        console.log(this.response);
                    }
                };

                var formData = new FormData();


                
                formData.append("model", angular.toJson(data));
                for (var i = 0; i < files.length; i++) {
                    formData.append("file" + i, files[i]);
                }

                xhr.send(formData);
                $http({
                    method: 'POST',
                    url: baseURL,
                    //IMPORTANT!!! You might think this should be set to 'multipart/form-data' 
                    // but this is not true because when we are sending up files the request 
                    // needs to include a 'boundary' parameter which identifies the boundary 
                    // name between parts in this multi-part request and setting the Content-type 
                    // manually will not set this boundary parameter. For whatever reason, 
                    // setting the Content-type to 'false' will force the request to automatically
                    // populate the headers properly including the boundary parameter.
                    headers: { 'Content-Type': false },
                    //This method will allow us to change how the data is sent up to the server
                    // for which we'll need to encapsulate the model data in 'FormData'
                    transformRequest: function (data) {

                        var formData = new FormData();
                        //need to convert our json object to a string version of json otherwise
                        // the browser will do a 'toString()' on the object which will result 
                        // in the value '[Object object]' on the server.
                        formData.append("model", angular.toJson(data.model));
                        //now add all of the assigned files
                        for (var i = 0; i < data.files.length; i++) {
                            //add each file to the form data and iteratively name them
                            formData.append("file" + i, data.files[i]);
                        }


                        console.log(formData);

                        return formData;
                    },
                    //Create an object that contains the model and files which will be transformed
                    // in the above transformRequest method
                    data: { model: data, files: files }
                }).
		        success(function (data, status, headers, config) {
		            success(data);
		        }).
		        error(function (data, status, headers, config) {
		            console.log("failed!", arguments);
		        });
            }
        },
        put: {
            appendResources: function () {

            }
        }

    }


}]);