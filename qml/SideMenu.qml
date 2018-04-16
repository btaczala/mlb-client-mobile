import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Drawer {
    id: drawer
    property var window
    property var globalSettings
    property int topBarHeight: 40
    readonly property bool inPortrait: window.width < window.height

    signal requestNewPage(string url, var props)

    modal: true
    interactive: true
    position: 0
    visible: false

    Component.onCompleted: {

        console.debug(globalSettings.disabledPages)
        for ( var count = 0; count < globalSettings.disabledPages.length; count++) {
            console.debug("SideMenu.qml: Disabling entry ", globalSettings.disabledPages[count])
            var searchedName = globalSettings.disabledPages[count];

            for (var listIndex = 0; listIndex < drawerItems.count; listIndex++) {
                if ( drawerItems.get(listIndex).name === searchedName) {
                    drawerItems.remove(listIndex, 1);
                }
            }
        }
    }

    ListModel {
        id: drawerItems
        ListElement {
            name: "Artykuły"
            url: "MainStackPage.qml"
        }
        ListElement {
            name: "Terminarz"
            url: "schedule/SchedulePage.qml"
        }
        ListElement {
            name: "Tabela"
            url: "standings/StandingsPage.qml"
        }
        ListElement {
            name: "Galeria"
            url: "gallery/GalleryPage.qml"
        }
        ListElement {
            name: "Zespoły"
            url: "teams/TeamsPage.qml"
        }
        ListElement {
            name: "Zawodnicy"
            url: "players/PlayersPage.qml"
        }
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: topBarHeight
            color: Material.primary
        }

        Image {
            id: logo
            Layout.fillWidth: true
            Layout.preferredHeight: 180
            source: "images/logo-mlb.png"
            fillMode: implicitWidth > width ? Image.PreserveAspectFit : Image.Pad
            sourceSize: {
                if (!inPortrait) {
                    return globalSettings.drawerLogoSize
                }
            }
        }

        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            interactive: height < contentHeight

            headerPositioning: ListView.OverlayHeader
            footer: ItemDelegate {
                id: footer
                text: "Ustawienia"
                width: parent.width

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        requestNewPage("settings/SettingsPage.qml", {
                                           newHeader: "Ustawienia"
                                       })
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
                        console.log("SideMenu.qml: Selecting " + name)
                        requestNewPage(url, null)
                    }
                }
            }

            ScrollIndicator.vertical: ScrollIndicator {
            }
        }
    }
}
