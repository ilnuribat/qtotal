import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Private 1.0
import QtQuick.Controls.Styles 1.3

Rectangle {
    anchors.fill: parent
    color: "silver"
    Text {
        //Надпись: Что омтечать
        id: textTypeOfMarking
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height / 10
        anchors.leftMargin: parent.width / 20
        anchors.rightMargin: parent.width / 20
        anchors.topMargin: parent.height / 25
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 28
        text: "Что отмечать"
    }

    ComboBox {
        id: typeOfMarking
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: textTypeOfMarking.bottom
        height: parent.height / 10
        anchors.leftMargin: parent.width / 20
        anchors.rightMargin: parent.width / 20
        anchors.topMargin: parent.height / 25
        model: ["Утренняя зарядка", "Чистота комнат утром", "Опаздания", "Внешний вид", "Сампод",
            "Чистота территории", "Чистота комнат вечером"]
        onCurrentIndexChanged: {
            backend.setTypeOfMark(currentIndex, currentText)
        }
    }

    Text {
        id: titleChooseClass
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 20
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 20
        anchors.top: typeOfMarking.bottom
        anchors.topMargin: parent.height / 15
        height: parent.height / 10
        text: "Выберите класс"
        font.pointSize: 28
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    ComboBox {
        //Выбор из выпадающего списка класс. тоже из сервера
        id: chooseClass
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 20
        anchors.right: parent.right
        anchors.rightMargin: parent.width / 20
        anchors.top: titleChooseClass.bottom
        anchors.topMargin: parent.height / 25
        height: parent.height / 10

        model: ["7А", "7Б", "7В", "8А", "8Б", "8В", "9А", "9Б", "9В", "10А", "10Б", "10В", "11А", "11Б", "11В"]
    }

    Rectangle {
        //Кнопка: "Далее", "начать отмечать"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: parent.width / 20
        anchors.rightMargin: parent.width / 20
        anchors.bottomMargin: parent.height / 15
        height: parent.height / 10
        color: "gray"
        Text {
            anchors.fill: parent
            font.pointSize: 28
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Начать!"
        }
        MouseArea {
            anchors.fill: parent
            onPressed: parent.color = "green"
            onReleased: parent.color = "silver"
            onClicked: {
                loader.setSource("qrc:/QMLs/lists.qml")
                if(typeOfMarking.currentIndex == 0 || (typeOfMarking.currentIndex > 1 &&
                                                       typeOfMarking.currentIndex < 5))
                        backend.getListOfClass(chooseClass.currentIndex + 1)
                else if(typeOfMarking.currentIndex != 5) //не Чистота территории
                {
                    backend.getListOfRooms(chooseClass.currentIndex + 1)
                }

            }
        }
    }

}

