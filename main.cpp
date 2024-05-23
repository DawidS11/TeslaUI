#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <controllers/system.h>
#include <controllers/indoortemperature.h>
#include <controllers/volume.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    IndoorTemperature m_indoorLeftTemperature;
    IndoorTemperature m_indoorRightTemperature;
    Volume m_volume;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/TeslaUI/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    QQmlContext *context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("indoorLeftTemperatureHandler", &m_indoorLeftTemperature);
    context->setContextProperty("indoorRightTemperatureHandler", &m_indoorRightTemperature);
    context->setContextProperty("volumeHandler", &m_volume);

    return app.exec();
}
