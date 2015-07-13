import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Rectangle {
    y: 0
    width: 200
    x: -width
    height: parent.height - y

    color: "white"

    function aRight() {
        parent.opacity = 1;
        aRight_.start();
    }

    function aLeft() {
        aLeft_.start();
    }

    NumberAnimation on x {
        id: aRight_
        to: 0
        running: false
        easing.type: Easing.InOutQuad;
    }
    NumberAnimation on x {
        id: aLeft_
        to: -width
        running: false
        easing.type: Easing.InOutQuad;
    }
}

