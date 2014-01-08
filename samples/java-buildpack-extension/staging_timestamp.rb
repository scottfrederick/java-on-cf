require 'java_buildpack/framework'

module JavaBuildpack::Framework

  # Adds a system property containing a timestamp of when the application was staged.
  class StagingTimestamp

    def initialize(context)
      @application = context[:application]
    end

    def detect
      'staging-timestamp'
    end

    def compile
    end

    def release
      @application.java_opts.add_system_property 'staging.timestamp', "'#{Time.now}'"
    end

  end

end
