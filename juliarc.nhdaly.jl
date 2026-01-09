isinteractive() && using Revise
include(homedir()*"/dotfiles/nhdaly/julia/utils.jl")

#get!(ENV, "RETESTITEMS_NWORKERS", 2)
get!(ENV, "RETESTITEMS_NWORKER_THREADS", "1,1")


