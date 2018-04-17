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

    property var majorModel: ListModel {
    }
    property var pretendentModel: ListModel {
    }
    property var basicModel: ListModel {
    }

    function refresh() {

        var afterCallback = function () {
            loading = false
        }

        var transform = function (object) {
            return {
                type: object.type,
                number: object.number,
                guest: object.guest,
                host: object.host,
                date: object.date
            }
        }
        Logic.getThreeModels(majorModel, pretendentModel, basicModel,
                             scheduleAPI.refresh, afterCallback, transform)
    }

    Component.onCompleted: {
        refresh()
    }

    SwipeView {
        id: view
        anchors.fill: parent

        ScheduleBase {
            scheduleModel: majorModel
            onGameClicked: {
                console.debug("SchedulePage.qml Clicked game", uid)
                requestNewPage("game/GamePage.qml", {
                                   gameId: uid
                               })
            }
        }
        ScheduleBase {
            scheduleModel: pretendentModel
        }
        ScheduleBase {
            scheduleModel: basicModel
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
