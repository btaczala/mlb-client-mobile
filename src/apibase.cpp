#include "apibase.h"

#include <QtCore/QFile>
#include <QtCore/QTimer>
#include <QtCore/QtDebug>

void APIBase::loadDummyData(const QString& file, QJSValue callback)
{
    QTimer::singleShot(1000 * 2, this, [this, file, callback]() mutable {
        qDebug() << Q_FUNC_INFO;
        QJSValueList args;

        const QString fName = ":/qml/dummydata/" + file;

        QFile f{fName};
        if (!f.open(QIODevice::ReadOnly | QIODevice::Text)) {
            emit error("Error while loading dummy file");
        }

        qDebug() << "Loading dummy data from " << f.fileName();
        const QString str = f.readAll();
        args.append(QJSValue(str));
        const auto jsvalue = callback.call(args);
        qDebug() << Q_FUNC_INFO << jsvalue.toString();

        if (jsvalue.isError()) {
            emit error(jsvalue.toString());
        }

        qDebug() << jsvalue.toString();
    });
}
