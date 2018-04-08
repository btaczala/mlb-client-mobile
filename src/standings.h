#ifndef STANDINGS_H
#define STANDINGS_H

#include "apibase.h"

class Standings : public APIBase
{
    Q_OBJECT
public:
    explicit Standings();
public slots:
    void refresh(QJSValue callback) override;

signals:
    void standingJsonChanged();
};

#endif // STANDINGS_H
