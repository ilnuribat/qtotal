import QtQuick 2.0
import Material 0.1 as Material
import QtQuick.Controls 1.3
import "Components"

Rectangle {
    id: rectangle1
    anchors.fill: parent
    height: 500
    width: 300

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            top: toolBar.bottom
            bottom: parent.bottom
        }

        color: rootApp.backGroundColor
        opacity: 1 - sideMenu.opacityVal/2
    }

    Material.Button {
        //Кнопка: "Далее", "начать отмечать"
        backgroundColor: rootApp.otherColor

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: parent.width / 20
        anchors.rightMargin: parent.width / 20
        anchors.bottomMargin: parent.height / 15
        height: parent.height / 10

        text: "Начать!"

        onClicked: {
            loader.setSource("qrc:/QMLs/lists.qml")
            if(typeOfMarking.currentIndex == 0 || (typeOfMarking.currentIndex > 1 &&
                                                   typeOfMarking.currentIndex < 5)) {
                //backend.getListOfClass(chooseClass.currentIndex + 1)
            }
            else if(typeOfMarking.currentIndex != 5) {//не Чистота территории
            }
            else {
            }
        }
    }

    SideMenu {
        id: sideMenu
        z: 1
        objectName: "sideMenu"
    }

    HIcon {
        id: hIcon
        z: 2
        onClicked: {

        }
    }

    Rectangle {
        id: toolBar
        y: 417
        height: hIcon.height
        color: "#ededed"
        opacity: 1 - sideMenu.opacityVal/2
        anchors.left: hIcon.right
        anchors.right: parent.right
        anchors.top: parent.top

        Text {
            id: text1
            text: qsTr("Главная")
            font.pixelSize: parent.height * 0.5
            textFormat: Text.PlainText
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

