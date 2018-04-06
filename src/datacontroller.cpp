#include "datacontroller.h"
#include "standings.h"

DataController::DataController(QObject *parent)
    : QObject(parent), _standings(new Standings()) {}

DataController::~DataController() noexcept {}

QObject *DataController::standings() const noexcept { return _standings.get(); }
