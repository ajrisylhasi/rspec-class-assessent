# frozen_string_literal: true

require './package'

describe Package do
  before do
    Package.clear

    Package.describe do
      package 'Birthday' do
        content 'PS5'
        content 'Controller'

        handling do
          instruction 'do not drop'
        end
      end

      package 'Solar Systems' do
        content 'Battery'
        content 'Photovoltaics Cells'

        handling do
          instruction 'land route only'
          instruction 'keep cool'
        end
      end
    end
  end

  it 'records the packages and how to handle it' do
    birthday_package = Package.for('Birthday')

    expect(birthday_package.name).to eq 'Birthday'
    expect(birthday_package.contents).to eq ['PS5', 'Controller']
    expect(birthday_package.handlings).to eq ['do not drop']

    solar_package = Package.for('Solar Systems')

    expect(solar_package.name).to eq 'Solar Systems'
    expect(solar_package.contents).to eq ['Battery', 'Photovoltaics Cells']
    expect(solar_package.handlings).to eq ['land route only', 'keep cool']
  end

  it 'clear the package' do
    expect(Package.count).to eq 2
    Package.clear
    expect(Package.count).to eq 0
  end
end
