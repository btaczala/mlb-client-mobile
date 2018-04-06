#ifndef DATACONTROLLER_H
#define DATACONTROLLER_H

#include <QObject>
#include <memory>

class Standings;
class DataController : public QObject {
  Q_OBJECT
  Q_PROPERTY(QObject standings READ standings CONSTANT)
public:
  explicit DataController(QObject *parent = nullptr);

    ~DataController() noexcept;

  QObject *standings() const noexcept;

signals:

public slots:

private:
  std::unique_ptr<Standings> _standings;
};

#endif // DATACONTROLLER_H
