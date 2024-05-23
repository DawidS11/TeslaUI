#ifndef INDOORTEMPERATURE_H
#define INDOORTEMPERATURE_H

#include <QObject>

class IndoorTemperature : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float temp READ temp WRITE setTemp NOTIFY tempChanged FINAL)

public:
    explicit IndoorTemperature(QObject *parent = nullptr);

    float temp() const;

public slots:
    void setTemp(float newTemp);

signals:
    void tempChanged();
private:
    float m_temp;
};

#endif // INDOORTEMPERATURE_H
