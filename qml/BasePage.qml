import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Page {
    property var applicationWindow
    property var globalSettings
    readonly property bool inPortrait: width < height
    signal requestNewPage(string url, var props)

    property bool loading: false

    onLoadingChanged: {

    }

    Popup {
        modal: true
        focus: true
        visible: loading
        width: 100
        height: 100
        x: 100
        y: 100

        closePolicy: Popup.NoAutoClose

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0.0
                to: 1.0
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1.0
                to: 0.0
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            BusyIndicator {
                anchors.fill: parent
            }
        }
    }
}
