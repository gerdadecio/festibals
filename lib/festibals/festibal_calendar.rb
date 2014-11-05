module Festibals
  require 'yaml'
  require 'icalendar'

  class FestibalCalendar
    attr_reader :calendar

    FILES = Dir[File.join(File.expand_path('lib/festibals/list/*.yml'))]

    def initialize
      @calendar = Icalendar::Calendar.new
      add_initial_events
      set_calendar_name
      set_calendar_lang
      set_calendar_region
      @calendar.publish
    end

    def set_calendar_name
      @calendar.append_custom_property("X-WR-CALNAME", "Philippine Festivals")
    end

    def set_calendar_lang
      @calendar.append_custom_property("X-APPLE-LANGUAGE", "en")
    end

    def set_calendar_region
      @calendar.append_custom_property("X-APPLE-REGION", "PH")
    end

    def add_events
      FILES.each do |file|
        fileContent = File.open(File.expand_path(file))
        festivalParams = YAML::load(fileContent)['name']
        @calendar.add_event Festibal.new(festivalParams).to_ical_event
      end

      #@calendar.add_event(Festival.new(params).to_ical_event)
    end


    private

    def add_initial_events
      list.each do |l|
        @calendar.add_event Festibal.new(l).to_ical_event
      end
    end

    def list
      return [
        { summary: 'Sinulog Festival (Cebu City)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=3SU;BYMONTH=1",
          start_month: 1,
          start_day: 19,
          start_year: 2014,
          description: 'The Feast of the Sto. Niño is celebrated in Cebu with a procession, street dancing competition and a fluvial parade. Much like the Ati-atihan, the Sinulog Festival is marked by frenzied reverly to the chant of "Pit Senor!"'
        },
        { summary: 'Feast of the Black Nazarene (Quiapo Manila)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=9;BYMONTH=1",
          start_month: 1,
          start_day: 9,
          start_year: 2014,
          description: 'A grand Fiesta, this festival centers on the image of the Black Nazarene which was transported by galleon from Mexico to Manila in the 17th century. The festival is marked by an afternoon procession by thousands of devotees.'
        },
        { summary: 'Ati-Atihan (Kalibo, Aklan)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=16;BYMONTH=1",
          start_month: 1,
          start_day: 16,
          start_year: 2014,
          description: 'One of the most popular of the Philippine festivals, the Ati-atihan is a celebration in honor of the Sto. Niño. Revelers don colorful costumes and paint their bodies black and dance to the distictive beat of "Hala bira!" around the town.'
        },
        { summary: 'Pasungay (San Joaquin, Iloilo)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=2SA;BYMONTH=1",
          start_month: 1,
          start_day: 11,
          start_year: 2014,
          description: 'A festival of bulls on the hillsides of San Joaquin. Prized bulls from the town and neighboring areas fight amidst wild cheering from spectators.'
        },
        { summary: 'Dinagyang (Iloilo City)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=4SA;BYMONTH=1",
          start_month: 1,
          start_day: 25,
          start_year: 2014,
          description: 'Spectacle characterized by a frenetic stomping of feet and hypnotic drumbeating. It is a colorful whirl of thousands of people dressed in unique costumes dancing and chanting all day and night.'
        },
        { summary: 'Zambulawan (Pagadian City, Zamboanga del Sur)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=3SU;BYMONTH=1",
          start_month: 1,
          start_day: 19,
          start_year: 2014,
          description: 'The founding of Pagadian City showcases the Subanon tribe\'s rich cultural heritage by way of songs, dances and exhibits of musical instruments.'
        },
        { summary: 'Feast of Our Lady of Candles (Jara, Iloilo City)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=2;BYMONTH=2",
          start_month: 2,
          start_day: 2,
          start_year: 2014,
          description: 'The biggest and most opulent religiuos pageanty in Western Visayas. The blessing of candles and the yearly procession of the patroness, the Nuestra Senora de Candelaria is followed by the fiesta queen and her court which highlights the celebration.'
        },
        { summary: 'Parraw Regatta (Iloilo City)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=1SU;BYMONTH=3",
          start_month: 3,
          start_day: 2,
          start_year: 2014,
          description: 'An exciting race among native outriggers in the strait between Guimaras Island and Iloilo City. This is an activity every summer hedged with rules, umpires and kibitzers.'
        },
        { summary: 'Lamilamihan Festival (Lamitan, Basilan)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=2SU;BYMONTH=4",
          start_month: 4,
          start_day: 6,
          start_year: 2014,
          description: 'A yearly festival coinciding with the founding of Lamitan Municipality; showcases the traditional Yakan customs and traditions, music and dances, and traditional crafts.'
        },
        { summary: 'Manaoag Pilgrimage (Pangasinan)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=2SU;BYMONTH=4",
          start_month: 4,
          start_day: 6,
          start_year: 2014,
          description: 'Annual pilgrimage to the Shrine of Our Lady of Manaoag. Known to local pilgrims / tourists as miraculous, the Virgin\'s image has become one of Manaoag\'s main attractions. Pilgrims\' vehicles are blessed every Saturday.'
        },
        { summary: 'Pista\'y Dayat (Lingayen, Pangasinan)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=1;BYMONTH=5",
          start_month: 5,
          start_day: 1,
          start_year: 2014,
          description: 'A day of thanksgiving for bountiful harvests and abundant fishing observed all over Pangasinan traditional with mass offering on beautiful beaches and fluvial parade.'
        },
        { summary: 'Carabao Festival (Angono, Rizal)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=14;BYMONTH=5",
          start_month: 5,
          start_day: 14,
          start_year: 2014,
          description: 'Farmers pay tribute to their patron saints; a procession of carabao carts bearing a myriad local produce is held; prizes are awarded to the strongest and most beautifully decorated carabaos.'
        },
        { summary: 'Pulillan Carabao (Pulilan, Bulacan)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=14;BYMONTH=5",
          start_month: 5,
          start_day: 14,
          start_year: 2014,
          description: 'Hundreds of festively adorned carabaos are paraded by theis farmer-owners on the street leading to the church; there they are made to kneel down homage to San Isidro de Labrado, the patron saint of farmers.'
        },
        { summary: 'Pahiyas sa Quezon (Sariaya, Lucban, Tayabas, Quezon)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=15;BYMONTH=5",
          start_month: 5,
          start_day: 15,
          start_year: 2014,
          description: 'Homes are decked with kiping (multi-colored paper thin, leaf-shaped rice kropeck) and harvested vegetables; trade fair; civic parades, procession and other activities.'
        },
        { summary: 'Obando Fertility Rites (Obando, Bulacan)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=17;BYMONTH=5",
          start_month: 5,
          start_day: 17,
          start_year: 2014,
          description: 'A three day fiesta celebration in honor of San Pascual, Baylon, Sta. Clara and Nuestra Senora de Salambao. Childless couples, thankful parents, grateful farmers and fishermen dance along the streets together with colorfully customed women to pray for children and a good harvest.'
        },
        { summary: 'Tapusan sa Kawit (Kawit, Cavite)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=30;BYMONTH=5",
          start_month: 5,
          start_day: 30,
          start_year: 2014,
          description: 'A procession of gaily decorated floats decked with flowers of Maytime honors the Blessed Virgin. The participation of the town\'s most beautiful young ladies symbolizes the purity and innocence of the Blessed Mother.'
        },
        { summary: 'Antipolo Pilgrimage (Antipolo, Rizal)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=1;BYMONTH=5",
          start_month: 5,
          start_day: 1,
          start_year: 2014,
          description: 'A month-long celebration that brings devotees and pilgrims to venerate the Lady of Peace and Good Voyage enshrined in Antipolo Church and afterwards, picnic to nearby Hinulugang Taktak.'
        },
        { summary: 'Parada ng Lechon (Balayan, Batangas)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=24;BYMONTH=6",
          start_month: 6,
          start_day: 24,
          start_year: 2014,
          description: 'The parading on the Feast of St. John the Baptist of "dressed" and decorated "lechons" (roasted pigs) around town. Revelers partake of the lechons after the parade.'
        },
        { summary: 'Pintados Festival (Tacloban City)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=29;BYMONTH=6",
          start_month: 6,
          start_day: 29,
          start_year: 2014,
          description: 'Street pageantry and contest focusing on the Leyteños\' old custom of tattooing that signifies courage and status in the community.'
        },
        { summary: 'Paaway sa Kabayo (Tanjay, Negros Orriental)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=25;BYMONTH=7",
          start_month: 7,
          start_day: 25,
          start_year: 2014,
          description: 'An exciting, thrilling and oftentimes bloody fight among studs for supremacy over a female horse. More than 100 horses have been trained solely for this twice a year event.'
        },
        { summary: 'Paaway sa Kabayo (Tanjay, Negros Orriental)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=25;BYMONTH=12",
          start_month: 12,
          start_day: 25,
          start_year: 2014,
          description: 'An exciting, thrilling and oftentimes bloody fight among studs for supremacy over a female horse. More than 100 horses have been trained solely for this twice a year event.'
        },
        { summary: 'Bocaue River Festival (Bocaue, Bulacan)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=1SU;BYMONTH=7",
          start_month: 7,
          start_day: 6,
          start_year: 2014,
          description: 'A famous river festival held in honor of the miraculous Cross of Bocaue (Krus ng Wawa). During the fluvial procession, devotees ride in the "pagoda" and douse each other with water.'
        },
        { summary: 'Rajah Baguinda Festival (Jolo, Sulu)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=2SU;BYMONTH=8",
          start_month: 8,
          start_day: 3,
          start_year: 2014,
          description: 'A famous river festival held in honor of the miraculous Cross of Bocaue (Krus ng Wawa). During the fluvial procession, devotees ride in the "pagoda" and douse each other with water.'
        },
        { summary: 'Kadayawan sa Dabaw (Davao City)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=3SU;BYMONTH=8",
          start_month: 8,
          start_day: 17,
          start_year: 2014,
          description: 'A celebration of the bountiful harvests of fruits and orchids during the season. Activities include fruit and flower show, trade fair, tribal/civic/military parade, traditional sports activities, horsefight, Search for B\'yaneng Kadayawan and street dancing.'
        },
        { summary: 'Lemlunay (T\'Boli Tribal Festival) (Lake Sebu, South Cotabato)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=16;BYMONTH=9",
          start_month: 9,
          start_day: 16,
          start_year: 2014,
          description: 'An annual authentic T\'boli tribal festival staged at Lake Sebu. Features tribal rituals that start at early down amidst sounds of gongs and native music, culminating at the town plaza where cultural dances and ethic sports like horsefight are held.'
        },
        { summary: 'Feast of Nuestra Senorra Penafrancia (Naga City, Camarines Sur)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=3SA;BYMONTH=9",
          start_month: 9,
          start_day: 20,
          start_year: 2014,
          description: 'A religious festival held in hornor of the Feast of Our Lady of Peñafrancia. Bicol\'s most revered patrones highlighted by the fluvial procession of the Lady\'s image down the Bicol river. The week-long-celebration includes civic-military parade, sportsfests, exhibits, cultural shows, beauty pageants and colorful competitions.'
        },
        { summary: 'Maskara Festival (Bacolod City, Negros Occidental)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=19;BYMONTH=10",
          start_month: 10,
          start_day: 19,
          start_year: 2014,
          description: 'The biggest annual event that reflects the Bacoleños love for fun and gaiety. Coinciding with Bacolod City\'s charter day celebration, the festival features sports competitions, cultural programs, carnivals, beauty contest and a long Mardi grasstyle costumed and masked street dancers.'
        },
        { summary: 'Ibalong Festival (Legaspi City)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=19;BYMONTH=10",
          start_month: 10,
          start_day: 19,
          start_year: 2014,
          description: 'A celebration depicting Bicol\'s early beginnings as portrayed in the \"Ibalong\" epic that tells of super heroes Handiong, Batlog and Oryol and villains and wild animals that roamed in the ancient times. In music and dances, revelers parade on the main streets wearing masks of these heroes and villains. Festival activities include tours, trade fairs, exhibits and beauty pageants.'
        },
        { summary: 'La Naval De Manila (Sto. Domingo, Quezon City)',
          recurrence_rule: "FREQ=YEARLY;BYDAY=2SU;BYMONTH=10",
          start_month: 10,
          start_day: 12,
          start_year: 2014,
          description: 'A festival revolving around the image of the Blessed Virgin Mary of La Naval carved in 1533 and given as a gift to the Dominican Fathers. Borne on an elaborately decorated and well-lit carriage in the form of a ship, the venerated image is brought out of the church preceded by a dozen or so images of Dominican saints. The procession goes around the main streets of Sto. Domingo parish and then returns to the church amidst applause until it reaches the altar pedestal.'
        },
        { summary: 'Feast of San Clemente/Higantes Festival (Angono, Rizal)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=22;BYMONTH=11",
          start_month: 11,
          start_day: 22,
          start_year: 2014,
          description: 'Angono\'s joyous fiesta in honor of San Clemente whose image, resplendent in papal vestment, is borne by male devotees during a procession accompanied by "pahadores (devotees dressed in colorful local costumes, wooden shoes and carrying boat paddles) and higantes" (giant paper mache effigies) The street event culminates in a fluvial procession in Laguna de Bay amidst revelry that continues until the image is brought back to its sanctuary.'
        },
        { summary: 'Grand Cordillera Festival (Baguio City)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=3;BYMONTH=11",
          start_month: 11,
          start_day: 3,
          start_year: 2014,
          description: 'One of the region\'s major events held annualy featuring the gathering of tribes in a week-long event to "celebrate life" marked by tribal dancing and performances of thanksgiving rituals.'
        },
        { summary: 'Marian Procession (Intramuros, Manila)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=8;BYMONTH=12",
          start_month: 12,
          start_day: 8,
          start_year: 2014,
          description: 'A revival of religious tradition with more than 60 images of the Blessed Virgin Mary from various parishes and provinces paraded.'
        },
        { summary: 'Pagdidiwata (Puerto Princessa, Palawan)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=8;BYMONTH=12",
          start_month: 12,
          start_day: 8,
          start_year: 2014,
          description: 'A thanks giving celebration by the Tagbanua natives of Palawan in ritual dances and food offerings to their deities and souls of departed kin'
        },
        { summary: 'Feast of the Immaculate Concepcion (Intramuros, Manila)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=8;BYMONTH=12",
          start_month: 12,
          start_day: 8,
          start_year: 2014,
          description: 'An Eucharistic celebrabration of the Feast Day of the La Immaculada, patroness of Intramuros, capped by a grand procession of more than 50 Marian images from all over the country and participated in by thousands of devotees.'
        },
        { summary: 'Bikol Pastores (Legazpi City, Albay)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=18;BYMONTH=12",
          start_month: 12,
          start_day: 18,
          start_year: 2014,
          description: 'A unique Christmas celebration believed to have originated in the province where "pastores" - young men and women dressed in colorful shepherd costumes - joyfully dance and sing "Pastores a Belen" through the city streets.'
        },
        { summary: 'San Fernando Giant Lantern Festival (Ermita, Manila)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=1;BYMONTH=12",
          start_month: 12,
          start_day: 1,
          start_year: 2014,
          description: 'A fiesta in honor of one of the oldest Marian images in the country (it was found by Legazpi\'s soldiers amidst the foliage of a pandan shrub on the shores of Ermita in 1571) - the La Nuestra Señora de Guia, patroness of seafarers and also known as Our Lady of Expectations. The main event of the fiesta is the Bota de Flores, a reenactment of a select group of young ladies and their escorts in sailor costumes of the procession returning the La Nuestra Señora de Guia to its reconstructed shrine in 1918.'
        },
        { summary: 'Binirayan Festival (San Jose, Antique)',
          recurrence_rule: "FREQ=YEARLY;BYMONTHDAY=28;BYMONTH=12",
          start_month: 12,
          start_day: 28,
          start_year: 2014,
          description: 'A festive commemoration of an episode in the history of the Filipino race through colorful pageants acted on the beaches of Maybato in San Jose and Malandog in Hamtik. Particularly interesting is the drama of the first Malay settlement at malandog which runs for several days and nights. Binirayan is also an occasion of reunion with families, relatives and friends of homecoming Antiqueno expatriates.'
        }
      ]

    end

  end
end