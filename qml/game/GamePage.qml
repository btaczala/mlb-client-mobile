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

    onRefreshPageContent: {
        loading = true
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

                var playerInfo = resp.guest.players[index]
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
            console.log("GamePage.qml: New header should be",
                        view.currentItem.homeTeamName)
            customHeader = view.currentItem.homeTeamName
            loading = false
        })
    }

    Component.onCompleted: {
        refreshPageContent()
    }

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
        visible: !loading

        onCurrentItemChanged: {
            customHeader = currentItem.homeTeamName
        }

        OneTeamPage {
            homeTeamName: homeTeam
            teamModel: homeModel
        }

        OneTeamPage {
            homeTeamName: guestTeam
            teamModel: guestModel
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
