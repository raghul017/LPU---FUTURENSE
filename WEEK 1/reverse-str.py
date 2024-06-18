def rev_str(text):

    words = text.split()

    rev_words = words[::-1]
    rev_sen = " ".join(rev_words)

    return rev_sen


print(rev_str("Today is thursday"))
