#include "articles.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

#include <QtCore/QUrl>

void Articles::refresh(QJSValue callback)
{
    qDebug() << Q_FUNC_INFO;
    const QUrl url{QStringLiteral("http://localhost:9080/mlb/articleHeaders")};
    APIBase::createJsonRequest(url, callback);
}

void Articles::fetchArticle(qint32 uid, QJSValue callback)
{
    const QString artid = QString("article%1.json").arg(uid);
    return APIBase::loadDummyData(artid, callback, 300);
}
