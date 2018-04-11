import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {

    width: 600
    height: 80

    property var sizes: [20, 20, 30, 40, 50, 60, 50, 30]
    property bool differentColor: false

    property bool portrait

    property alias teamNameText: teamName.text
    property alias gamesText: games.text
    property alias winsText: wins.text
    property alias lostsText: losts.text
    property alias bilansText: bilans.text
    property alias diffText: diff.text
    property alias pointsText: points.text

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: lpRect

            Layout.fillHeight: true
            Layout.preferredWidth: sizes[0]

            color: !differentColor ? Material.background : "grey"

            Label {
                id: lp
                anchors.centerIn: parent
                text: index + 1
            }
        }

        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: sizes[1]
            color: !differentColor ? Material.background : "grey"

            Label {
                id: teamName
                anchors.centerIn: parent
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: sizes[2]
            color: !differentColor ? Material.background : "grey"

            Label {
                id: games
                anchors.centerIn: parent
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: sizes[3]
            color: !differentColor ? Material.background : "grey"

            Label {
                id: wins
                anchors.centerIn: parent
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: sizes[4]
            color: !differentColor ? Material.background : "grey"

            Label {
                id: losts
                anchors.centerIn: parent
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: portrait ? 0 : sizes[5]
            color: !differentColor ? Material.background : "grey"
            visible: !portrait

            Label {
                id: bilans
                anchors.centerIn: parent

                font.pixelSize: 9
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: portrait ? 0 : sizes[6]
            color: !differentColor ? Material.background : "grey"
            visible: !portrait

            Label {
                id: diff
                anchors.centerIn: parent
            }
        }
        Rectangle {

            Layout.fillHeight: true
            Layout.preferredWidth: portrait ? sizes[5] : sizes[7]
            color: !differentColor ? Material.background : "grey"

            Label {
                id: points
                anchors.centerIn: parent
            }
        }
    }
}
