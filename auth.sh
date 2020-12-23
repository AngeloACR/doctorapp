#!/bin/bash

# cd ./docto_user

# npm install --save jwt-decode
# ionic cordova plugin add cordova-sqlite-storage
# npm install --save @ionic/storage

# cd ../docto_delivery

# npm install --save jwt-decode
# ionic cordova plugin add cordova-sqlite-storage
# npm install --save @ionic/storage

# cd ../docto_doc

# npm install --save jwt-decode
# ionic cordova plugin add cordova-sqlite-storage
# npm install --save @ionic/storage

# cd ../

cp ./docto_doc/src/services/auth/auth.service.ts ./docto_user/src/services/auth/auth.service.ts
cp ./docto_doc/src/services/auth/auth.service.ts ./docto_delivery/src/services/auth/auth.service.ts