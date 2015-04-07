#ifndef BACKEND_H
#define BACKEND_H

#include <QQuickItem>
#include <QQmlApplicationEngine>


class backend : public QQuickItem
{
    Q_OBJECT
public:
    backend();
    ~backend();
    QQmlApplicationEngine *engine;
signals:

public slots:
};

#endif // BACKEND_H
