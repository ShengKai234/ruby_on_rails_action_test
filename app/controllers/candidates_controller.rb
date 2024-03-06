class CandidatesController < ApplicationController
    before_action :find_candidate, only: [:edit, :update, :destroy, :vote]

    def index
        @candidates = Candidate.all
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            # success
            redirect_to candidates_path, notice: "Add candidate success!"
        else
            # fail
            render :new
        end
    end

    def edit
    end

    def update
        if @candidate.update(candidate_params)
            # success
            redirect_to candidates_path, notice: "Update candidate success!"
        else
            # fail
            render :eidt
        end
    end

    def destroy
        @candidate.destroy if @candidate
        redirect_to candidates_path, notice: "Delete candidate success!"
    end

    def vote
        # @candidate.increment(:votes)
        # @candidate.save
        @candidate.vote_logs.create(ip_address: request.remote_ip) if @candidate
        redirect_to candidates_path, notice: "Finished vote!"
    end

    private
    def candidate_params
        params.require(:candidate).permit(:name, :age, :party, :politics)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end
