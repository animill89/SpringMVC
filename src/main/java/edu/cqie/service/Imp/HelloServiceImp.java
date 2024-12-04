package edu.cqie.service.Imp;

import edu.cqie.entity.Hello;
import edu.cqie.service.HelloService;
import org.springframework.stereotype.Service;

@Service
public class HelloServiceImp implements HelloService {
    @Override
    public Hello getByID(Integer id) {
        return null;
    }
}
