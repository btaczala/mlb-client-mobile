import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Page {

    width: 700
    height: 16/9 * 700
    signal requestNewPage(string url, var props)

    ListModel {
        id: images
        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_8994276_2018.03.24%20MLB%20(21).jpg"
        }

        ListElement {
            url: "http://www.miastobasketu.com//images/galeria_albumy/photo_2238492_2018.03.24%20MLB%20(43).jpg"
        }

        ListElement {
            url :"http://www.miastobasketu.com//images/galeria_albumy/photo_4124249_2018.03.24%20MLB%20(37).jpg"
        }
    }
}
