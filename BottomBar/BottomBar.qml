import QtQuick 2.15

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carIcon
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 20
        }
        height: parent.height * .7
        fillMode: Image.PreserveAspectFit
        source: "../data/carIcon.png"
    }

    IndoorTemperature {
        id: leftTemperature
        anchors {
            left: carIcon.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 75
        }
        tempController: indoorLeftTemperatureHandler
        height: parent.height
    }

    Image {
        id: callIcon
        anchors {
            left: leftTemperature.right
            verticalCenter: parent.verticalCenter
            leftMargin: 150
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/call.png"
    }

    Image {
        id: musicIcon
        anchors {
            left: callIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/music.png"
    }

    Image {
        id: photoIcon
        anchors {
            left: musicIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/photo.png"
    }

    Image {
        id: chatIcon
        anchors {
            left: photoIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/chat.png"
    }

    Image {
        id: notesIcon
        anchors {
            left: chatIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/notes.png"
    }

    Image {
        id: calendarIcon
        anchors {
            left: notesIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        width: parent.width / 50
        height: parent.height
        fillMode: Image.PreserveAspectFit
        source: "../data/calendar.png"
    }

    IndoorTemperature {
        id: rightTemperature
        anchors {
            left: calendarIcon.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 150
        }
        tempController: indoorRightTemperatureHandler
        height: parent.height
    }

    Volume {
        id: volumeIndoor
        anchors {
            left: rightTemperature.right
            top: parent.top
            bottom: parent.bottom
            leftMargin: 150
        }
        height: parent.height
    }
}
