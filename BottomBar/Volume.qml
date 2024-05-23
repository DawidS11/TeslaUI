import QtQuick 2.15

Item {
    id: volume

    Connections {
        target: volumeHandler
        function onVolumeChanged() {
            volumeDisplay.visible = false
            visibleTimer.stop()
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 500
        repeat: false
        onTriggered: {
            volumeDisplay.visible = true
        }
    }

    Image {
        id: decVolumeIcon
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/left.png"
        MouseArea {
            anchors.fill: parent
            onClicked: volumeHandler.incrementValue(-10)
        }
    }

    Image {
        id: volumeDisplay
        visible: true
        anchors {
            left: decVolumeIcon.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }
        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: {
            if(volumeHandler.volume > 50) {
                "../data/volume2.png"
            } else if(volumeHandler.volume > 0) {
                "../data/volume1.png"
            } else {
                "../data/volume0.png"
            }
        }
    }

    Text {
        id: volumeTextDisplay
        visible: !volumeDisplay.visible
        anchors {
            centerIn: volumeDisplay
        }
        font.pixelSize: 18
        font.bold: true
        color: "white"
        text: volumeHandler.volume
    }

    Image {
        id: incVolumeIcon
        anchors {
            left: volumeDisplay.right
            verticalCenter: parent.verticalCenter
            leftMargin: 30
        }

        height: parent.height * .3
        fillMode: Image.PreserveAspectFit
        source: "../data/right.png"
        MouseArea {
            anchors.fill: parent
            onClicked: volumeHandler.incrementValue(10)
        }
    }

    width: 96 * (parent.width / 1280)
    height: parent.height
}
