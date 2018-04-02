import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Page {
    id: page
    width: 800
    height: 1024

    ListView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        snapMode: ListView.SnapOneItem

        model: ListModel {
            ListElement{
                league: "Major"
            }
            ListElement{
                league: "Pretendent"
            }
            ListElement{
                league: "Basic"
            }
        }

        delegate: SchedulePageDelegate {
            width: page.width
            height: page.height
            leagueName: league
        }
    }
}
