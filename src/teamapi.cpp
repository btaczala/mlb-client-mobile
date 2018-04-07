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
