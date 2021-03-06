# frozen_string_literal: true

module ActiveRecord
  module OpenTracing
    module SqlSanitizer
      module Regexes
        MULTIPLE_SPACES    = /\s+/.freeze
        MULTIPLE_QUESTIONS = /\?(,\?)+/.freeze

        PSQL_VAR_INTERPOLATION = /\[\[.*\]\]\s*$/.freeze
        PSQL_REMOVE_STRINGS = /'(?:[^']|'')*'/.freeze
        PSQL_REMOVE_INTEGERS = /(?<!LIMIT )\b\d+\b/.freeze
        PSQL_PLACEHOLDER = /\$\d+/.freeze
        PSQL_IN_CLAUSE = /IN\s+\(\?[^\)]*\)/.freeze
        PSQL_AFTER_WHERE = /(?:WHERE\s+).*?(?:SELECT|$)/i.freeze

        MYSQL_VAR_INTERPOLATION = /\[\[.*\]\]\s*$/.freeze
        MYSQL_REMOVE_INTEGERS = /(?<!LIMIT )\b\d+\b/.freeze
        MYSQL_REMOVE_SINGLE_QUOTE_STRINGS = /'(?:\\'|[^']|'')*'/.freeze
        MYSQL_REMOVE_DOUBLE_QUOTE_STRINGS = /"(?:\\"|[^"]|"")*"/.freeze
        MYSQL_IN_CLAUSE = /IN\s+\(\?[^\)]*\)/.freeze

        SQLITE_VAR_INTERPOLATION = /\[\[.*\]\]\s*$/.freeze
        SQLITE_REMOVE_STRINGS = /'(?:[^']|'')*'/.freeze
        SQLITE_REMOVE_INTEGERS = /(?<!LIMIT )\b\d+\b/.freeze

        SQLSERVER_EXECUTESQL = /EXEC sp_executesql N'(.*?)'.*/.freeze
        SQLSERVER_REMOVE_INTEGERS = /(?<!LIMIT )\b(?<!@)\d+\b/.freeze
        SQLSERVER_IN_CLAUSE = /IN\s+\(\?[^\)]*\)/.freeze
      end
    end
  end
end
