import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1

import ".."

CommonScrollableLeaguePage {

    ListModel {
        id: majorTeamsModel

        ListElement {
            name: "GRYF-PANTHERS"
        }
        ListElement {
            name: "MELBEST"
        }
        ListElement {
            name: "OPEN BASKETBALL TEAM"
        }
        ListElement {
            name: "RIM"
        }
        ListElement {
            name: "Elektryka Morska"
        }
        ListElement {
            name: "FASOLKI"
        }
        ListElement {
            name: "ENDOO DROGMAL"
        }
        ListElement {
            name: "THE CATHLONS"
        }
        ListElement {
            name: "FRASSATI"
        }
    }

    ListModel {
        id: pretendentTeamsModel

        ListElement {
            name: "GRYF-PANTHERS"
        }
        ListElement {
            name: "MELBEST"
        }
    }
    ListModel {
        id: basicTeamsModel

        ListElement {
            name: "GRYF-PANTHERS"
        }
        ListElement {
            name: "MELBEST"
        }
    }

    property var __models: [majorTeamsModel, pretendentTeamsModel, majorTeamsModel]

    delegate: TeamsPageDelegate {
        width: list.width
        height: list.height
        title: list.model.get(list.currentIndex).league
        models:  __models
    }
}
