var gulp = require('gulp');
var gutil = require('gulp-util');
var notify  = require('gulp-notify');

var coffee = require('gulp-coffee');
var coffeelint = require('gulp-coffeelint');

var paths = {
  coffee: ['*.coffee']
};

gulp.task('coffee', function() {
  gulp.src(paths.coffee)
    .pipe(coffee({sourceMap: true})
      .on('error', gutil.log)
      .on('error', notify.onError())
    )
    .pipe(gulp.dest('./'));
});

gulp.task('lint', function () {
  gulp.src(paths.coffee)
    .pipe(coffeelint())
    .pipe(coffeelint.reporter())
    .pipe(coffeelint.reporter('fail'))
      .on('error', notify.onError());
});

gulp.task('watch', function() {
  gulp.watch(paths.coffee, ['coffee']);
});

gulp.task('default', ['coffee', 'lint', 'watch']);
