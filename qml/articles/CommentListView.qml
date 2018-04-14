import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import ".." as Common

ListView {

    id: rootList
    width: 600
    height: 300

    //model: ListModel {}
    model: ListModel {
        ListElement {
            name: "Wierzbol85"
            date: "2018-04-11"
            time: "23:49:43"
            commentText: "Po obejrzeniu materiału na kanale youtube stwierdzam, że kontuzja Rafała Mierzwy była dziełem nieszczęśliwego wypadku i bez ingerencji obrońcy. Przepraszam zawodników drużyny UTD za niesłuszne oskarżenie. Dawid Wierzbicki."
        }
        ListElement {
            name: "Wierzbol85"
            date: "2018-04-11"
            time: "23:49:43"
            commentText: "Po obejrzeniu materiału na kanale youtube stwierdzam, że kontuzja Rafała Mierzwy była dziełem nieszczęśliwego wypadku i bez ingerencji obrońcy. Przepraszam zawodników drużyny UTD za niesłuszne oskarżenie. Dawid Wierzbicki."
        }
    }

    spacing: 5
    delegate: Pane {
        width: parent.width
        height: commentHeaderLabelItem.contentHeight + commentLabeltem.contentHeight + 40

        Material.elevation: 4

        RowLayout {
            anchors.fill: parent

            Common.MaterialIcon {
                Layout.preferredWidth: 100
                Layout.fillHeight: true

                size: 48

                Label {
                    anchors.centerIn: parent
                    font.family: "Material Design Icons"
                    font.pointSize: 24
                    text:"\uE853"
                }
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true

                ColumnLayout {
                    anchors.fill: parent
                    Label {
                        id: commentHeaderLabelItem
                        text: "Wystawiony przez %1, dnia %2 o %3".arg(name).arg(
                                  date).arg(time)
                        Layout.fillWidth: true
                        Layout.preferredHeight: contentHeight
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Label {
                        id: commentLabeltem
                        text: commentText
                        wrapMode: Text.WordWrap

                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
