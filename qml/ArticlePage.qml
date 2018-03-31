import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3

Pane {

    property int uid

    Component.onCompleted: {
        console.debug("Showing article uid = " + uid)
    }

    Flickable {
        id: flickable
        anchors.fill: parent
        contentHeight: layout.height + 1000
        flickableDirection: Flickable.VerticalFlick
        anchors.margins: {
            left: 10
            right: 10
        }

        ColumnLayout {
            id: layout
            anchors.fill: parent
            spacing: 20

            Item {
                id: pictureItem
                Layout.alignment: Qt.AlignLeft | Qt.AlignTop
                Layout.fillWidth: true
                Layout.preferredHeight: 400
                Rectangle {
                    anchors.fill: parent
                    color: "black"
                }

                Image {
                    id: image
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: 500
                    sourceSize.width: 500
                    fillMode: Image.Stretch
                    source: "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg"
                }
            }

            Item {
                id: textSection
                Layout.fillWidth: true
                Layout.preferredHeight: 400
                Layout.fillHeight: true

                Label {
                    anchors.fill: parent
                    text: "Sobotnie granie rozpoczęły zespoły MAYLAND i Nowy Projekt 2017. Ten mecz dostarczył najwięcej emocji. Do rozstrzygnięcia potrzebne były dwie dogrywki. Po pierwszej połowie Nowy Projekt 2017 prowadził 13 punktami, wydawało się, że kontrolują wydarzenia na boisku. MAYLAND mozolnie odrabia straty w drugiej części. W czwartej  kwarcie ważne dwa rzuty za 3 punkty trafia Daniel Piękosz. MAYLAND ma tylko 2 punkty straty 53:55. W emocjonującej końcówce Paweł Wojtkowiak nie trafia rzutu za dwa punkty, który mógł dać zwycięstwo Nowemu Projektowi jeszcze w regulaminowym czasie. Każda z dogrywek zacięta, ostatecznie jednym punktem wygrywa MAYLAND. Marek Ciecióra rzucił 36 punktów dla MAYLAND, w Nowym Projekcie 2017 Sebastian Jachym osiąga triple – double (18 punktów, 19 zbiórek, 11 asyst). Sebastianowi zabrakło tylko 3 przechwytów do osiągnięcia quadruple-double. Równie dobrze indywidualnie spisał się jego młodszy brat Mateusz. Także triple-double (20/13/10). Następnie zobaczyliśmy pojedynek AKTIVONSPORT – CAN BATLORI. Od początku spotkania uwidoczniła się przewaga CAN BATLORI. Do przerwy wypracowali sobie 24 punkty przewagi. AKTIVONSPORT odrabia tylko część strat. Do końca spotkania zawodnicy CAN BATLORI kontrolują wynik meczu. W ich szeregach wyróżnił się doświadczony Krzysztof Wieczorek – rzucił 25 punktów. Najskuteczniejszym w szeregach AKTIVONSPORT był Arkadiusz Majewski – 19 punktów. Pojedynek niepokonanych do tej pory drużyn w MLB BASIC wygrywa Magneticpoint.com.  W drugiej kwarcie Magneticpoint.com odskakuje UTD na 12 punktów. Do końca meczu dosyć spokojnie kontrolowali przebieg spotkania. Nie można graczom UTD odmówić ambicji i walki, tego dnia po prostu byli słabsi. Paweł Kownacki zawody zakończył na poziomie double – double (21 punktów, 12 zbiórek), w UTD po 9 punktów rzucili Piotr Stempiński i Kari Cagri. W kolejnym meczu z poziomu MLB BASIC pomiędzy Team Stargard a RUN AND GUN, nieznacznie lepsi gracze ze Stargardu. RUN AND GUN mieli szansę na zwycięstwo, jednak pod koniec spotkania byli nieskuteczni z linii rzutów wolnych. W Team Stargard Tomasz Glinkowski rzucił 19 punktów, dla RUN AND GUN najwięcej Dorian Sidorowicz również 19 punktów. Historyczne pierwsze zwycięstwo na poziomie MLB MAJOR odnosi drużyna ENDOO DROGMAL. Pokonali dzisiaj THE CATHLONS. W drugiej kwarcie ENDOO wypracowało kilka punktów przewagi. Co prawda w czwartej kwarcie THE CATHLONS zniwelowali straty do 2 punktów, ale to było wszystko na co ich było stać tego dnia. Ostatecznie ENDOO wygrywa 57:48, duża w tym zasługa Michała Wojciechowskiego – rzucił 22 punkty. Dla THE CATHLONS 20 punktów zdobył Bartosz Grynfelder. Na zakończenie dnia drużyna SMALL BALL wygrywa z REWORK 51:40. Tylko pierwsza kwarta udana dla REOWRK, w drugiej kwarcie następuje odjazd punktowy zespołu SMALL BALL. Najskuteczniejszym w zespole SMALL BALL pomimo podkręcania kostki ponownie był Rafał Mierzwa zdobywca 16 punktów. Dla REWORK najwięcej rzucił Krzysztof Lato 12 punktów"
                    wrapMode: Text.WordWrap
                }
            }

        }
    }
}
