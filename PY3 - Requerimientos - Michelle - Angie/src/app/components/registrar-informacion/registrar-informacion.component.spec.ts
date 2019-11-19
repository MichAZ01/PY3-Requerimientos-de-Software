import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrarInformacionComponent } from './registrar-informacion.component';

describe('RegistrarInformacionComponent', () => {
  let component: RegistrarInformacionComponent;
  let fixture: ComponentFixture<RegistrarInformacionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistrarInformacionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistrarInformacionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
