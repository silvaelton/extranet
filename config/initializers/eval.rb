String.class_eval { include Support::StringUtility }
Integer.class_eval { include Support::IntegerUtility }
TrueClass.class_eval { include Support::BooleanUtility }
NilClass.class_eval { include Support::NilUtility}
Date.class_eval { include Support::DateUtility }