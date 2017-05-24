#!/bin/bash

echo "TECHIO> redirect-streams --input out null"

cd /project/target

echo "TECHIO> message --channel \"execution progress\" Building..."
dotnet test --filter "FullyQualifiedName=$1" --verbosity="quiet" >build.out 2>&1
result=$?
echo "TECHIO> message --channel \"execution progress\" Done"
if [ $result -eq 0 ]; then
    echo "TECHIO> success true"
else
    echo "TECHIO> success false"
fi

/parse_build_out.pl build.out

rm -f build.out
