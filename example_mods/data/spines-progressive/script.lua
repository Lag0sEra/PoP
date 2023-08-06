function onCreate()
     setProperty('skipCountdown', true)
 end



function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('health') > 0.35 then --prevent opponent from killing by just singing too long
         if not isSustainNote then
              setProperty('health', getProperty('health')-0.015); --amount to lose on normal notes
         else
              setProperty('health', getProperty('health')-0.01); --amount to lose on sustain part of notes
         end
    end

    
end




