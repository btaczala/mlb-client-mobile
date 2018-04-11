#include "standings.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

Standings::Standings()
{
}

void Standings::refresh(QJSValue callback)
{
    if (useDummyData) {
        APIBase::loadDummyData(QString("standings.json"), callback, 2000);
    } else {
        qFatal("Not implemented");
    }
}
