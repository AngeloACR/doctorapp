import { TestBed } from '@angular/core/testing';

import { TerminoscondicionesService } from './terminoscondiciones.service';

describe('TerminoscondicionesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TerminoscondicionesService = TestBed.get(TerminoscondicionesService);
    expect(service).toBeTruthy();
  });
});
