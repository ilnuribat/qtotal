#include "welcomePage.h"
#include "externvars.h"

welcomePage::welcomePage(QQmlApplicationEngine &engine, QQuickItem *parent)
    : QQuickItem(parent)
{
    mainQML = engine.rootObjects().value(0);
    engine.rootContext()->setContextProperty("welcome", this);
    settings = new QSettings("settings.ini", QSettings::IniFormat);
    qDebug() << IP;
}

void welcomePage::login (QString login, QString password)
{
    QObject *toast = mainQML->findChild<QObject*>("toast");
    if(login.size () == 0)
    {

        toast->setProperty ("text", "Введите логин");
        QMetaObject::invokeMethod (toast, "show");
        return;
    }
    if(password.size () == 0)
    {
        toast->setProperty ("text", "Введите пароль");
        QMetaObject::invokeMethod (toast, "show");
        return;
    }
    //Типо запускаю анимацию, отрпавляю запрос на сервер
    this->authentication (login, password);
}

void welcomePage::loaded ()
{
    qDebug() << "welcome page loaded";
}

void welcomePage::authentication (QString login, QString password)
{
    QNetworkAccessManager *pManager = new QNetworkAccessManager(this);
    connect(pManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotAuthentication(QNetworkReply *)));
    QString url = IP + "/auth";
    QNetworkRequest request(QUrl(url.toUtf8()));
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/x-www-form-urlencoded");
    QString params("login=" + login);
    params.append("&password=" + password);
    pManager->post(request, params.toUtf8());
}

void welcomePage::slotAuthentication (QNetworkReply *reply)
{
    QString response(reply->readAll());
    QObject *toast = mainQML->findChild<QObject*>("toast");

    if(response == "incorrect") {
        //Логин или пароль введены неверно
        toast->setProperty ("text", "Неверный логин или пароль");
        QMetaObject::invokeMethod (toast, "show");
        return;
    }

    QJsonDocument jsonDoc = QJsonDocument::fromJson(response.toUtf8());
    QJsonObject jsonObject = jsonDoc.object ();
    QVariantMap map = jsonObject.toVariantMap ();
    settings->setValue ("ID", map["id"]);
    settings->sync ();
    QObject *loader = mainQML->findChild<QObject*>("loader");
    loader->setProperty ("source", "qrc:/QMLs/Home.qml");
}
