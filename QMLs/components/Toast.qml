import QtQuick 2.0

Rectangle {
    id: toast
    objectName: "toast"
    anchors.centerIn: parent
    width: parent.width * 0.75
    visible: false
    color: parent.color
    Text {
        id: toastText
        objectName: "toastText"
        anchors.left: parent.left
        anchors.right: parent.right

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
    function show() {
        toast.visible = true;
        timer.start();
    }
}
