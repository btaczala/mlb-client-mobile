import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Drawer {
    id: drawer
    property var window
    property var overlayHeader
    readonly property bool inPortrait: window.width < window.height

    signal requestNewPage(string url, var props)

    y: overlayHeader.height

    width: window.width / 2
    height: window.height - overlayHeader.height

    modal: true
    interactive: true
    position: 0
    visible: false

    ListModel {
        id: drawerItems
        ListElement {
            name : "Artykuły"
            url: "MainStackPage.qml"
        }
        ListElement {
            name : "Terminarz"
            url: "schedule/SchedulePage.qml"
        }
        ListElement {
            name : "Tabela"
            url: "StandingsPage.qml"
        }
        ListElement {
            name : "Galeria"
            url: "gallery/GalleryPage.qml"
        }
    }

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
                source: "images/logo-mlb.png"
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
            text: "Ustawienia"
            width: parent.width

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    requestNewPage("SettingsPage.qml", null)
                }
            }

            MenuSeparator {
                parent: footer
                width: parent.width
                anchors.verticalCenter: parent.top
            }
        }

        model: drawerItems

        delegate: ItemDelegate {
            text: name
            width: parent.width

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Selecting " + name)
                    requestNewPage(url, null)
                }
            }
        }

        ScrollIndicator.vertical: ScrollIndicator {
        }
    }
}
