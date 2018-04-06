#include "standings.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

Standings::Standings(QObject *parent) : QObject(parent) {}

void Standings::refreshStandings(QJSValue callback) {

  QTimer::singleShot(1000 * 5, this, [callback]() mutable {
    QJSValueList args;
    auto str = R"([{
"name": "FRASSATTI",
"games": 3,
"wons": 1,
"lost": 2,
"score": "206-210",
"diff": -4,
"points": 4
},
{
"name": "FRASSATTI",
"games": 3,
"wons": 1,
"lost": 2,
"score": "206-210",
"diff": -4,
"points": 4
}]
)";
    args.append(QJSValue(QString(str)));
    qDebug() << callback.call(args).toString();
  });
}
