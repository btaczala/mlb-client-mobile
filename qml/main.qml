import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: window
    visible: true
    width: 600
    height: width * 16 / 9

    Material.theme: Material.System
    Material.accent: Material.Purple

    readonly property bool inPortrait: window.width < window.height

    ToolBar {
        id: overlayHeader

        z: 1
        width: parent.width
        parent: window.overlay

        Image {
            source: {

                if (mainStack.depth === 1) {
                    return "images/ic_menu_white_24px.svg"
                } else {
                    return "images/ic_chevron_left_white_48px.svg"
                }
            }

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 5

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (mainStack.depth === 1) {

                        if (drawer.visible) {
                            drawer.close()
                        } else {
                            drawer.open()
                        }
                    } else {
                        mainStack.pop()
                    }
                }
            }
        }

        Label {
            id: label
            anchors.centerIn: parent
            text: "MLB"
        }
    }

    SideMenu {
        id: drawer
        window: window
        overlayHeader: overlayHeader

        onRequestNewPage: {
            var newPage = mainStack.push(url, props)
            drawer.close()

            newPage.width = mainStack.width;
            newPage.height = mainStack.height;
        }
    }

    StackView {
        id: mainStack
        anchors.fill: parent
        anchors.topMargin: overlayHeader.height
        anchors.leftMargin: !inPortrait ? drawer.width : undefined

        Rectangle {
            anchors.fill: parent
        }

        initialItem: MainStackPage {
            window: window

            onRequestNewPage: {
                console.log("Pushing " + url + props)
                var item = mainStack.push(url, props)

                item.width = mainStack.width
                item.height = mainStack.height
            }
        }
    }
}
