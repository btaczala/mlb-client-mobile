import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

BasePage {
    id: root

    width: 700
    height: 16 / 9 * 700

    property int numberOfColumns: inPortrait ? 2 : 4

    ListModel {
        id: images
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_8994276_2018.03.24%20MLB%20(21).jpg"
        }

        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_2238492_2018.03.24%20MLB%20(43).jpg"
        }

        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
    }

    GridView {
        id: grid
        anchors.fill: parent
        model: images

        cellWidth: width / numberOfColumns
        cellHeight: cellWidth

        anchors.leftMargin: 10
        anchors.rightMargin: 10

        delegate: Item {
            width: grid.cellWidth
            height: grid.cellHeight

            anchors.margins: 10

            Pane {

                width: parent.width - 10
                height: parent.height - 10

                anchors.centerIn: parent

                Material.elevation: 6

                Image {
                    id: image
                    width: parent.width
                    height: parent.height
                    source: url
                }

                BusyIndicator {
                    running: image.status === Image.Loading
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        requestNewPage("ImageView.qml", {
                                           url: url
                                       })
                    }
                }
            }
        }
    }
}
