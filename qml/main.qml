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

    Drawer {
        id: drawer

        y: overlayHeader.height
        width: window.width / 2
        height: window.height - overlayHeader.height

        modal: inPortrait
        interactive: inPortrait
        position: inPortrait ? 0 : 1
        visible: !inPortrait

        ListView {
            id: listView
            anchors.fill: parent

            headerPositioning: ListView.OverlayHeader
            header: Pane {
                id: header
                z: 2
                width: parent.width

                contentHeight: logo.height

                Image {
                    id: logo
                    width: parent.width
                    source: "images/qt-logo.png"
                    fillMode: implicitWidth > width ? Image.PreserveAspectFit : Image.Pad
                }

                MenuSeparator {
                    parent: header
                    width: parent.width
                    anchors.verticalCenter: parent.bottom
                    visible: !listView.atYBeginning
                }
            }

            footer: ItemDelegate {
                id: footer
                text: qsTr("Footer")
                width: parent.width

                MenuSeparator {
                    parent: footer
                    width: parent.width
                    anchors.verticalCenter: parent.top
                }
            }

            model: 50

            delegate: ItemDelegate {
                text: qsTr("Title %1").arg(index + 1)
                width: parent.width
            }

            ScrollIndicator.vertical: ScrollIndicator {
            }
        }
    }
    StackView {
        id: mainStack
        anchors.fill: parent

        initialItem: MainStackPage {
            window: window

            onRequestNewPage: {
                console.log("Pushing " + url + props)
                mainStack.push(url, props)
            }
        }
    }
}
