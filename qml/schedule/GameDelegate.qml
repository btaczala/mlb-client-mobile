import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

RowLayout {
    id: root

    width: 500
    height: 80

    property string guest: "San Antonio"
    property string home: "San Antonio"
    property string date: "2018-10-15 12:00"


    Label {
        Layout.fillHeight: true
        Layout.preferredWidth: 120

        text: root.date
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Item {
        Layout.fillHeight: true
        Layout.preferredWidth: 100

        Layout.fillWidth: true

        RowLayout {
            anchors.fill: parent

            Label {
                Layout.preferredWidth: parent.width / 2 - 10
                Layout.fillHeight: true
                text: guest
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            Label {
                text: "-"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillHeight: true
            }
            Label {
                Layout.preferredWidth: parent.width / 2 - 10
                Layout.fillHeight: true

                text: home
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
