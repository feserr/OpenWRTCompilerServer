OpenWRTCompilerServer
=========

# Index

- [About](#about)
- [Requirements](#requirements)
- [Dependencies](#dependencies)
- [Demos](#demos)
- [Future features](#future)
- [Contributing](#contributing)
- [Bugs?](#bugs)
- [License](#license)

<a name="about"></a>
# OpenWRTCompilerServer

This repository held a server application for OpenWRT that works as a cloud compilation server but it can be use localy in every device with OpenWRT.
It also contains a client application that communicates with the server and send the project to it.

## Requirements

To run the server you need to install OpenWRT in a compatible device and install the [dependencies](#dependencies).

<a name="dependencies"></a>
## Dependencies

* GCC
* Make

<a name="tests"></a>
## Tests

The test are:
* Helloworld without errors.
* Helloworld with an error.

<a name="future"></a>
## Future features

* Give full information about the compilation process to the client.
* Support more languages.
* Do not depend on system call to unzip the project.

<a name="contributing"></a>
## Contributing

- If you find a bug then please report it on [GitHub Issues][issues].

- If you have a feature request, or have written a test that shows OpenWRTCompilerServer in use, then please get in touch. We'd love to hear from you!

- If you issue a Pull Request for OpenWRTCompilerServer, please only do so against the `dev` branch and **not** against the `master` branch.

<a name="bugs"></a>
## Bugs?

Please add them to the [Issue Tracker][issues] with as much info as possible, especially source code demonstrating the issue.

<a name="license"></a>
## License

OpenWRTCompilerServer is released under the [LGPL-3.0 license](https://www.gnu.org/licenses/gpl-3.0.en.html).

[issues]: https://github.com/feserr/OpenWRTCompilerServer/issues
