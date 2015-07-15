import QtQuick 2.2
import "qrc:/Helpers/QMLs/Components/Helpers"
//import "Helpers"

Rectangle {
    width: 48
    height: 48
    color: "#9c27b0"

    signal clicked()
    property string menuState: "menu"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            menuState = menuBackIcon.state;
            menuBackIcon.state = menuBackIcon.state === "menu" ? "back" : "menu";
        }
    }

    MenuBackIcon {
        id: menuBackIcon
        anchors.centerIn: parent
    }

    Component.onCompleted: {
        mouseArea.clicked.connect(clicked)
    }
}
