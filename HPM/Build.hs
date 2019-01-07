module HPM.Build
    (
     build
     ) where
import Data.List
import System.Process as Process
build :: [String] -> IO ()
build [entryFile] = build [entryFile,entryFile,"."]
build [entryFile,output] = build [entryFile,output,"."]
build [entryFile,output,root] = do
  let fullPath = root ++ "/" ++ entryFile
  mapM putStr $ ["Building: ", fullPath, " as ", output, "\n"]
  putStrLn "With:"
  Process.runCommand "ghc --version"
  putStr "\n\n"
  Process.callCommand $ "ghc --make " ++ fullPath ++ " -o " ++ output
  return ()
