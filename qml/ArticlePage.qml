import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

BasePage {
    id: root
    property int uid: 10

    floatingButton.visible: !flickable.atYEnd

    width: 800
    height: 1024

    function refreshArticle() {
        loading = true
        articlesDataAPI.fetchArticle(uid, function (jsonData) {
            var result = JSON.parse(jsonData)
            textItem.text = result.text
            image.source = result.image
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
            console.log("ArticlePage.qml: Error ", errorMessage);
            root.error("Unable to fetch" + uid)
        }
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        // 15 is bottom margins sorta like
        contentHeight: textItem.contentHeight + pictureItem.height + layout.spacing + 15
        flickableDirection: Flickable.VerticalFlick
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        ScrollBar.vertical: ScrollBar {
            parent: flickable.parent
            anchors.top: flickable.top
            anchors.left: flickable.right
            anchors.bottom: flickable.bottom
            contentItem.opacity: 1
        }

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
        }
    }
}
