import System.IO 
import System.Directory

main = do
	handle <- openFile "./resources/testText.txt" ReadMode
	(tempName, tempHandle) <- openTempFile "." "temp" 
	reading <- hGetContents handle
	let numberOfEdges = read $ (lines reading) !! 2
	putStr $ unlines $ take (6+numberOfEdges) $ lines reading
	hPutStr tempHandle (unlines $ drop (6+numberOfEdges) $ lines reading)
	hClose handle
	hClose tempHandle
	removeFile "./resources/testText.txt"
	renameFile tempName "./resources/testText.txt"