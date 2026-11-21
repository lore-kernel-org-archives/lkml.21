Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795252728;
	b=aPqkx4OhZjdNEA4HG/c4l1xiDfWRzGEnTObcTJPpxIifzNWosqbk0JE8yZ77ivrB6poS
	 Zk4+lQJjEh5gkqqWT1XnKH93cW+E3kyLu6mlaxkd2mOZDAGID0CIilJY3r9Clxdps0+Y0
	 5fe1+ySNfTqn7NMTcNsIMw3Gwyo08c0OqnLUDlWDSptt+/dCsRU7AFxa/0yPJdFXPgzbi
	 Ol7s61xxtknL88h77sIBs0eGet1Y+vqYjeIo/LyJDtKQFSOzxKABciS98h2ZiR68f0Hoi
	 CdVZsuOm4WxS5o8FaXfkrfl92EVDqde4lpyPjFboAD/jbkR8cnB5EIJg/usmV4W0q3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795252728;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Io3nZZR4Fo6Fo0A3fBUMWR8FWffzBMe6HwDSSqr5Wqg=;
	b=DM1rH+HQ6T0LlTM6h0DkXGkvfarZ7LEdCoEHPwLKt/GXTBhhGz1wLTljFW2D6hEqdij8
	 XtYL7RXlgdcsX9ZSXV9/X86enZt2tB78UMOT0ioZI/T6re/w6spgHr6Nt5XpMTLgOasJ9
	 w6yOnDmUOCDTqY813H83rK2Xhean/mP+Rqgo6TvsdBUx4+42Q1USUwb0nonOrVxSkRG30
	 yl27upYOuQbO7HYvY+13EJv7T9LHiQPBhiACLHITJG/A/wI7R6AQMKACnFR4j9dKWnaJL
	 HZ5WoJLngMTbMt/1liOG4unyG3Y5iXMBd1syd97ngeM/xYnKCXwh7iNh5axhTEPe/zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aK9k4WMA;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E92606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33E92606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aK9k4WMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795252728; x=1826788728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=47CbEugCOkJMog57P3DdjF+OExylaCYntrmSkY4FJf0=;
  b=aK9k4WMAVB4QMs9v6JXO/0bMYC45nnM+/vzdSm/+o4sGThpvd9QvDkZf
   w4g0A2l3w9NNkre460Pyo3SVc/qXIku3lnJFCcC3wBi5aZfl0SLMPuEQz
   K+WCZY+c2QocHOawtMEhsVBAZokxwl1bh1rsIFKMzOJPqlayuvMSwIoRy
   ht/xETvErQqNWlQPJnShYrKqkTor1OZBYpeS3p4dzyRNKiPNs8EDw9UNK
   rtYNDFBJgfRikAWWUQ/tsppLe3QmqwZQj3uEpAizBSSMA5fftE0i5yqz0
   IvYQ4L1IbgHqY7axqyCgeV7NHK8iyFBrH9e6RSm/rwh6qsuAxw8gSlPj3
   Q==;
X-CSE-ConnectionGUID: M6lW7KG3SCS8f+TupEgFaQ==
X-CSE-MsgGUID: RTnUgQixQlmjfHFSp19c+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4040161"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4040161"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 01:18:47 -0800
X-CSE-ConnectionGUID: ouH4SdJXQoKblpB6P+umJw==
X-CSE-MsgGUID: duZ8/5SUQyeDqQSHDtdGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="11462979"
Received: from cyp05.fm.intel.com ([10.36.55.41])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2026 01:18:47 -0800
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
Subject: [PATCH] drm/ttm: Don't warn on oversized page directory allocations
Date: Sat, 21 Nov 2026 01:18:13 -0800
Message-ID: <20261121091815.1436090-2-shuicheng.lin@intel.com>
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

Fixes: 7661809d493b ("mm: don't allow oversized kvmalloc() calls")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index b645a1818184..5dc9d3795b04 100644
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
 

base-commit: 61df0d1929e7e99d38404a1be02c461a8f6a3f5a
-- 
2.43.0

