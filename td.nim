import strutils, os, strformat, colorize

let validExtensions = [
    ".py", 
    ".c", 
    ".cpp",
    ".h",
    ".hpp",
    ".txt", 
    ".md", 
    ".nim", 
    ".sh",
    ".class",
    ".cs",
    ".js",
    ".ts",
    ".java",
    ".swift",
    ".vb",
    ".sc",
    ".schelp",
    ".ipynb",
    ".d",
    ".rb",
    ".r",
    ".matlab",
    ".php",
    ".php4",
    ".php3",
    ".phtml",
    ".html",
    ".xml",
    ".css",
    ".go",
    ".pl",
    ".yaws",
    ".bat",
    ".ps1"
]

proc searchFile(filePath: string): void =
    var printedName = false
    let pathParts = filePath.splitFile
    let fileName = filePath.splitPath.tail
    if pathParts.ext in validExtensions:
        var f = open(filePath)
        var lineCounter = 1
        var line: string
    
        while f.readLine(line):
            if "TODO" in line:
                if printedName == false: 
                    echo fmt"{filePath}".bold.underline
                echo fmt"{lineCounter.intToStr().fgRed()} | {line.strip().fgYellow()}"
                printedName = true
            if "FIXME" in line:
                if printedName == false: 
                    echo fmt"{filePath}".bold.underline
                echo fmt"{lineCounter.intToStr().fgBlue()} | {line.strip().fgYellow()}"
                printedName = true

            lineCounter += 1

# Start of Logic
let numParams = paramCount()
echo paramCount()
for i in 0..paramCount():
    echo paramStr(i)

if numParams >= 1:
    for i in 0..paramCount():
        searchFile(paramStr(i))

elif paramCount() == 0:
    var cwd = os.getCurrentDir()
    for f in walkDirRec(cwd):
        searchFile(f)
