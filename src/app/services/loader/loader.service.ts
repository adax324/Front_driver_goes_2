import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class LoaderService {

  constructor() { }
    loadCSS(url:string) {
    // Create link
    let link = document.createElement('link');
    link.href = url;
    link.rel = 'stylesheet';
    link.type = 'text/css';
    
    let head = document.getElementsByTagName('head')[0];
    let links = head.getElementsByTagName('link');
    let style = head.getElementsByTagName('style')[0];
    
    // Check if the same style sheet has been loaded already.
    let isLoaded = false;  
    for (var i = 0; i < links.length; i++) {
      var node = links[i];
      if (node.href.indexOf(link.href) > -1) {
        isLoaded = true;
      }
    }
    if (isLoaded) return;
    head.insertBefore(link, style);
  }
  loadScript(url: string) {
    const body = <HTMLDivElement> document.body;
    const script = document.createElement('script');
    script.innerHTML = '';
    script.src = url;
    script.async = false;
    script.defer = true;
    body.appendChild(script);
  }
  loadDTJsAndCss():void{
        // DataTables CSS
        this.loadCSS('../assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css');
        this.loadCSS('../assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css');
        this.loadCSS('../assets/plugins/datatables-buttons/css/buttons.bootstrap4.min.css');
        //DataTables JS
        this.loadScript('../assets/plugins/datatables/jquery.dataTables.min.js');
        this.loadScript('../assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js');
        this.loadScript('../assets/plugins/datatables-responsive/js/dataTables.responsive.min.js');
        this.loadScript('../assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js');
        this.loadScript('../assets/plugins/datatables-buttons/js/dataTables.buttons.min.js');
        this.loadScript('../assets/plugins/datatables-buttons/js/buttons.bootstrap4.min.js');
        this.loadScript('../assets/plugins/jszip/jszip.min.js');
        this.loadScript('../assets/plugins/pdfmake/pdfmake.min.js');
        this.loadScript('../assets/plugins/pdfmake/vfs_fonts.js');
        this.loadScript('../assets/plugins/datatables-buttons/js/buttons.html5.min.js');
        this.loadScript('../assets/plugins/datatables-buttons/js/buttons.print.min.js');
        this.loadScript('../assets/plugins/datatables-buttons/js/buttons.colVis.min.js');
  }
  
}
