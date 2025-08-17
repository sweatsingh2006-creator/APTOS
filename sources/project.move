module AlumniDAO::Mentoring {

    use aptos_framework::signer;

    /// Resource representing a Mentor Profile
    struct Mentor has store, key {
        name: vector<u8>,     // Mentor's name
        expertise: vector<u8> // Mentor's area of expertise
    }

    /// Function for an alumnus to register as a mentor
    public fun register_mentor(account: &signer, name: vector<u8>, expertise: vector<u8>) {
        let mentor = Mentor {
            name,
            expertise,
        };
        move_to(account, mentor);
    }

    /// Function for a student to request mentoring from a registered mentor
    public fun request_mentoring(student: &signer, mentor_addr: address): vector<u8> acquires Mentor {
        let mentor = borrow_global<Mentor>(mentor_addr);
        // Simply return mentor's expertise as "proof of match"
        mentor.expertise
    }
}
