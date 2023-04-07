import secrets

def private_key(p):
    """
    :param p: int - a prime number base for the private key
    :return int: - a cryptograhipcally safe random integer larger than 1 and smaller than p
    """
    return secrets.choice(range(2,p))


def public_key(p, g, private):
    """
    :param p: int - a prime number base for the private key
    :param g: int - a prime number base for the public key
    :param private: int - a private_key, a cryptograhipcally safe random integer larger than 1 and smaller than p
    :return int: - public key, a cryptograhipcally safe random integer larger than 1 and smaller than p
    """
    return pow(g, private) % p


def secret(p, public, private):
    """
    :param p: int - a prime number base for the private key
    :param public: int - a public_key
    :param private: int - a private_key, a cryptograhipcally safe random integer larger than 1 and smaller than p
    :return int: - secret key
    """
    return pow(public, private) % p
