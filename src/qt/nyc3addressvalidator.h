// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017 The Nyc3 Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PIGEON_QT_PIGEONADDRESSVALIDATOR_H
#define PIGEON_QT_PIGEONADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class Nyc3AddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit Nyc3AddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Nyc3 address widget validator, checks for a valid nyc3 address.
 */
class Nyc3AddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit Nyc3AddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // PIGEON_QT_PIGEONADDRESSVALIDATOR_H
