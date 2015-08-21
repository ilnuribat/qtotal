import QtQuick 2.0
import Material 0.1 as Material
import QtQuick.Controls 1.3
import "Components"

Rectangle {
    id: mainHome
    anchors.fill: parent
    z: 0
    SideMenu {
        id: sideMenu
        z: toolBar.z + 1
        objectName: "sideMenu"
    }

    HIcon {
        id: hIcon
        z: sideMenu.z + 1
        size: parent.height / 15
    }

    Rectangle {
        id: backFon
        anchors {
            left: parent.left
            right: parent.right
            top: toolBar.bottom
            bottom: parent.bottom
        }

        color: rootApp.backGroundColor
        opacity: 1 - sideMenu.opacityVal/2
        z: mainHome.z + 1
    }


    Rectangle {
        id: toolBar
        y: 417
        height: hIcon.height
        color: "#ededed"
        opacity: 1 - sideMenu.opacityVal/2
        anchors {
            left: hIcon.right
            right: parent.right
            top: parent.top
        }
        z: backFon.z + 1

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

    Material.Button {
        id: newExplain
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.height * 0.20
        width: parent.width * 0.75
        height: parent.height * 0.10
        text: "Новая объяснительная"
        backgroundColor: rootApp.otherColor
        z: backFon.z + 1
    }

    Material.Button {
        id: zrd
        backgroundColor: rootApp.otherColor
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.height * 0.40
        width: parent.width * 0.75
        height: parent.height * 0.10

        text: "Отметить зарядку"
        z: backFon.z + 1
        onClicked: {
            home.goToZRD();

        }
    }

    Material.Button {
        id: chkv
        backgroundColor: rootApp.otherColor
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        y: parent.height * 0.60
        width: parent.width * 0.75
        height: parent.height * 0.10

        text: "Чистота комнат вечером"
        z: backFon.z + 1
        onClicked: {
        }
    }

    Material.TextField {
        id: textField
        y: parent.height * 0.8
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.75
        height: parent.height * 0.1
        placeholderText: "test"
        z: backFon.z + 1

        Keys.onPressed: {
            if (event.key == Qt.Key_Enter || event.key == Qt.Key_Return || event.key == Qt.Key_Back)              {
                Qt.inputMethod.hide()
                loader.forceActiveFocus()
                event.accepted = true
            }
        }
    }
}

