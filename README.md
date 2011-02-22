EM-Swirl
=====

Swirl is an evented EC2 version agnostic client for EC2 written in Ruby. It gets
out of your way.

The secret is it's simple input extraction and output compacting.  Your
input parameters and `expand`ed and EC2's (terrible) xml output is
`compact`ed.


Some simple examples:

    # Input
    { "InstanceId" => ["i-123k2h1", "i-0234d3"] }

is `expand`ed to:

    { "InstanceId.0" => "i-123k2h1", "InstanceId.1" => "i-0234d3" }

in the case that `.n` isn't at the end of the key:

    { "Foo.#.Bar" => ["a", "b"] }

is `expand`ed to:

    { "Foo.0.Bar" => "a", "Foo.1.Bar" => "b" }

and

    # Output
    {
      "reservationSet" => {
        "item" => {
          "instancesSet" => { "item" => [ ... ] }
        }
      }
    }

and it's variations are now `compact`ed to:

  {
    "reservationSet" => {
      "instancesSet" => [ { ... }, { ... } ]
    }
  }


Some things worth noting is that compact ignores Symbols.  This
allows you to pass the params into `call` and use them later
without affecting the API call (i.e. chain of responsibility); a
nifty trick we use in (Rack)[http://github.com/rack/rack]

Use
---

    require 'swirl/ec2/em'

    EM.run do
      ec2 = Swirl::EC2.new

      # Describe all instances
      ec2.call "DescribeInstances" do |reservation_set|
        p reservation_set
      end

      # Describe specific instances
      r = ec2.call "DescribeInstances", "InstanceId" => ["i-38hdk2f", "i-93nndch"] do |reservation_set|
        p reservation_set 
      end

      # Catch an error if the request gets one
      # NOTE:  If you don't catch errors, they will be swollowed
      r.error do |e|
        p e
      end

    end
