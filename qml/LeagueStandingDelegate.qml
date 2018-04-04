import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

Item {
    width: 800
    height: 600
    property string title

    readonly property int lpCellSize: 20
    readonly property int itemMarginSize: 4

    ListModel {
        id: standings
        ListElement {
            lp: 1
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 2
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 3
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 4
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 5
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 6
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 7
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 8
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
        ListElement {
            lp: 9
            name: "FRASSATI"
            games: 3
            wons: 1
            lost: 2
            score: "(206-210)"
            diff: -4
            points: 4
        }
    }

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
            z:10

            Repeater {
                id: headerRepeater
                model: ["", "Drużyna", "Mecze", "Wygrane", "Przegrane", "Bilans", "Różnica", "Punkty"]

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
            sizes: [ll[0].width, ll[1].width, ll[2].width, ll[3].width, ll[4].width, ll[5].width, ll[6].width, ll[7].width]
            height: 40

            differentColor: index % 2 !== 0

            lpText: lp
            teamNameText: name
            gamesText: games
            winsText: wons
            lostsText: lost
            diffText: diff
            bilansText: score
            pointsText: points

            Component.onCompleted: console.log(points)
        }
    }
}
