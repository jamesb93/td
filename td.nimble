version       = "0.1.0"
author        = "James Bradbury"
description   = "find TODO in code"
license       = "MIT"

bin    = @["td"]

requires "nim >= 1.0.0"
requires "colorize >= 0.2.0"

#Manual buildRelease
task buildRelease, "Builds nimBend with -d:release and -d:danger":
    exec "nim c -d:release -d:danger --opt:speed --threads:on"

#Manual installRelease
task installRelease, "Builds nimBend with -d:release and -d:danger and installs it in ~/.nimble/bin":
    exec "nimble install --passNim:-d:release --passNim:--threads:on --passNim:-d:danger --passNim:--opt:speed"