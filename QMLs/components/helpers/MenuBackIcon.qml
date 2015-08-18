import QtQuick 2.2

Item {
    id: root
    anchors.centerIn: parent
    property int size: parent.height
    width: size / 2
    height: size / 2

    Rectangle {
        id: bar1
        x: 2 * (size / 48)
        y: 5  * (size / 48)
        width: 20 * (size / 48)
        height: 2 * (size / 48)
        antialiasing: true
    }

    Rectangle {
        id: bar2
        x: 2 * (size / 48)
        y: 11 * (size / 48)
        width: 20 * (size / 48)
        height: 2 * (size / 48)
        antialiasing: true
    }

    Rectangle {
        id: bar3
        x: 2 * (size / 48)
        y: 17 * (size / 48)
        width: 20 * (size / 48)
        height: 2 * (size / 48)
        antialiasing: true
    }

    property int animationDuration: 500

    state: "menu"
    states: [
        State {
            name: "menu"
        },

        State {
            name: "back"
            PropertyChanges { target: root; rotation: 180 }
            PropertyChanges {
                target: bar1;
                rotation: 45;
                width: 13 * (size / 48);
                x: 9.5 * (size / 48);
                y: 8 * (size / 48);
            }
            PropertyChanges {
                target: bar2;
                width: 17 * (size / 48);
                x: 3 * (size / 48);
                y: 12 * (size / 48);
            }
            PropertyChanges {
                target: bar3;
                rotation: -45;
                width: 13 * (size / 48);
                x: 9.5 * (size / 48);
                y: 16 * (size / 48);
            }
        }
    ]

    transitions: [
        Transition {
            RotationAnimation { target: root; direction: RotationAnimation.Clockwise; duration: animationDuration; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: bar1; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: bar2; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
            PropertyAnimation { target: bar3; properties: "rotation, width, x, y"; duration: animationDuration; easing.type: Easing.InOutQuad }
        }
    ]
}
