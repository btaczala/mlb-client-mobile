import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {

    property string label

    width: 200
    height: 50

    Rectangle {
        anchors.fill: parent
        color: Material.primary

        anchors.leftMargin: 5
        anchors.rightMargin:5
    }

    Label {
        id: labelItem
        anchors.fill: parent
        text: label
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
