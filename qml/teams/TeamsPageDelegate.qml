import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {
    width: 800
    height: 600

    property alias title: textItem.text

    property var models

    ColumnLayout {
        anchors.fill: parent

        spacing: 10
        anchors.margins: {
            left: 10
            right: 10
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            Label {
                id: textItem
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
        }

        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            model: models[index]
            spacing: 4

            delegate: Item {
                width: listView.width
                height: 60

                Pane {
                    width: parent.width - 20
                    height: parent.height - 20
                    anchors.centerIn: parent
                    Material.elevation: 4

                    RowLayout {
                        anchors.fill: parent
                        Label {
                            Layout.preferredWidth: 40
                            Layout.fillHeight: true
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            text: index + 1
                        }

                        Label {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter

                            text: name
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: requestNewPage("teams/TeamPage.qml", {teamName: name, teamImage: image})
                    }
                }
            }
        }
    }
}
