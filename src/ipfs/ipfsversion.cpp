#include "ipfsversion.h"
#include "ipfs/ipfs.h"
#include <QDebug>
#include <QUrl>
#include <QJsonObject>

const QString API_COMMAND = "version";

IpfsVersion::IpfsVersion(QObject *parent)
    : QObject(parent),
      valid_data_(false),
      major_(0),
      minor_(0),
      micro_(0)
{
}

int IpfsVersion::major() const
{
    return major_;
}

int IpfsVersion::minor() const
{
    return minor_;
}

int IpfsVersion::micro() const
{
    return micro_;
}

void IpfsVersion::init()
{
    Ipfs::instance().query(API_COMMAND, this);
}

void IpfsVersion::on_reply(const QJsonObject *json)
{
    QJsonValue value = json->value("Version");
    QString valueStr = value.toString();
    QStringList numbers = valueStr.split(".");

    major_ = numbers[0].toInt();
    minor_ = numbers[1].toInt();
    micro_ = numbers[2].toInt();

    qDebug() << "Got version: " << this->ToString();
}

bool IpfsVersion::valid_data() const
{
    return valid_data_;
}

QString IpfsVersion::ToString() const
{
    QString str;
    str += QString::number(major_) + ".";
    str += QString::number(minor_) + ".";
    str += QString::number(micro_);

    return str;
}

