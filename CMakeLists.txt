cmake_minimum_required(VERSION 3.16)

project(TeslaUI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appTeslaUI
    main.cpp
)

qt_add_qml_module(appTeslaUI
    URI TeslaUI
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES BottomBar/BottomBar.qml
        QML_FILES RightScreen/RightScreen.qml
        QML_FILES LeftScreen/LeftScreen.qml
        RESOURCES
        RESOURCES
        RESOURCES data/Tesla.png
        RESOURCES
        RESOURCES
        RESOURCES data/carIcon.png
        SOURCES controllers/system.h controllers/system.cpp
        RESOURCES data/padlock.png data/padlock-unlock.png
        RESOURCES data/recordOff.png
        RESOURCES
        RESOURCES data/recordOn.png
        RESOURCES data/user.png
        QML_FILES RightScreen/NavigationSearchBox.qml
        RESOURCES data/search.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaUI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaUI
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTeslaUI
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appTeslaUI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
