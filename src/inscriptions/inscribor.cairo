#[starknet::interface]
trait IInscribor<TContractState> {
    fn inscribe(ref self: TContractState);
}

#[starknet::contract]
mod Inscribor {
    #[storage]
    struct Storage {}

    #[external(v0)]
    impl InscriborImpl of super::IInscribor<ContractState> {
        fn inscribe(ref self: ContractState) {}
    }
}
