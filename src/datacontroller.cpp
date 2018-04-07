#include "datacontroller.h"
#include "articles.h"
#include "standings.h"
#include "teamapi.h"

DataController::DataController(QObject* parent)
    : QObject(parent)
    , _standings(new Standings())
    , _articles(new Articles())
    , _teamAPI(new TeamAPI())
{
}

DataController::~DataController() noexcept = default;

QObject* DataController::standings() const noexcept { return _standings.get(); }

QObject* DataController::articles() const noexcept
{
    return _articles.get();
}

QObject* DataController::teamAPI() const noexcept
{
    return _teamAPI.get();
}
