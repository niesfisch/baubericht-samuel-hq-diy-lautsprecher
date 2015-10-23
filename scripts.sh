# convert files to thumbs
for file in `find . -name "*.jpg"`; do echo $file; name="`basename $file .jpg`_thumb.jpg"; dirname="`dirname $file`"; newname="$dirname/$name"; cnewname=`echo $newname | perl -pe 's/\.\///'`; sips -Z 150 $file --out $cnewname; done

# create links
for thumb in `find . -name "*_thumb.jpg"`; do thumbnail="images/`echo $thumb |  perl -pe 's/\.\///'`"; dir=`dirname $thumbnail`; setname=`echo $dir | perl -pe 's/images\///'`; big="`echo $thumbnail|perl -pe 's/_thumb//'| perl -pe 's/\.\///'`"; echo "<a href=\"$big\" data-lightbox=\"$setname\" data-title=\"rechts klicken, um weiter zu blättern\"><img src=\"$thumbnail\" alt=\"$setname\"/></a>"; done