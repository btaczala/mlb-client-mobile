import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {

    width: 800
    height: 60

    property string image
    property alias playerName: nameLabel.text
    property alias playerAge: ageLabel.text

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 40

            Label {
                text: index + 1
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            RowLayout {
                anchors.fill: parent
                spacing: 10

                Image {
                    source: "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG"
                    sourceSize: Qt.size(32, 32)
                }

                Label {
                    id: nameLabel
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 40

            Label {
                id: ageLabel
                anchors.centerIn: parent
            }

        }
    }
}
