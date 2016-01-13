require 'spec_helper'

describe PrettyStrings do
  it 'has a version number' do
    expect(PrettyStrings::VERSION).not_to be nil
  end

  it "prettify example #001" do
    text = "Hello World. My name is Jonas."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello World. My name is Jonas.")
  end

  it "prettify example #002" do
    text = "<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;cf size=&quot;8&quot; complexscriptssize=&quot;8&quot;&gt;<ut>}</ut>Determination of time point of wound closure <ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf size=&quot;8&quot; complexscriptssize=&quot;8&quot; superscript=&quot;on&quot;&gt;<ut>}</ut>K<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;<ut>}</ut>"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Determination of time point of wound closure K")
  end

  it "prettify example #003" do
    text = "<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot;&gt;<ut>}</ut>DermaPro<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot; superscript=&quot;on&quot;&gt;<ut>}</ut>®<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot;&gt;<ut>}</ut> versus isotonic sodium chloride solution in patients with diabetic foot ulcers<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;<ut>}</ut>"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("DermaPro® versus isotonic sodium chloride solution in patients with diabetic foot ulcers")
  end

  it "prettify example #004" do
    text = "HS will not refund any applied registration fees or backorder fees for a backordered domain that has been allocated into a Customer's ownership and account."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("HS will not refund any applied registration fees or backorder fees for a backordered domain that has been allocated into a Customer's ownership and account.")
  end

  it "prettify example #005" do
    text = "40 Hz nominal for a standard kit (48&quot;/12&quot;); &amp;gt;200 Hz for sensor alone"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('40 Hz nominal for a standard kit (48"/12"); >200 Hz for sensor alone')
  end

  it "prettify example #006" do
    text = "The Edwards SAPIEN transcatheter heart valve is indicated for use in patients with symptomatic aortic stenosis (aortic valve area &amp;amp;lt;0.8 cm2) requiring aortic valve replacement who have high risk for operative mortality, or are “non-operable”, as determined by either or both of the following risk assessments:"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The Edwards SAPIEN transcatheter heart valve is indicated for use in patients with symptomatic aortic stenosis (aortic valve area <0.8 cm2) requiring aortic valve replacement who have high risk for operative mortality, or are “non-operable”, as determined by either or both of the following risk assessments:")
  end

  it "prettify example #007" do
    text = "{&#92;f23 3.2.1}  {&#92;f23 SCUF (Slow Continuous Ultra-filtration):}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("3.2.1 SCUF (Slow Continuous Ultra-filtration):")
  end

  it "prettify example #008" do
    text = nil
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("")
  end

  it "prettify example #009" do
    text = "&amp;amp;lt;CharStyle:&amp;amp;gt;&amp;amp;lt;CharStyle:credit&amp;amp;gt;Reuter et al&amp;amp;lt;cSize:6.000000&amp;amp;gt;&amp;amp;lt;cBaselineShift:4.000000&amp;amp;gt;5&amp;amp;lt;cBaselineShift:&amp;amp;gt;&amp;amp;lt;cSize:&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Reuter et al5")
  end

  it "prettify example #010" do
    text = "Lifesciences S.A. · Ch. du Glapin 6 · 1162 Saint-Prex · Switzerland · 41.21.823.4300&amp;amp;lt;SoftReturn&amp;amp;gt;Edwards"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Lifesciences S.A. · Ch. du Glapin 6 · 1162 Saint-Prex · Switzerland · 41.21.823.4300Edwards")
  end

  it "prettify example #011" do
    text = "&amp;amp;lt;CharStyle:legal&amp;amp;gt;5."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("5.")
  end

  it "prettify example #012" do
    text = "{0}No other express or implied warranty exists, including any warranty of merchantability or fitness for a particular purpose.{1}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("No other express or implied warranty exists, including any warranty of merchantability or fitness for a particular purpose.")
  end

  it "prettify example #013" do
    text = "&amp;amp;lt;CharStyle:legal&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("")
  end

  it "prettify example #014" do
    text = "&amp;amp;lt;CharStyle:bullets&amp;amp;gt;&amp;amp;lt;cColor:PANTONE 561 C&amp;amp;gt;• &amp;amp;lt;cColor:&amp;amp;gt;Validated against the clinical gold-standard Swan-Ganz pulmonary artery catheter&amp;amp;lt;cSize:6.000000&amp;amp;gt;&amp;amp;lt;cBaselineShift:4.000000&amp;amp;gt;&amp;amp;lt;cLeading:14.000000&amp;amp;gt;1&amp;amp;lt;cLeading:&amp;amp;gt;&amp;amp;lt;cBaselineShift:&amp;amp;gt;&amp;amp;lt;cSize:&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq( "• Validated against the clinical gold-standard Swan-Ganz pulmonary artery catheter1")
  end

  it "prettify example #015" do
    text = "Hello\n\n\n\n\rWorld"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello World")
  end

  it "prettify example #016" do
    text = "{&#92;f23 3.2.1}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("3.2.1")
  end

  it "prettify example #017" do
    text = "&amp;lt;CharStyle:body copy&amp;gt;The Fl&amp;lt;cTracking:-75&amp;gt;o&amp;lt;cTracking:&amp;gt;Trac system is easy to set up and use, providing real-time &amp;lt;SoftReturn&amp;gt;hemodynamic insight from pre-op to the operating room and to the ICU."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The FloTrac system is easy to set up and use, providing real-time hemodynamic insight from pre-op to the operating room and to the ICU.")
  end

  it "prettify example #018" do
    text = "Tabulka 1 ukazuje počet pozorovaných časných komplikací (< 30 dnů u nežádoucích účinků týkajících se chlopně), linearizované počty pozdních komplikací (> 30 dnů po operaci) a počty komplikací 1, 5 a 8 let po operaci."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Tabulka 1 ukazuje počet pozorovaných časných komplikací (< 30 dnů u nežádoucích účinků týkajících se chlopně), linearizované počty pozdních komplikací (> 30 dnů po operaci) a počty komplikací 1, 5 a 8 let po operaci.")
  end

  it "prettify example #019" do
    text = "&amp;lt;z6cW&amp;gt;33 - 47 mL/beat/m&amp;lt;V&amp;gt;2"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("33 - 47 mL/beat/m2")
  end

  it "prettify example #020" do
    text = "Hello\t\tworld."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello world.")
  end
end
