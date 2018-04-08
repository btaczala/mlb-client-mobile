#ifndef SCHEDULEAPI_H
#define SCHEDULEAPI_H

#include <QObject>
#include <QtQml/QJSValue>

class ScheduleAPI : public QObject {
    Q_OBJECT
public:
    explicit ScheduleAPI(QObject* parent = nullptr);

signals:

public slots:

    void refreshSchedule(QJSValue callback);
};

#endif // SCHEDULEAPI_H
