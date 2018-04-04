import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import ".."

Item {
    width: 300
    height: 40

    property Component component: null
    property alias image: imageItem
    property alias label: labelItem

    RowLayout {
        anchors.fill: parent

        spacing: 10

        ThemedImage {
            id: imageItem
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 64
        }

        Label {
            id: labelItem
            Layout.preferredHeight: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 300
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        Loader {
            sourceComponent: component
            Layout.preferredHeight: parent.height
        }
    }

    Rectangle {
        width: parent.width
        height: 2
        anchors.bottom: parent.bottom
    }
}
