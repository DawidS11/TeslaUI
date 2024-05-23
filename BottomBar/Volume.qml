import QtQuick 2.15

Item {
    id: volume

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

    width: parent.width / 15
    height: parent.height
}
