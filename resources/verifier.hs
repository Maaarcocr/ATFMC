import System.IO 
import System.Directory

main = do
  contents <- getContents
  tempRespH <- openFile "./resources/responses.txt" ReadMode
  (tempName, tempHandle) <- openTempFile "." "temp" 
  respCont <- hGetContents tempRespH
  let graphResponse = last $ words $ last $ lines contents
  let response = head $ lines respCont
  if graphResponse == response then putStrLn "correct" else putStrLn "incorrect"
  hPutStr tempHandle (unlines $ tail $ lines respCont)
  hClose tempRespH
  hClose tempHandle
  removeFile "./resources/responses.txt"
  renameFile tempName "./resources/responses.txt"
