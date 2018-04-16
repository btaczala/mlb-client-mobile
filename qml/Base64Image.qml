import QtQuick 2.9

Image {
    property string urlOrData


    source : {
        if (urlOrData.startsWith("http://") || urlOrData.startsWith("https://")) {
            return urlOrData;
        } else {
            return "data:image/png;base64," + urlOrData
        }
    }
}
