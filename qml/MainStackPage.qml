import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Item {
    readonly property bool inPortrait: window.width < window.height
    property var window

    signal requestNewPage(string url, var props)


    ShortArticleView {
        anchors.fill: parent
        anchors.topMargin: overlayHeader.height
        anchors.leftMargin: !inPortrait ? drawer.width : undefined

        onArticleClicked: {
            console.debug("Article clicked " + uid)
            requestNewPage("qrc:/ArticlePage.qml", {uid: uid})
        }
    }
}
