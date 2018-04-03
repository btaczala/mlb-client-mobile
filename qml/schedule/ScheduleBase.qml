import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {
    width: 600
    height: width * 16 / 9

    property alias scheduleModel : list.model

    Component.onCompleted: console.log(scheduleModel)

    ListView {
        anchors.fill: parent

        id: list
        clip: true

        delegate: Loader {
            width: parent.width
            id: loader
            height: 80

            sourceComponent: {
                return Qt.createComponent(type === "week_nr" ? "WeekLabelDelegate.qml" : "GameDelegate.qml")
            }

            onStatusChanged: {
                if (loader.status === Loader.Ready) {
                    if (type === "week_nr") {
                        loader.item.label = "Tydzień numer " + number
                    } else {
                        loader.item.guest = guest;
                        loader.item.home = host;
                        loader.item.date = date;
                    }
                }
            }
        }
    }
}
