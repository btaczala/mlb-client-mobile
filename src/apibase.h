#ifndef APIBASE_H_JMR5OGLD
#define APIBASE_H_JMR5OGLD

#include <QtCore/QObject>
#include <QtQml/QJSValue>

extern bool useDummyData;

class APIBase : public QObject
{
    Q_OBJECT
public:
    virtual ~APIBase() = default;

public slots:
    virtual void refresh(QJSValue) = 0;

protected:
    void loadDummyData(const QString& file, QJSValue callback, int delay);

    void createJsonRequest(const QUrl& url, QJSValue callback);
signals:
    void error(QString errorMessage);
};

#endif /* end of include guard: APIBASE_H_JMR5OGLD */
