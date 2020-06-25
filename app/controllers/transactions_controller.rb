class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = current_user.transactions.where(group_id: nil).includes(:group)
    @total = @transactions.sum(:amount)
  end

  def index_by_user
    @transactions = current_user.transactions.where.not(group_id: nil).includes(:group)
    @total = @transactions.inject(0){|sum, t| sum + t.amount}
  end

  def index_by_group
    @group = Group.find(params[:group_id])
    @transactions = group.transactions.includes(:user)
    @total = @transactions.sum(:amount)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show; end

  # GET /transactions/new
  def new
    @transaction = current_user.transactions.new
    @groups = Group.all
  end

  def new_with_group
    @group = Group.find(params[:group_id])
    @transaction = @group.transactions.new
  end

  # GET /transactions/1/edit
  def edit; end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = current_user.id if @transaction.user_id.nil?
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:name, :description, :amount, :group_id)
  end
end
