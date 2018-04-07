import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "logic.js" as Data
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

    Component.onCompleted: {
        loading = true;
        Data.getStandings(majorStandings, pretendentStandings, basicStandings, standings, function() {
            loading = false;
        });
    }

    Connections {
        target: standings
        onError: {
            loading = false;
            console.error("Standings.qml: Error ", errorMessage, " during json parsing");
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
