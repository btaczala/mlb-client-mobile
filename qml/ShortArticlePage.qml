import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

BasePage {
    width: 600
    height: 900

    property bool fetchingData: false

    currentAPI: articlesDataAPI

    BusyIndicator {
        anchors.horizontalCenter: parent.horizontalCenter
        z: 100
        running: fetchingData
    }

    Component.onCompleted: startRefreshing()

    onRefreshPageContent: {
        console.log("ShortArticleView.qml Refreshing")

        loading = true

        articlesDataAPI.refresh(function (jsonData) {

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

            finishRefreshing()
        })
    }

    signal articleClicked(int uid)

    property var articlesShortModel: ListModel {
    }

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        spacing: 10

        model: articlesShortModel
        delegate: ShortArticleViewDelegate {
            width: parent.width - 10
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
