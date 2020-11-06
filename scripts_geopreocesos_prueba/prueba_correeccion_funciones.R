read.inp2 <- function (file ){
    
    return(  epanet.inp2( file ) )
    
}



epanet.inp2 <- function( file ){
    
    allLines <- read_lines_wrapper2( file )
    
    # remove comments  
    allLines <-  gsub( ";.*$", "", allLines)
    
    # read in all the sections  
    titl <- TITLE( allLines )
    junc <- JUNCTIONS( allLines )
    tank <- TANKS (allLines)
    resr <- RESERVOIRS( allLines) 
    pipe <- PIPES(allLines)
    pump <- PUMPS(allLines)
    valv <- VALVES(allLines)
    dmd  <- DEMANDS(allLines) 
    pats <- PATTERNS(allLines)
    crvs <- CURVES(allLines)
    ctrl <- CONTROLS(allLines)
    rul  <- RULES(allLines)
    engy <- ENERGY(allLines)
    stat <- STATUS(allLines)
    emit <- EMITTERS(allLines)
    qlty <- QUALITY(allLines)
    srcs <- SOURCES(allLines)
    rxns <- REACTIONS(allLines)
    mix  <- MIXING(allLines)
    tims <- TIMES(allLines)
    rpt  <- REPORT(allLines)
    opts <- OPTIONS(allLines)
    coor <- COORDINATES(allLines)
    vert <- VERTICES(allLines)
    labs <- LABELS(allLines)
    bdrp <- BACKDROP(allLines)
    tags <- TAGS(allLines)
    
    # make a list of all the elements 
    inp <- list( Title = titl,
                 Junctions = junc,
                 Tanks = tank,
                 Reservoirs = resr,
                 Pipes = pipe,
                 Pumps = pump,
                 Valves = valv,
                 Demands = dmd, 
                 Patterns = pats,
                 Curves = crvs,
                 Controls = ctrl, 
                 Rules = rul,
                 Energy = engy,
                 Status = stat,
                 Emitters = emit,
                 Quality = qlty,
                 Sources = srcs,
                 Reactions = rxns,
                 Mixing = mix,
                 Times = tims,
                 Report =rpt,
                 Options = opts,
                 Coordinates = coor,
                 Vertices = vert,
                 Labels = labs,
                 Backdrop = bdrp,
                 Tags = tags)               
    
    class(inp) <- "epanet.inp"
    return( inp )
}



read_lines_wrapper2 <- function (file) 
{
    sz <- base::file.info(file)$size
    size_MB <- sz/1e+06
    if (requireNamespace("data.table", quietly = TRUE)) {
        allLines <- data.table::fread(file, sep = '\t', colClasses = "character", 
                                      strip.white = F, header = F, fill = T, data.table = F)[, 
                                                                                             1]
    }
    else {
        if (size_MB > 100) {
            warning("Consider installing package data.table to speed up file reading")
        }
        allLines <- readLines(file)
    }
    return(allLines)
}