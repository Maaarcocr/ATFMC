#!/bin/bash

cd resources
cat original.txt > testText.txt
cat originalResponses.txt > responses.txt
ghc --make readingTest
ghc --make verifier
cd ..
COUNTER=0
while [ $COUNTER -lt 23 ]; do
	let COUNTER=COUNTER+1
	echo test_number: $COUNTER
	./resources/readingTest | ./graph | ./resources/verifier
done
rm ./resources/testText.txt
rm ./resources/responses.txt