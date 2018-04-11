#ifndef DATACONTROLLER_H
#define DATACONTROLLER_H

#include <QtCore/QObject>
#include <memory>

class Standings;
class Articles;
class TeamAPI;
class ScheduleAPI;
class PlayersAPI;
class DataController : public QObject
{
    Q_OBJECT
public:
    explicit DataController(bool dummy, QObject* parent = nullptr);
    ~DataController() noexcept final;

    QObject* standings() const noexcept;
    QObject* articles() const noexcept;
    QObject* teamAPI() const noexcept;
    QObject* scheduleAPI() const noexcept;
    QObject* playersAPI() const noexcept;

private:
    const bool _dummy;
    std::unique_ptr<Standings> _standingsAPI;
    std::unique_ptr<Articles> _articles;
    std::unique_ptr<TeamAPI> _teamAPI;
    std::unique_ptr<ScheduleAPI> _scheduleAPI;
    std::unique_ptr<PlayersAPI> _playersAPI;
};

#endif // DATACONTROLLER_H
