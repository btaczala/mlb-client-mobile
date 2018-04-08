import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    visible: true

    width: 600
    height: 900

    Material.theme: settings.theme
    Material.accent: Material.Purple

    readonly property bool inPortrait: window.width < window.height

    onInPortraitChanged: {
        console.log("main.qml: Orientation changed! ",
                    inPortrait ? "portrait" : "landscape")
    }

    Settings {
        id: settings
        property int theme
        property alias width: window.width
        property alias height: window.height
    }

    Component.onCompleted: {
        console.log("main.qml: ", mainStack.depth)
        console.log("main.qml: ", mainStack.initialItem)
    }

    function pushNewPage(url, props) {

        if (url === "")
            console.assert("Url cannot be empty")

        var newPage = mainStack.push(url, props)
        console.log("main.qml: ", "Pushing " + url + " " + props)
        console.log("main.qml: ", "New Page = ", newPage)
        drawer.close()

        newPage.anchors.top = mainStack.top
        newPage.anchors.left = mainStack.left
        newPage.anchors.right = mainStack.right
        newPage.anchors.bottom = mainStack.bottom
        newPage.globalSettings = settings
        newPage.applicationWindow = window

        if (!!newPage.window)
            newPage.window = window
    }

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
            text: "miastobasketu.com"
        }
    }

    SideMenu {
        id: drawer
        window: window
        overlayHeader: overlayHeader

        onRequestNewPage: {
            pushNewPage(url, props)
        }
    }

    Connections {
        target: mainStack.currentItem
        onRequestNewPage: {
            pushNewPage(url, props)
        }
    }

    StackView {
        id: mainStack
        anchors.fill: parent
        anchors.topMargin: overlayHeader.height

        initialItem: MainStackPage {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.top: parent.top
        }
    }
}
