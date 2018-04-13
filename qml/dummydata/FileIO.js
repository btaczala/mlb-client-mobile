function readFile(path, callback) {
    var xhr = new XMLHttpRequest;
    xhr.open("GET", path)
    xhr.onreadystatechange = function () {
        console.log("FileIO.qml: Reading file ", path, " state = ", xhr.readyState);
        if (xhr.readyState === XMLHttpRequest.DONE) {
            var response = xhr.responseText
            // use file contents as required
            callback(response)
        }
    }
    xhr.send()
}
