import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Dialogs 1.2

Page {
    id: root
    property var applicationWindow
    property var globalSettings
    property string customHeader
    property bool loading: false
    property string errorText: "An error blah blah"
    readonly property bool inPortrait: width < height
    property var currentAPI

    signal requestNewPage(string url, var props)
    signal refreshPageContent

    signal error(string errorMessage)


    function startRefreshing() {
        loading = true
        refreshPageContent()
    }

    function finishRefreshing() {
        console.log("BasePage.qml Refreshing finished")
        loading = false
    }

    Component.onCompleted: {
        for(var childIndex in children) {
            console.log("BasePage.qml: child", children[childIndex])
        }
    }

    onInPortraitChanged: {
        console.log("BasePage.qml: orientation changed ",
                    inPortrait ? "portrait" : "landscape")
    }

    onStateChanged: {
        console.debug("BasePage.qml: State changed to ", state)
    }

    Connections {
        target: currentAPI
        onError: {
            console.warn("Implement error functioN!")
            console.log("BasePage.qml: Error " + errorMessage)
            root.error(errorMessage)
        }
    }

    onError: {
        console.error("BasePage.qml: Error = ", errorMessage)
        errorText = errorMessage
        loading = false

        errorDialog.visible = true
    }

    Rectangle {
        id: loadingRect
        anchors.fill: parent
        z: 20
        opacity: loading ? 1 : 0
        color: root.background.color
        Behavior on opacity {
            PropertyAnimation {
            }
        }

        BusyIndicator {
            anchors.centerIn: parent
            running: loading
        }
    }

    MessageDialog {
        id: errorDialog
        visible: false
        title: "Błąd połączenia"
        text: errorText
    }
}
