#ifndef STANDINGS_H
#define STANDINGS_H

#include <QObject>
#include <QtCore/QVariant>

#include <QtQml/QJSValue>

class Standings : public QObject {
  Q_OBJECT
  Q_PROPERTY(QString majorStandings READ majorStandings NOTIFY
                 majorStandingsChanged)
public:
  explicit Standings(QObject *parent = nullptr);
  QString majorStandings() const noexcept { return _majorStandings; }
public slots:
  void refreshStandings(QJSValue callback);
signals:
  void majorStandingsChanged();

private:
  QString _majorStandings;
};

#endif // STANDINGS_H
