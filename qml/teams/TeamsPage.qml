import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import ".." as Common

import "../commonLogic.js" as Logic

Common.BasePage {
    id: root
    width: 800
    height: 600

    property var majorTeamsModel: ListModel {
    }
    property var pretendentTeamsModel: ListModel {
    }
    property var basicTeamsModel: ListModel {
    }

    onRefreshPageContent: {
        var convert = function (obj) {
            return {
                name: obj.name,
                image: obj.image
            }
        }
        var finishCb = function () {
            finishRefreshing()
        }
        Logic.getThreeModels(majorTeamsModel, pretendentTeamsModel,
                             basicTeamsModel, teamDataAPI.refresh,
                             finishCb, convert)
    }

    Component.onCompleted: {
        startRefreshing()
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent

        TeamsPageDelegate {
            playerModel: majorTeamsModel
        }
        TeamsPageDelegate {
            playerModel: pretendentTeamsModel
        }
        TeamsPageDelegate {
            playerModel: basicTeamsModel
        }
    }

    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
