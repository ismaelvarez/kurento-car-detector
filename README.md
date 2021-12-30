# kurento-car-detector
Kurento Module for car detection using OpenCV Haar Cascade

```linux
mkdir build && cd build
cmake ..
make
```

Compile and build
```linux
cd ..
dpkg-buildpackage -us -uc
```

To install:

```linux
dpkg -i recorder-module_0.0.1~rc1_amd64.deb
```

Java Client

```linux
mkdir build && cd build
cmake .. -DGENERATE_JAVA_CLIENT_PROJECT=TRUE
make java_install
```
