#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include <QtCore/QCommandLineOption>
#include <QtCore/QCommandLineParser>
#include <QtCore/QDebug>

#include <QtGui/QFontDatabase>

#define BOOST_LOG_DYN_LINK 1
#undef RESTC_CPP_LOG_WITH_BOOST_LOG

#include <boost/log/core.hpp>
#include <boost/log/expressions.hpp>
#include <boost/log/trivial.hpp>

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
    QGuiApplication::setApplicationVersion("0.1");

    QCommandLineParser parser;
    QCommandLineOption useDummyData("d", QCoreApplication::translate("main", "use dummy data"));
    parser.addOption(useDummyData);

    parser.process(app);

    const bool useDummy = parser.isSet(useDummyData);

    DataController controller{useDummy};
    qRegisterMetaType<QObjectList>("QObjectList");

    namespace logging = boost::log;
    logging::core::get()->set_filter(logging::trivial::severity >= logging::trivial::error);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("standings", controller.standings());
    engine.rootContext()->setContextProperty("articlesDataAPI", controller.articles());
    engine.rootContext()->setContextProperty("teamDataAPI", controller.teamAPI());
    engine.rootContext()->setContextProperty("scheduleAPI", controller.scheduleAPI());
    engine.rootContext()->setContextProperty("playersAPI", controller.playersAPI());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty()) {
        return EXIT_FAILURE;
    }

    return QGuiApplication::exec();
}
