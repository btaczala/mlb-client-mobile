#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <QtCore/QCommandLineOption>
#include <QtCore/QCommandLineParser>
#include <QtCore/QDebug>

#include <QtGui/QFontDatabase>

#include <QtCore/QJsonDocument>

#include "apibase.h"
#include "articles.h"
#include "datacontroller.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QFontDatabase::addApplicationFont(":/MaterialIcons-Regular.ttf");

    QGuiApplication::setOrganizationDomain("miastobasketu.com");
    QGuiApplication::setOrganizationName("MLB");
    QGuiApplication::setApplicationName("mlb-mobile-client");
    QGuiApplication::setApplicationDisplayName("mlb client");
    QGuiApplication::setApplicationVersion("0.0.1");

    QCommandLineParser parser;

    parser.process(app);

    APIBase base;

    DataController controller;
    qRegisterMetaType<QObjectList>("QObjectList");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("standings", controller.standings());
    engine.rootContext()->setContextProperty("articlesDataAPI", controller.articles());
    engine.rootContext()->setContextProperty("teamDataAPI", controller.teamAPI());
    engine.rootContext()->setContextProperty("scheduleAPI", controller.scheduleAPI());
    engine.rootContext()->setContextProperty("playersAPI", controller.playersAPI());
    engine.rootContext()->setContextProperty("serverVersion", "?");
    engine.rootContext()->setContextProperty("clientVersion", QGuiApplication::applicationVersion());

    base.createJsonRequestRaw(QUrl{"mlb/version"}, [&engine](const auto& jsonVersion) {
        qDebug() << "VERSION: " << jsonVersion;
        const QJsonDocument dc = QJsonDocument::fromJson(jsonVersion.toUtf8());
        const QString ver =
          QString("%1.%2.%3").arg(dc["major"].toString()).arg(dc["minor"].toString()).arg(dc["release"].toString());

        if (ver != QGuiApplication::applicationVersion()) {
            qWarning() << "Application version is not the same as server version, this will not work";
        }
        engine.rootContext()->setContextProperty("serverVersion", ver);
    });
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return EXIT_FAILURE;
    }

    return QGuiApplication::exec();
}
