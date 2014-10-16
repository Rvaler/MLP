holiday(friday, may1).
weather(friday, fair).
weather(saturday, fair).
weather(sunday, fair).
weekend(saturday).
weekend(sunday).

picnic(Day) :- !, weather(Day, fair), weekend(Day).
picnic(Day) :- holiday(Day, may1).
