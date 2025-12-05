import { test, expect } from '@playwright/test';

test.describe('Worker onboarding landing', () => {
  test('shows sample worker cards', async ({ page }) => {
    await page.goto('/');
    await expect(page.getByRole('heading', { level: 1, name: 'Work For Me' })).toBeVisible();
    await expect(page.getByText('Available workers')).toBeVisible();
  });
});
