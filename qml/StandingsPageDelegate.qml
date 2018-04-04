import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {
    width: 800
    height: 600

    property alias title: textItem.text

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true

            Layout.preferredHeight: 50

            Label {
                id: textItem
                anchors.centerIn: parent
            }
        }

        ListView {
            snapMode: ListView.SnapToItem
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            orientation: Qt.Horizontal
            highlightFollowsCurrentItem: true
            highlightRangeMode: ListView.StrictlyEnforceRange

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
                title = model.get(currentIndex).league
            }

            delegate: LeagueStandingDelegate {
                title: league
            }
        }
    }
}
