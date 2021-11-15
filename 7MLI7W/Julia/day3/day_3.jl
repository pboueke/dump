include("./Codec.jl")
using Main.Codec
using Images, ImageView, TestImages

# 1.
macro reverseBlock(exprs...)
    quote
        for exp in reverse($exprs)
            eval(exp)
        end
    end
end

@reverseBlock println("1") println("2") println("3") println("4")

# 2.
freqs = Main.Codec.blockdct(testimage("cameraman"), 6)
y, x = size(freqs)
withNoise = freqs + 1 * rand(y, x)
imshow(Main.Codec.blockidct(withNoise, 6))

# 3. see Codec.jl

# 4. see Codec.jl

# 5. Play around with the parameters

# 6. & 7. -> Nope