#!/usr/bin/env julia

packages = [:OhMyREPL,:LightGraphs,
        :RCall,:GraphPlot,:Colors,
        :Compose,:Clustering,:PyCall,
        :Plots,:PyPlot,:Cairo,
        :Fontconfig,:DifferentialEquations,:DataFrames,
        :DataArrays,:GLM,:Distributions,
        :TimeSeries,:Plotly,:LaTeXStrings,
        :Statistics,:StatPlots]

 installed = [key for key in keys(Pkg.installed())]
 strpackages = @. string(packages)
 uninstalled = setdiff(strpackages,installed)

 map(Pkg.add,uninstalled)
 for package ∈ packages
     @eval using $package
 end
