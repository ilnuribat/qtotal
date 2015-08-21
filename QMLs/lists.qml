import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Rectangle {
    //anchors.fill: parent
    width: 480
    height: 800
    id: listMain
    objectName: "listMain"
    color: "silver"
    //Получить, распарсить список учащихся
    //вывести учащихся
    //после каждой фамилии_имени поставить ChekBox
    //данные компоновать, отправлять на сервер
    ListView {
        //Тут типо список будет
        id: listCheckBox
        objectName: "listCheckBox"
        anchors {
            left: parent.left
            top: titleListOfClassOrRooms.bottom
            right: parent.right
            bottom: sendData.top
        }

        model: ListModel {}
        delegate: Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            color: markedStudent.checked ? "lightgreen" : "silver"
            height: 20 * (25.4 / 72) * Screen.pixelDensity
            Rectangle {
                id: name_surnameText
                anchors.left: parent.left
                anchors.leftMargin: parent.width / 20
                height: parent.height
                width: parent.width
                color: parent.color

                CheckBox {
                    id: markedStudent
                    //anchors.fill: parent
                    anchors.verticalCenter: parent.verticalCenter
                    //anchors.left: parent.left
                    checked: checkBoxStatus.text == "0" ? Qt.Unchecked : Qt.Checked
                    onClicked: {
                        //backend.setMark(id, (markedStudent.checked ? 1 : 0))
                    }
                }

                Text {
                    anchors.fill: parent
                    anchors.leftMargin: name_surnameText.width * 0.1
                    verticalAlignment: Text.AlignTop
                    font.pixelSize: name_surnameText.height * 0.8
                    text: name
                }

                Text {
                    //Это чисто для ID, чтобы в базу легче было закидывать
                    id: idOfStudent
                    text: id
                    visible: false
                }
                Text {
                    //Это для метки состояния CheckBox
                    id: checkBoxStatus
                    text: marked
                    visible: false
                }
            }
        }
        function append(newElement) {
            listCheckBox.model.append(newElement)
        }
        function clearList() {
            listCheckBox.model.clear();
        }
    }

    Rectangle {
        id: titleListOfClassOrRooms
        objectName: "titleListOfClassOrRooms"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        height: parent.height / 10
        border.width: 1
        color: "lightgray"
        Text {
            id:  titleMarkingType
            anchors.fill: parent
            anchors.leftMargin: parent.width * 0.05
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            //text: "Список класса"
        }
        Text {
            id: titleListOf
            anchors.fill: parent
            anchors.rightMargin: parent.width * 0.05
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            //text: "чисто"
        }
        function setTitle(list) {
            titleListOf.text = list;
        }
        function setMarkTitle(name) {
            titleMarkingType.text = name;
        }

    }

    Button {
        //Отправить данные на сервер
        id: sendData
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        //anchors.leftMargin: parent.width / 20
        //anchors.rightMargin: parent.width / 20
        //anchors.bottomMargin: parent.width / 20
        height: parent.height / 10

        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Отправить!"
        }
        MouseArea {
            anchors.fill: parent

            //onPressed: parent.color = "green"
            //onReleased: parent.color = "lightgray"
            onClicked: {
                //backend.sendData();
            }
        }
    }

    MessageDialog {
        id: messageDialog
        title: "Данные были успешно отправлены"
        text: "Теперь можно выйти из программы"
        onAccepted: {
            console.log("And of course you could only agree.")
            Qt.quit()
        }
    }

    function closeProgram() {
        console.log("exit!")
        messageDialog.open();
    }
}

