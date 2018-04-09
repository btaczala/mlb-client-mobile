import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

import ".."
import "../rest_controller.js" as Rest

BasePage {
    width: 900
    height: 600

    property string teamName
    property string teamImage: "http://www.miastobasketu.com/zespoly/foto/photo_9330428_2017_533_1511276869.11"
    property var teamModel: ListModel {
    }

    onRefreshPageContent: {
        loading = true

        var dataCallback = function (jsonData) {
            var result = JSON.parse(jsonData)

            for (var index in result) {
                var player = result[index]

                teamModel.append({
                                     name: player.name,
                                     age: player.age,
                                     image: player.image
                                 })
            }

            loading = false
        }
        teamDataAPI.teamPlayers(teamName, dataCallback)
    }

    Component.onCompleted: {
        refreshPageContent()
    }

    Flickable {
        id: flickable
        width: parent.width - scrollbar.width - 5
        height: parent.height

        contentHeight: column.height

        ScrollBar.vertical: ScrollBar {
            id: scrollbar
            parent: flickable.parent
            anchors.top: flickable.top
            anchors.left: flickable.right
            anchors.bottom: flickable.bottom
            contentItem.opacity: 1
        }

        ColumnLayout {
            id: column
            width: parent.width
            height: imageItem.height + list.contentHeight

            Item {
                id: imageItem
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
                Layout.fillHeight: true

                ListView {
                    id: list
                    anchors.fill: parent
                    clip: true
                    interactive: false

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
}
