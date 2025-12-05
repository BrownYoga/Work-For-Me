import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';

interface WorkerProfile {
  name: string;
  email: string;
  skills: string[];
  geoRadiusKm: number;
}

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  readonly title = 'Work For Me';
  readonly http = inject(HttpClient);
  readonly workers = signal<WorkerProfile[]>([
    { name: 'Lesedi Dlamini', email: 'lesedi@example.com', skills: ['tiling', 'painting'], geoRadiusKm: 20 },
    { name: 'Lungi Maseko', email: 'lungi@example.com', skills: ['plumbing'], geoRadiusKm: 15 }
  ]);

  // Placeholder to show future REST integration
  refreshFromApi() {
    this.http
      .get<WorkerProfile[]>('/api/workers')
      .subscribe({
        next: (list) => this.workers.set(list),
        error: () => console.warn('API not wired yet - using sample data')
      });
  }
}
