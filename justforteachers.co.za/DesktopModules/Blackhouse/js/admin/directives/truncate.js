app.filter('truncate', function () {
    return function (text, length) {
        if (isNaN(length))
            length = 10;

        if (text.length <= length) {
            return text;
        } else {
            return String(text).substring(0, length) + "...";
        }
    };
});