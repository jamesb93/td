import strutils, os, strformat, colorize

let validExtensions = [".py", ".c", ".txt", ".md", ".nim"]

proc searchFile(filePath: string): void =
    var hasTodo = false
    var pathParts = filePath.splitFile
    if pathParts[2] in validExtensions:
        var f = open(filePath)
        var lineCounter = 0
        var line: string
    
        while f.readLine(line):
            if "TODO" in line:
                hasTodo = true
                if hasTodo == true:
                    echo fmt"{pathParts[1]}{pathParts[2]}".bold.underline
                echo fmt"{lineCounter.intToStr().fgRed()} | {line.strip().fgYellow()}"
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