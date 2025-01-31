class WelcomeController < ApplicationController

    def index
        @result = params[:result]
    end

    def calculate
        result = add(params[:input])
        flash[:info] = result
        redirect_to welcomes_path(result: result)
    end
    
    private

    def add(input)
        # if there are multiple negatives, show all of them in the exception message.
        neg_numbers = input.scan(/-[0-9]+/)
        return "negative numbers not allowed #{neg_numbers.to_sentence}" if neg_numbers.any? 
        pos_numbers = input.scan(/[0-9]+/).map(&:to_i)
        # Numbers bigger than 1000 should be ignored
        valid_numbers = pos_numbers.reject {|n| n > 1000}
        return "The sum of the input string is #{valid_numbers.sum}"
    end
end
