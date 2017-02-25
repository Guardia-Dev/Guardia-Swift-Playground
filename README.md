# Guardia-Swift-Server

![](https://img.shields.io/badge/Swift-3.0-green.svg)
![](https://img.shields.io/badge/Vapor-1.4-orange.svg)
![](https://img.shields.io/badge/license-MIT-green.svg)

- [x] Vapor Web Server
- [x] Guardia v4.0 UI Style
- [x] Creat Code File 
- [x] Run In The Sandbox
- [x] Show Logs

## Description

The **Swift Playground** of Guardia v4.0 written by `Swift 3.0` and `Vapor` web server toolkit, which will be moved from gitpages [repo](https://github.com/Desgard/desgard.github.com) to my private server. 

## Screenshot

![](http://ognvpizmr.bkt.clouddn.com/pg.png)

## Usage In macOS

First, you need to install the `Vapor` and `Vapor toolbox`. I had pack them two shell files.

```bash
git clone https://github.com/Desgard/Guardia-Swift-Server.git
cd Guardia-Swift-Server
bash toolbox-install.sh
bash vapor-install.sh
```

And then, to configure the runtime environment.

```bash
mkdir /Users/Shared/Guardia-pg/
chmod -R 777 /Users/Shared/Guardia-pg
```

Run web serve by Vapor toolbox.

```bash
cd src
bash runserve.sh
```

## MIT License

Copyright (c) 2017 Desgard_Duan

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
