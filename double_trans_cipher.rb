class Array
  def unshuffle(random:)
    transformed_order = (0...length).to_a.shuffle!(random: random)
    sort_by.with_index{|_, i| transformed_order[i]}
  end
end

module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocks
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext

    # generate matrix and map
    matrix = create_matrix(document).shuffle(random: Random.new(key))
    matrix.each { |row| 
      row.shuffle!(random: Random.new(key)) 
    }.join
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    create_matrix(ciphertext).map { |row| 
      row.unshuffle(random: Random.new(key)) 
    }.unshuffle(random: Random.new(key)).join
  end

  def self.create_matrix(document)
    size = (document.to_s.length ** 0.5).ceil

    grid = Array.new(size) { Array.new(size) {" "}}

    document.to_s.chars.each_with_index.map do |key, value|
      x, y = value.divmod(11)
      grid[x][y] = key
    end
    grid
  end
end
