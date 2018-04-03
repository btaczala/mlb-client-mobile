import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

Page {
    property var globalSettings
    readonly property bool inPortrait: width < height
    signal requestNewPage(string url, var props)
}
