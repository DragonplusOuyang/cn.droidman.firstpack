#!/bin/sh
if [ "$#" -ne 1 ]; then
echo "please input project name"
exit 1
fi
project_name="$1"

# mkdir "$project_name" && cd "$project_name" 
touch README.md CHANGELOG.md LICENSE.md
cp package_templ.json package.json
mkdir -p Editor Runtime Tests/Editor Tests/Runtime Documentation~
cd Editor && cp ../editor_asmref.json "Unity.$project_name.Editor.asmdef"  && cd -
cd Runtime && cp ../runtime_asmref.json "Unity.$project_name.asmdef" && cd -
cd Tests/Editor && cp ../../editor_asmref.json "Unity.$project_name.Editor.Tests.asmdef"  && cd -
cd Tests/Runtime && cp ../../runtime_asmref.json "Unity.$project_name.Tests.asmdef" && cd -
cd Documentation~ && touch "$project_name.md"
# basedir=$(dirname $0)
# echo "dir $basedir"