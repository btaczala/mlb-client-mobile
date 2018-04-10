import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Page {
    id: root
    property var applicationWindow
    property var globalSettings
    readonly property bool inPortrait: width < height
    signal requestNewPage(string url, var props)
    signal refreshPageContent

    property bool loading: false

    property alias floatingButton: floatingButtonItem

    onInPortraitChanged: {
        console.log("BasePage.qml: orientation changed ",
                    inPortrait ? "portrait" : "landscape")
    }

    onStateChanged: {
        console.debug("BasePage.qml: State changed to ", state)
    }

    Rectangle {
        id: busyItem
        z: 100
        radius: 30
        width: busy.width + 10
        height: busy.height + 10

        color: Material.background

        BusyIndicator {
            id: busy
            anchors.centerIn: parent
        }

        state: root.loading ? "loading" : "normal"

        anchors.horizontalCenter: parent.horizontalCenter
        states: [
            State {
                name: "loading"
                AnchorChanges {
                    target: busyItem
                    anchors.top: parent.top
                }
            },
            State {
                name: "normal"
                AnchorChanges {
                    target: busyItem
                    anchors.top: undefined
                    anchors.bottom: parent.top
                }
            }
        ]

        transitions: Transition {
            AnchorAnimation { duration: 100 }
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
        onClicked: {
            console.log("BasePage.qml: Refresh clicked")
            refreshPageContent()
        }

        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottomMargin: 30
        anchors.bottom: parent.bottom
    }
}
