import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import Qt.labs.settings 1.0

ApplicationWindow {
    id: window
    visible: true

    width: settings.orientation
           === "portrait" ? settings.portraitSize.width : settings.landscapeSize.width
    height: settings.orientation
            === "portrait" ? settings.portraitSize.height : settings.landscapeSize.height

    Material.theme: settings.theme
    Material.accent: Material.Purple

    readonly property bool inPortrait: window.width < window.height

    Settings {
        id: settings
        property string orientation
        property size portraitSize: Qt.size(800, 800 * 16 / 9)
        property size landscapeSize: Qt.size(800, 600)
        property int theme
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

        newPage.width = mainStack.width
        newPage.height = mainStack.height

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
            text: "MLB"
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

        //        anchors.leftMargin: !inPortrait ? drawer.width : undefined
        initialItem: MainStackPage {

            width: mainStack.width
            height: mainStack.height
        }
    }
}
