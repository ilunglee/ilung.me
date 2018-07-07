Project.destroy_all

projects = [
  {
    title: 'Wrap ActiveAdmin',
    description: 'A custom theme for popular Ruby On Rails admin framework.',
    background_color: '#4F7883',
    browser: 'aa-browser.png',
    mobile: 'aa-mobile.png',
    devices: %w[browser iphone],
    video: 'https://youtu.be/Ewobwr3f5sg'
  },
  {
    title: 'Online Ticketing System',
    description: 'Online & Offline ticket selling application for event organizers.',
    background_color: '#A33C3A',
    browser: 'ticketing-browser.png',
    mobile: 'ticketing-mobile.png',
    devices: %w[browser iphone],
    video: 'https://youtu.be/nT1MNGEEGTA'
  },
  {
    title: 'Haircut Express',
    description: 'A self-checkout system designed to ease the workload of hair stylists.',
    background_color: '#4456DD',
    browser: 'hcexpress-browser.png',
    devices: %w[browser epos square],
    video: 'https://youtu.be/kjjC9W8DCBE'
  },
  {
    title: 'Custom Dashboard',
    description: 'Integrates Asana, Hubspot, Airtable, and Google Analytics to provide instant insight into the company workflow.',
    background_color: '#222229',
    browser: 'dashboard-browser.png',
    devices: %w[browser],
    video: 'https://youtu.be/0vnKfTjILCw'
  },
  {
    title: 'Vancouver Spring Show',
    description: 'An annual event that celebrates multiculturalism, and features top artists around the world.',
    background_color: '#A33C3A',
    browser: 'vss-browser.png',
    mobile: 'vss-mobile.png',
    devices: %w[browser iphone],
    video: 'https://youtu.be/NkzktvhL8_E?t=2s'
  },
  {
    title: 'BiteHub CRM',
    description: 'A customized system tailored for financial advisors needs.',
    background_color: '#3359BF',
    browser: 'bhf-browser.png',
    mobile: 'bhf-mobile.png',
    devices: %w[browser iphone],
    video: 'https://youtu.be/05eqpNdn4kk'
  },
  {
    title: 'Everme Hair Design',
    description: 'Website designed for a local hair salon.',
    background_color: '#5B46A5',
    browser: 'everme-browser.png',
    devices: %w[browser],
    video: 'https://youtu.be/Yx4WT6eMzzY'
  },
  {
    title: 'FCWR TV Show',
    description: 'Online event registration for famous Chinese TV Show.',
    background_color: '#DE42F1',
    browser: 'fcwr-browser.png',
    devices: %w[browser],
    video: 'https://youtu.be/Uf6RvRpjN1k'
  },
  {
    title: 'MyMode',
    description: 'Fashion model scouting platform for agencies.',
    background_color: '#E2837D',
    browser: 'mode-browser.png',
    devices: %w[browser],
    video: 'https://youtu.be/aOPclzGHO0Y'
  },
  {
    title: 'Amei | Utopia',
    description: 'Amei, a famous singer from Taiwan, world tour Vancouver concert.',
    background_color: '#D43964',
    browser: 'amei-browser.png',
    devices: %w[browser],
    video: 'https://youtu.be/-Qi8prty4eE'
  }
]

whitelist = %i[browser mobile]

projects.each_with_index do |project, index|
  attrs = project.reject { |k| whitelist.include? k }
  proj = Project.new(attrs.merge(position: index + 1))

  whitelist.each do |key|
    next if project[key].blank?
    file = Rails.root.join('db', 'fixtures', 'projects', project[key]).open
    proj.send("#{key}=", file)
  end

  proj.save
end
