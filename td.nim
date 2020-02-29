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
    var hasTodo = false
    var hasFixme = false
    var pathParts = filePath.splitFile
    if pathParts[2] in validExtensions:
        var f = open(filePath)
        var lineCounter = 1
        var line: string
    
        while f.readLine(line):
            if "TODO" in line:
                hasTodo = true
                if hasTodo == true:
                    echo fmt"{pathParts[1]}{pathParts[2]}".bold.underline
                echo fmt"{lineCounter.intToStr().fgRed()} | {line.strip().fgYellow()}"
            if "FIXME" in line:
                hasFixme = true
                if hasFixme == true:
                    echo fmt"{pathParts[1]}{pathParts[2]}".bold.underline
                echo fmt"{lineCounter.intToStr().fgBlue()} | {line.strip().fgYellow()}"

            lineCounter += 1

# Start of Logic
let numParams = paramCount()

if numParams > 1:
    for i in 0..paramCount():
        searchFile(paramStr(i))

elif paramCount() == 0:
    var cwd = os.getCurrentDir()
    for f in walkDirRec(cwd):
        searchFile(f)