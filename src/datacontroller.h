#ifndef DATACONTROLLER_H
#define DATACONTROLLER_H

#include <QtCore/QObject>
#include <memory>

class Standings;
class Articles;
class TeamAPI;
class DataController : public QObject {
    Q_OBJECT
    Q_PROPERTY(QObject standings READ standings CONSTANT)
    Q_PROPERTY(QObject articles READ articles CONSTANT)
public:
    explicit DataController(QObject* parent = nullptr);
    ~DataController() noexcept final;

    QObject* standings() const noexcept;
    QObject* articles() const noexcept;
    QObject* teamAPI() const noexcept;

signals:

public slots:

private:
    std::unique_ptr<Standings> _standings;
    std::unique_ptr<Articles> _articles;
    std::unique_ptr<TeamAPI> _teamAPI;
};

#endif // DATACONTROLLER_H
