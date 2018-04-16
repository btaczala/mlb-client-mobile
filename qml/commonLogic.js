function getThreeModels(major, pretendent, basic, apiToCall, functionToCallAfter, convertFunction) {

    var callback = function (jsonData) {
        var result = JSON.parse(jsonData)
        major.clear()
        pretendent.clear()
        basic.clear()

        __parseModel(result["major"], major, convertFunction)
        __parseModel(result["pretendent"], pretendent, convertFunction)
        __parseModel(result["basic"], basic, convertFunction)

        functionToCallAfter();
        return true;
    }

    apiToCall(callback);
}

function __parseModel(data, model, convertFunction) {
    for (var count = 0; count < data.length; count++) {
        var obj = data[count];

        model.append(convertFunction(obj));
    }
}
