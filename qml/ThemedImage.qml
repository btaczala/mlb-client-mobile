import QtQuick 2.9
import QtQuick.Controls.Material 2.1

Image {

    smooth: true
    property string url

    source: {
        if (url === "")
            return ""
        if (Material.theme === Material.Dark) {
            return url + "_white_48px.svg"
        }
        return url + "_black_48px.svg"
    }
}
