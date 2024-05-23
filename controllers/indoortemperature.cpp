#include "indoortemperature.h"

IndoorTemperature::IndoorTemperature(QObject *parent)
    : QObject{parent}
    , m_temp(20)
{}

float IndoorTemperature::temp() const
{
    return m_temp;
}

void IndoorTemperature::setTemp(float newTemp)
{
    if(newTemp < 17.0 || newTemp > 25)
        return;
    if (m_temp == newTemp)
        return;
    m_temp = newTemp;
    emit tempChanged();
}
