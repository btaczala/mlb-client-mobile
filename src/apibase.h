#ifndef APIBASE_H_JMR5OGLD
#define APIBASE_H_JMR5OGLD

#include <QtCore/QObject>
#include <QtQml/QJSValue>

#include <QtNetwork/QNetworkAccessManager>

extern bool useDummyData;

class APIBase : public QObject
{
    Q_OBJECT
public:
    virtual ~APIBase() = default;

    void createJsonRequestRaw(const QUrl&, const std::function<void(const QString& json)>& callback);
public slots:
    virtual void refresh(QJSValue)
    {
    }

protected slots:
    void loadDummyData(const QString& file, QJSValue callback, int delay);

    void createJsonRequest(const QUrl& url, QJSValue callback);
signals:
    void error(QString errorMessage);

private:
    QNetworkAccessManager _nam;
};

#endif /* end of include guard: APIBASE_H_JMR5OGLD */
