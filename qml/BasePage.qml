import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Page {
    id: root
    property var applicationWindow
    property var globalSettings
    readonly property bool inPortrait: width < height
    signal requestNewPage(string url, var props)
    signal refreshPageContent();

    property bool loading: false

    property alias floatingButton: floatingButtonItem

    onInPortraitChanged: {
        console.log("BasePage.qml: orientation changed ",
                    inPortrait ? "portrait" : "landscape")
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

    RoundButton {
        id: floatingButtonItem
        width: 64
        height: 64
        z: 100
        radius: 30
        text: "\u2713"
        highlighted: true

        visible: !loading

        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottomMargin: 30
        anchors.bottom: parent.bottom
    }
}
