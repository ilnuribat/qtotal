#include "backend.h"

backend::backend()
{
    engine = new QQmlApplicationEngine();
    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
}

backend::~backend()
{

}

