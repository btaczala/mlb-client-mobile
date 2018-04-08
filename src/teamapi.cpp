#include "teamapi.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

TeamAPI::TeamAPI(QObject* parent)
    : QObject(parent)
{
}

void TeamAPI::refreshTeams(QJSValue callback)
{
    QTimer::singleShot(1000 * 2, this, [this, callback]() mutable {
        QJSValueList args;
        auto str = R"(
                   {
                                      "major": [{
                                          "name": "FRASSATTI"
                                      }],
                                      "pretendent": [{
                                          "name": "Charlotte"
                                      }],
                                      "basic": [{
                                          "name": "Basket++"
                                      }]
                                  }
)";
        args.append(QJSValue(QString(str)));
        const auto jsvalue = callback.call(args);

        //        if (jsvalue.isError()) {
        //            emit error(jsvalue.toString());
        //        }

        qDebug() << jsvalue.toString();
    });
}

void TeamAPI::teamPlayers(const QString& teamID, QJSValue callback)
{
    QTimer::singleShot(1000 * 2, this, [this, callback]() mutable {
        QJSValueList args;
        auto str = R"(
                   [
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     },
                     {
                       "image": "http://miastobasketu.com/zawodnicy/foto4/michaldudzik.JPG",
                       "name": "Michał Dudzik",
                       "age": 10
                     }
                   ]
)";
        args.append(QJSValue(QString(str)));
        const auto jsvalue = callback.call(args);

        //        if (jsvalue.isError()) {
        //            emit error(jsvalue.toString());
        //        }

        qDebug() << jsvalue.toString();
    });
}
