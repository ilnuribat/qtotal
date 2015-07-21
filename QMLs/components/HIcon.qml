import QtQuick 2.2
//import "qrc:/Helpers/QMLs/Components/Helpers"
import "Helpers"

Rectangle {
    width: 48
    height: 48
    color: rootApp.otherColor

    signal clicked()
    property string menuState: "menu"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            menuState = menuBackIcon.state;
            menuBackIcon.state = menuBackIcon.state === "menu" ? "back" : "menu";
            if(sideMenu)
                if(menuState === "menu")
                    sideMenu.aRight()
                else sideMenu.aLeft();
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
