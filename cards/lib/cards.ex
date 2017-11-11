defmodule Cards do
  @moduledoc """
    provides methods for creating and handling a deck of cards
  """

  @doc """
    creates a full deck of cards
  """
  def create_deck do
    values = ["Ace", "two", "three", "Jack"]
    suits = ["Spades", "Hearts", "Clubs", "Diamonds"]
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end  
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck,card)
  end

  @doc """
    Returns tuple of a hand of cards and the remainder of the deck
    The  `hand_size` is how many cards should be returned for the hand

    ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
      
  """

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error,  _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
  
end
