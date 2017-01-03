require_relative '../lib/caesar_cipher'

describe "caesar_cipher" do
  
  it "encrypts lower case letters" do
    expect(caesar_cipher("cat", 3)).to eql("fdw")
  end
  
  it "preserves letter case" do
    expect(caesar_cipher("DoggY", 3)).to eql("GrjjB")
  end

  it "preserves blank spaces" do
    expect(caesar_cipher("Bird in the hand", 3)).to eql("Elug lq wkh kdqg")
  end

  it "shifts ecrypted letters back to start of alphabet" do
    expect(caesar_cipher("Xray Zeebra", 4)).to eql("Bvec Diifve")
  end

  it "does not ecrypt numbers" do
    expect(caesar_cipher("Number 44", 4)).to eql("Ryqfiv 44")
  end

  it "does not ecrypt punctuation or special characters" do
    expect(caesar_cipher("Isn't #ME", 2)).to eql("Kup'v #OG")
  end

end
