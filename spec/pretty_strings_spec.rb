require 'spec_helper'

describe PrettyStrings do
  it 'has a version number' do
    expect(PrettyStrings::VERSION).not_to be nil
  end

  it "prettifies example #001" do
    text = "Hello World. My name is Jonas."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello World. My name is Jonas.")
  end

  it "prettifies example #002" do
    text = "<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;cf size=&quot;8&quot; complexscriptssize=&quot;8&quot;&gt;<ut>}</ut>Determination of time point of wound closure <ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf size=&quot;8&quot; complexscriptssize=&quot;8&quot; superscript=&quot;on&quot;&gt;<ut>}</ut>K<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;<ut>}</ut>"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Determination of time point of wound closure K")
  end

  it "prettifies example #003" do
    text = "<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot;&gt;<ut>}</ut>DermaPro<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot; superscript=&quot;on&quot;&gt;<ut>}</ut>®<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;&lt;cf font=&quot;Arial&quot; size=&quot;11&quot; complexscriptsfont=&quot;Arial&quot; complexscriptssize=&quot;11&quot;&gt;<ut>}</ut> versus isotonic sodium chloride solution in patients with diabetic foot ulcers<ut>{\cs6\f1\cf6\lang1024  </ut>&lt;/cf&gt;<ut>}</ut>"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("DermaPro® versus isotonic sodium chloride solution in patients with diabetic foot ulcers")
  end

  it "prettifies example #004" do
    text = "HS will not refund any applied registration fees or backorder fees for a backordered domain that has been allocated into a Customer's ownership and account."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("HS will not refund any applied registration fees or backorder fees for a backordered domain that has been allocated into a Customer's ownership and account.")
  end

  it "prettifies example #005" do
    text = "40 Hz nominal for a standard kit (48&quot;/12&quot;); &amp;gt;200 Hz for sensor alone"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('40 Hz nominal for a standard kit (48"/12"); >200 Hz for sensor alone')
  end

  it "prettifies example #006" do
    text = "The Edwards SAPIEN transcatheter heart valve is indicated for use in patients with symptomatic aortic stenosis (aortic valve area &amp;amp;lt;0.8 cm2) requiring aortic valve replacement who have high risk for operative mortality, or are “non-operable”, as determined by either or both of the following risk assessments:"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The Edwards SAPIEN transcatheter heart valve is indicated for use in patients with symptomatic aortic stenosis (aortic valve area <0.8 cm2) requiring aortic valve replacement who have high risk for operative mortality, or are “non-operable”, as determined by either or both of the following risk assessments:")
  end

  it "prettifies example #007" do
    text = "{&#92;f23 3.2.1}  {&#92;f23 SCUF (Slow Continuous Ultra-filtration):}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("3.2.1 SCUF (Slow Continuous Ultra-filtration):")
  end

  it "prettifies example #008" do
    text = nil
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("")
  end

  it "prettifies example #009" do
    text = "&amp;amp;lt;CharStyle:&amp;amp;gt;&amp;amp;lt;CharStyle:credit&amp;amp;gt;Reuter et al&amp;amp;lt;cSize:6.000000&amp;amp;gt;&amp;amp;lt;cBaselineShift:4.000000&amp;amp;gt;5&amp;amp;lt;cBaselineShift:&amp;amp;gt;&amp;amp;lt;cSize:&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Reuter et al5")
  end

  it "prettifies example #010" do
    text = "Lifesciences S.A. · Ch. du Glapin 6 · 1162 Saint-Prex · Switzerland · 41.21.823.4300&amp;amp;lt;SoftReturn&amp;amp;gt;Edwards"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Lifesciences S.A. · Ch. du Glapin 6 · 1162 Saint-Prex · Switzerland · 41.21.823.4300Edwards")
  end

  it "prettifies example #011" do
    text = "&amp;amp;lt;CharStyle:legal&amp;amp;gt;5."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("5.")
  end

  it "prettifies example #012" do
    text = "{0}No other express or implied warranty exists, including any warranty of merchantability or fitness for a particular purpose.{1}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("No other express or implied warranty exists, including any warranty of merchantability or fitness for a particular purpose.")
  end

  it "prettifies example #013" do
    text = "&amp;amp;lt;CharStyle:legal&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("")
  end

  it "prettifies example #014" do
    text = "&amp;amp;lt;CharStyle:bullets&amp;amp;gt;&amp;amp;lt;cColor:PANTONE 561 C&amp;amp;gt;• &amp;amp;lt;cColor:&amp;amp;gt;Validated against the clinical gold-standard Swan-Ganz pulmonary artery catheter&amp;amp;lt;cSize:6.000000&amp;amp;gt;&amp;amp;lt;cBaselineShift:4.000000&amp;amp;gt;&amp;amp;lt;cLeading:14.000000&amp;amp;gt;1&amp;amp;lt;cLeading:&amp;amp;gt;&amp;amp;lt;cBaselineShift:&amp;amp;gt;&amp;amp;lt;cSize:&amp;amp;gt;"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq( "• Validated against the clinical gold-standard Swan-Ganz pulmonary artery catheter1")
  end

  it "prettifies example #015" do
    text = "Hello\n\n\n\n\rWorld"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello World")
  end

  it "prettifies example #016" do
    text = "{&#92;f23 3.2.1}"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("3.2.1")
  end

  it "prettifies example #017" do
    text = "&amp;lt;CharStyle:body copy&amp;gt;The Fl&amp;lt;cTracking:-75&amp;gt;o&amp;lt;cTracking:&amp;gt;Trac system is easy to set up and use, providing real-time &amp;lt;SoftReturn&amp;gt;hemodynamic insight from pre-op to the operating room and to the ICU."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The FloTrac system is easy to set up and use, providing real-time hemodynamic insight from pre-op to the operating room and to the ICU.")
  end

  it "prettifies example #018" do
    text = "Tabulka 1 ukazuje počet pozorovaných časných komplikací (< 30 dnů u nežádoucích účinků týkajících se chlopně), linearizované počty pozdních komplikací (> 30 dnů po operaci) a počty komplikací 1, 5 a 8 let po operaci."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Tabulka 1 ukazuje počet pozorovaných časných komplikací (< 30 dnů u nežádoucích účinků týkajících se chlopně), linearizované počty pozdních komplikací (> 30 dnů po operaci) a počty komplikací 1, 5 a 8 let po operaci.")
  end

  it "prettifies example #019" do
    text = "&amp;lt;z6cW&amp;gt;33 - 47 mL/beat/m&amp;lt;V&amp;gt;2"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("33 - 47 mL/beat/m2")
  end

  it "prettifies example #020" do
    text = "Hello\t\tworld."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Hello world.")
  end

  it "prettifies example #021" do
    text = "&amp;lt;CharStyle:body copy&amp;gt;The Supe&amp;lt;cTracking:-75&amp;gt;r&amp;lt;cTracking:&amp;gt;Track system is easy to set up and use, providing real-time &amp;lt;SoftReturn&amp;gt;insight and stats."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The SuperTrack system is easy to set up and use, providing real-time insight and stats.")
  end

  it "prettifies example #022" do
    text = "The following tools are included: Déjà Vu X2 (Atril), memoQ (Kilgray), SDL Trados Studio 2009 (SDL) and Wordfast Pro (Wordfast)."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("The following tools are included: Déjà Vu X2 (Atril), memoQ (Kilgray), SDL Trados Studio 2009 (SDL) and Wordfast Pro (Wordfast).")
  end

  it "prettifies example #023" do
    text = "こんにちは、今日は土曜日。"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("こんにちは、今日は土曜日。")
  end

  it "prettifies example #024" do
    text = "**{date}** **{number}** **{email}** **{url}** test"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("**{date}** **{number}** **{email}** **{url}** test")
  end

  it "prettifies example #025" do
    text = "How satisfied were you with the way in which the car was handed over to you?<it pos='begin'>&lt;6&gt;</it>"
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("How satisfied were you with the way in which the car was handed over to you?")
  end

  it "prettifies example #026" do
    text = "hello..........................................................................................................................................................................................................................................................................................................................................................."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("hello")
  end

  it "prettifies example #027" do
    text = "hello...what is your name."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("hello...what is your name.")
  end

  it "prettifies example #028" do
    text = "hello <3 and </3 and the temp is <8 and >6...what is your name."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("hello <3 and </3 and the temp is <8 and >6...what is your name.")
  end

  it "prettifies example #029" do
    text = "hello <h1>This is HTML</h1>."
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("hello This is HTML.")
  end

  it "prettifies example #030" do
    text = 'Para obtener noticias actualizadas, visite nuestro {\field {\*\fldinst HYPERLINK "http://example.com/default.aspx?clientid=-1"}{\cs37\ul\cf2 {\fldrslt newsroom}}}\sectd\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sftnbj  o suscríbase a nuestro  {\field {\*\fldinst HYPERLINK "http://example.com/content/newsfeeds.aspx" \\t "_blank"}{\cs37\ul\cf2 {\fldrslt news feed}}}\sectd\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sftnbj .'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("Para obtener noticias actualizadas, visite nuestro newsroom o suscríbase a nuestro news feed.")
  end

  it "prettifies example #031" do
    text = 'For ongoing news, please visit our {\field {\*\fldinst HYPERLINK "http://example.com/default.aspx?clientid=-1"}{\cs37\ul\cf2 {\fldrslt newsroom}}}\sectd\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sftnbj  or subscribe to our {\field {\*\fldinst HYPERLINK "http://example.com/content/newsfeeds.aspx" \\t "_blank"}{\cs37\ul\cf2 {\fldrslt news feed}}}\sectd\linex0\headery708\footery708\colsx708\endnhere\sectlinegrid360\sectdefaultcl\sftnbj .'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq("For ongoing news, please visit our newsroom or subscribe to our news feed.")
  end

  it "prettifies example #032" do
    text = 'Tenemos el agrado de dirigirnos a ustedes a fin de formularles una oferta para la utilización de Pallets (según se define en el punto 1.1 (xi) {\i infra), }vinculados al negocio de las gaseosas, sujeta a las siguientes cláusulas y condiciones (la "{\ul Oferta}").'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('Tenemos el agrado de dirigirnos a ustedes a fin de formularles una oferta para la utilización de Pallets (según se define en el punto 1.1 (xi) infra), vinculados al negocio de las gaseosas, sujeta a las siguientes cláusulas y condiciones (la "Oferta").')
  end

  it "prettifies example #033" do
    text = '"{\ul Alquiler}": {\expndtw-1 es la suma en pesos básica diaria que el Participante debe abonar a CHEP }durante ei tiempo que cada Pallet permanece en poder del Participante, según se detalla en el Anexo VIII.'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('"Alquiler": es la suma en pesos básica diaria que el Participante debe abonar a CHEP durante ei tiempo que cada Pallet permanece en poder del Participante, según se detalla en el Anexo VIII.')
  end

  it "prettifies example #034" do
    text = 'Pacific Islander, Asian, African, Hispanice, {\highlight7 Pacific islander} or Native American ancestry'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('Pacific Islander, Asian, African, Hispanice, Pacific islander or Native American ancestry')
  end

  it "prettifies example #035" do
    text = 'STIMULATORS OF INSULIN RELEASE (Insulin Secretagogues) \endash  increase insulin secretion from the pancreas{\super 1}'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('STIMULATORS OF INSULIN RELEASE (Insulin Secretagogues) \endash increase insulin secretion from the pancreas')
  end

  it "prettifies example #036" do
    text = '{\f32 náuseas, jaqueca, hipoglucemia (cuando se usa con secretagogos de la insulina)} '
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('náuseas, jaqueca, hipoglucemia (cuando se usa con secretagogos de la insulina)')
  end

  it "prettifies example #037" do
    text = '{\f32 goteo nasal, infección del tracto respiratorio superior, reacciones alérgicas severas raramente} {\f32 (inflamación de la lengua, garganta, rostro o cuerpo; sarpullido severo)\~}'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('goteo nasal, infección del tracto respiratorio superior, reacciones alérgicas severas raramente (inflamación de la lengua, garganta, rostro o cuerpo; sarpullido severo)\~')
  end

  it "prettifies example #038" do
    text = '{\field {\*\fldinst  HYPERLINK "" \\l "RANGE!a1c" }{\cs10 {\fldrslt A1c*}}}'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('A1c*')
  end

  it "prettifies example #039" do
    text = 'The two most important pieces of information for the carbohydrate controlled diet is the {\cs11\b\cf17 serving size} and the grams of {\cs11\b\cf17 total carbohydrate}.'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('The two most important pieces of information for the carbohydrate controlled diet is the serving size and the grams of total carbohydrate.')
  end

  it "prettifies example #040" do
    text = '{\b About ABC Solutions}\line ABC Solutions is a leading provider of mission-critical communication solutions and services for enterprise and government customers.'
    expect(PrettyStrings::Cleaner.new(text).pretty).to eq('About ABC Solutions ABC Solutions is a leading provider of mission-critical communication solutions and services for enterprise and government customers.')
  end
end
