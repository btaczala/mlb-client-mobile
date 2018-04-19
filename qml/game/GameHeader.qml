import QtQuick 2.9
import QtQml 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

import ".." as Common

RowLayout {

    width: 600
    height: 80
    spacing: 1

    property bool inPortrait: true

    property var sizes: {
        var tmp = new Array
        for (var index in children) {
            if (children[index].visible)
                tmp.push(children[index].width)
            else
                tmp.push(0)
        }

        return tmp
    }

    HeaderLabel {
        id: nameLabelItem
        text: "Imię i nazwisko"
        Layout.fillHeight: true
        Layout.fillWidth: true

        Layout.minimumWidth: 100
    }

    HeaderLabel {
        id: pointsLabelItem
        text: inPortrait ? "Pkt" : "Punkty"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: pts
        text: "2 pkt. \n(c/o)"
        Layout.fillHeight: true
        visible: !inPortrait
    }

    HeaderLabel {
        id: ptsLabelItem_three
        text: "3 pkt. \n(c/o)"
        Layout.fillHeight: true
        visible: !inPortrait
    }

    HeaderLabel {
        id: ptsLabelItem_one
        text: "1 pkt. \n(c/o)"
        Layout.fillHeight: true
        visible: !inPortrait
    }

    HeaderLabel {
        id: reboundsLabelItem
        text: inPortrait ? "Zb" : "Zbiórki \n(A/O)"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: assistsLabelItem
        text: inPortrait ? "Ast" : "Asysty"
        Layout.fillHeight: true
    }
    HeaderLabel {
        id: stealsLabelItem
        text: inPortrait ? "Prz" : "Przechwyty"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: blocksLabelItem
        text: inPortrait ? "Blk" : "Bloki"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: turnoversLabelItem
        text: inPortrait ? "Str" : "Straty"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: foulsLabelItem
        text: inPortrait ? "Fau" : "Faule"
        Layout.fillHeight: true
    }

    HeaderLabel {
        id: evalLabelItem
        Layout.fillHeight: true
        text: "Eval"
    }
}
