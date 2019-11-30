#!/bin/bash
scripthPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

read -p "Enter Component Name:" cname
cname=${cname:-DefaultComponentName}
path=./src/components
if [ -d "$path" ]; then
  cd $path
fi
mkdir $cname
cd ./$cname
touch index.js $cname{.stories,.test,}.js

sed "s/#cname/${cname}/g" "${scripthPath}"/react-native-contents/index > index.js
sed "s/#cname/${cname}/g" "${scripthPath}"/react-native-contents/component > "$cname".js
sed "s/#cname/${cname}/g" "${scripthPath}"/react-native-contents/story > "$cname".stories.js
sed "s/#cname/${cname}/g" "${scripthPath}"/react-native-contents/test > "$cname".test.js

cd ../../../
