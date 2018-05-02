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

    currentAPI: scheduleAPI

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

            var transform = function (jsonModel, model) {

                for (var index in jsonModel) {
                    var playerInfo = jsonModel[index]
                    var arr = new Array
                    model.append({
                                         name: playerInfo.player.firstName + " "
                                               + playerInfo.player.lastName,
                                         points: playerInfo.points,
                                         points_two: playerInfo.fgm + "/" + playerInfo.fga,
                                         points_three: playerInfo.tpm + "/" + playerInfo.tpa,
                                         points_one: playerInfo.ftm + "/" + playerInfo.fta,
                                         rebounds: 0,
                                         assists: 0,
                                         blocks: 0,
                                         steals: 0,
                                         turnovers: 0,
                                         fouls: 0,
                                         Eval: playerInfo.eval
                                     })
                }
            }

            guestModel.clear()
            homeModel.clear()
            transform(resp.guestStats, guestModel)
            transform(resp.hostStats, homeModel)

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
