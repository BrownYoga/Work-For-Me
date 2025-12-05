import { Component, inject, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpClient } from '@angular/common/http';

interface WorkerProfile {
  name: string;
  email: string;
  skills: string[];
  geoRadiusKm: number;
}

interface QuickFilter {
  title: string;
  description: string;
  skills: string[];
}

interface ProcessStep {
  title: string;
  detail: string;
}

interface HighlightStat {
  label: string;
  value: string;
  helper: string;
}

interface Testimonial {
  quote: string;
  name: string;
  role: string;
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

  readonly highlights: HighlightStat[] = [
    { label: 'Verified workers', value: '2,340+', helper: 'Across 6 provinces and 31 towns' },
    { label: 'Average response', value: '22 mins', helper: 'From posting to first reply' },
    { label: 'Bookings completed', value: '14,800', helper: 'Rated 4.8/5 by clients' }
  ];

  readonly quickFilters: QuickFilter[] = [
    {
      title: 'Emergency fixes',
      description: 'Rapid call-outs for plumbing, electrical and urgent repairs.',
      skills: ['plumbing', 'electrical', 'security']
    },
    {
      title: 'Home upgrades',
      description: 'Renovations, painting, tiling and landscaping to refresh your space.',
      skills: ['tiling', 'painting', 'garden']
    },
    {
      title: 'Business jobs',
      description: 'Office fit-outs, signage, and recurring maintenance teams.',
      skills: ['carpentry', 'installation', 'maintenance']
    }
  ];

  readonly process: ProcessStep[] = [
    {
      title: 'Tell us what you need',
      detail: 'Share the skills, timing and travel distance. We match you with nearby workers instantly.'
    },
    {
      title: 'Compare and chat',
      detail: 'Browse profiles, check ratings and message workers directly without leaving the page.'
    },
    {
      title: 'Confirm and relax',
      detail: 'Lock in the booking, track progress, and pay once you are happy with the work.'
    }
  ];

  readonly testimonial: Testimonial = {
    quote: 'The quick filters helped me find a reliable plumber in minutes. The response time blew me away!',
    name: 'Naledi K.',
    role: 'Small business owner, Cape Town'
  };

  readonly workers = signal<WorkerProfile[]>([
    { name: 'Lesedi Dlamini', email: 'lesedi@example.com', skills: ['tiling', 'painting'], geoRadiusKm: 20 },
    { name: 'Lungi Maseko', email: 'lungi@example.com', skills: ['plumbing'], geoRadiusKm: 15 },
    { name: 'Thabo Ngwenya', email: 'thabo@example.com', skills: ['electrical', 'security'], geoRadiusKm: 25 }
  ]);

  refreshFromApi() {
    this.http
      .get<WorkerProfile[]>('/api/workers')
      .subscribe({
        next: (list) => this.workers.set(list),
        error: () => console.warn('API not wired yet - using sample data')
      });
  }
}
