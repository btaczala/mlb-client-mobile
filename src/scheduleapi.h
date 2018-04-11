#ifndef SCHEDULEAPI_H
#define SCHEDULEAPI_H

#include "apibase.h"
#include <QObject>
#include <QtQml/QJSValue>

class ScheduleAPI : public APIBase
{
    Q_OBJECT
public slots:
    void refresh(QJSValue callback) override;
};

#endif // SCHEDULEAPI_H
