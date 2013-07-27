require 'chef/knife'

class Chef
  class Knife
    class NodeBulkRunListRemove < Knife
      deps do
        require 'chef/knife/node_run_list_remove'
        require 'chef/search/query'
      end

      banner "knife node bulk run_list remove QUERY [ENTRY,[ENTRY]] (options)"

      def run
        node_list = Array.new
        q = Chef::Search::Query.new
        @nodes = q.search(:node, @name_args[0])[0]
        @name_args.shift
        @nodes.each do |n|
          node_list.push n.name
        end
        if node_list.length == 0
          ui.fatal("No nodes returned from search!")
        end

        ui.info("Found nodes: #{node_list.join(',')}")

        node_list.each do |n|
          Chef::Knife::NodeRunListRemove.new([n] + @name_args).run
        end
      end
    end
  end
end