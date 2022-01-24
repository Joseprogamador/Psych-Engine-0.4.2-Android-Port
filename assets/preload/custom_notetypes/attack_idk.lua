function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'attack_idk' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'attack_idk');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'attack_idk' then
		characterPlayAnim('boyfriend', 'dodge', true);
		characterPlayAnim('dad', 'attack', true);
		setProperty('boyfriend.specialAnim', true);
		playSound('attackDodge');
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'attack_idk' then
		setProperty('health', getProperty('health')-0.4);
		playSound('attackHit');
		characterPlayAnim('boyfriend', 'hurt', true);
		characterPlayAnim('dad', 'attack', true);
	end
end