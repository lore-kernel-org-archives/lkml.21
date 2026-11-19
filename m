Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108042;
	b=gMDvAudID8uuuWBs59f5u/VWXcFPuv3TQV8oMDrPiXuiyDMcx6TPUkjX3w5aKy2HwGfQ
	 6st1Sg5eUH2r6THzaPFvVF1DaDvo4e0Jj0xwCNUcaAqEVcmU8xB+q33JsoABncvW8u2qr
	 RFTGwHZR6no7Qt5Y6LFIeyniAJ9+HOQxEMRLrnYvgzW7hcfqpgTFd/2dEt6Cvwg3Djxyf
	 iuA8otkuW3ka+DBqNMRHGJLOAy0pKyls5FwatPcEOiX1popAgVunR3ZoNZ5WJy0TbXfmi
	 55lGlSDvIUeYFxuhQvTnjst5VrbIeWImZBNyz5PDtJfYO0gms5gkRMC5MIPiz343Yww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
	b=lsbgpM5duzXecZfiGyNjlPjLXi0MczZxjNun0wvZE1Jkjugz3hzqLRTJeSUBQuj4U6ZM
	 njgBsG+c4S/+B93Xqa1mswzUuanokBNvc2lhft6VfuyxulhAKrLeL7d8qTYSRyA25qmpB
	 4J6AZ3l5GfvsTYeOCZBOU67o0uSl5y4Hzg+X8w6lxYNaBfnX/bSp55BohwRuEdeE4R7jz
	 MSlgtowN3NxQXnrLefSkxQ7uR3pjCxy6EZGbTPQF+HeHAOI3T2Nt1IqyGdZJ32fFWJKfT
	 bicp3z4MAoFj95kU6ujpVqUdKwLDq2D5Zz3dDjMvtYWmM4cxz9BpQxEkrtONYUQeKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPvcSqfI;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802FA60A261E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 802FA60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPvcSqfI
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3040014eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108041; x=1795712841; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
        b=SPvcSqfIVKIS1JrxtJgDiaTHwPuWyHv6y5FbHCPSqKJ/VnNPpIM1yBznp01/9ulTYK
         lf1EJbBJYU/K0MzpjO9Rc6Ia2Hj9q1BtMllyVNu9WSly0UnQTLAeNT0Lxth1TvSy2sLm
         +oD14SFbuLbZyo12E1fPcyQEP5HukQvv+vFBUskIm62jJfvOF5GQz72XaCJQbOUZ5sMg
         1W+P5J1rp12opKvo2TjPNzHidXrpRCrOXv557HdZWcQmnVWiXvHNe3vKcheHAnTgox4A
         mQaPPmT0w43yNflrZkqI6vKbXKhws5ZsyYMZzvcoiedcpwD03K+vtujwwrPbwNezNYel
         oS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108041; x=1795712841;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UznqD1ivej2QYO7rN4puPEMrUhaWQ4TH3qb1l1RtxYo=;
        b=o1OiJtyVACsIJcemTtRvADCKNvn0TLbAcM/BltOBkUw4WMov7sn96VTFsX08RWGKCi
         rNwdjoaPPK9RWKOA+APCj0G6Wgfm8xV83bMaypedw9OJ/oyAqTygb5RKGt+nJ2/8QvZ3
         8kdo7q0+6YAg/wyXIW4O2f9GSzTZ34qV5Z93BNlMy6JwnHy81/xeKU93iSiNA3aqK+M5
         aDOiNiLSwO4tn1CbSLMvs8AZlVyobtecz0Ml8CQMM5CsmVTEBfrNRPlg+fgGmU/CtWnw
         CZ4Wd+mP0MXnwqZSYHZTmrn4S7KHnbK2kcVRX+SZQf8kQ398ZY4vgaKsWKWAB5Ru9YNS
         hqDw==
X-Forwarded-Encrypted: i=1; AL+hErE4F+ojfulEc3KUb+79Hwh8trpx6WtUKlLC/nvaOAcls/D6UUzJN7M1qJLITM6dJGztGPwelBUemaHxAQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q4CXRO1p0KR8tCrj6uo2vxPkD9NEdoZ8V92cDU4Br/2n327zT
	AAnYmEDAGGYwWgkVjkDtz28+PIaRyrK/mRVXAvV+M/OGS/8uncTpMXO+AytslAu43XRuk/irFyh
	XyY8pCVM8tw==
X-Received: from dyaw1-n1.prod.google.com ([2002:a05:693c:4141:10b0:37a:8a0f:3aba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc05:b0:381:6ecf:5389
 with SMTP id 5a478bee46e88-38281cf6a20mr8681249eec.41.1795108040312; Thu, 19
 Nov 2026 09:07:20 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:16 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170716.1523667-1-irogers@google.com>
Subject: [PATCH] drm/xe/svm: Initialize xpagemap to NULL in xe_svm_get_pagemaps()
From: Ian Rogers <irogers@google.com>
To: Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On integrated Intel Xe GPUs (!IS_DGFX), xe->info.mem_region_mask has no
per-tile VRAM bits set, so every iteration of for_each_tile() in
xe_svm_get_pagemaps() hits 'continue' without assigning 'xpagemap'. The
post-loop IS_ERR(xpagemap) check then evaluates an uninitialized stack
pointer on every fault/SVM VM creation.

Initialize 'xpagemap' to NULL so IS_ERR(xpagemap) evaluates false when no
VRAM regions exist.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on Intel Xe hardware.

Fixes: 8a52f4d9b1ef ("drm/xe: Use the drm_pagemap cache and shrinker")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index bc6902b5bf57..22cc7ed19d8a 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -2055,7 +2055,7 @@ xe_pagemap_find_or_create(struct xe_device *xe, struct drm_pagemap_cache *cache,
 static int xe_svm_get_pagemaps(struct xe_vm *vm)
 {
 	struct xe_device *xe = vm->xe;
-	struct xe_pagemap *xpagemap;
+	struct xe_pagemap *xpagemap = NULL;
 	struct xe_tile *tile;
 	int id;
 
-- 
2.56.1.708.g77570a6a1d-goog

