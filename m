Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886811;
	b=ynGQGhwxDCK5CLsGN/tt0ETfcpw4KH8OkepzAAaTxk9z047GB6yvu8vIStJ3pNETOpXs
	 AANgVmqou/WNj1WMJtsRLeDNvKd2JRsyfQ36sPBOMz0aGvTLeg4h/W7Kln9h+Fc88mtmI
	 IugT389P1eh7WyYhfzw2FJNwSHwP0BIpwqMe8UurSC0x/N0xwotjoxo+BRVJE3Zp6iWQ1
	 QJ+KKG39GFuZSUVOqxYJPmCyFWn+eI7T0QYlQpb8YWf/rScWaHlEYAc5BOV3Q/ej0LRbm
	 w0h0S282+y9DWp2HIPG4upspPdZEbHPdIva5VaB7TRAL0w4j4FatYCLLi/2MRiNn55w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886811;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sFyU/cN2Q5RenfrWgsXIweIzF4ZLorkSF1vWKpU3g/M=;
	b=41wOMjopyg79F4kTvJVIctCfT697L34Jdjw5lzwBFjbA372e0SUTjNWBHnbXR8qpioVy
	 LVjoENToWGQT63//ao+rPgbXG/FD3MDXq+7wNV1JfEsgDk6JkUBusX7uS8NNqA7M/yw+1
	 8qCsxZe53CPvMa/I8IkySqURQ07vVMLNNmpUxrWdxW6le1LZFvbczST4P1csxDNccAKux
	 GeQmCapIqVeqb4a/WCuP5J4RqSQVgXDFe4jQa89l7mHFf6aj3vTU5NKl5dWi+a40B32fD
	 2AP7J45jUlpQC4/BjQgGIYC37BwMHX9UpG86ZjwI2quxzQfF8u+hLGOf2tv5Y7ZKOBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsB3oZ1x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448D606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsB3oZ1x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886811;
	b=07fRCFjp+eLloJfhe9R+R+0zNIQdSVyLEYBxkQeUUkJSyRjFF/hZigMQwKSOijcm8k2E
	 vqQwdxKDxGZdobGP5WVH4Eut6wx7SXMc1t6ZGzYsIQI9/8u9o+ObWOVTyY2UDOFnw0P0L
	 yH2hzfNqjnWXLYRj2Qxqzh8Ho3FlhEJdKBG8D21eFUbzMlv0h+1J4cVh4fR4h7xJsIWOI
	 vYu0yj6wj+lH7aHLuPpnfLQY8SjXJuIGYTf7BoN//36D4Fr7mdxXStmG/DfAq7m9ecXfO
	 NBIkx4y7stibsUqq4puXQSCKZmej0hlbi5BVimPdVWbfou57Kn3f/nS5r+uJoIH3Hhg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886811;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sFyU/cN2Q5RenfrWgsXIweIzF4ZLorkSF1vWKpU3g/M=;
	b=tmQhi/9qi/qxX2GiL1LvbPuh2l12dcfaynwVBgDKjOsWEOH5XqMB/GDyS9G2nhx53hoc
	 GHLCt1dVoinhMIa/VuFUXKKqdVixw4ExigN6qeDp9EiERMwo2u7f4ZgHlXKKYtuCkST4i
	 ehM4FoVof4WJRe3Nk0F9ruf78qoiIfgDDMiJcKvJzWVQFXpg+qxgA2hdIJNvcZpWMgDpt
	 EmCAgxeRHmsedkGICeqlZGac36pTW14EX9CVVIdU2sV6QoKKEfcrNtLI037d/bBvBjNg6
	 7ItqSUc4ko2j8fyUgrDiC0G7D69NenP4kWiaXrj3qTiHoyTJtQQR6q1zJSTU7OHDRxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 735091F00925;
	Sat, 28 Nov 2026 17:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886811;
	bh=sFyU/cN2Q5RenfrWgsXIweIzF4ZLorkSF1vWKpU3g/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PsB3oZ1xocBqBcp4kJGX3HWrE2Awkg089gbbFwhDBqi8Fm2ItnaAeFwRhqoz4WOLx
	 8MfODABj4bL5CO+LB9VAnQqtgnr5EDSeyea2dkXRIwVOwDtY3+Pn7xcjO+qI7eLdA5
	 7juGF0pPaqllTlXk/dK85fqH3j2excZsvReH/DLFufu7rh2PPchNU3GlZZQBmMWRd+
	 2e0UNt/z0AbpfxCLabfynYZ4OjNdcMIa3MA6tR+YMhp4D5hEdemwVymUZqcwxBzMb2
	 t0a3rtuiVdJz2jzcx33j4Lp7gxEsygN9tge2/YyOum2c5WhOx7yUQvfB00jtmhzBGn
	 M7Mw4LeJ9h+4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D2FD94E17F;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:38 +0000
Subject: [PATCH v5 07/17] drm/panfrost: Give back the pages of a heap chunk
 that failed to map
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-panfrost-long-jobs-v5-7-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=3977;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Fy4hIaYtMsYqP1o6pifRn+AqW6XSoeC4gWPuvrzKAb8=;
 b=loIOe4wA2rCx3Au0YO+94bTTHx2K9Lcq4caAfzNf5NcU97h3M1/hCNHOBm90LwnkWt2D/AVUD
 morh3+vf7HFAYkBMRFdOI92ObE4mPdHS2vhFnCWEmocRXHDt9bvjsSs
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

If growing a heap BO by a 2 MB chunk fails after the chunk's folios
were read, they stay in bo->base.pages without an sg table. The next
fault in the chunk finds them owned and hits the drm_WARN_ON() that
commit b49c35ba0ce1 added.

On those error paths, put the folios read and clear their entries:
whole folios, as the fill loop wrote them, except those a neighbouring
chunk owns.

Tested with a test-only failure after the read: before, the next fault
WARNed for each of the 512 pages; after, none. Folios larger than a
chunk (16K/64K pages) are from reading the code.

Fixes: b49c35ba0ce1 ("drm/panfrost: Fix a page leak in panfrost_mmu_map_fault_addr() when THP is on")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: test result added; no code change.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e59a16b68..9edf66f6e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -592,6 +592,27 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 
 #define NUM_FAULT_PAGES (SZ_2M / PAGE_SIZE)
 
+/* [start, end) is whole folios: it can reach past the 2 MB chunk. */
+static void panfrost_heap_put_pages(struct page **pages, pgoff_t start,
+				    pgoff_t end)
+{
+	while (start < end) {
+		struct folio *folio;
+
+		if (!pages[start]) {
+			start++;
+			continue;
+		}
+
+		folio = page_folio(pages[start]);
+		do {
+			pages[start++] = NULL;
+		} while (start < end && pages[start] &&
+			 page_folio(pages[start]) == folio);
+		folio_put(folio);
+	}
+}
+
 static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 				       u64 addr)
 {
@@ -600,7 +621,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
 	struct drm_gem_object *obj;
-	pgoff_t page_offset, nr_pages;
+	pgoff_t page_offset, nr_pages, got_start, got_end;
 	struct sg_table *sgt;
 	struct page **pages;
 
@@ -659,17 +680,22 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	mapping = bo->base.base.filp->f_mapping;
 	mapping_set_unevictable(mapping);
 
+	got_start = page_offset;
+	got_end = page_offset;
+
 	for (pgoff_t pg = page_offset; pg < page_offset + NUM_FAULT_PAGES;) {
 		bool already_owned = false;
 		struct folio *folio;
+		pgoff_t first;
 
 		folio = shmem_read_folio(mapping, pg);
 		if (IS_ERR(folio)) {
 			ret = PTR_ERR(folio);
-			goto err_unlock;
+			goto err_put_chunk;
 		}
 
 		pg &= ~(folio_nr_pages(folio) - 1);
+		first = pg;
 		for (u32 i = 0; i < folio_nr_pages(folio) && pg < nr_pages; i++) {
 			if (pages[pg])
 				already_owned = true;
@@ -681,14 +707,18 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		 * there's no valid reason for a folio range to be partially
 		 * populated.
 		 */
-		if (drm_WARN_ON(&pfdev->base, already_owned))
+		if (drm_WARN_ON(&pfdev->base, already_owned)) {
 			folio_put(folio);
+		} else {
+			got_start = min(got_start, first);
+			got_end = max(got_end, pg);
+		}
 	}
 
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
 					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
 	if (ret)
-		goto err_unlock;
+		goto err_put_chunk;
 
 	ret = dma_map_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
@@ -715,6 +745,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	dma_unmap_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);
 err_map:
 	sg_free_table(sgt);
+err_put_chunk:
+	panfrost_heap_put_pages(pages, got_start, got_end);
 err_unlock:
 	dma_resv_unlock(obj->resv);
 err_bo:

-- 
2.55.0


