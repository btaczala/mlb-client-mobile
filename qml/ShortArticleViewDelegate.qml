import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {
    width: 400
    height: 200

    Pane {
        anchors.fill: parent
        Material.elevation: 6

        ColumnLayout {
            id: column
            anchors.fill: parent
            spacing: 40

            Label {
                id: title
                text: headerContent
                font.pointSize: 14
                font.bold: true
                Layout.alignment: Qt.AlignCenter
                width: parent.width
                Layout.preferredHeight: 40
            }

            RowLayout {
                width: parent.width
                Layout.fillHeight: true
                spacing: 10

                Image {
                    Layout.preferredWidth: 128
                    sourceSize.height: 128
                    sourceSize.width: 128
                    source: imageUrl
                }

                Label {
                    id: textLabel
                    text: textContent
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }

            }

            Label {
                id: posted
                text: postedContent
                font.pointSize: 8
                width: parent.width
                Layout.alignment: Qt.AlignRight
            }
        }
    }
}
