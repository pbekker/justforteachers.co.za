// EAV Object
EAV = {
    FormsInitialized: false,
    FieldControllerManager: new Object(),
    Dimensions: new Object(),
    InitializeForms: function () {
        // Initialize if not already done
        if (EAV.FormsInitialized == null || !EAV.FormsInitialized) {
            // Hide Save Button until EAV is initialized
            $("." + EAV.CssClasses.SaveButtonClass).hide();

            // Create Dimensions Model
            $.each(EavDimensionsModel, function (i, dimension) {
                EAV.Dimensions[dimension.DimensionID] = dimension;
            });

            // Loop through each EAV form wrapper
            $(".eav-form").each(function (i, form) {
                EAV.AttachFormController(form);
            });
            // Initialization done, set Initialized to true and show save button again
            EAV.FormsInitialized = true;
            $("." + EAV.CssClasses.SaveButtonClass).show();
        }
    },

    CssClasses: {
        LockedClass: "eav-dimension-locked",
        ButtonDisabledClass: "disabled",
        MenuWrapper: "eav-dimensionmenu-wrapper",
        SaveButtonClass: "eav-save"
    },

    AttachFormController: function (form) {

        var formController = $(form).get(0).Controller = {
            DefaultCultureDimension: parseInt($(form).attr("data-defaultculturedimension")),
            CurrentCultureDimension: parseInt($(form).attr("data-activeculturedimension")),

            TranslateAll: function () {
                $.each(formController.EntityModel.Attributes, function (i, e) {
                    e.Controller.Unlink();
                });
            },

            UseDefaultAll: function () {
                $.each(formController.EntityModel.Attributes, function (i, e) {
                    e.Controller.UseDefault();
                });
            },

            ShareFromAll: function (dimensionId) {
                formController.RunForAllAttributesIfRequirement(dimensionId, "CanShareDimension", "Share");
            },

            UseFromAll: function (dimensionId) {
                formController.RunForAllAttributesIfRequirement(dimensionId, "CanUseDimension", "UseFrom");
            },

            CopyFromAll: function (dimensionId) {
                formController.RunForAllAttributesIfRequirement(dimensionId, "CanCopyDimension", "Copy");
            },

            RunForAllAttributesIfRequirement: function (dimensionId, requirement, functionToRun) {
                var can = [];
                var canNot = [];

                $.each(formController.EntityModel.Attributes, function (i, e) {
                    if (e.Controller[requirement](dimensionId))
                        can.push(e);
                    else
                        canNot.push(e);
                });

                var canString = "\n\nWill apply to:\n- " + can.length == 0 ? "(none)" : $.map(can, function (e) { return e.Controller.StaticName; }).join('\n- ');
                var canNotString = "\n\nWill not change:\n- " + canNot.length == 0 ? "(none)" : $.map(canNot, function (e) { return e.Controller.StaticName; }).join('\n- ');
                var confirmString = "Not all fields are available in " + EAV.Dimensions[dimensionId].Name + "." + canString + canNotString;

                if (canNot.length == 0 || confirm(confirmString)) {
                    $.each(can, function (i, e) {
                        e.Controller[functionToRun](dimensionId);
                    });
                }
            },

            IsChanged: function () {
                var changed = false;

                // If there are no form fields, return false
                if ($(form).find(".eav-field").size() == 0)
                    return false;

                // If Entity does not exist yet, changes won't be tracked
                if (formController.EntityModel == null)
                    return true;

                $.each(formController.EntityModel.Attributes, function (i, e) {
                    if (e.Controller.IsChanged())
                        changed = true;
                });
                return changed;
            }
        };

        // If the current language is not the master language, attach Controllers etc.
        if ((formController.CurrentCultureDimension != formController.DefaultCultureDimension) && !isNaN(formController.DefaultCultureDimension))
            $(".eav-message-defaultfirst").html("Edit this in the default language <i>" + EAV.Dimensions[formController.DefaultCultureDimension].Name + "</i> before translating.");

        // Set entityModel to form if available
        if (window.EavEntityModels != null) {
            var entityModelJson = EavEntityModels[$(form).attr("data-entityid")];
            if (entityModelJson != null) {
                formController.EntityModel = EAV.Entities.CreateEntityModel(entityModelJson);
            }
        }

        // Loop through each EAV field in form and attach controller
        $(".eav-field", form).each(function (i, field) {
            EAV.AttachFieldController($(field), $(form));
        });
    },

    // Attaches a controller to the target (EAV field)
    AttachFieldController: function (field, form) {

        // Create controller object
        var controller = field.get(0).Controller = {
            // Data-attributes
            StaticName: field.attr("data-staticname"),
            FieldIsMasterRecord: field.attr("data-ismasterrecord") == 'true',
            MenuWrapper: field.find("." + EAV.CssClasses.MenuWrapper),
            FieldType: field.attr("data-fieldtype"),
            FieldIsEnabled: field.attr("data-enabled") == 'true',

            // Original Values
            OriginalValue: "",
            OriginalValueID: "",
            OriginalReadOnlyState: "",

            // Hidden fields
            HiddenFieldReadOnly: field.find("input[type=hidden][id$='_hfReadOnly']"),
            HiddenFieldValueID: field.find("input[type=hidden][id$='_hfValueID']"),

            SetReadOnly: function (readOnlyState) {
                controller.FieldController.SetReadOnly(readOnlyState);
                controller.HiddenFieldReadOnly.val(readOnlyState);
                controller.AppendDimensionsMenu();
            },

            GetReadOnly: function () {
                return controller.HiddenFieldReadOnly.val() == 'true';
            },

            SetFieldValue: function (value) {
                controller.FieldController.SetValue(value);
            },

            GetFieldValue: function () {
                return controller.FieldController.GetValue();
            },

            SetFieldValueByValueID: function (valueID) {
                controller.SetFieldValue(controller.AttributeModel.Values[valueID].Value);
            },

            SetValueID: function (valueID) {
                controller.HiddenFieldValueID.val(valueID);
                if (valueID != "" && valueID != null)
                    controller.SetFieldValueByValueID(valueID);
                controller.AppendDimensionsMenu();
            },

            GetValueID: function () {
                return controller.HiddenFieldValueID.val();
            },

            GetCurrentValueModel: function () {
                return controller.AttributeModel.Values[controller.GetValueID()];
            },

            UseFrom: function (dimensionId) {
                var valueId = controller.AttributeModel.GetValueIDByDimensionID(dimensionId);
                controller.SaveFieldValueBeforeIfTranslated();
                controller.SetReadOnly(true);
                controller.SetValueID(valueId);
            },

            Share: function (dimensionId) {
                var valueId = controller.AttributeModel.GetValueIDByDimensionID(dimensionId);
                controller.SaveFieldValueBeforeIfTranslated();
                controller.SetReadOnly(false);
                controller.SetValueID(valueId);
            },

            Copy: function (dimensionId) {
                // Unlink if currently read-only
                if (controller.GetReadOnly())
                    controller.Unlink();

                var valueId = controller.AttributeModel.GetValueIDByDimensionID(dimensionId);
                controller.SetFieldValueByValueID(valueId);
            },

            AutoTranslate: function (dimensionId) {

                // Get value from model
                var valueID = controller.AttributeModel.GetValueIDByDimensionID(dimensionId);
                var value = controller.AttributeModel.Values[valueID].Value;

                // Fix some HTML that could cause issues
                value = value.replace("><", "> <");

                // Prepare taget and source language
                var sourceLanguage = EAV.Dimensions[dimensionId].ExternalKey.substring(0, 2);
                var targetLanguage = EAV.Dimensions[form.get(0).Controller.CurrentCultureDimension].ExternalKey.substring(0, 2);

                var yqlUrl = "http://query.yahooapis.com/v1/public/yql?format=json";
                //var data = "q=" + encodeURIComponent('select * from json where url="http://translate.google.de/translate_a/t?client=t&text=Translate&hl=de&sl=en&tl=de&ie=UTF-8&oe=UTF-8&multires=1&otf=2&ssel=0&tsel=0"');

                var data = "q=" + encodeURIComponent("use 'https://raw.github.com/yql/yql-tables/master/data/jsonpost.xml' as jsonpost; "
                + "select * from jsonpost where "
                + "url='http://translate.google.de/translate_a/t' "
                + "and postdata='client=t&text=" + encodeURIComponent(value).replace('\'', '\\\'') + "&hl=en&sl=" + sourceLanguage + "&tl=" + targetLanguage + "&ie=UTF-8&oe=UTF-8&multires=1&otf=2&ssel=0&tsel=0'");

                jQuery.ajax({
                    async:true,
                    crossDomain: true,
                    url: yqlUrl,
                    data: data,
                    cache: false,
                    success: function (data) {
                        // data is the JSON response
                        // process the response here
                        if (typeof data == "string")
                            data = $.parseJSON(data);

                        var translationResults = data.query.results;
                        if (translationResults != null) {
                            var translationValue = "";

                            $.each(eval(translationResults.postresult)[0], function (i, v) {
                                translationValue += v[0];
                            });

                            // Fix some things Google adds to HTML
                            translationValue = translationValue.replace("</ ", "</");
                            translationValue = translationValue.replace("< / ", "</");
                            translationValue = translationValue.replace("< /", "</");
                            translationValue = translationValue.replace(" >", ">");

                            controller.SetFieldValue(translationValue);

                            // Unlink if currently read-only
                            if (controller.GetReadOnly())
                                controller.Unlink();
                        }
                    },
                    error: function (e) {
                        alert("An error occurred while translating the text. Please try again.");
                    }
                });
            },

            UseDefault: function () {
                controller.SaveFieldValueBeforeIfTranslated();
                controller.SetReadOnly(true);
                controller.SetValueID("");
                controller.SetFieldValueByValueID(controller.AttributeModel.GetValueIDByDimensionID(form.get(0).Controller.DefaultCultureDimension));
            },

            Unlink: function () {
                controller.SetReadOnly(false);
                controller.SetValueID("");

                if (controller.FieldValueBefore != null) {
                    controller.SetFieldValue(controller.FieldValueBefore);
                    controller.FieldValueBefore = null;
                }
            },

            SaveFieldValueBeforeIfTranslated: function () {
                if (controller.GetState() == "Translate")
                    controller.FieldValueBefore = controller.GetFieldValue();
            },

            // Hide the control only
            HideControl: function () {
                field.find(".eav-field-control").hide();

                // Run field-specific HideControl function if exists
                if (controller.FieldController.HideControl != null)
                    controller.FieldController.HideControl();
            },

            AppendDimensionsMenu: function () {
                if (!controller.FieldIsMasterRecord)
                    EAV.AppendDimensionsMenu(field, form);
            },

            GetState: function () {
                if (controller.GetValueID() == "" && controller.GetReadOnly())
                    return "Default";
                if (controller.GetValueID() != "" && controller.GetReadOnly())
                    return "Use";

                if (controller.GetValueID() == "" && !controller.GetReadOnly())
                    return "Translate";

                if (controller.GetValueID() != "" && !controller.GetReadOnly()) {
                    if (controller.GetCurrentValueModel().GetDimensionsCount() == 1 && controller.GetCurrentValueModel().HasDimension(form.get(0).Controller.CurrentCultureDimension))
                        return "Translate";
                    else
                        return "Share";
                }
            },

            CanUseDimension: function (dimensionID) {
                return controller.AttributeModel.HasDimension(dimensionID) && dimensionID != form.get(0).Controller.CurrentCultureDimension;
            },

            CanShareDimension: function (dimensionID) {
                return controller.AttributeModel.HasDimension(dimensionID) && dimensionID != form.get(0).Controller.CurrentCultureDimension;
            },

            CanCopyDimension: function (dimensionID) {
                return controller.AttributeModel.HasDimension(dimensionID);
            },

            IsChanged: function () {
                return (controller.OriginalReadOnlyState != controller.GetReadOnly()) ||
                        (controller.OriginalValue != controller.GetFieldValue()) ||
                        (controller.OriginalValueID != controller.GetValueID());
            }
        };

        // Attach field-specific controllers
        controller.FieldController = EAV.FieldControllerManager[field.get(0).Controller.FieldType.toLowerCase()](field);

        if (controller.FieldIsEnabled) {
            // Attach AttributeModel for this field
            if (form.get(0).Controller.EntityModel != null)
                controller.AttributeModel = form.get(0).Controller.EntityModel.Attributes[controller.StaticName];
            // Append Controller to AttributeModel
            if (controller.AttributeModel != null)
                controller.AttributeModel.Controller = controller;

            // Set field to read-only if required
            controller.SetReadOnly(controller.GetReadOnly());

            // Set current field values for later comparison (IsChanged) - ReadOnly, Value, ValueID
            controller.OriginalReadOnlyState = controller.GetReadOnly();
            controller.OriginalValue = controller.GetFieldValue();
            controller.OriginalValueID = controller.GetValueID();

            // Append Dimensions Menu for this field
            controller.AppendDimensionsMenu(field, form);

            // Let the lock icon jump on hover of field
            field.find(".eav-field-control").mouseenter(function () {
                if (controller.GetReadOnly()) {
                    field.find(".eav-dimension-lockicon").animate({ "top": "-7px" }, 150).animate({ "top": "0px" }, 150);
                    field.find(".eav-dimension-message").animate({ "left": "-3px" }, 100).animate({ "left": "3px" }, 100).animate({ "left": "0px" }, 100);
                }
            });

        } else {
            field.find(".eav-field-control:first").after("<span class='eav-dimension-defaultfirst'>create this in <i>" + EAV.Dimensions[form.get(0).Controller.DefaultCultureDimension].Name + "</i> before translating</span>");
            controller.HideControl();
        }
    },

    AppendDimensionsMenu: function (field, form) {
        var fieldController = field.get(0).Controller;
        var formController = form.get(0).Controller;
        field.find(".eav-dimension").remove();

        var menuBase = $("<div class='eav-dimension'><a class='eav-dimension-lockicon' href='javascript:void(0);'></a><span class='eav-dimension-message'>&nbsp;</span><ul class='eav-dimension-actions' /></div>");
        var menu = menuBase.find(".eav-dimension-actions");

        menuBase.find(".eav-dimension-lockicon").bind("click", function () {
            if (fieldController.GetState() == "Translate")
                fieldController.UseDefault();
            else
                fieldController.Unlink();
        });

        // Append Translate button
        if (fieldController.GetState() != "Translate")
            EAV.AppendDimensionsMenuItem(menu, "Translate (unlink)", fieldController.Unlink, true);

        if (fieldController.GetState() != "Default")
            EAV.AppendDimensionsMenuItem(menu, "Use default", fieldController.UseDefault, true);

        var autoTranslateParent = EAV.AppendDimensionsMenuItem(menu, "Google-Translate from", fieldController.UseDefault, true);

        // Append "Copy" menu
        var copyFromParent = EAV.AppendDimensionsMenuItem(menu, "Copy from", null, true);
        // Append "Use" menu
        var useFromParent = EAV.AppendDimensionsMenuItem(menu, "Use from", null, true);
        // Append "Share" menu
        var shareFromParent = EAV.AppendDimensionsMenuItem(menu, "Share from", null, true);


        // Append "All Items" menu
        var allItemsParent = EAV.AppendDimensionsMenuItem(menu, "All fields", null, true);
        EAV.AppendDimensionsMenuItem(allItemsParent, "Translate", formController.TranslateAll, true);
        EAV.AppendDimensionsMenuItem(allItemsParent, "Use default", formController.UseDefaultAll, true);

        var copyAllItemsParent = EAV.AppendDimensionsMenuItem(allItemsParent, "Copy from", null, true);
        var useAllItemsParent = EAV.AppendDimensionsMenuItem(allItemsParent, "Use from", null, true);
        var shareAllItemsParent = EAV.AppendDimensionsMenuItem(allItemsParent, "Share from", null, true);


        // Loop Dimensions and append to menus
        $.each(EAV.Dimensions, function (i, dimension) {
            EAV.AppendDimensionsMenuItem(autoTranslateParent, dimension.Name, function () { fieldController.AutoTranslate(dimension.DimensionID); }, fieldController.AttributeModel.HasDimension(dimension.DimensionID));
            EAV.AppendDimensionsMenuItem(copyFromParent, dimension.Name, function () { fieldController.Copy(dimension.DimensionID); }, fieldController.CanCopyDimension(dimension.DimensionID));
            EAV.AppendDimensionsMenuItem(useFromParent, dimension.Name, function () { fieldController.UseFrom(dimension.DimensionID); }, fieldController.CanUseDimension(dimension.DimensionID));
            EAV.AppendDimensionsMenuItem(shareFromParent, dimension.Name, function () { fieldController.Share(dimension.DimensionID); }, fieldController.CanShareDimension(dimension.DimensionID));

            EAV.AppendDimensionsMenuItem(copyAllItemsParent, dimension.Name, function () { formController.CopyFromAll(dimension.DimensionID); }, true);
            EAV.AppendDimensionsMenuItem(useAllItemsParent, dimension.Name, function () { formController.UseFromAll(dimension.DimensionID); }, true);
            EAV.AppendDimensionsMenuItem(shareAllItemsParent, dimension.Name, function () { formController.ShareFromAll(dimension.DimensionID); }, true);
        });

        // Append locked class if read-only
        menuBase.toggleClass(EAV.CssClasses.LockedClass, fieldController.GetReadOnly());

        // Set hover functions to open the menu
        menuBase.add(menu.find("li")).hover(function () {
            var hoverInterval = $(this).data("hoverTimeout");
            if (hoverInterval != null)
                window.clearTimeout(hoverInterval);

            // Hide ul's on same level, hide hovered li > ul
            $(this).parent().find("> li > ul").not($(this).children("ul")).hide();
            $(this).children("ul").show();

            // If the menu was hovered, close all other open menus
            if ($(this).hasClass("eav-dimension"))
                $(this).parents(".eav-form").find(".eav-dimension-actions").not($(this).find(".eav-dimension-actions")).hide();
        }, function () {
            var element = $(this);
            var hoverInterval = window.setTimeout(function () {
                element.children("ul").hide();
            }, 300);
            element.data("hoverTimeout", hoverInterval);
        });

        // Append message
        EAV.GetDimensionsMenuMessage($(".eav-dimension-message", menuBase), field, form);

        fieldController.MenuWrapper.append(menuBase);
    },
    AppendDimensionsMenuItem: function (wrapper, text, action, active) {
        if (wrapper.is("li")) {
            wrapper.addClass("haschildren");
            if ($("ul", wrapper).size() == 0) {
                wrapper.append("<ul />");
            }
            wrapper = wrapper.find("ul:first");
        }

        var menuItem = $("<li />");

        var anchor = $("<a href='javascript:void(0);' />").text(text);

        if (!active)
            anchor.addClass("disabled");

        anchor.bind("click", function () {
            if (!$(this).hasClass("disabled"))
                anchor.trigger("eav-action");
        });

        if (action != null)
            anchor.bind("eav-action", action);

        menuItem.append(anchor);
        wrapper.append(menuItem);
        return menuItem;
    },

    GetDimensionsMenuMessage: function (target, field, form) {
        fieldController = field.get(0).Controller;
        var message = "&nbsp;";
        var toolTip = "";
        var valueModel = fieldController.GetCurrentValueModel();

        if (valueModel != null && fieldController.GetState() != "Translate") {
            var dimensions = $.map(fieldController.GetCurrentValueModel().Dimensions, function (i) { return i; });
            dimensions = $(dimensions).filter(function (i, e) {
                return e.DimensionID != form.get(0).Controller.CurrentCultureDimension;
            });

            var sharedDimensions = $(dimensions).filter(function (i, e) { return !e.ReadOnly; });
            var usedDimensions = $(dimensions).filter(function (i, e) { return e.ReadOnly; });

            var sharedDimensionsString = "";
            if ($(sharedDimensions).size() != 0) {
                sharedDimensionsString += $.map(sharedDimensions, function (e) {
                    return EAV.Dimensions[e.DimensionID].ExternalKey;
                }).join(', ');
            }

            var usedDimensionsString = "";
            if ($(usedDimensions).size() != 0) {
                usedDimensionsString += $.map(usedDimensions, function (e) {
                    return EAV.Dimensions[e.DimensionID].ExternalKey;
                }).join(', ');
            }

            // Build message
            if (sharedDimensionsString != "" || usedDimensionsString != "") {
                message = "in <strong>" + sharedDimensionsString + "</strong>";
                message += (sharedDimensionsString != "" && usedDimensionsString != "" ? ", " : "") + usedDimensionsString;

                toolTip += sharedDimensionsString != "" ? "editable in " + sharedDimensionsString : "";
                toolTip += usedDimensionsString != "" ? (toolTip == "" ? "" : "\r\n") + "also used in " + usedDimensionsString : "";
            }


        }
        else if (fieldController.GetReadOnly() == true) {
            message = "auto (default)";
        }

        $(target).html(message).attr("title", toolTip);
    }
};

function pageLoad(sender, e) {
    EAV.InitializeForms();
}

/*$(document).ready(function () {
InitializeControllers();
});*/



// Object used to store field-specific controller functions
EAV.FieldControllerManager = {
    string: function (objWrapper) {
        var Controller = new Object();
        var FieldSubType = objWrapper.attr("data-fieldsubtype").toLowerCase();

        switch (FieldSubType) {
            case "dropdown":
                var field = objWrapper.find("select");
                Controller.SetReadOnly = function (readOnlyState) {
                    field.prop("disabled", readOnlyState);
                };
                Controller.SetValue = function (value) {
                    field.val(value);
                };
                Controller.GetValue = function () {
                    return field.val();
                };
                break;
            case ("wysiwyg"):
                var editor = $find(objWrapper.find(".RadEditor").get(0).id);
                Controller.SetReadOnly = function (readOnlyState) {
                    // Bug DNN 7: Radeditor won't get disabled if this runs without timeout
                    window.setTimeout(function () {
                        // Bug in Radeditor: Must not set editable to the same value twice!
                        if (!readOnlyState != editor.get_editable()) {
                            editor.enableEditing(!readOnlyState);
                            editor.set_editable(!readOnlyState);
                            if (readOnlyState == true) editor.get_document().body.style.backgroundColor = "#EEE";
                            else editor.get_document().body.style.backgroundColor = "";
                        }
                    }, 1);

                    //if (!editor.get_isInitialized()) {

                    //}
                };
                Controller.SetValue = function (value) {
                    editor.set_html(value);
                };
                Controller.GetValue = function () {
                    return editor.get_html();
                };
                break;
            default:
                var field = objWrapper.find("input[type=text],textarea");
                Controller.SetReadOnly = function (readOnlyState) { field.prop("disabled", readOnlyState); };
                Controller.SetValue = function (value) { field.val(value); };
                Controller.GetValue = function () { return field.val(); };
                break;
        }

        return Controller;
    },

    boolean: function (objWrapper) {
        var Controller = new Object();

        var checkBox = objWrapper.find("input[type=checkbox]");
        Controller.SetReadOnly = function (readOnlyState) { checkBox.prop("disabled", readOnlyState); };
        Controller.SetValue = function (value) {
            var checked = value.toLower() == 'true';
            checkBox.prop("checked", checked);
            $(objWrapper).find(".dnnCheckbox").toggleClass("dnnCheckbox-checked", checked);
        };
        Controller.GetValue = function () {
            return checkBox.prop("checked");
        };
        return Controller;
    },

    datetime: function (objWrapper) {
        var Controller = new Object();

        var field = objWrapper.find("input[type=text]");
        var calPopup = objWrapper.find(".rcCalPopup");

        Controller.SetReadOnly = function (readOnlyState) {
            field.prop("disabled", readOnlyState);
            calPopup.toggle(!readOnlyState);
        };
        Controller.SetValue = function (value) { field.val(value); };
        Controller.GetValue = function () { return field.val(); };

        return Controller;
    },

    file: function (objWrapper) {
        var Controller = new Object();

        var field = objWrapper.find("input[type=text]");
        var browseFile = objWrapper.find(".sc-browsefile");

        Controller.SetReadOnly = function (readOnlyState) {
            field.prop("disabled", readOnlyState);
            browseFile.toggle(!readOnlyState);
        };
        Controller.SetValue = function (value) {
            field.val(value);
        };
        Controller.GetValue = function () {
            return field.val();
        };
        return Controller;
    },

    number: function (objWrapper) {
        var Controller = new Object();

        var field = objWrapper.find("input[type=text]");
        Controller.SetReadOnly = function (readOnlyState) { field.prop("disabled", readOnlyState); };
        Controller.SetValue = function (value) { field.val(value); };
        Controller.GetValue = function () { return field.val(); };
        return Controller;
    }
};



/* Fix cross-browser ajax request support for IE 8 / 9. Source: Comments of http://bugs.jquery.com/ticket/8283 */
$.ajaxTransport(function (options, originalOptions, jqXHR) {
    var xdr;

    return {
        send: function (_, completeCallback) {
            xdr = new XDomainRequest();
            xdr.onload = function () {
                if (xdr.contentType.match(/\/json/)) {
                    options.dataTypes.push("json");
                }

                completeCallback(200, 'success', { text: xdr.responseText });
            };
            xdr.onerror = xdr.ontimeout = function () {
                completeCallback(400, 'failed', { text: xdr.responseText });
            }

            xdr.open(options.type, options.url);
            xdr.send(options.data);
        },
        abort: function () {
            if (xdr) {
                xdr.abort();
            }
        }
    };
});
