#ifndef ARTICLES_H
#define ARTICLES_H

#include <QObject>
#include <QtQml/QJSValue>

#include "apibase.h"

class Articles : public APIBase
{
    Q_OBJECT
signals:
    void error(QString errorMessage);

public slots:
    void refresh(QJSValue callback) override;
};

#endif // ARTICLES_H
