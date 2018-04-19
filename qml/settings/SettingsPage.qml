import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

import ".."

BasePage {
    id: root

    property var globalSettings

    Component.onCompleted: console.log(globalSettings)
    customHeader: "Ustawienia"

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        SettingsPageMenuItem {
            Layout.preferredHeight: 60
            width: parent.width
            label.text: "Temat"
            icon: "\ue243"

            component: ComboBox {
                id: comboBox
                Layout.preferredWidth: 340
                model: ["Jasny", "Ciemny", "Automatyczny"]

                Connections {
                    target: root
                    onGlobalSettingsChanged: {
                        comboBox.currentIndex = globalSettings.theme
                    }
                }

                onActivated: {
                    console.log(comboBox.currentText, currentIndex,
                                globalSettings)
                    if (comboBox.currentIndex === 0) {
                        globalSettings.theme = Material.Light
                    } else if (comboBox.currentIndex === 1) {
                        globalSettings.theme = Material.Dark
                    }
                }
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
