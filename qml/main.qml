import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

ApplicationWindow {
    id: window
    visible: true
    width: 600
    height: width * 16/9

    Material.theme: Material.LightBlue
    Material.accent: Material.Purple

    readonly property bool inPortrait: window.width < window.height

    ToolBar {
        id: overlayHeader

        z: 1
        width: parent.width
        parent: window.overlay

        Rectangle {
            width: 40
            height: 40

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
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
        }
    }

    StackView {
        id: mainStack
        anchors.fill: parent
        anchors.topMargin: overlayHeader.height
        anchors.leftMargin: !inPortrait ? drawer.width : undefined

        initialItem: MainStackPage {
            window: window

            onRequestNewPage: {
                console.log("Pushing " + url + props)
                mainStack.push(url, props)
            }
        }
    }
}
