import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {

    property alias leagueName : label.text

    width: 800
    height: 1024

    ColumnLayout {
        anchors.fill: parent

        Label {
            id: label
            Layout.fillWidth: true
            Layout.preferredHeight: 140

            text: "Major"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
