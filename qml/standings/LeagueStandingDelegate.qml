import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {
    id: root
    width: 800
    height: 600
    property string title

    property bool portrait
    property alias model: list.model

    property var portraitModel: ["", "Drużyna", "Mecze", "Wygrane", "Przegrane", "Punkty"]
    property var landscapeModel: ["", "Drużyna", "Mecze", "Wygrane", "Przegrane", "Bilans", "Różnica", "Punkty"]

    readonly property int lpCellSize: 20
    readonly property int itemMarginSize: 4

    ListView {
        id: list
        anchors.fill: parent
        model: standings
        spacing: 4
        headerPositioning: ListView.OverlayHeader
        clip: true
        header: RowLayout {
            spacing: 4
            width: list.width
            height: 40
            z: 10

            Repeater {
                id: headerRepeater
                model: portrait ? portraitModel : landscapeModel

                Rectangle {
                    Layout.preferredWidth: {

                        if (index === 0) {
                            return 40
                        }

                        return lbl.contentWidth + 10
                    }
                    Layout.fillWidth: {
                        if (index === 1) {
                            return true
                        }
                        return false
                    }

                    Layout.fillHeight: true
                    color: {
                        if (index === 0)
                            return Material.background
                        return Material.primary
                    }

                    Label {
                        id: lbl
                        anchors.centerIn: parent
                        text: modelData
                        font.pixelSize: 16
                    }
                }
            }
        }

        delegate: LeagueStandingOneEntryDelegate {
            property var ll: list.headerItem.children
            sizes: {
                if (root.portrait) {
                    return [ll[0].width, ll[1].width, ll[2].width, ll[3].width, ll[4].width, ll[5].width]
                } else {
                    return [ll[0].width, ll[1].width, ll[2].width, ll[3].width, ll[4].width, ll[5].width, ll[6].width, ll[7].width]
                }
            }

            height: 40

            portrait: root.portrait
            differentColor: index % 2 !== 0

            teamNameText: name
            gamesText: games
            winsText: wons
            lostsText: lost
            diffText: diff
            bilansText: score
            pointsText: points
        }
    }
}
