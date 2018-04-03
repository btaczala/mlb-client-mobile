import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {

    property alias leagueName: label.text

    width: 800
    height: 1024


    Item {
        id: header
        width: parent.width
        height: 70
        z: 100

        Label {
            id: label
            anchors.fill: parent

            text: "Major"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Component.onCompleted: {
        console.log(leagueName)
        console.log(loader.source)
    }

    Loader {
        id: loader
        source: "qrc:/schedule/" + leagueName + "Schedule.qml"
        width: parent.width

        anchors.top: header.bottom

    }
}
