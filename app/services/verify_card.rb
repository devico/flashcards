class VerifyCard
  require 'damerau-levenshtein'

  PASS_LEVEL_GOOD = 0.15
  PASS_LEVEL_ACCEPTABLE = 0.20
  PASS_LEVEL_UNACCEPTABLE = 0.25

  def initialize(params)
    @factor = params[:factor]
    @probe = params[:probe]
    @repetition = params[:repetition]
    @original_text = params[:original_text]
    @user_text = params[:user_text]
    @good_level_pass = PASS_LEVEL_GOOD
    @acceptable_level_pass = PASS_LEVEL_ACCEPTABLE
    @unacceptable_level_pass = PASS_LEVEL_UNACCEPTABLE
  end

  def set_new_preview_date
    calculate_new_factor
    if @probe == 1
      @repetition  = 1
    elsif @probe == 2
      @repetition = 6
    else
      @repetition = @repetition * @factor.round
    end
    @probe = @probe + 1
    return { factor: @factor, 
             probe: @probe, 
             repetition: @repetition,
             grade_scale: @q }
  end

  def calculate_new_factor
    calculate_grade_scale
    if @q > 2
      @factor = if @q == 4
                  @factor
                else
                  @factor-0.8+(0.28*@q)-(0.02*@q*@q)
                end
      if @factor < 1.3
        @factor = 1.3
      end
    end
  end

  def calculate_grade_scale
    dl = DamerauLevenshtein.distance(@original_text, @user_text)
    check_pass = dl.to_f / @original_text.size.to_f
    if check_pass > 0
      @q = 0
      # if check_pass < @good_level_pass
      #   @q = 4
      # elsif check_pass == @good_level_pass
      #   @q = 3
      # elsif check_pass.between?(@good_level_pass, @acceptable_level_pass)
      #   @q = 2
      # elsif check_pass.between?(@acceptable_level_pass, @unacceptable_level_pass)
      #   @q = 1
      # else
      #   @q = 0
      # end
    else
      @q = 5
    end
  end

end
