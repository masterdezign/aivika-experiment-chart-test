{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE BangPatterns #-}

birefrP :: Floating a => a -> a
birefrP !x = 0.5 * beta * (1 - (cos $ 2.0 * (x + phi)))
  where beta = 3
        phi = 0.2

dynamicsIkeda :: [Double] -> [Double]
dynamicsIkeda !input = res1
  where
    -- The length of result depends on the
    -- length of the input, which is a part of
    -- zip* functions
    res0 = history0 ++ (zipWith3 butter1 res1 u0 u_1)
    res1 = drop k res0
    u_1 = map birefrP $ zipWith (+) res0 input
    u0 = drop 1 u_1

    history0 = replicate (k + 1) 0.2

-- Sampling frequency = 2e3 Hz
-- High cutoff frequency tau = 31.83 Hz (epsilon = 0.005)
-- >> [b, a] = butter(1, 2 * 31.83 / 2e3)
-- b =
--    0.047655   0.047655
--
-- a =
--    1.00000  -0.90469
butter1 !x0 !x_k_u0 !x_k_1_u_1 = x
  where
    b0 = 0.047655
    b1 = 0.047655
    a1_neg = 0.90469
    x = b1 * x_k_1_u_1 + b0 * x_k_u0 + a1_neg * x0

k = 2000  -- Samples per delay

main = do
  -- Calculate 30 delays
  let result = dynamicsIkeda (replicate (30*k) 0)
  mapM (putStrLn. show) result
