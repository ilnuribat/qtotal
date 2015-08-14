import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Rectangle {
    y: 0
    height: rootApp.aHeight
    width: 0.8 * rootApp.aWidth
    x: -width
    opacity: opacityVal
    property int durationTime: 200
    property double opacityVal: (width + x) / (width * 1.0001)
    property string name_lastname: ""
    property string position: ""
    color: "#FEFEFE"

    Rectangle {
        id: toolBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: hIcon.height
        color: "#EFEFEF"
        Text {
            anchors.fill: parent
            anchors.leftMargin: parent.width * 0.1
            text: "Меню"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: parent.height * 0.5
        }
    }

    Text {
        id: titleNameLast
        anchors {
            left: parent.left
            leftMargin: parent.width * 0.02
            right: parent.right
        }
        visible: toolBar.text === "" ? false : true
        y: parent.height * 0.1
        color: "#666666"
        font.pointSize: 14
        text: "Имя Отчество:"
    }

    Text {
        id: nameLastname
        anchors {
            left: parent.left
            right: parent.right
            top: titleNameLast.bottom
            margins: parent.width * 0.05
        }

        text: name_lastname
        font.pointSize: 16
        wrapMode: Text.WordWrap
        color: "black"
    }

    Text {
        id: positionTitle
        anchors {
            left: parent.left
            leftMargin: parent.width * 0.02
            right: parent.right
        }
        visible: positionText.text === "" ? false : true
        y: parent.height * 0.3
        color: "#666666"
        font.pointSize: 14
        text: "Должность"
    }

    Text {
        id: positionText
        anchors {
            left: parent.left
            right: parent.right
            top: positionTitle.bottom
            margins: parent.width * 0.05
        }
        text: position
        font.pointSize: 14
        wrapMode: Text.WordWrap
        color: "black"
        y: parent.height * 0.3
    }

    function aRight() {
        aRight_.start();
        console.log(height)
    }
    function aLeft() {
        aLeft_.start();
    }
    NumberAnimation on x {
        id: aRight_
        to: 0
        running: false
        duration: durationTime
        easing.type: Easing.InOutQuad;
    }
    NumberAnimation on x {
        id: aLeft_
        to: -width
        running: false
        duration: durationTime
        easing.type: Easing.InOutQuad;
    }
}
