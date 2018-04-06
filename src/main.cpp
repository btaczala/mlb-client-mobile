#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QtQml/QQmlContext>

#include "datacontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setOrganizationDomain("miastobasketu.com");
    app.setOrganizationName("MLB");
    app.setApplicationName("mlb-mobile-client");
    app.setApplicationDisplayName("mlb client");

    DataController controller;
    qRegisterMetaType< QObjectList>("QObjectList");



    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("standings", controller.standings());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
