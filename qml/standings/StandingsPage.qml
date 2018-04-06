import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import ".."

BasePage {
    width: 600
    height: 800


    SwipeView {
        id: view
        anchors.fill: parent

        LeagueStandingDelegate {
            portrait: inPortrait
        }
        LeagueStandingDelegate {
            portrait: inPortrait
        }
        LeagueStandingDelegate {
            portrait: inPortrait
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
