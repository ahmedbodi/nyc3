Nyc3 Core
=============

Setup
---------------------
Nyc3 Core is the original Nyc3 client and it builds the backbone of the network. It downloads and, by default, stores the entire history of Nyc3 transactions (which is currently more than 100 GBs); depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Nyc3 Core, visit [nyc3core.org](https://nyc3coin.org/en/releases/).

Running
---------------------
The following are some helpful notes on how to run Nyc3 on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/nyc3-qt` (GUI) or
- `bin/nyc3d` (headless)

### Windows

Unpack the files into a directory, and then run nyc3-qt.exe.

### OS X

Drag Nyc3-Core to your applications folder, and then run Nyc3-Core.

### Need Help?

* See the documentation at the [Nyc3 Wiki](https://en.nyc3.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#nyc3](http://webchat.freenode.net?channels=nyc3) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=nyc3).
* Ask for help on the [Nyc3Talk](https://nyc3talk.org/) forums, in the [Technical Support board](https://nyc3talk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build Nyc3 on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The Nyc3 repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/nyc3/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [Nyc3Talk](https://nyc3talk.org/) forums, in the [Development & Technical Discussion board](https://nyc3talk.org/index.php?board=6.0).
* Discuss project-specific development on #nyc3-core-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=nyc3-core-dev).
* Discuss general Nyc3 development on #nyc3-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=nyc3-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
