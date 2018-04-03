import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Page {
    id: root
    width: 700
    height: 700 * 16/9

    signal requestNewPage(string url, var props)

    ListModel {
        id: galleryModel
        ListElement {
            picture: "http://www.miastobasketu.com//images/galeria_albumy/photo_8153601_2018.03.24%20MLB%20(41).jpg"
            title: "MLB SEZON XXII III TYDZIEŃ (D.Reszke)"
            date: "23-03-2018"
        }
    }

    ListView {
        id: list
        anchors.fill: parent
        anchors.margins: 20

        spacing: 10

        model: galleryModel

        delegate: GalleryPageDelegate {
            height: 400
            width: parent.width - 20

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    requestNewPage("FullGalleryPage.qml", {})
                }
            }
        }
    }
}
