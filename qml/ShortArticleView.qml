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

    onRefresh: {

        loading = true
        articlesShortModel.clear()

        articlesDataAPI.refreshArticlesList(function (jsonData) {

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

    Component.onCompleted: refresh()

    signal articleClicked(int uid)

    property var articlesShortModel: ListModel {
    }

    ListView {
        id: articleHeadersListView
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        ScrollBar.vertical: ScrollBar {
        }

        model: articlesShortModel
        delegate: ShortArticleViewDelegate {
            width: parent.width
            height: 300

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    articleClicked(uid)
                }
            }
        }
    }
}
