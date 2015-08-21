TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    welcomePage.cpp \
    externvars.cpp \
    homepage.cpp \
    listpage.cpp

RESOURCES += qml.qrc

CONFIG+=qml_debug

OTHER_FILES += Components

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    welcomePage.h \
    externvars.h \
    homepage.h \
    listpage.h

DISTFILES += \
	android/AndroidManifest.xml \
	android/gradle/wrapper/gradle-wrapper.jar \
	android/gradlew \
	android/res/values/libs.xml \
	android/build.gradle \
	android/gradle/wrapper/gradle-wrapper.properties \
	android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
