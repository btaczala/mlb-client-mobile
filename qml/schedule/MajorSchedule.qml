import QtQuick 2.9

ScheduleBase {
    width: 600
    height: width * 16 / 9

    ListModel {
        id: model

        ListElement {
            type: "week_nr"
            number: 1
        }

        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "week_nr"
            number: 2
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
        ListElement {
            type: "week_nr"
            number: 3
        }
        ListElement {
            type: "game"
            guest: "San Antonio"
            host: "San Antonio"
            date: "2018-10-12 15:10"
        }
    }
    scheduleModel: model
}
