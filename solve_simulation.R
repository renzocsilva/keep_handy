# Input: vector with simulation id's be processed
# Output: apply desired function to each simulation id
# Requirements: vectorized, multicore fashion


# Start multicore session with future
require(future.apply)
plan(multiprocess)

# Define function that takes a chunk with simulation id's
# and apply the desired function
solve_sims <- function(chunk) {
  future_lapply(chunk,
                #placeholder function defined elsewhere
                get_sim_results)
  
  #Log progress in multicore processing
  solved <<- solved + 1
  print(paste0(round(solved / length(chunks) * 100,
                     2),
               "%    ",
               Sys.time()))
}

# Optional: split queue into chunks
chunk_size <- 1000
chunks <- split(x, #x is the list with simulation id's
                ceiling(seq_along(x) / chunk_size))

# Reset counter and solve chunks
solved <- 0
y <- lapply(chunks,
            solve_sims)