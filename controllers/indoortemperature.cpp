#include "indoortemperature.h"

IndoorTemperature::IndoorTemperature(QObject *parent)
    : QObject{parent}
    , m_leftTemp(20)
{}

float IndoorTemperature::leftTemp() const
{
    return m_leftTemp;
}

void IndoorTemperature::setLeftTemp(float newLeftTemp)
{
    if(newLeftTemp < 17.0 || newLeftTemp > 25)
        return;
    if (m_leftTemp == newLeftTemp)
        return;
    m_leftTemp = newLeftTemp;
    emit leftTempChanged();
}
