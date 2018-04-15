import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import ".." as Common

Item {
    width: 300
    height: 40

    property Component component: null
    property alias icon: imageItem.text
    property alias label: labelItem

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        spacing: 10

        Common.MaterialIcon {
            id: imageItem
            Layout.fillHeight: true
            Layout.preferredWidth: 30
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        Label {
            id: labelItem
            Layout.fillHeight: true
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        Loader {
            sourceComponent: component
            Layout.fillHeight: true
        }
    }

    Rectangle {
        width: parent.width
        height: 2
        anchors.bottom: parent.bottom
    }
}
