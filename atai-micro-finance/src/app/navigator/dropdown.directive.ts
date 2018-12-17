import { Directive, HostListener, HostBinding } from "@angular/core";
import { visitAll } from "@angular/compiler/src/render3/r3_ast";

@Directive({
    selector: '[appDropdown]'
})
export class DropdownDirective {
    @HostBinding('class.hide') visible = false;
    @HostListener('click')  dropdownToggle(){
        this.visible = !this.visible;
    }
}