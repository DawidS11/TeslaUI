#ifndef INDOORTEMPERATURE_H
#define INDOORTEMPERATURE_H

#include <QObject>

class IndoorTemperature : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float leftTemp READ leftTemp WRITE setLeftTemp NOTIFY leftTempChanged FINAL)

public:
    explicit IndoorTemperature(QObject *parent = nullptr);

    float leftTemp() const;

public slots:
    void setLeftTemp(float newLeftTemp);

signals:
    void leftTempChanged();
private:
    float m_leftTemp;
};

#endif // INDOORTEMPERATURE_H
