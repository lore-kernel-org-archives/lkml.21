Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255057;
	b=eqOC3qBEz/7M+sBpp/YL8Kde03KI+BSovY1NCriXf5TEe/R317ss3A6T+AHj2bMkFY4n
	 jlvtLQidjqQVRflJx0d5GUhprWrZewape/WHglnx69aFIsowvImEyvHDdsMdbb6DSEFqf
	 LwUx0VWoh+8EogR5/00E6SnwYWaBvY3/kS8/mcF2PohMq3v61nUmVzYD11xYV1hqRA6E2
	 7NLFz3ZuRC+VKQQZa+65jCIi6RkXjQVU7e34XMBwsqGYWA6PVHlIhkrWzWEQ/R3tyOono
	 XskpkOIVWY2SEHSLulQBRaMqJlRQU+JvaYeoGDn0D0ghG0J2fzkhfC3Kn3aciaUu0wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255057;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9PZNpVKWewioOCpjPSVeU87MzEHGiYh/jP3AeuO1EhA=;
	b=IobO1Kgkl/A+4V/ydBpgzz+ew0uB2sIM+M7aUziRG5jhJjARQXTD929O7CDkpVOOiSv1
	 c+iAty80fALdGBXdH8f1IhYz7rc7reNY9fqlXeAFnfxV7+QrGvtYe38T9pR4an3o41OJk
	 h2kM2HqfieK0m4vGab2EUnRp+kQxwp0zdSlvWFr0mJTYmSafXMPpZl8uUiuCciSH880JC
	 exD9HBKcaKSnlXyflW6Lp3Tx5crZDH48GUfYtU9XuFYcHAz8/syidJmpojt/PPxJBvGoc
	 7dkVEo8GjgF6NU68zER1FlmLcKHMyKLMagdvh2Z8OFmE45PZYAowPOcx8J+3HBFR4SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="a4LTnl/U";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA316606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA316606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4LTnl/U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795255056; x=1826791056;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G4pbtfdvN+5JkvK3sNDxdWk/EAzihJACbs62h1aSgbA=;
  b=a4LTnl/UWGGwi5lWKiIhfW9QjRWDvZqJbcvNPb9Ktfy9pmdI3ZcxozJy
   tchqYYfjG6Tjb4QwqvjpXGtmCB52M5QzZR6TOfnoCMCTexFpJNt0dwSuX
   MxIRNK6uqUziCOAw+qFKthkzrE3liZqIj1L4lvwit+p5O6NwcgtEV9TWP
   897Ns4fgt1vgHbHdEY3MprqTJZDruSp1hXiyrfJ7nzHecRBGJqJuI741M
   3joZd+yUkdjAGkaNiEpQAplaifhpKOE4WNmXM/B+LA/lOkJHmwLrMTOGU
   Bf/xNAT4EHpt7RrN6q8lYcLrPizDvbK14dQAbl8gEABhB5poo8t0iAVS1
   g==;
X-CSE-ConnectionGUID: SI2fR1y6RGedrwWog8qjRQ==
X-CSE-MsgGUID: X57MW+5JR0qRNofSSUj55Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4115709"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4115709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 01:57:35 -0800
X-CSE-ConnectionGUID: GgZI4avdQPi6+m4nF9qBRA==
X-CSE-MsgGUID: 6Y0OD3+hSo2jPOwZCXgq+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10970011"
Received: from cyp05.fm.intel.com ([10.36.55.41])
  by fmviesa005.fm.intel.com with ESMTP; 21 Nov 2026 01:57:34 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
	intel-xe@lists.freedesktop.org,
	Natalie Vock <nat@pixelcluster.dev>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ttm: Don't warn on oversized page directory allocations
Date: Sat, 21 Nov 2026 01:57:00 -0800
Message-ID: <20261121095703.1571697-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The page directory size in ttm_tt_alloc_page_directory() and
ttm_dma_tt_alloc_page_directory() comes from the user-supplied BO size.
kvmalloc() warns on requests above INT_MAX unless __GFP_NOWARN is set,
so userspace can trigger a WARN (or a panic with panic_on_warn) by
creating a huge BO, e.g. a 1 TiB sysmem BO on xe with DEFER_BACKING:

  WARNING: mm/slub.c:7144 at __kvmalloc_node_noprof+0x665/0x810
  Call Trace:
   ttm_tt_init+0x1e0/0x2b0
   xe_ttm_tt_create+0x2cf/0x4b0 [xe]
   ttm_tt_create+0x17c/0x310
   ...
   xe_gem_create_ioctl+0x70f/0x12b0 [xe]

The failure is already handled and the ioctl returns -ENOMEM, so pass
__GFP_NOWARN to both allocations.

v2 (Sashiko):
  - Also pass __GFP_NOWARN in ttm_sg_tt_alloc_page_directory(), whose
    size comes from an imported dma-buf

Fixes: 7661809d493b ("mm: don't allow oversized kvmalloc() calls")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index b645a1818184..7d6c9247507b 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -117,7 +117,8 @@ EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_create);
  */
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->pages = kvcalloc(ttm->num_pages, sizeof(void*), GFP_KERNEL);
+	ttm->pages = kvcalloc(ttm->num_pages, sizeof(void *),
+			      GFP_KERNEL | __GFP_NOWARN);
 	if (!ttm->pages)
 		return -ENOMEM;
 
@@ -127,7 +128,8 @@ static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
 	ttm->pages = kvcalloc(ttm->num_pages, sizeof(*ttm->pages) +
-			      sizeof(*ttm->dma_address), GFP_KERNEL);
+			      sizeof(*ttm->dma_address),
+			      GFP_KERNEL | __GFP_NOWARN);
 	if (!ttm->pages)
 		return -ENOMEM;
 
@@ -137,7 +139,8 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
 
 static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->dma_address = kvzalloc_objs(*ttm->dma_address, ttm->num_pages);
+	ttm->dma_address = kvzalloc_objs(*ttm->dma_address, ttm->num_pages,
+					 GFP_KERNEL | __GFP_NOWARN);
 	if (!ttm->dma_address)
 		return -ENOMEM;
 

base-commit: 61df0d1929e7e99d38404a1be02c461a8f6a3f5a
-- 
2.43.0

