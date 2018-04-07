#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <QtCore/QDebug>

#include "datacontroller.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QGuiApplication::setOrganizationDomain("miastobasketu.com");
    QGuiApplication::setOrganizationName("MLB");
    QGuiApplication::setApplicationName("mlb-mobile-client");
    QGuiApplication::setApplicationDisplayName("mlb client");

    DataController controller;
    qRegisterMetaType<QObjectList>("QObjectList");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("standings", controller.standings());
    engine.rootContext()->setContextProperty("articlesDataAPI", controller.articles());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return EXIT_FAILURE;
    }
    return QGuiApplication::exec();
}
