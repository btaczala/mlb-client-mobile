import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {
    id: root

    property string guestTeamName: "San Antonio"
    property string homeTeamName: "San Antonio"
    property string gameDate: "2018-10-15 12:00"

    signal gameClicked(int uid)

    width: 500
    height: 80

    Pane {
        anchors.fill: parent
        anchors.margins: 10
        Material.elevation: 6
        RowLayout {
            anchors.fill: parent

            Label {
                Layout.fillHeight: true
                Layout.preferredWidth: 120

                text: gameDate
                font.pointSize: 8
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Item {
                Layout.fillHeight: true
                Layout.preferredWidth: 100

                Layout.fillWidth: true

                RowLayout {
                    anchors.fill: parent

                    Label {
                        Layout.preferredWidth: parent.width / 2 - 10
                        Layout.fillHeight: true
                        text: guestTeamName
                        font.pointSize: 11
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Label {
                        text: "-"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        Layout.fillHeight: true
                    }
                    Label {
                        Layout.preferredWidth: parent.width / 2 - 10
                        Layout.fillHeight: true

                        text: homeTeamName
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // FIXME: Proper uid
                gameClicked(10)
            }
        }
    }
}
