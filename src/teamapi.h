#ifndef TEAMAPI_H
#define TEAMAPI_H

#include <QtCore/QObject>
#include <QtQml/QJSValue>

class TeamAPI : public QObject
{
    Q_OBJECT
public:
    explicit TeamAPI(QObject* parent = nullptr);

signals:

public slots:
    void refreshTeams(QJSValue callback);

    void teamPlayers(const QString& teamID, QJSValue callback);
};

#endif // TEAMAPI_H
