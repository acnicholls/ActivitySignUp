import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ActivityListComponent } from './pages/activity-list/activity-list.component';
import { ActivityComponent } from './pages/activity/activity.component';
import { NewActivityComponent } from './pages/activity/new/new.component';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { Router } from '@angular/router';
import { 
  NbThemeModule, 
  NbLayoutModule, 
  NbCardModule,
  NbListModule,
  NbInputModule,
  NbButtonModule,
  NbIconModule,
  NbActionsModule,
 } from '@nebular/theme';
import { UploadComponent } from './pages/activity/new/upload.component';
import { InfoComponent } from './pages/activity/info/info.component';

@NgModule({ declarations: [
        AppComponent,
        ActivityListComponent,
        ActivityComponent,
        NewActivityComponent,
        UploadComponent,
        InfoComponent
    ],
    bootstrap: [AppComponent], imports: [BrowserModule,
        AppRoutingModule,
        FormsModule,
        ReactiveFormsModule,
        NbThemeModule.forRoot({ name: 'dark' }),
        NbLayoutModule,
        NbCardModule,
        NbListModule,
        NbInputModule,
        NbButtonModule,
        NbIconModule,
        NbActionsModule,
        NbEvaIconsModule], providers: [provideHttpClient(withInterceptorsFromDi())] })
export class AppModule {
  // for diagnostic purposes
  constructor(router: Router) {
    const replacer = (key: any, value: any) => (typeof value === 'function') ? value.name : value;

    console.log('Routes: ', JSON.stringify(router.config, replacer, 2));
  }
 }
