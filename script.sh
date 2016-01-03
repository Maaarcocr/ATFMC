#!/bin/bash

cd resources
cat original.txt > testText.txt
cat originalResponses.txt > responses.txt
ghc --make readingTest
ghc --make verifier
cd ..
COUNTER=0
while [ $COUNTER -lt 8 ]; do
	./resources/readingTest | ./graph | ./resources/verifier
	let COUNTER=COUNTER+1
done
rm ./resources/testText.txt
rm ./resources/responses.txt