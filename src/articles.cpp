#include "articles.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

void Articles::refresh(QJSValue callback)
{
    return APIBase::loadDummyData("articlesList.json", callback, 500);
}

void Articles::fetchArticle(qint32 uid, QJSValue callback)
{
    const QString artid = QString("article%1.json").arg(uid);
    return APIBase::loadDummyData(artid, callback, 300);
}
