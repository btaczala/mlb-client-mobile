#include "scheduleapi.h"

void ScheduleAPI::refresh(QJSValue callback)
{
    qDebug() << Q_FUNC_INFO;
    const QUrl url{QStringLiteral("mlb/schedule")};
    APIBase::createJsonRequest(url, callback);
}

void ScheduleAPI::gameData(quint32 uid, QJSValue callback)
{
    // const QString strId = QString("gameData%1.json").arg(uid);
    // APIBase::loadDummyData(strId, callback, 500);
    const QUrl url{QStringLiteral("mlb/gamereport/%1").arg(uid)};
    qDebug() << Q_FUNC_INFO << url;
    APIBase::createJsonRequest(url, callback);
}
