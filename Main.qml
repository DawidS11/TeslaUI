import QtQuick

import "BottomBar"
import "RightScreen"
import "LeftScreen"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Tesla")

    LeftScreen {
        id: leftScreen
    }

    RightScreen {
        id: rightScreen
    }

    BottomBar {
        id: bottomBar
    }

}
