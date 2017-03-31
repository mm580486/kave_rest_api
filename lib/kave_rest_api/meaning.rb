module KaveRestApi
     ERRORS = {
      '200' => I18n.t("KaveRestApi.200", :default => "fallback text"),
      '400' => 'http://www.banksepah.ir',
      '401' => 'https://www.edbi.ir',
      '402' => 'http://www.bim.ir',
      '403' => 'http://www.bki.ir',
      '404' => 'http://www.bank-maskan.ir',
      '405' => 'http://www.postbank.ir',
      '406' => 'http://www.ttbank.ir',
      '407' => 'http://www.enbank.ir',
      '408' => 'http://www.parsian-bank.ir',
      '409' => 'http://www.bpi.ir',
      '411' => 'http://www.karafarinbank.ir',
      '412' => 'https://www.sb24.com',
      '413' => 'http://www.sinabank.ir',
      '414' => 'http://www.sbank.ir',
      '415' => 'https://www.ba24.ir',
      '417' => 'http://www.shahr-bank.ir',
      '418' => 'http://www.bank-day.org',
      '419' => 'http://www.bsi.ir',
      '422' => 'http://www.bankmellat.ir',
      '424' => 'http://www.tejaratbank.ir',
      '426' => 'https://www.rb24.ir/',
      '428' => 'https://www.ansarbank.com',
      '431' => 'https://www.mebank.ir',
    }
    
    
    ENTRIES = {
      :inـqueue => '1',
      :givenـdate => '2',
      :deliver_to_telecommunications => '4',
      :failed => '6',
      :delivered => '10',
      :inaccessible => '11',
      :ads_block => '14',
      :sms_id_is_invalid => '100'
    }
    
    
end