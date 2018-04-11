import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

BasePage {
    width: 800
    height: 1024

    property alias delegate: listView.delegate
    property alias list: listView

    ListView {
        id: listView
        anchors.top: parent.top
        anchors.bottom: dotDotDot.top
        anchors.bottomMargin: 30

        anchors.left: parent.left
        anchors.right: parent.right
        clip: true

        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.StrictlyEnforceRange
        ScrollBar.vertical: ScrollBar {
        }

        model: ListModel {
            ListElement {
                league: "Major"
            }
            ListElement {
                league: "Pretendent"
            }
            ListElement {
                league: "Basic"
            }
        }

        onCurrentIndexChanged: {
            console.log("CommonScrollableLeaguePage.qml: current index changed" + currentIndex)

            for (var count = 0; count < repeater.count; count++)
                repeater.itemAt(count).color = "white"

            repeater.itemAt(currentIndex).color = Material.primary
        }
    }

    Row {
        id: dotDotDot

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        spacing: 5

        Repeater {
            id: repeater
            model: listView.model.count

            Rectangle {
                width: 20
                height: 20
                color: "white"
                radius: 10
                border.color: Material.primary
            }
        }
    }
}
