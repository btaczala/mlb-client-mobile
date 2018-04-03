import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Pane {
    width: 400
    height: 400

    property string url

    anchors.margins: 5
    Material.elevation: 6

    ColumnLayout {
        anchors.fill: parent

        Item {
            Image {
                id: image
                anchors.centerIn: parent
                source: url

                width: parent.width - 40
                height: parent.height - 40
            }
            BusyIndicator {
                running: image.status === Image.Loading
                anchors.centerIn: parent
            }

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 400
        }

        Label {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "MLB SEZON XXII III TYDZIEŃ (D.Reszke)"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        Label {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "2018-03-02"
            font.pointSize: 8
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
