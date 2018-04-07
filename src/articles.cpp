#include "articles.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

Articles::Articles(QObject* parent)
    : QObject(parent)
{
}

void Articles::refreshArticlesList(QJSValue callback)
{
    QTimer::singleShot(1000 * 2, this, [this, callback]() mutable {
        QJSValueList args;
        auto str = R"(
                   [
                     {
                       "imageUrl": "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg",
                       "headerContent": "AKADEMIA BASKETU 2016/2017",
                       "textContent": "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]",
                       "postedContent": "2017-10-20 14:55, Michael Jordan",
                       "uid": 10
                     },
                     {
                       "imageUrl": "http://miastobasketu.com/gfx/zdjeciaglowne/AKADEMIABANER800.jpg",
                       "headerContent": "AKADEMIA BASKETU 2016/2017",
                       "textContent": "Jeśli jeszcze do kogoś nie dotarliśmy z koszykarskim przesłaniem, to nasze wspaniałe trenerki od miesiąca pracują już z dziećmi w ramach AKADEMII BASKETU. Zajęć z Pauliną Gajdosz i Martą Malczewską naprawdę nie trzeba zbytn [...]",
                       "postedContent": "2017-10-20 14:55, Michael Jordan",
                       "uid": 10
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
