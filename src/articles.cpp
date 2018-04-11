#include "articles.h"

#include <QtCore/QTimer>
#include <QtCore/QtDebug>

void Articles::refresh(QJSValue callback)
{
    return APIBase::loadDummyData("articlesList.json", callback, 500);
}
