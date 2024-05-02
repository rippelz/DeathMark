Scriptname rplzDeathPlayerScript extends ReferenceAlias  

int MarkedActors

Event OnInit()
    MarkedActors = JArray.object()
    JValue.retain(MarkedActors)
    ClearActors()
    Debug.Trace("Initialized...")
EndEvent

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

