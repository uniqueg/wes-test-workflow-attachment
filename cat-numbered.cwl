#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ["cat", "-n"]
inputs:
  input_file:
    type: File
    inputBinding:
      position: 1
outputs:
  result:
    type: stdout

stdout: output.txt
