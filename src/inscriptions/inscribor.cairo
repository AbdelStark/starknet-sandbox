#[starknet::interface]
trait IInscribor<TContractState> {
    fn inscribe(ref self: TContractState, user_data: Array<felt252>);
}

#[starknet::contract]
mod Inscribor {
    use core::starknet::event::EventEmitter;
    #[storage]
    struct Storage {}

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        Inscribed: Inscribed,
    }

    #[derive(Drop, starknet::Event)]
    struct Inscribed {
        user_data: Array<felt252>,
    }

    #[external(v0)]
    impl InscriborImpl of super::IInscribor<ContractState> {
        fn inscribe(ref self: ContractState, user_data: Array<felt252>) {
            self.emit(Inscribed { user_data });
        }
    }
}
