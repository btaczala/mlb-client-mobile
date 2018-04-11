#include "scheduleapi.h"

void ScheduleAPI::refresh(QJSValue callback)
{
    APIBase::loadDummyData("scheduleExample.json", callback, 500);
}
