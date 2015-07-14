import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import "components"
import "hamMenu"

Rectangle {
    anchors.fill: parent
    id: mainLocalRect
    color: "orange"
    Button  {
    //Кнопка. отмечать.
        id: buttonPutMarks
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.1
        anchors.top: parent.top
        anchors.topMargin: parent.height / 5
        height: parent.height / 10
        Text {
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 28
            text: "Отмечать"
        }
        onClicked: {
            loader.setSource("qrc:/QMLs/class.qml")
        }
    }

    SideMenu {
        id: sideMenu
    }

    HIcon {
        id: hIcon
        x: 0
        y: 0
        onClicked: {
            if(menuState === "menu") {
                parent.opacity = 0.5;
                sideMenu.aRight();
            }
            else {
                parent.opacity = 1;
                sideMenu.aLeft();
            }
        }
    }
}

