require "fileutils"
require "rake/testtask"

namespace :gce do
  namespace :development do
    desc "Build packer development release candidate image"
    task :release_candidate do
      create_gce_image \
        credentials_file:    "tmp/turbotest-development-8a543b023b25.json",
        image_family:        "ubuntu-2204-lts-release-candidate",
        project_id:          "turbotest-development",
        source_image_family: "ubuntu-2204-lts",
        template:            "GCE_release_candidate"
    end

    desc "Build packer development release image"
    task :release do
      create_gce_image \
        credentials_file:    "tmp/turbotest-development-8a543b023b25.json",
        image_family:        "ubuntu-2204-lts",
        project_id:          "turbotest-development",
        source_image_family: "ubuntu-2204-lts-release-candidate",
        template:            "GCE_release"
    end
  end

  namespace :production do
    desc "Build packer production release candidate image"
    task :release_candidate do
      create_gce_image \
        credentials_file:    "tmp/turbotest-production-e760714f3f2c.json",
        image_family:        "ubuntu-2204-lts-release-candidate",
        project_id:          "turbotest-production",
        source_image_family: "ubuntu-2204-lts",
        template:            "GCE_release_candidate"
    end

    desc "Build packer production release image"
    task :release do
      create_gce_image \
        credentials_file:    "tmp/turbotest-production-e760714f3f2c.json",
        image_family:        "ubuntu-2204-lts",
        project_id:          "turbotest-production",
        source_image_family: "ubuntu-2204-lts-release-candidate",
        template:            "GCE_release"
    end
  end
end

namespace :vagrant_cloud do
  desc "release_candidate"
  task :release_candidate do
    FileUtils.rm_rf "output-vagrant"

    create_vagrant_box \
      name:     "turbotest/ubuntu_2204_LTS_release_candidate",
      from:     "ubuntu/jammy64",
      template: "vagrant_release_candidate"
  end

  desc "release"
  task :release do
    FileUtils.rm_rf "output-vagrant"

    create_vagrant_box \
      name:     "turbotest/ubuntu_2204_LTS",
      from:     "turbotest/ubuntu_2204_LTS_release_candidate",
      template: "vagrant_release"

    # TODO: upload box to vagrant cloud
    # https://developer.hashicorp.com/vagrant/vagrant-cloud/boxes/create
    # https://developer.hashicorp.com/packer/integrations/hashicorp/vagrant/latest/components/post-processor/vagrant-cloud
  end
end

namespace :vagrant_local do
  desc "release candidate"
  task :release_candidate do
    FileUtils.rm_rf "output-vagrant"

    execute <<~COMMAND
      set -ex
      vagrant destroy --force
      vagrant box remove --all local/ubuntu_2204_LTS_release_candidate
      rm -f tmp/turbotest_ubuntu_2204_LTS.box
      time vagrant up
      time vagrant package --base turbotest --output tmp/turbotest_ubuntu_2204_LTS.box
      time vagrant box add tmp/turbotest_ubuntu_2204_LTS.box --name local/ubuntu_2204_LTS_release_candidate
    COMMAND
  end

  desc "release"
  task :release do
    execute <<~COMMAND
      set -ex
      vagrant destroy --force
      time VAGRANT_VAGRANTFILE=Vagrantfile.release vagrant up
    COMMAND
  end
end

desc "Run unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end

def execute(command)
  IO.popen(command, err: [:child, :out]) do |io|
    while line = io.gets
      $stdout.puts line
      $stdout.flush
    end
  end
end

def create_gce_image(credentials_file:, image_family:, machine_type:"c2-standard-16", project_id:, source_image_family:, template:, zone:)
  execute <<~COMMAND
    time packer build \
      -var 'credentials_file=#{ credentials_file }' \
      -var 'image_family=#{ image_family }' \
      -var 'machine_type=#{ machine_type }' \
      -var 'project_id=#{ project }' \
      -var 'source_image_family=#{ source_image_family }' \
      -var 'zone=#{ zone }' \
      packer/#{ template }.json | tee tmp/#{ log }.log
  COMMAND
end

def create_vagrant_box(from:, name:, template:)
  execute <<~COMMAND
    time packer build \
      -var 'box_name=#{ name }' \
      -var 'source_path=#{ from }' \
      packer/#{ template }.json | tee tmp/#{ template }.log
  COMMAND
end