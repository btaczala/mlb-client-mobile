#include "standings.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

Standings::Standings()
{
}

void Standings::refresh(QJSValue callback)
{
    QTimer::singleShot(1000 * 2, this, [this, callback]() mutable {
        qDebug() << Q_FUNC_INFO;
        QJSValueList args;
        auto str = R"(
               {
                   "major": [{
                       "name": "FRASSATTI",
                       "games": 3,
                       "wons": 1,
                       "lost": 2,
                       "score": "206-210",
                       "diff": -4,
                       "points": 4
                   },{
                       "name": "GRYFPANTHERS",
                       "games": 3,
                       "wons": 1,
                       "lost": 2,
                       "score": "206-210",
                       "diff": -4,
                       "points": 4
                   }],
                   "pretendent": [{
                       "name": "Charlotte",
                       "games": 3,
                       "wons": 1,
                       "lost": 2,
                       "score": "206-210",
                       "diff": -4,
                       "points": 4
                   }],
                   "basic": [{
                       "name": "Basket++",
                       "games": 3,
                       "wons": 1,
                       "lost": 2,
                       "score": "206-210",
                       "diff": -4,
                       "points": 4
                   }]
               }
)";
        args.append(QJSValue(QString(str)));
        const auto jsvalue = callback.call(args);
        qDebug() << Q_FUNC_INFO << jsvalue.toString();

        if (jsvalue.isError()) {
            emit error(jsvalue.toString());
        }

        qDebug() << jsvalue.toString();
    });
}
