import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

BasePage {

    width: 600
    height: 700

    Component.onCompleted: loading = true

    Timer {

        interval: 1000 * 3
        running: true
        onTriggered: loading = false

    }

    ShortArticleView {
        anchors.fill: parent

        onArticleClicked: {
            console.debug("Article clicked " + uid)
            requestNewPage("qrc:/ArticlePage.qml", {uid: uid})
        }
    }
}
