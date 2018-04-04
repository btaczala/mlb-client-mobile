import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    visible: true

    width: 800
    height: 1024

    Material.theme: settings.theme
    Material.accent: Material.Purple

    readonly property bool inPortrait: window.width < window.height

    onInPortraitChanged: {
        console.log("Orientation changed! ",
                    inPortrait ? "portrait" : "landscape")
    }

    Settings {
        id: settings
        property int theme
        property alias width: window.width
        property alias height: window.height
    }

    Component.onCompleted: {
        console.log(mainStack.depth)
        console.log(mainStack.initialItem)
    }

    function pushNewPage(url, props) {

        var newPage = mainStack.push(url, props)
        console.log("Pushing " + url + " " + props)
        console.log("New Page = ", +newPage)
        drawer.close()

        newPage.anchors.fill = mainStack
        newPage.globalSettings = settings

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

            width: mainStack.width
            height: mainStack.height
        }
    }
}
