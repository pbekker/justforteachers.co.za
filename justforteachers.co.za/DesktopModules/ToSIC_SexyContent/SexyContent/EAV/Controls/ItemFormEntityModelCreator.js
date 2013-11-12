//var EavEntityModels;
//if (EavEntityModels == undefined)
//	EavEntityModels = new Object();
//EavEntityModels[291] = ({"EntityID":291,"EntityGUID":"98de32d0-f01a-4227-ac72-ad0022ca0861","Attributes":[{"StaticName":"LastName","IsTitle":true,"Values":[{"ValueID":1271,"Value":"Gemperle EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168},{"ValueID":1279,"Value":"Gemperle FR","Dimensions":[{"DimensionID":6,"ReadOnly":false}],"ChangeLogIDCreated":170}],"DefaultValue":{"ValueID":1271,"Value":"Gemperle EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168}},{"StaticName":"FirstName","IsTitle":false,"Values":[{"ValueID":1272,"Value":"Benjamin EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168},{"ValueID":1280,"Value":"Benjamin FR","Dimensions":[{"DimensionID":6,"ReadOnly":false}],"ChangeLogIDCreated":170},{"ValueID":1283,"Value":"Benjamin DE","Dimensions":[{"DimensionID":7,"ReadOnly":false}],"ChangeLogIDCreated":171}],"DefaultValue":{"ValueID":1272,"Value":"Benjamin EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168}},{"StaticName":"City","IsTitle":false,"Values":[{"ValueID":1273,"Value":"Sevelen EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168},{"ValueID":1281,"Value":"Sevelen FR","Dimensions":[{"DimensionID":6,"ReadOnly":false}],"ChangeLogIDCreated":170}],"DefaultValue":{"ValueID":1273,"Value":"Sevelen EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168}},{"StaticName":"City2","IsTitle":false,"Values":[{"ValueID":1274,"Value":"Buchs EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168},{"ValueID":1282,"Value":"Buchs FR","Dimensions":[{"DimensionID":6,"ReadOnly":false}],"ChangeLogIDCreated":170}],"DefaultValue":{"ValueID":1274,"Value":"Buchs EN","Dimensions":[{"DimensionID":5,"ReadOnly":false}],"ChangeLogIDCreated":168}}],"FallbackDimensions":[{"DimensionID":5,"ReadOnly":false}]});
//var EavDimensionsModel = [{ "DimensionID": 2, "Name": "English (United States)" }, { "DimensionID": 3, "Name": "Deutsch (Deutschland)" }];

// ToDo: Ensure this is not loaded in Insert-Mode
EAV.Entities = {
    // Creates a client-side model for working with Entities
    CreateEntityModel: function (entityModelJson) {

        var entityModel = {
            EntityID: entityModelJson.EntityID,
            EntityGUID: entityModelJson.EntityGUID,
            Attributes: EAV.Entities.CreateAttributeListModel(entityModelJson),
            _json: entityModelJson
        };

        return entityModel;
    },

    CreateAttributeListModel: function (entityModelJson) {
        var attributes = {};

        $.each(entityModelJson.Attributes, function (i, attributeModelJson) {
            attributes[attributeModelJson.StaticName] = EAV.Entities.CreateAttributeModel(attributeModelJson);
        });

        return attributes;
    },

    CreateAttributeModel: function (attributeModelJson) {
        var attributeModel = {
            StaticName: attributeModelJson.StaticName,
            Values: EAV.Entities.CreateValueListModel(attributeModelJson),
            GetDimensions: function () {
                var dimensions = {};
                $.each(attributeModel.Values, function (i, value) {
                    $.extend(dimensions, value.Dimensions);
                });
                return dimensions;
            },
            HasDimension: function (dimensionID) {
                return attributeModel.GetDimensions()[dimensionID] != null;
            },
            GetValueIDByDimensionID: function (dimensionID) {
                var valueID = null;
                $.each(attributeModel.GetDimensions(), function (i, dimension) {
                    if (dimension.DimensionID == dimensionID)
                        valueID = dimension.ValueID;
                });
                return valueID;
            },
            _json: attributeModelJson
        };

        return attributeModel;
    },

    CreateValueListModel: function (attributeModelJson) {
        var values = {};

        $.each(attributeModelJson.Values, function (i, valueModelJson) {
            values[valueModelJson.ValueID] = EAV.Entities.CreateValueModel(valueModelJson);
        });

        return values;
    },

    CreateValueModel: function (valuesModelJson) {
        var valueModel = {
            ValueID: valuesModelJson.ValueID,
            Value: valuesModelJson.Value,
            Dimensions: EAV.Entities.CreateDimensionListModel(valuesModelJson),
            HasDimension: function (dimensionID) {
                return valueModel.Dimensions[dimensionID] != null;
            },
            GetDimensionsCount: function () {
                return $.map(valueModel.Dimensions, function (i, e) {
                    return e;
                }).length;
            },
            _json: valuesModelJson
        };
        return valueModel;
    },

    CreateDimensionListModel: function (valueModelJson) {
        var dimensions = {};

        $.each(valueModelJson.Dimensions, function (i, dimensionModelJson) {
            dimensions[dimensionModelJson.DimensionID] = EAV.Entities.CreateDimensionModel(dimensionModelJson, valueModelJson.ValueID);
        });

        return dimensions;
    },

    CreateDimensionModel: function (dimensionModelJson, valueID) {
        var dimensionModel = {
            DimensionID: dimensionModelJson.DimensionID,
            ValueID: valueID,
            ReadOnly: dimensionModelJson.ReadOnly,
            _json: dimensionModelJson
        };
        return dimensionModel;
    }
};