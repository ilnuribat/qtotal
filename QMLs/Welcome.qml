import QtQuick 2.0
import "Components"
import Material 0.1


Rectangle {
    id: mainLocalRect

    width: 300
    height: 500
    color: "orange"

    property int widthSize: parent.width * 0.75

    Text {
        text: qsTr("Добро пожаловать")
        font.pixelSize: parent.height * 0.06
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.08
        color: "black"
    }

    Text {
        text: qsTr("Total Control")
        font.pixelSize: parent.height * 0.085
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.2
        color: "#9c27b0"
    }

    TextField {
        //Логин
        id: login
        objectName: "login"
        anchors{
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: parent.height * 0.5
        }
        height: parent.height / 10
        width: widthSize

        font.pixelSize: height / 2
        placeholderText: "Логин"

        Keys.onPressed: {
                    if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return) {
                        Qt.inputMethod.hide()
                        loader.forceActiveFocus()
                        event.accepted = true
                    }
                }
    }

    TextField {
        //Пароль
        id: password
        objectName: "password"
        height: parent.height / 10
        width: widthSize

        anchors {
            top: login.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: 10
        }

        font.pixelSize: height / 2
        placeholderText: "Пароль"
        echoMode: TextInput.Password

        Keys.onPressed: {
            //Свернуть клавиатуру
            if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return) {
                Qt.inputMethod.hide()
                loader.forceActiveFocus()
                event.accepted = true
            }
        }
    }

    Button {
        id: logIn
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.8
        width: widthSize
        height: parent.height * 0.1
        text: qsTr("Войти")
        backgroundColor: "#9c27b0"
    }
}
