class ETL

  def self.transform(param)
    @param = param
    create_a_new_score_hash
  end

  private

  def self.create_a_new_score_hash
    new_table_of_scores = {}
    @new_scoring = @param.each do |key, value|
                      value.each do |elem|
                        new_table_of_scores[elem.downcase] = key
                      end
                    end
    new_table_of_scores
  end

end
