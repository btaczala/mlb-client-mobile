import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "../commonLogic.js" as Logic
import ".." as Common

Common.BasePage {
    width: 600
    height: 800

    property var majorStandings: ListModel {
    }
    property var pretendentStandings: ListModel {
    }
    property var basicStandings: ListModel {
    }

    function refresh() {
        loading = true
        Logic.getThreeModels(majorStandings, pretendentStandings,
                             basicStandings, standings.refresh, function () {
                                 loading = false
                             }, function (obj) {
                                 return {
                                     name: obj.name,
                                     points: obj.points,
                                     score: obj.score,
                                     diff: obj.diff,
                                     lost: obj.lost,
                                     wons: obj.wons,
                                     games: obj.games
                                 }
                             })
    }

    Component.onCompleted: refresh()

    Connections {
        target: standings
        onError: {
            loading = false
            console.error("Standings.qml: Error ", errorMessage,
                          " during json parsing")
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent

        LeagueStandingDelegate {
            portrait: inPortrait
            model: majorStandings
        }
        LeagueStandingDelegate {
            portrait: inPortrait
            model: pretendentStandings
        }
        LeagueStandingDelegate {
            portrait: inPortrait
            model: basicStandings
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
