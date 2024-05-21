import QtQuick 2.15

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        left: parent.left
        right: rightScreen.left
    }
    color: "blue"
    width: parent.width * 1/3
}
