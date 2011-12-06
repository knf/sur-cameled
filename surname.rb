module SurCameled
  class Surname
    
    COMMONS = %w(AbuArab DaSilva DeAnda DeAngelo DeBardelaben DeBary DeBaugh DeBeck DeBergh DeBerry DeBlanc DeBoe DeBoer DeBonis DeBord DeBose DeBostock DeBourge DeBroux DeBruhl DeBruler DeButts DeCaires DeCamp DeCarolis DeCastro DeCay DeConinck DeCook DeCoppens DeCorte DeCost DeCosta DeCoste DeCoster DeCouto DeFamio DeFazio DeFee DeFluri DeFord DeForest DeFraia DeFrange DeFree DeFrees DeGarmo DeGear DeGeare DeGnath DeGraff DeGraffenreid DeGrange DeGraw DeGrenier DeGroft DeGuaincour DeHaan DeHaas DeHart DeHass DeHate DeHaven DeHeer DeHerrera DeJarnette DeJean DeLaet DelAmarre DeLancey DeLara DeLarm DelAshmutt DeLaughter DeLay DeLespine DelGado DelGaudio DeLong DeLony DeLorenzo DeLozier DelPrincipe DelRosso DeLuca DeLude DeMaio DeMarchi DeMarco DeMarcus DeMarmein DeMars DeMartinis DeMay DeMello DeMonge DeMont DeMontigny DeMoss DeNunzio DeNure DePalma DePaola DePasquale DePauli DePerno DePhillips DePoty DePriest DeRatt DeRemer DeRosa DeRosier DeRossett DeSaegher DeSalme DeShane DeShano DeSilva DeSimencourt DeSimone DesJardins DeSoto DeSpain DesPlanques DeSplinter DeStefano DesVoigne DeTurck DeVall DeVane DeVaughan DeVaughn DeVaul DeVault DeVenney DeVilbiss DeVille DeVillier DeVinney DeVito DeVore DeVorss DeVoto DeVries DeWald DeWall DeWalt DeWilfond DeWinne DeWitt DeWolf DeYarmett DeYoung DiBenedetto DiCicco DiClaudio DiClemento DiFrisco DiGiacomo DiGiglio DiGraziano DiGregorio DiLiberto DiMarco DiMarzo DiPaolo DiPietrantonio DiStefano DoBoto DonSang DuBois DuBose DuBourg DuCoin DuPre DuPuy DeVaux DeVoir EnEarl FitzJames FitzRandolf LaBarge LaBarr LaBelle LaBonte LaBounty LaBrue LaCaille LaCasse LaChapelle LaClair LaCombe LaCount LaCour LaCourse LaCroix LaFarge LaFeuillande LaFlamme LaFollette LaFontaine LaForge LaForme LaForte LaFosse LaFountain LaFoy LaFrance LaFuze LaGaisse LaGreca LaGuardia LaHaise LaLande LaLanne LaLiberte LaLonde LaLone LaMaitre LaMatry LaMay LaMere LaMont LaMotte LaMunyon LaPierre LaPlante LaPointe LaPorte LaPrade LaPrairie LaQue LaRoche LaRochelle LaRose LaRue LaSalle LaSance LaSart LaTray LaVallee LaVeau LaVenia LaVigna LeBerth LeBlond LeBoeuf LeBreton LeCaire LeCapitain LeCesne LeClair LeClaire LeClerc LeCompte LeConte LeCour LeCrone LeDow LeDuc LeFevre LeFlore LeFors LeFridge LeGrand LeGras LeGrove LeJeune LeMaster LeMesurier LeMieux LeMoine LePage LeQuire LeRoy LeStage LeSuer LeVally LeVert LiConti LoManto LoMastro LoRusso MacAlister MacAlpine MacArthur MacAulay MacAulay MacAuliffe MacBain MacBean MacBeth MacCallum MacClaine MacCauley MacClelland MacCleery MacCloud MacCord MacCray MacDonald MacDonnell MacDougall MacDuff MacDuffie MacFadyen MacFarland MacFarlane MacFie MacGillivray MacGregor MacInnes MacIntyre MacKay MacKenzie MacKinley MacKinnon Mackintosh MacKinney MacLaine MacLachlan MacLaren MacLaughlin MacLea MacLean MacLellan MacLeod MacMahon MacMillan MacNab MacNaught MacNeal MacNeil MacNeill MacNicol MacPhee MacPherson MacQuarrie MacRae MacShane MacSporran MacTavish MacThomas MacWhirter MacAtee MacCarthy MacCarty MacCleverty MacCredie MacCue MacCurrach MacEachern MacGilvray MacIvor MacKechnie MacLennan MacLucas MacManus MacMartin MacNeary MacNevin MacQueen MacWilliams MaDej MaGaw SanFillipo SanGalli SantaLucia TePas VanArsdale VanBuren VanCamp VanCleave VanDalsem VanderLey VanderNeut VanderTol VanderWegen VanDerWeyer VanderWilligen VanDevelde VandeWege VanDolah VanDusen VanDyke VanHee VanHoak VanHook VanHoose VanHouten VanHouwe VanHoven VanKampen VanKleck VanKleeck VanKuiken VanLanduyt VanLeer VanLiere VanLuven VanMeter VanOlinda VanOrmer VanPelt VanSchaick VanSciver VanScoy VanScoyk VanSickle VanTassel VanTuyl VanValkenburg VanVolkenburgh VanWinkle VanWysenberghe VanZandt VenDerWeyer VonCannon).sort!

    DOWNCASED_COMMONS = COMMONS.collect { |n| n.downcase }

    def self.parse(surname)
      match = false
      converted_surname = ""
      apostr_match = surname.scan(/^([a-z]+)(\')([a-z]+)$/i).flatten
      mc_match = surname.scan(/^(mc)([a-z]+)/i).flatten
      index = DOWNCASED_COMMONS.index(surname.downcase)
      if !index.nil?
        converted_surname = COMMONS[index]
        match = true
      elsif apostr_match && !apostr_match.empty? 
        apostr_match.last.capitalize!
        converted_surname = apostr_match.join
        match = true
      elsif mc_match && !mc_match.empty? 
        converted_surname = "#{mc_match.first.capitalize}#{mc_match.last.capitalize}"
        match = true
      else
        match = false
      end
      match ? converted_surname : nil
    end

  end
end