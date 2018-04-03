import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Item {

    signal requestNewPage(string url, var props)

    ShortArticleView {
        anchors.fill: parent

        onArticleClicked: {
            console.debug("Article clicked " + uid)
            requestNewPage("qrc:/ArticlePage.qml", {uid: uid})
        }
    }
}
