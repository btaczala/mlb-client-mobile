#include "playersapi.h"

void PlayersAPI::refresh(QJSValue callback)
{
    APIBase::loadDummyData("players.json", callback, 1200);
}
