import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Page {

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        SettingsPageMenuItem {
            Layout.preferredHeight: 60
            width: parent.width

            component: ComboBox {
                id: comboBox
                Layout.preferredWidth: 240
                model: ["Jasny", "Ciemny", "Automatyczny"]

                onActivated: {
                    console.log(comboBox.currentText)
                    if ( comboBox.currentIndex === 1) {
                        Material.theme = Material.Light;
                    } else if(comboBox.currentIndex === 2) {
                        Material.theme = Material.Dark;
                    }
                }
            }
        }
        SettingsPageMenuItem {
            Layout.preferredHeight: 40
            width: parent.width

            component:  Label {
                text:"test"
            }
        }

        Item {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 40
        }
        Item {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 40
            Layout.fillHeight: true
        }
    }
}
