import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    width: 300
    height: 40

    property Component component: null

    RowLayout {
        anchors.fill: parent

        Image {
            id: image
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: 64
        }

        Label {
            Layout.preferredHeight: parent.height
            Layout.fillWidth: true
            Layout.preferredWidth: 300
            text: "Temat"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        Loader {
            sourceComponent: component
            Layout.preferredWidth: 100
            Layout.preferredHeight: parent.height
        }
    }
    Rectangle {
        width: parent.width
        height: 2
        anchors.bottom: parent.bottom
    }
}
