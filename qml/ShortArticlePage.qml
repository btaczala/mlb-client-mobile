import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

BasePage {
    width: 600
    height: 900

    property bool fetchingData: false

    BusyIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        z: 100
        running: fetchingData
    }

    Component.onCompleted: refreshPageContent()

    onRefreshPageContent: {
        console.log("ShortArticleView.qml Refreshing")

        loading = true

        articlesDataAPI.refreshArticlesList(function (jsonData) {

            articlesShortModel.clear()
            var response = JSON.parse(jsonData)
            for (var count = 0; count < response.length; count++) {
                var object = response[count]
                articlesShortModel.append({
                                              imageUrl: object.imageUrl,
                                              headerContent: object.headerContent,
                                              textContent: object.textContent,
                                              postedContent: object.postedContent,
                                              uid: object.uid
                                          })
            }

            loading = false
        })
    }

    signal articleClicked(int uid)

    property var articlesShortModel: ListModel {
    }

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.leftMargin: scrollbar.width
        anchors.topMargin: 10
        spacing: 10

        ScrollBar.vertical: ScrollBar {
            id: scrollbar
        }

        model: articlesShortModel
        delegate: ShortArticleViewDelegate {
            width: parent.width - scrollbar.width
            height: 300

            image: imageUrl
            header: headerContent
            text: textContent

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    console.log("Pushing new article uid=", uid)
                    articleClicked(uid)
                }
            }
        }
    }
}
