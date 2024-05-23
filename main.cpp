#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <controllers/system.h>
#include <controllers/indoortemperature.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    System m_systemHandler;
    IndoorTemperature m_indoorTemperature;

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
    context->setContextProperty("indoorTemperature", &m_indoorTemperature);

    return app.exec();
}
