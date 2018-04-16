import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import "articles"

BasePage {
    id: root
    property int uid: 11

    width: 800
    height: 1024

    function refreshArticle() {
        loading = true
        articlesDataAPI.fetchArticle(uid, function (jsonData) {
            var result = JSON.parse(jsonData)
            textItem.text = result.text
            image.source = result.image

            commentListView.model.clear()
            for (var count = 0; count < result.comments.length; count++) {

                var object = result.comments[count]
                commentListView.model.append({
                                                 name: object.name,
                                                 date: object.date,
                                                 time: object.time,
                                                 commentText: object.text
                                             })
            }

            loading = false
        })
    }

    Component.onCompleted: {
        console.debug("Showing article uid = " + uid)
        refreshArticle()
    }

    onRefreshPageContent: {
        refreshArticle()
    }

    Connections {
        target: articlesDataAPI
        onError: {
            console.log("ArticlePage.qml: Error ", errorMessage)
            root.error("Unable to fetch" + uid)
        }
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        // 15 is bottom margins sorta like
        contentHeight: textItem.contentHeight + pictureItem.height + comments.height
                       + commentListView.contentHeight + layout.spacing + 50
        flickableDirection: Flickable.VerticalFlick
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        ColumnLayout {
            id: layout
            width: parent.width
            height: pictureItem.height + textItem.contentHeight
            spacing: 10

            Item {
                id: pictureItem
                Layout.fillWidth: true
                Layout.preferredHeight: 400

                Image {
                    id: image
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: parent.height
                    sourceSize.width: parent.width - 40
                    fillMode: Image.Stretch
                }
            }

            Label {
                id: textItem
                Layout.fillWidth: true
                wrapMode: Text.WordWrap
            }

            Label {
                id: comments
                Layout.fillWidth: true
                visible: !loading
                text: "Komentarze"
            }

            CommentListView {
                id: commentListView
                Layout.fillWidth: true
            }
        }
    }
}
