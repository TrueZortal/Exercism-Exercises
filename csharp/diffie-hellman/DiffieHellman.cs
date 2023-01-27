using System;
using System.Numerics;

public static class DiffieHellman
{
    public static BigInteger PrivateKey(BigInteger primeP)
    {
        var random = new Random();
        byte[] bytes = primeP.ToByteArray ();
        BigInteger PrivateKey;

         do {
            random.NextBytes (bytes);
            bytes [bytes.Length - 1] &= (byte)0x7F;
            PrivateKey = new BigInteger (bytes);
        } while (PrivateKey >= primeP && PrivateKey > 0);

    return PrivateKey;
    }

    public static BigInteger PublicKey(BigInteger primeP, BigInteger primeG, BigInteger privateKey)
    {
        return (BigInteger.Pow(primeG,(int)privateKey)) % primeP;
    }

    public static BigInteger Secret(BigInteger primeP, BigInteger publicKey, BigInteger privateKey)
    {
        return (BigInteger.Pow(publicKey, (int)privateKey)) % primeP;
    }
}