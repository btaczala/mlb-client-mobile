import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

ToolBar {

    property var stack: StackView {
    }

    property alias title: textLabel.text

    width: 600
    height: 50

    signal refreshRequested
    signal menuClicked

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 50

            MaterialIcon {
                id: menuIcon
                anchors.centerIn: parent
                size: 16
                text: {
                    if (stack.depth === 1) {
                        return "\ue5d2"
                    } else {
                        return "\ue5c4"
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    menuClicked()
                }
            }
        }

        Label {
            id: textLabel
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "miastobasketu.com"
        }

        Item {
            id: refreshItem
            Layout.fillHeight: true
            Layout.preferredWidth: 50

            MaterialIcon {
                id: refreshLabel
                size: 16
                text: "\ue5d5"
                anchors.centerIn: parent
                opacity: isRefreshing ? 0 : 1
                Behavior on opacity {
                    PropertyAnimation {
                    }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    refreshRequested()
                }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.preferredWidth: 50
            visible: false

            MaterialIcon {
                anchors.centerIn: parent
                size: 16
                text: "\ue853"
            }
        }
    }
}
