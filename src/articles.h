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
    void fetchArticle(qint32 uid, QJSValue callback);
};

#endif // ARTICLES_H
