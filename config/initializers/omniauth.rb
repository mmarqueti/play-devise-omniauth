Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'qmHpWvhcCXDCyxI1NrfmA', '5943rg7o5nR1og9qAiItLvZhT2E5VNutQpWnlbXcQ40'
  provider :facebook, '142565224137', '7f008819fa41d5dc6ee7dcf048370049'
end
