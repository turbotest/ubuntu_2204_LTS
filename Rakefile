require "fileutils"
require "rake/testtask"

namespace :gce do
  namespace :development do
    desc "Create development release candidate GCE image"
    task :release_candidate do
      create_gce_image \
        credentials_file:    "tmp/turbotest-development-8a543b023b25.json",
        image_family:        "turbotest-ubuntu-2204-lts-release-candidate",
        log:                 "gce_development_release_candidate",
        project_id:          "turbotest-development",
        source_image_family: "ubuntu-2204-lts",
        template:            "GCE_release_candidate",
        zone:                "europe-west2-a"
    end

    desc "Create development production release GCE image"
    task :release do
      create_gce_image \
        credentials_file:    "tmp/turbotest-development-8a543b023b25.json",
        image_family:        "turbotest-ubuntu-2204-lts",
        log:                 "gce_development_release",
        project_id:          "turbotest-development",
        source_image_family: "turbotest-ubuntu-2204-lts-release-candidate",
        template:            "GCE_release",
        zone:                "europe-west2-a"
    end
  end

  namespace :production do
    desc "Create production release candidate GCE image"
    task :release_candidate do
      create_gce_image \
        credentials_file:    "tmp/turbotest-production-e760714f3f2c.json",
        image_family:        "ubuntu-2204-lts-release-candidate",
        log:                 "gce_production_release_candidate",
        project_id:          "turbotest-production",
        source_image_family: "ubuntu-2204-lts",
        template:            "GCE_release_candidate",
        zone:                "europe-west2-b"
    end

    desc "Create production release GCE image"
    task :release do
      create_gce_image \
        credentials_file:    "tmp/turbotest-production-e760714f3f2c.json",
        image_family:        "ubuntu-2204-lts",
        log:                 "gce_production_release",
        project_id:          "turbotest-production",
        source_image_family: "ubuntu-2204-lts-release-candidate",
        template:            "GCE_release",
        zone:                "europe-west2-b"
    end
  end
end

namespace :vagrant do
  namespace :cloud do
    desc "Create release candidate box on vagrant cloud"
    task :release_candidate do
      FileUtils.rm_rf "output-vagrant"

      create_vagrant_box \
        name:     "turbotest/ubuntu_2204_LTS_release_candidate",
        from:     "ubuntu/jammy64",
        template: "vagrant_release_candidate"
    end

    desc "Create production release box on vagrant cloud"
    task :release do
      FileUtils.rm_rf "output-vagrant"

      create_vagrant_box \
        name:     "turbotest/ubuntu_2204_LTS",
        from:     "turbotest/ubuntu_2204_LTS_release_candidate",
        template: "vagrant_release"
    end
  end

  namespace :local do
    desc "Create release candidate vagrant box locally"
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

    desc "Create production vagrant box locally"
    task :release do
      execute <<~COMMAND
        set -ex
        vagrant destroy --force
        time VAGRANT_VAGRANTFILE=Vagrantfile.release vagrant up
      COMMAND
    end
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

def create_gce_image(credentials_file:, image_family:, log:, machine_type:"c2-standard-16", project_id:, source_image_family:, template:, zone:)
  execute <<~COMMAND
    time packer build \
      -var 'credentials_file=#{ credentials_file }' \
      -var 'image_family=#{ image_family }' \
      -var 'machine_type=#{ machine_type }' \
      -var 'project_id=#{ project_id }' \
      -var 'source_image_family=#{ source_image_family }' \
      -var 'zone=#{ zone }' \
      packer/#{ template }.json | tee tmp/#{ log }.log
  COMMAND
end

def create_vagrant_box(from:, name:, template:)
  execute <<~COMMAND
    time packer build \
      -var 'box_name=#{ name }' \
      -var 'cloud_token=#{ `cat tmp/vagrant_cloud.key`.strip }' \
      -var 'source_path=#{ from }' \
      -var 'version=#{ `cat VERSION`.strip }' \
      packer/#{ template }.json | tee tmp/#{ template }.log
  COMMAND
end