import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import ".." as Common

Common.BasePage {
    id: root
    width: 800
    height: 800

    property int uid: 10
    property var homeModel: ListModel {
    }
    property var guestModel: ListModel {
    }

    property string homeTeam: "OPEN BASKETBALL TEAM"
    property string guestTeam: "ENDOO DROGMAL"

    function refresh() {
        console.log("GamePage.qml: Refreshing game data for uid ", uid)

        scheduleAPI.gameData(uid, function (jsonData) {
            var resp = JSON.parse(jsonData)

            for (var index in resp.home.players) {
                var playerInfo = resp.home.players[index]
                var arr = new Array
                homeModel.append({
                                     name: playerInfo.name,
                                     points: playerInfo.points,
                                     points_two: playerInfo.fgm_two + "/" + playerInfo.fga_two,
                                     points_three: playerInfo.fgm_three + "/"
                                                   + playerInfo.fga_three,
                                     points_one: playerInfo.fgm_one + "/" + playerInfo.fga_one,
                                     rebounds: playerInfo.rebounds_off + playerInfo.rebounds_diff,
                                     assists: playerInfo.assists,
                                     blocks: playerInfo.blocks,
                                     steals: playerInfo.steals,
                                     turnovers: playerInfo.turnovers,
                                     fouls: playerInfo.fouls,
                                     Eval: playerInfo.eval
                                 })
            }
            for (var index in resp.guest.players) {

                var playerInfo = resp.home.players[index]
                var arr = new Array
                guestModel.append({
                                     name: playerInfo.name,
                                     points: playerInfo.points,
                                     points_two: playerInfo.fgm_two + "/" + playerInfo.fga_two,
                                     points_three: playerInfo.fgm_three + "/"
                                                   + playerInfo.fga_three,
                                     points_one: playerInfo.fgm_one + "/" + playerInfo.fga_one,
                                     rebounds: playerInfo.rebounds_off + playerInfo.rebounds_diff,
                                     assists: playerInfo.assists,
                                     blocks: playerInfo.blocks,
                                     steals: playerInfo.steals,
                                     turnovers: playerInfo.turnovers,
                                     fouls: playerInfo.fouls,
                                     Eval: playerInfo.eval
                                 })
            }
        })
    }

    Component.onCompleted: refresh()

    Component {
        id: listHeader

        GameHeader {
            id: gameHeaderItem
            width: view.width
            inPortrait: root.inPortrait
            z: 5
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent

        ColumnLayout {
            Label {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                text: homeTeam
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            ListView {
                id: homeListView
                model: homeModel
                header: listHeader
                headerPositioning: ListView.OverlayHeader
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                delegate: PlayerEntryDelegate {
                    width: homeListView.width
                    sizes: homeListView.headerItem.sizes
                    height: 60
                    spacing: homeListView.headerItem.spacing
                    backgroundColor: index % 2 === 0 ? "#9E9E9E" : Material.background
                    texts: [name,points,points_two,points_three,points_one,rebounds,assists,steals,blocks,turnovers,fouls,Eval]
                }
            }
        }

        ColumnLayout {
            Label {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                text: guestTeam
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            ListView {
                id: guestListView
                model: guestModel
                header: listHeader
                headerPositioning: ListView.OverlayHeader
                clip: true
                Layout.fillWidth: true
                Layout.fillHeight: true
                delegate: PlayerEntryDelegate {
                    width: homeListView.width
                    sizes: homeListView.headerItem.sizes
                    height: 60
                    spacing: homeListView.headerItem.spacing
                    backgroundColor: index % 2 === 0 ? "#9E9E9E" : Material.background
                    texts: [name,points,points_two,points_three,points_one,rebounds,assists,steals,blocks,turnovers,fouls,Eval]
                }
            }
        }
    }
    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
