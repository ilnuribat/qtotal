import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Window 2.0

Rectangle {
    y: 0
    height: 500
    width: 200
    x: -width

    property int durationTime: 500

    color: "white"

    function aRight() {
        console.log(2);
        aRight_.start();
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
