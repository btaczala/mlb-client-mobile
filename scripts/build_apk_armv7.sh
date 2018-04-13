#!/bin/bash

docker run --rm\
    -v $(pwd):/home/user/src rabits/qt:5.10-android  /bin/bash\
    -c "cd /home/user/ && mkdir build && cd build && qmake ~/src CONFIG+=debug && make -j$(nproc) && make install INSTALL_ROOT=/home/user/src/dist && androiddeployqt --input android-libmobile-client.so-deployment-settings.json --output /home/user/src/dist --deployment bundled --gradle"
