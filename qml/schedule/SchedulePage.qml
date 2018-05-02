import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import ".."
import "../commonLogic.js" as Logic

BasePage {
    width: 600
    height: 800

    currentAPI: scheduleAPI

    property var majorModel: ListModel {
    }
    property var pretendentModel: ListModel {
    }
    property var basicModel: ListModel {
    }

    Component.onCompleted: {
        startRefreshing()
    }

    onRefreshPageContent: {

        var afterCallback = function (jsonData) {
            var result = JSON.parse(jsonData)

            var parseFunction = function (jsonModel, model) {
                var weeks = jsonModel["weeks"]

                console.log(weeks.length)
                for (var index = 0; index < weeks.length; ++index) {
                    console.log("Week number ", weeks[index]["weeknumber"])

                    var gamesArray = weeks[index]["games"]
                    console.log("Number of games: " + gamesArray.length)
                    for (var gIndex = 0; gIndex < gamesArray.length; ++gIndex) {
                        var game = gamesArray[gIndex]

                        model.append({
                                         guest: game["guest"]["name"],
                                         host: game["host"]["name"],
                                         date: game["datetime"],
                                         score: game["score"],
                                         gameId: game["id"],
                                         weeknumber: weeks[index]["weeknumber"]
                                     })
                    }
                }
            }
            majorModel.clear()
            pretendentModel.clear()
            basicModel.clear()

            parseFunction(result["major"], majorModel)
            parseFunction(result["pretendent"], pretendentModel)
            parseFunction(result["basic"], basicModel)

            finishRefreshing()
            customHeader = view.currentItem.league
        }

        scheduleAPI.refresh(afterCallback)
    }

    SwipeView {
        id: view
        anchors.fill: parent

        onCurrentItemChanged: {
            customHeader = currentItem.league
        }

        ScheduleBase {
            league: "Major"
            scheduleModel: majorModel
            onGameClicked: {
                console.debug("SchedulePage.qml Clicked game", uid)
                requestNewPage("game/GamePage.qml", {
                                   gameId: uid,
                                   loading: true
                               })
            }
        }
        ScheduleBase {
            league: "Pretendent"
            scheduleModel: pretendentModel
            onGameClicked: {
                console.debug("SchedulePage.qml Clicked game", uid)
                requestNewPage("game/GamePage.qml", {
                                   gameId: uid,
                                   loading: true
                               })
            }
        }
        ScheduleBase {
            scheduleModel: basicModel
            league: "Basic"
            onGameClicked: {
                console.debug("SchedulePage.qml Clicked game", uid)
                requestNewPage("game/GamePage.qml", {
                                   gameId: uid,
                                   loading: true
                               })
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
