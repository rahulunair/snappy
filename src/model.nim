# *object model* for snappy

import tables

type Stage* = ref object  ## **stages** have **components**
    comp: Table[string, string]

proc set_comp*(this: Stage, name: string, val: string) =
    this.comp[name] = val

proc has_comp*(this: Stage, name: string) : bool =
    this.comp.has_key(name)

proc get_comp*(this: Stage, name: string) : string =
    this.comp[name]


type Templ*  = ref object  ## **Templ** with **stages**
    stages: Table[string, Stage]


proc set_stage*(this: Templ, name: string, stage: Stage) = 
    this.stages[name] = stage

proc get_stage*(this: Templ, name: string) : Stage = 
    this.stages[name]

proc has_stage*(this: Templ, name: string) : bool = 
    this.stages.has_key(name)