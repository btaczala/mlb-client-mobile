import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

import ".." as Common
import "../rest_controller.js" as Rest

Common.BasePage {
    width: 600
    height: 900

    property string teamName

    function refresh() {

        var dataCallback = function(jsonData) { }
        teamDataAPI.teamPlayers(teamName, dataCallback)
    }

    Component.onCompleted: {
        refresh();
    }

    ListModel {
        id: teamModel
    }

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 400
            Image {
                source: "http://www.miastobasketu.com/zespoly/foto/photo_9330428_2017_533_1511276869.11"
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 400

            ListView {
                id: list
                anchors.fill: parent
                clip: true
                ScrollBar.vertical: ScrollBar {
                }

                model: teamModel

                header: Item {
                    width: list.width
                    height: 40

                    RowLayout {
                        anchors.fill: parent

                        Repeater {
                            model: ["LP.", "Imię i nazwisko", "Wiek"]

                            Rectangle {
                                Layout.fillWidth: index === 1
                                Layout.preferredWidth: {
                                    if (index === 0)
                                        return 20
                                    else if (index === 2)
                                        return 40
                                    else
                                        return 100
                                }
                                Layout.fillHeight: true

                                color: Material.primary

                                Label {
                                    text: modelData
                                    anchors.centerIn: parent
                                }
                            }
                        }
                    }
                }

                delegate: TeamPlayerDelegate {
                    width: list.width
                    height: 60
                    image: image
                    playerName: name
                    playerAge: age
                    property var ll: list.headerItem.children[0].children
                }
            }
        }
    }
}
