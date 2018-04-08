#ifndef TEAMAPI_H
#define TEAMAPI_H

#include <QtCore/QObject>
#include <QtQml/QJSValue>

#include "apibase.h"

class TeamAPI : public APIBase
{
    Q_OBJECT

public slots:
    void refresh(QJSValue callback) override;

    void teamPlayers(const QString& teamID, QJSValue callback);
};

#endif // TEAMAPI_H
