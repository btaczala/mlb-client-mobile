#ifndef PLAYERSAPI_H_UTBUBHX8
#define PLAYERSAPI_H_UTBUBHX8

#include "apibase.h"

class PlayersAPI : public APIBase
{
    Q_OBJECT

public:
    void refresh(QJSValue callback) override;
};

#endif /* end of include guard: PLAYERSAPI_H_UTBUBHX8 */
