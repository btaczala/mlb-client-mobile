import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import ".." as Common

Label {
    color: "white"

    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter

    Layout.preferredWidth: contentWidth + 10

    text: "ASDASDASDAS"

    background: Rectangle {
        color: Material.primary
    }
}
