#ifndef STANDINGS_H
#define STANDINGS_H

#include <QObject>
#include <QtCore/QVariant>

#include <QtQml/QJSValue>

class Standings : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString standingsJson READ standingsJson NOTIFY
            standingJsonChanged)
public:
    explicit Standings(QObject* parent = nullptr);
    QString standingsJson() const noexcept { return _standingsJson; }

public slots:
    void refreshStandings(QJSValue callback);

signals:
    void standingJsonChanged();
    void error(QString errorMessage);

private:
    QString _standingsJson;
};

#endif // STANDINGS_H
