#include "apibase.h"

#include <QtCore/QFile>
#include <QtCore/QJsonDocument>
#include <QtCore/QTimer>
#include <QtCore/QUrl>
#include <QtCore/QtDebug>

#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>

namespace
{
const QString serverAddress = "http://localhost:9080";
}

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

void APIBase::createJsonRequestRaw(const QUrl& url, const std::function<void(const QString& json)>& callback)
{
    const QUrl fullUrl{QString{"%1/%2"}.arg(serverAddress).arg(url.toString())};
    qDebug() << Q_FUNC_INFO << "downloading url = " << fullUrl;

    QNetworkRequest request(fullUrl);
    auto reply = _nam.get(request);

    qDebug() << reply;

    connect(reply, &QNetworkReply::finished, [url, reply, callback]() mutable {
        qDebug() << Q_FUNC_INFO;
        if (reply->error() == QNetworkReply::NoError) {
            const QByteArray raw = reply->readAll();
            QJsonParseError err;
            auto jsonRawData = QString::fromUtf8(raw).toUtf8();
            const auto jdoc = QJsonDocument::fromJson(jsonRawData, &err);

            if (err.error != QJsonParseError::NoError) {
                qWarning() << "Unable to parse json" << jsonRawData;
                qFatal("No :(");
            }

            if (callback)
                callback(jsonRawData);
        }

        reply->deleteLater();
    });

    connect(reply, QOverload<QNetworkReply::NetworkError>::of(&QNetworkReply::error),
      [this, reply](QNetworkReply::NetworkError) {
          qDebug() << Q_FUNC_INFO << "error" << reply->error();
          emit error("Błąd połączenia");
      });
}

void APIBase::createJsonRequest(const QUrl& url, QJSValue callback)
{
    createJsonRequestRaw(url, [url, callback](const QString& jsonRawData) mutable {
        QString jsonData = (jsonRawData);
        QJSValueList args;
        args.push_back(jsonData);
        qDebug() << "Finished downloading url " << url;
        const auto ret = callback.call(args);
        qDebug() << ret.toString();
    });
}
