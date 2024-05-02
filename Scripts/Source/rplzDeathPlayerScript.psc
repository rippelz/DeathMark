Scriptname rplzDeathPlayerScript extends ReferenceAlias  

int MarkedActors

Event OnInit()
    MarkedActors = JArray.object()
    JValue.retain(MarkedActors)
    ClearActors()
    Debug.Trace("Initialized...")
EndEvent

; Array Functions
Function MarkActor(ObjectReference actorToMark)
    if !(IsActor(actorToMark))
        Debug.Trace("NOT FOUND: " + actorToMark)
        JArray.addForm(MarkedActors, actorToMark)
    else
        Debug.Trace("Found.")
    endif
    Debug.Trace("Actors: " + JArray.asFormArray(MarkedActors))    
EndFunction

bool Function IsActor(ObjectReference actorToCheck)
    return !(JArray.findForm(MarkedActors, actorToCheck) == -1)
EndFunction

Function ClearActors()
    JArray.clear(MarkedActors)
EndFunction

; Spell Functions
Function KillMarked()
    int count = 0
    int total = JArray.count(MarkedActors)
    ObjectReference refToKill
    Actor actorToKill

    while count < total
        refToKill = JArray.getForm(MarkedActors, count) as ObjectReference
        if refToKill != None
            actorToKill = refToKill as Actor
            if actorToKill != None
                actorToKill.KillEssential()
            else
                Debug.Trace("Object at index " + count + " is not an actor. [" + actorToKill + "]")
            endIf
        endIf
        count += 1
    endWhile
    ClearActors()
EndFunction