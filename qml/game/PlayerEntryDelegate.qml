import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import ".." as Common

Item {
    id: root
    width: 800
    height: 70

    property var sizes: [309, 43, 63.046875, 63.046875, 63.046875, 42, 25, 69, 25, 23, 32, 24]
    property var texts: ["Tomasz Bińkowski", "8", "3/3", "0/1", "2/3", "2 (0/2)", "1", "6", "0", "1", "3", "11"]

    property string backgroundColor: "#607D8B"

    property int spacing: 1

    Component.onCompleted: console.log(sizes)

    RowLayout {
        anchors.fill: parent

        spacing: root.spacing

        Repeater {
            model: sizes.length

            Label {
                Layout.fillHeight: true
                Layout.preferredWidth: root.sizes[index]

                text: root.texts[index]
                visible: root.sizes[index] !== 0
                verticalAlignment: Text.AlignVCenter

                horizontalAlignment: {
                    if (index == 0) {
                        return Text.AlignLeft
                    } else {
                        return Text.AlignHCenter
                    }
                }

                background: Rectangle {
                    color: backgroundColor
                }
            }
        }
    }
}
