using Plots
x = collect(200:200:2000)
y1 = readdlm("./Results/normal.txt")
y2 = readdlm("./Results/dot.txt")
y3 = readdlm("./Results/matmul.txt")

p = plot(x, y1, label = "No optimization", xscale = :log10, yscale = :log10)
plot!(p, x, y2, label = "Using dot product")
plot!(p, x, y3, label = "Using matmul")

display(p)
savefig("./Results/plot.png")