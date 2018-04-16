import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "../commonLogic.js" as Logic
import ".." as Common

Common.BasePage {
    width: 600
    height: 800

    property var playersModel: ListModel {
    }

    function refreshPlayersList() {
        loading = true

        playersAPI.refresh(function (jsonData) {

            var response = JSON.parse(jsonData)
            playersModel.clear()

            for (var number in response) {
                var ob = response[number]
                playersModel.append({
                                        name: ob.name
                                    })
            }
            loading = false
        })
    }

    Component.onCompleted: {
        refreshPlayersList()
    }

    property var originalList: playersModel

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 50

            TextField {
                anchors.fill: parent

                onTextChanged: {
                    console.log("PlayersPage.qml: filtering with ", text)
                    filter(text)
                }
            }
        }

        ListView {
            id: list
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            focus: true

            section.property: "name"
            section.criteria: ViewSection.FirstCharacter
            section.delegate: Rectangle {
                width: list.width
                height: 40
                color: Material.primary

                Label {
                    anchors.centerIn: parent
                    text: section
                }
            }

            delegate: Item {
                width: list.width
                height: 60

                Pane {
                    id: pane
                    anchors.fill: parent
                    Material.elevation: 4
                    anchors.margins: 5

                    Label {
                        anchors.fill: parent
                        text: name

                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            console.log("PlayersPage.qml: Selecting player ",
                                        name)
                        }
                    }
                }
            }

            model: playersModel
        }
    }
}
