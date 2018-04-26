#include "apibase.h"

#include <QtCore/QFile>
#include <QtCore/QJsonDocument>
#include <QtCore/QTimer>
#include <QtCore/QUrl>
#include <QtCore/QtDebug>

#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>

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

void APIBase::createJsonRequest(const QUrl& url, QJSValue callback)
{
    qDebug() << Q_FUNC_INFO << "downloading url = " << url;

    QNetworkRequest request(url);
    auto reply = _nam.get(request);

    qDebug() << reply;

    connect(reply, &QNetworkReply::finished, [url, reply, callback]() mutable {
        qDebug() << Q_FUNC_INFO;
        if (reply->error() == QNetworkReply::NoError) {
            const auto ba = reply->readAll();
            QJSValueList args;
            args.push_back(ba.constData());
            qDebug() << "Finished downloading url " << url;
            const auto ret = callback.call(args);

            qDebug() << ret.toString();
        }

        reply->deleteLater();
    });

    connect(
      reply, QOverload<QNetworkReply::NetworkError>::of(&QNetworkReply::error), [this](QNetworkReply::NetworkError) {
          qDebug() << Q_FUNC_INFO << "error";
          emit error("Błąd połączenia");
      });
}
