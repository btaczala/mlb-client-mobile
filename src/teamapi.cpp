#include "teamapi.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

void TeamAPI::refresh(QJSValue callback)
{

    qDebug() << Q_FUNC_INFO;

    QTimer::singleShot(500, this, [this, callback]() mutable {
        QJSValueList args;
        auto str = R"({
    "major": [{
        "name": "FRASSATTI", 
        "image": "http://www.miastobasketu.com/zespoly/foto/photo_9330428_2017_533_1511276869.11"
    }],
        "pretendent": [{
        "name": "Charlotte", 
        "image": "http://www.miastobasketu.com/zespoly/foto/photo_9330428_2017_533_1511276869.11"
    }],
        "basic": [{
        "name": "Basket++", 
        "image": "http://www.miastobasketu.com/zespoly/foto/photo_9330428_2017_533_1511276869.11"
    }]
}
)";
        args.append(QJSValue(QString(str)));
        const auto jsvalue = callback.call(args);

        if (jsvalue.isError()) {
            emit error(jsvalue.toString());
        }

        qDebug() << jsvalue.toString();
    });
}

void TeamAPI::teamPlayers(const QString& /*teamID*/, QJSValue callback)
{
    QTimer::singleShot(500, this, [this, callback]() mutable {
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

        if (jsvalue.isError()) {
            emit error(jsvalue.toString());
        }

        qDebug() << jsvalue.toString();
    });
}
