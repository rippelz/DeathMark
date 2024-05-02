Scriptname rplzFinalEffectScript extends activemagiceffect  

rplzDeathPlayerScript property PlayerScript auto

Event OnEffectStart(Actor target, Actor caster)
    PlayerScript.KillMarked()
EndEvent