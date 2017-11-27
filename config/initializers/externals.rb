Kms::ExternalsRegistry.register(:galleries) {|_,_| Kms::Gallery::Gallery.order("created_at desc").to_drop }
