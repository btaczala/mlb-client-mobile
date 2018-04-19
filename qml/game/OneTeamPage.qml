import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import ".." as Common

ColumnLayout {

    width: 700
    height: 40

    property string homeTeamName
    property alias teamModel: listView.model

    ListView {
        id: listView
        model: homeModel
        header: listHeader
        headerPositioning: ListView.OverlayHeader
        Layout.fillWidth: true
        Layout.fillHeight: true
        clip: true
        delegate: PlayerEntryDelegate {
            width: listView.width
            sizes: listView.headerItem.sizes
            height: 60
            spacing: listView.headerItem.spacing
            backgroundColor: index % 2 === 0 ? "#9E9E9E" : Material.background
            texts: [name, points, points_two, points_three, points_one, rebounds, assists, steals, blocks, turnovers, fouls, Eval]
        }
    }
}
