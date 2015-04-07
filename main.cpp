#include <QApplication>
#include "backend.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    new backend();
    return app.exec();
}
