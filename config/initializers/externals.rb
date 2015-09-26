Kms::ExternalsRegistry.register(:galleries) {|_,_| Gallery.order("created_at desc").to_drop }
