Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108036;
	b=Q9IlZ5RnuGT3Y6QRcA/2YHDCp4sNdJ1FG72QQnLKwb+iguc1G1p+ukgV1RIrSw48kFW+
	 ihLzBtFTRNWLZtbDoFfPwnNAezX6XdkLajrsnb8B2yaZqq1kYyKzUFr8OQ9xAoIyDj/hd
	 X8OQthekOB5ck+iL4bLrCT956Yz5xQ41PbQlVBr3QIkWCVyoL4NgpVWlnJcOL7Xsx06Ai
	 YMGjRostbcgplwNate2mQe/J8q3ldFMepLaFWU8SD4dmpwCr8sDXoYVT0xuIGHSyVVir6
	 uaoZpXvUPSK4495pXSvavX0mknOvTG9irxMK32Sy2d/aeFO0ayjigOKvbyLmLZpRH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
	b=GpnGQ63EUJKDjZuhXynBRV9f2wYtqVdbJekzP8HDd9IRYGiFmecgzZJEckMxgpMtPzCe
	 5dcB4f5wRDRN+ODYHV7HsdyxBpiTJ3KccBclXTFSLvdbDTO55PKWJLplreIE1wa8sGFpM
	 35q2tXKoDSbVtpqcX2Zr4h9ANC6RiRQnOapzFKpGstTJ9wE6iE/RCYYrY2JYiT4sjIS0f
	 B5G6IZErvXtYKHu0M4udRpNDLDdVYoSXkryDi7jw1q+S+FTJ55S/FP/Kizb5w27KyeCL3
	 WMW8MjnnOCGQuu+sx5QEysKKmXIJnrJz9AawqpDA1gXp8il+5Vh8ZkK3uwOrRLzIisg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Inyk+b82;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F8606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E6F8606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Inyk+b82
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso50582b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108034; x=1795712834; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
        b=Inyk+b826EVUltuIdfSu70zNZNw0N8l2G5dIz2ErTQavbfNYJqILZiDFK0PNHHumlm
         5WPXr96n8PsWYy7SDVZNt7jVfN5GYbDq3HHkt9WQAItHZ6LGGfwi8IbfR39RomI2Khdg
         fkFSWmLoeViN5XkU0dZVxFlrCvnAZ7V9keYN3JsTBiPxjIfSYzQ/CQ/zkQtkWy+DNx7O
         aW97Ap3z+kdS7zhG6htLgkqnIrDseDz6yD8mPM+nb0eIhnZcXJloEH4ulf5ILavkunYx
         MnoW9/tAc+MjJrxz91rabd5v0EsCEHmWpbe/pKUsoGrICpj1tSwsGQY4WHeIc2QL9Qp+
         G5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108034; x=1795712834;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+8hy451Az1QACplhl6NMxwsBcDH/OzMgfYQcFFvdBo=;
        b=oTJqpWT47WY2e5pnL6ZK+Tnuq10KiXES4uX+lPNzLLmvdBZ4ryP05SkTntkaPGS/R+
         6xrA2kmlkUNVsySDAKWYqg3tRO4UIeCehBIz6qOX/X73n9dMG796mqEATnpX8wRNnLPc
         LQuJz48Wzh9ZnUG8fzhrfajXnfYeIhWnT36PPCG1Nd2lkyU7O7pkQA0EWXjvaySsiH4z
         yXjUi9B2KHUk+ChDLLNAr56WwXSc3lKUYHJ8ERNvfyytoTUI/6Z3ahx8t3jmbMeG4cdq
         t+3B1DXTuE0lVibWK4N2+WiZ0eFOimMwec0nYS8Gl7ktKqpqnizn3/H5RfsWgU6/Bbuy
         QxMg==
X-Forwarded-Encrypted: i=1; AL+hErH6iC/aOFujHpqufktXfPjBcwOLUL/Tn72mgT0GjYiiOdxT9PLE5Y8k6yhjqth/WTl92kxL/UV6PCka8w0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PqTtL2PWhqvPutQ/XYGY5wwARvmwnBQWgSmhMYnMxfsJDDXvK
	1xjuyK8aEMRuxeJpkduwbGqArxuBTuMHI6ikhns/D4B1ysMyoO7JnXFl15v5r6PMW6sPaEzMvz5
	TnKyR3gzRbA==
X-Received: from oibkf8.prod.google.com ([2002:a05:6808:4788:b0:4f2:da8a:16de])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3503:b0:4f5:eaac:5151
 with SMTP id 5614622812f47-57a0b0414a8mr598706b6e.39.1795108034097; Thu, 19
 Nov 2026 09:07:14 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:05 -0800
In-Reply-To: <cover.1795106955.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106955.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <6fcb1e5c7545f8bcfee9ac9a3abd296c475aa1b7.1795106955.git.irogers@google.com>
Subject: [PATCH 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARED
set, every iteration of the cursor loop hits 'continue' without assigning
'r', returning uninitialized stack memory to amdgpu_bo_create().

Initialize 'r' to 0.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0f86777250fc..280fcdfb9cca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2675,7 +2675,7 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_entity *entity,
 	struct dma_fence *fence = NULL;
 	struct amdgpu_res_cursor dst;
 	bool vm_needs_flush = false;
-	int r;
+	int r = 0;
 
 	if (!entity)
 		return -EINVAL;
-- 
2.56.1.708.g77570a6a1d-goog

