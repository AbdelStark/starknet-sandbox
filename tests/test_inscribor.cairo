use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait};

use sandbox::inscriptions::inscribor::{IInscriborDispatcher, IInscriborDispatcherTrait};

fn test_inscribe() {
    let inscribor = deploy_contract('Inscribor');
    let user_data = array![
        195080802730755079337567143392786321948899998649715002517760167916426518884,
        863640006348999817137024283375775751997356790556214532146621540142424692
    ];
    inscribor.inscribe(user_data);
}

fn deploy_contract(name: felt252) -> IInscriborDispatcher {
    let contract = declare(name);
    let contract_address = contract.deploy(@ArrayTrait::new()).unwrap();
    IInscriborDispatcher { contract_address }
}
