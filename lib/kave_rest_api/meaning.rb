module KaveRestApi
     ERRORS = {
      '200' => I18n.t("KaveRestApi.200", :default => "Request Approved"),
      '400' => I18n.t("KaveRestApi.400", :default => "Argument Error"),
      '401' => I18n.t("KaveRestApi.401", :default => "Account has been disabled"),
      '402' => I18n.t("KaveRestApi.402", :default => "Operation failed"),
      '403' => I18n.t("KaveRestApi.403", :default => "Not a valid API key"),
      '404' => I18n.t("KaveRestApi.404", :default => "Undeifined method"),
      '405' => I18n.t("KaveRestApi.405", :default => "Get / Post wrong"),
      '406' => I18n.t("KaveRestApi.406", :default => "Eequired field"),
      '407' => I18n.t("KaveRestApi.407", :default => "You don't currently have permission to access this method"),
      '408' => I18n.t("KaveRestApi.408", :default => "fallback text"),
      '409' => I18n.t("KaveRestApi.409", :default => "Server not able to respond"),
      '411' => I18n.t("KaveRestApi.411", :default => "Not a valid receptor"),
      '412' => I18n.t("KaveRestApi.412", :default => "Not a valid sender"),
      '413' => I18n.t("KaveRestApi.413", :default => "Message is invalid"),
      '414' => I18n.t("KaveRestApi.414", :default => "Request is limit"),
      '415' => I18n.t("KaveRestApi.415", :default => "fallback text"),
      '417' => I18n.t("KaveRestApi.417", :default => "Not a valid UnixTime"),
      '418' => I18n.t("KaveRestApi.418", :default => "Your credit is not enough"),
      '419' => I18n.t("KaveRestApi.419", :default => "fallback text"),
      '422' => I18n.t("KaveRestApi.422", :default => "fallback text"),
      '424' => I18n.t("KaveRestApi.424", :default => "Template not found"),
      '426' => I18n.t("KaveRestApi.426", :default => "fallback text"),
      '428' => I18n.t("KaveRestApi.428", :default => "fallback text"),
      '431' => I18n.t("KaveRestApi.431", :default => "fallback text"),
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