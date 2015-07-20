import QtQuick 2.0

Rectangle {
    id: toast
    objectName: "toast"
    anchors.centerIn: parent
    width: parent.width * 0.75
    visible: false
    color: parent.color
    property string text: ""
    Text {
        id: toastText
        objectName: "toastText"
        anchors.left: parent.left
        anchors.right: parent.right
        text: toast.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
        font.pointSize: 14
        wrapMode: Text.WordWrap
        color: rootApp.otherColor
    }
    Timer {
        id: timer
        interval: 2500
        repeat: false

        onTriggered: {
            toast.visible = false;
        }
    }
    function _show() {
        //toastText.text = str;
        toast.visible = true;
        timer.start();
    }
}
