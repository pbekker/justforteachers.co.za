module.exports = function (grunt) {
    // Project Configuration
    grunt.initConfig({
        watch: {
            js: {
                files: ['shared/**', 'admin/**', 'client/**', 'vendor/**'],
                tasks: ['concat:client', 'concat:admin', 'uglify:client', 'uglify:admin']
            }
        },
        concat: {
            client: {
                src: ['vendor/angular.js', 'vendor/**/*.js', 'client/client.js', 'shared/**/*.js', 'client/**/*.js'],
                dest: 'client.js'
            },
            admin: {
                src: ['vendor/angular.js', 'vendor/**/*.js', 'admin/admin.js', 'shared/**/*.js', 'admin/**/*.js'],
                dest: 'admin.js'
            }
        },
        uglify: {
            client: {
                files: {
                    'client.min.js': ['client.js'],
                }
            },
            admin: {
                files: {
                    'admin.min.js': ['admin.js'],
                }
            }
        },
        concurrent: {
            target: {
                tasks: ['watch'],
                options: {
                    logConcurrentOutput: true
                }
            }
        }
    });

    // Load NPM tasks 
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-concurrent');
    // Default task(s).
    grunt.registerTask('default', ['concat:client', 'concat:admin', 'uglify:client', 'uglify:admin', 'concurrent:target']);
};