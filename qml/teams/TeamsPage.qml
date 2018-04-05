import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import ".."

import "../rest_controller.js" as Rest

CommonScrollableLeaguePage {
    id: root

    Component.onCompleted: {
        loading = true;
        Rest.getTeamsData(majorTeamsModel, pretendentTeamsModel, basicTeamsModel, root);
    }

    ListModel {
        id: majorTeamsModel
    }

    ListModel {
        id: pretendentTeamsModel

    }
    ListModel {
        id: basicTeamsModel
    }

    property var __models: [ majorTeamsModel, pretendentTeamsModel, basicTeamsModel]

    delegate: TeamsPageDelegate {
        width: list.width
        height: list.height
        title: list.model.get(list.currentIndex).league
        models: __models
    }
}
