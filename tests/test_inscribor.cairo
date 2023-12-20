use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait};

use sandbox::inscriptions::inscribor::{IInscriborDispatcher, IInscriborDispatcherTrait};

fn test_inscribe() {
    let inscribor = deploy_contract('Inscribor');
    inscribor.inscribe();
}

fn deploy_contract(name: felt252) -> IInscriborDispatcher {
    let contract = declare(name);
    let contract_address = contract.deploy(@ArrayTrait::new()).unwrap();
    IInscriborDispatcher { contract_address }
}
