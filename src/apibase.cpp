#include "apibase.h"

#include <QtCore/QFile>
#include <QtCore/QTimer>
#include <QtCore/QtDebug>

#include <QtCore/QJsonDocument>

void APIBase::loadDummyData(const QString& file, QJSValue callback, int delay)
{
    QTimer::singleShot(delay, this, [this, file, callback]() mutable {
        qDebug() << Q_FUNC_INFO;
        QJSValueList args;

        const QString fName = ":/qml/dummydata/" + file;

        QFile f{fName};
        if (!f.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qWarning() << "Error while reading " << fName;
            emit error("Error while loading dummy file" + fName);
            return;
        }

        qDebug() << "Loading dummy data from " << f.fileName();
        const QString str = f.readAll();
        args.append(QJSValue(str));
        const auto jsvalue = callback.call(args);
        qDebug() << Q_FUNC_INFO << jsvalue.toString();

        if (jsvalue.isError()) {
            qWarning() << "Error while calling " << callback.toString();
            emit error(jsvalue.toString());
        }
    });
}
