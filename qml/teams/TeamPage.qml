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
    property string teamImage
    property var teamModel: ListModel {}

    onRefreshPageContent: {
        loading = true;

        var dataCallback = function(jsonData) { 
            var result = JSON.parse(jsonData);

            for(var index in result) {
                var player = result[index];

                teamModel.append( { "name": player.name, "age": player.age, "image" : player.image });
            }
            
            loading = false;
        }
        teamDataAPI.teamPlayers(teamName, dataCallback)
    }

    Component.onCompleted: {
        refreshPageContent();
    }

    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 400
            Image {
                //source: ""
                source: teamImage
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
