import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import ".."

BasePage {
    width: 600
    height: 800

    property var majorStandings: ListModel {
    }

    Component.onCompleted: {
        loading = true
        standings.refreshStandings(function (json) {
            majorStandings.clear()
            console.log("StandingsPage.qml: Refreshing finished")
            console.log("StandingsPage.qml: Received data ", json)

            var result = JSON.parse(json)
            console.log("StandingsPage.qml: Result ", result)

            for (var count = 0; count < result.length; count++) {
                console.log(result[count].name)
                var obj = result[count]
                majorStandings.append({
                                          name: obj.name,
                                          points: obj.points,
                                          score: obj.score,
                                          diff: obj.diff,
                                          lost: obj.lost,
                                          wons: obj.wons,
                                          games: obj.games
                                      })
            }
            console.log("StandingsPage.qml Finished Parsing");
            loading = false;
        })
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
            model: majorStandings
        }
        LeagueStandingDelegate {
            portrait: inPortrait
            model: majorStandings
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
