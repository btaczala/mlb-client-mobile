import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import QtQuick.Layouts 1.3

BasePage {


    ColumnLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 70
            Label {
                anchors.centerIn: parent
                text: "TABELA PO 3. TYGODNIU"
            }
        }

        ListView {
            id: listView
            Layout.fillWidth: true
            Layout.fillHeight: true

            clip: true

            model: ListModel {
                ListElement {
                    league: "Major"
                }
                ListElement {
                    league: "Pretendent"
                }
                ListElement {
                    league: "Basic"
                }
            }

            delegate: StandingsPageDelegate {
                width: listView.width
                height: listView.height
            }
        }
    }
}
