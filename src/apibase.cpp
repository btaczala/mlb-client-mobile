#include "apibase.h"

#include <QtCore/QFile>
#include <QtCore/QTimer>
#include <QtCore/QUrl>
#include <QtCore/QtDebug>

#include <QtCore/QJsonDocument>
#include <restc-cpp/restc-cpp.h>

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
    using namespace restc_cpp;

    qDebug() << Q_FUNC_INFO << "downloading url = " << url;

    auto rest_client = restc_cpp::RestClient::Create();

    rest_client->Process([&url, callback, this](restc_cpp::Context& ctx) mutable {
        try {
            auto reply = ctx.Get(url.toString().toStdString());
            auto json = reply->GetBodyAsString();

            QJSValueList args;
            callback.call(args);
        } catch (const std::exception& ex) {
            qWarning() << Q_FUNC_INFO << ex.what();
            emit error("Unable to connect");
        }
    });
    rest_client->CloseWhenReady(true);
}
