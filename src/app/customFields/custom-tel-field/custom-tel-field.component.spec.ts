import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CustomTelFieldComponent } from './custom-tel-field.component';

describe('CustomTelFieldComponent', () => {
  let component: CustomTelFieldComponent;
  let fixture: ComponentFixture<CustomTelFieldComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CustomTelFieldComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CustomTelFieldComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
