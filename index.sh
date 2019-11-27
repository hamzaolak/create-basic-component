#!/bin/bash
cname=$1
path=./src/components
if [ -d "$path" ]; then
  cd $path
fi
mkdir $cname
cd ./$cname
touch index.js $cname{.stories,.test,}.js
indexjsContent='export { default } from '"'"'./'"$cname"''"'"''
echo $indexjsContent >> index.js
cjsContent='import React from '"'"'react'"'"'\nimport { Text} from '"'"'react-native'"'"'\n\nfunction '"$cname"'(){\n  return(<Text style={{fontWeight: '"'"'bold'"'"'}}>'"$cname"' Component</Text>)\n}
\nexport default '"$cname"''
echo -e "$cjsContent" >> "$cname".js
storyContent='import React from '"'"'react'"'"';\nimport {storiesOf} from '"'"'@storybook/react-native'"'"';\nimport StoriesView from '"'"'storybook/decorators/StoryView'"'"';\n\nimport '"$cname"' from '"'"'./'"$cname"''"'"';\n\nstoriesOf('"'"'Components/'"$cname"''"'"', module)\n  .addDecorator(getStory => <StoriesView>{getStory()}</StoriesView>)\n  .add('"'"'with default'"'"', () => <'"$cname"' />)'
echo -e "$storyContent" >> "$cname".stories.js
cd ../../../