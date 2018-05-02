#include "articles.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

#include <QtCore/QUrl>

void Articles::refresh(QJSValue callback)
{
    qDebug() << Q_FUNC_INFO;
    const QUrl url{QStringLiteral("mlb/articleHeaders")};
    APIBase::createJsonRequest(url, callback);
}

void Articles::fetchArticle(qint32 uid, QJSValue callback)
{
    qDebug() << Q_FUNC_INFO;
    const QString url = QString{"%1%2"}.arg("mlb/article/").arg(uid);
    APIBase::createJsonRequest(url, callback);
}
