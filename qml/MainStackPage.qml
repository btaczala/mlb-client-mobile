import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

ShortArticlePage {

    onArticleClicked: {
        console.debug("Article clicked " + uid)
        requestNewPage("qrc:/ArticlePage.qml", {
                           uid: uid
                       })
    }
}
