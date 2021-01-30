import { DataAccessService } from './../../../services/data-access.service';
import { HttpEventType, HttpClient } from '@angular/common/http';
import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Globals } from '../../../globals';

@Component({
  selector: 'app-upload',
  templateUrl: './upload.component.html',
  styleUrls: ['./upload.component.sass']
})
export class UploadComponent implements OnInit {
  public progress: number = 0;
  public message: string = '';
  @Output() public onUploadFinished = new EventEmitter();

  constructor(private http: HttpClient) { }

  ngOnInit(): void {
  }

  public uploadFile = (files: any) => {
    if(files.length === 0){
      return;
    }

    let fileToUpload = <File>files[0];
    const formData = new FormData();
    formData.append('file', fileToUpload, fileToUpload.name);

    this.http.post(`${Globals.DATA_ACCESS_PREFIX}/activity/image`, formData, {reportProgress: true, observe: 'events'})
      .subscribe(event => {
        if (event.type === HttpEventType.UploadProgress)
        {
          if(event.total)
          {
            this.progress = Math.round(100 * event.loaded / event.total);
          }
          else{
            this.message = 'Uploading...';
          }
        }
        else if (event.type === HttpEventType.Response) {
          this.message = 'Upload success.';
          this.onUploadFinished.emit(event.body);
        }
      });
  }

}
