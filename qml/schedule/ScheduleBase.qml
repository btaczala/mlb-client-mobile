import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {
    id: root

    width: 600
    height: 300

    property alias scheduleModel: list.model
    property string league

    signal gameClicked(int uid)

    Component.onCompleted: console.log("ScheduleBase.qml: ", scheduleModel)

    ListView {
        anchors.fill: parent

        id: list
        clip: true

        model: ListModel {
            ListElement {
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
                weeknumber: 1
            }
            ListElement {
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
                weeknumber: 1
            }
            ListElement {
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
                weeknumber: 2
            }
            ListElement {
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
                weeknumber: 3
            }
            ListElement {
                guest: "Basket++"
                host: "MLB"
                date: "2018-04-05 15:10"
                weeknumber: 3
            }
        }

        delegate: GameDelegate {
            width: parent.width
            height: 80

            guestTeamName: guest
            homeTeamName: host
            gameDate: date
        }

        section.property: "weeknumber"
        section.criteria: ViewSection.FullString
        section.delegate: WeekLabelDelegate {
            width: list.width
            height: 50
            label: "Tydzień numer: " + section
        }
    }
}
