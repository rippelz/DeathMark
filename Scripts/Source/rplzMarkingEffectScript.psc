Scriptname rplzMarkingEffectScript extends activemagiceffect  

rplzDeathPlayerScript property PlayerScript auto
rplzDeathMarkQuestScript property QuestScript auto

Event OnEffectStart(Actor target, Actor caster)
    ObjectReference targetRef = target as ObjectReference
    PlayerScript.MarkActor(targetRef)
EndEvent