import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Item {
    id: root
    width: 500
    height: 200

    property alias header: title.text

    property alias image: imageItem.source
    property alias text: textLabel.text
    property alias posted: postedItem.text
    Pane {
        anchors.fill: parent
        Material.elevation: 6

        RowLayout {
            anchors.fill: parent
            spacing: 5

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: imageItem
                    fillMode: Image.Stretch
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize.height: parent.height
                    sourceSize.width: parent.width
                    source: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
                }
            }

            Item {
                Layout.fillHeight: true
                //Layout.preferredWidth: title.contentWidth
                Layout.preferredWidth: root.width / 2

                ColumnLayout {
                    anchors.fill: parent

                    Label {
                        id: title
                        font.pointSize: 14
                        font.bold: true
                        Layout.alignment: Qt.AlignCenter
                        Layout.preferredHeight: contentHeight
                        width: parent.width
                        Layout.fillWidth: true
                        text: "AKADEMIA BASKETU 2016/2017"
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Label {
                        id: textLabel
                        wrapMode: Text.WordWrap
                        Layout.fillWidth: true
                        Layout.preferredHeight: contentHeight
                        text: "Czwarty tydzień rozgrywek już za nami. Na początek doszło do sporej niespodzianki Elektryka Morska ograła zespół OPEN BASKETBALL TEAM. Co prawda w pierwszej połowie OPEN kontrol [...]"
                    }
                    Label {
                        id: postedItem
                        Layout.fillWidth: true
                        font.pointSize: 8
                        text: "2018-25-12, Micheal Jordan"
                        horizontalAlignment: Text.AlignRight
                    }
                }
            }
        }
    }
}
