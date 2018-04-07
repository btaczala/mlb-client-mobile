#ifndef ARTICLES_H
#define ARTICLES_H

#include <QObject>
#include <QtQml/QJSValue>

class Articles : public QObject {
    Q_OBJECT
public:
    explicit Articles(QObject* parent = nullptr);

signals:
    void error(QString errorMessage);

public slots:
    void refreshArticlesList(QJSValue callback);
};

#endif // ARTICLES_H
