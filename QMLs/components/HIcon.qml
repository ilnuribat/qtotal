import QtQuick 2.2
//import "qrc:/Helpers/QMLs/Components/Helpers"
import "Helpers"

Rectangle {
    property int size: 48
    width: size
    height: size
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
    }

    Component.onCompleted: {
        mouseArea.clicked.connect(clicked)
    }
}
