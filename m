Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795274863;
	b=Rg7FUipuj3pfSPPAPlKMHvFiRghrZ/wYmXgF3aY7bVi0Pi9YZvo4mhEwjSUPydV7wVFg
	 zoeg5hIzJdFA+6RHDofWJs/ZISeRqGTfBIsxCCZ91Q6RRtheh0rCb5chpgsfFG2gRlQfj
	 NDP86g65RoDThGViPQw9fCh4FCoqv/VdJJtwMcYERlGu97P2HqyaF9Fbc8qEXxyC9w9If
	 1asczYwqjDE/iuBaMgm0qm/sgNBI4Ldndalx17L1o3G+jggvNnkVjkRtbl8+q2hVtmnlD
	 RXYnKv849m0XmghR531wkf8V0u0Y6Y2MSFEqMzcehQ3SIWZ2SOAntde9GKM5KOVZqXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795274863;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status;
	bh=PZUjOuXotXUqzcn6MrbfswQYgqQ1n7UHIABMVzOfr54=;
	b=O83zxK+IX2uS6GpnAjZrxPQgC3RKkMvT/XJuPMLhOp8bCh8nL0lyVc4F/E5EG+BYhNSs
	 SVaMYknq9rFz/3dJSP3pOUuG207GT2V5n/lfNTTNxbtYkrNNZL9IoXQVVxgJiB9GZQ3bc
	 YdIjIe7d4+aqj8DNwhErtXUmNOKRSoEqIbva9+K+OJITL9kecJPofsJ24AG3GkI/GYh4i
	 OKEoMaQujQy2V+jiMqAfvA6AZ2EyFfzdeDJg5KUuc+hKGikQ+lPfd2qDlPIcWw5rFvFJR
	 WDlYg0MMuRAcP8N0uNyvC234y+Y5DsKth064fX6F5obAq3g7TB/urXFk2RntyblW+Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=whut.edu.cn;
	spf=pass smtp.mailfrom=whut.edu.cn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6640606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 15:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6640606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from Mogu.localdomain (unknown [202.197.100.81])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5583120b3;
	Sat, 21 Nov 2026 23:27:31 +0800 (GMT+08:00)
From: Haoming Gao <Naixumogu@whut.edu.cn>
To: boris.brezillon@collabora.com
Cc: adrian.larumbe@collabora.com,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix overflow in fdinfo engine time conversion
Date: Sat, 21 Nov 2026 23:27:28 +0800
Message-ID: <20261121152728.210765-1-Naixumogu@whut.edu.cn>
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
X-HM-Tid: 0aa1feb845b703a1kunm82fa9b59271cb4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0NIVhhJTBgYQkxNQkIfGlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJS0lVSkJMVUpLS1VDSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+

The timestamp counter accumulates GPU ticks per DRM client. Multiplying
that counter by NSEC_PER_SEC in u64 can overflow before the division by
the timer frequency, even when the result in nanoseconds fits in u64.

On an RK3588 with a 24 MHz timer, drm-engine-panthor dropped from
768569012750 ns to 422647638 ns between two reads of the same client's
fdinfo. The GPU cycle counter continued to advance.

Use mul_u64_u64_div_u64_roundup() to preserve the full product and keep
the existing rounding. The helper was checked against a 128-bit
reference on the board, including at the first wrap boundary.

Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")
Signed-off-by: Haoming Gao <Naixumogu@whut.edu.cn>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index dc8d0191aef4..39b827a9b9cc 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -8,6 +8,7 @@
 #endif
 
 #include <linux/list.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/pagemap.h>
@@ -1708,8 +1709,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
 	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP) {
 #ifdef CONFIG_ARM_ARCH_TIMER
 		drm_printf(p, "drm-engine-panthor:\t%llu ns\n",
-			   DIV_ROUND_UP_ULL((pfile->stats.time * NSEC_PER_SEC),
-					    arch_timer_get_cntfrq()));
+			   mul_u64_u64_div_u64_roundup(pfile->stats.time, NSEC_PER_SEC,
+						       arch_timer_get_cntfrq()));
 #endif
 	}
 	if (ptdev->profile_mask & PANTHOR_DEVICE_PROFILING_CYCLES)

base-commit: 878c885830ef004a32e8974c4d1ae14e2ea30c5a
-- 
2.43.0

