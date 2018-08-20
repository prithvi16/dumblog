class Nosubdomain
def self.matches?(request)
    !request.subdomain.present? or request.subdomain == "www"
  end
end