#ifndef IPFS_VERSION_H
#define IPFS_VERSION_H

#include <QObject>
#include "ipfs/iapilistener.h"

class IpfsVersion : public QObject, public IApiListener
{
    Q_OBJECT
public:
    explicit IpfsVersion(QObject *parent = 0);
    virtual ~IpfsVersion() {}

    QString ToString() const;

    int major() const;
    int minor() const;
    int micro() const;

    // AbstractIpfsCommand interface
public:
    void init();
    void on_reply(const QJsonObject *json);
    bool valid_data() const;

private:
    bool valid_data_;
    int major_;
    int minor_;
    int micro_;

};

#endif // IPFS_VERSION_H
