#include "scheduleapi.h"

void ScheduleAPI::refresh(QJSValue callback)
{
    APIBase::loadDummyData("scheduleExample.json", callback, 500);
}

void ScheduleAPI::gameData(quint32 uid, QJSValue callback)
{
    const QString strId = QString("gameData%1.json").arg(uid);
    APIBase::loadDummyData(strId, callback, 500);
}
