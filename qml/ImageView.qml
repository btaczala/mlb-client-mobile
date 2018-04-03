import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

BasePage {
    width: 700
    height: 16/9 * width

    property string url

    Flickable {
        anchors.fill: parent
        contentHeight: image.height
        contentWidth: image.width

        Image {
            id: image
            source: url
        }
    }
}
