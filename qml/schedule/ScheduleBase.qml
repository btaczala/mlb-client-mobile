import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {

    id: root
    property alias scheduleModel: list.model

    Component.onCompleted: console.log("ScheduleBase.qml: ", scheduleModel)

    signal gameClicked(int uid)

    ListView {
        anchors.fill: parent

        id: list
        clip: true

        model: ListModel {
            ListElement {
                type: "week_nr"
                number: 2
                guest: ""
                host: ""
                date: ""
            }
            ListElement {
                type: "game"
                number: -1
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
            }
        }

        delegate: Loader {
            id: loader
            width: parent.width
            height: 80

            sourceComponent: {
                return Qt.createComponent(
                            type === "week_nr" ? "WeekLabelDelegate.qml" : "GameDelegate.qml")
            }

            Connections {
                target: item
                enabled: type !== "week_nr"
                onGameClicked: {
                    console.debug("ScheduleBase.qml Clicked game", host, guest, date)
                    root.gameClicked(uid)
                }
            }

            onStatusChanged: {
                if (loader.status === Loader.Ready) {
                    if (type === "week_nr") {
                        loader.item.label = "Tydzień numer " + number
                    } else {
                        loader.item.guest = guest
                        loader.item.home = host
                        loader.item.date = date
                    }
                }
            }
        }
    }
}
