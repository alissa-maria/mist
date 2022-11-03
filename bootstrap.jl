(pwd() != @__DIR__) && cd(@__DIR__) # allow starting app from bin/ dir

using Motregen
const UserApp = Motregen
Motregen.main()
