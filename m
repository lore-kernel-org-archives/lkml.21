Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108029;
	b=zc/BFednIaGRd39vNSp4IfGlP5/m/+02nbJlasg8cGbbdjy+PMm/zRpNxNRfXnVdTNSJ
	 zOFYMlMBktp9OCo8bcaCDMeUlH1l8IQI4sFU5N35PqN7tLvrrtz0Xt/OcbM2IZ7gM1LT5
	 y/UqT7G26xUKCoXGGCv2+LqxWIFCv3lZpgVjuJH9ihxTOmZqUBP6nw6+4ZfYCHIkqIENK
	 hR6KC4rPZCfyFaHs1APxIVgdbAUtpOQ0NT6Lm6bluGwmfDuGZA4Raueg3soqjKLhfxt0b
	 avgCCN8xANrF8XOEb8Hv7E9kDUe8chlRJfPDM0z4SmJaOwST0+++ajo7d68s6cr1hVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
	b=3YZgQCvQaBDiZh9HqI2rU7SkHRJcS+wI0TSmuG4crFxzbIe2HKnsb4UkHJkPqW0yDtxp
	 aeoL76IEPSKGDNGEkJiCQHX6du87VxpjjjCRNkGImFwwrz4Gt4Ih9aVFoaKoa4C4oCK3M
	 9Zy3sK1gFQrA89cSW91kcPxkrLyJTAU88nfC06WZQTTbvoV1R29onQSjjnfjBKLvhRhF8
	 2kyhbpOnxh/0PYiInJeJ6HYq2JGul33zC7Jg7cMQbMHNdF99G2JW2wECbN2aFez2lTi1k
	 l4bY1X3OhEn7mdduz6TRHYBU4Po24RIoaiWxHRBFNRxU8Q5glg1Kc9Qfrk543/wtPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JjuUmT6f;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE2DF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JjuUmT6f
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383f2d05c73so3881105eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108028; x=1795712828; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
        b=JjuUmT6f/6YszfY3t58hJLrfJa6N6ruwe8ElujwPHABWw6RKfAUPAg3HC06nYYJ7tp
         3Kl4w2mbZhdLWlUOK/TOhkmA3upwiSjENJ/5WTDORvl77H8mNjy1xSqTQf6iS919p5a5
         aAfH+wzN87QFaMxoA8NIthDdt6VA5XZdaBRhkoOSRPRde560h+KdnQOo7cTZm5LZ9Clj
         bU19ikQNV4MxNBi7snubGCIe0KBfEWQJEFyJpDwYIyQsnk9aCGxuNhwayKqk32wMQTdT
         xr7dGCR5jyVa8E3TqFmNyDFTpm5ZYBX59qiwTVVSF5BuvgeqTnlgs3xUH0dVGjtXsZ82
         Kuuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108028; x=1795712828;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HXYvdAAUg6PhdIi6P7o7bJNHIqooKYEpFbbw0vh7ik=;
        b=x+qNiwUEVjXleHj6ELokc6OAx4PVVafnWy4Tl7vw6G8piq/Ot8viBUmKVgi3vhhNU4
         NhOLRbnUVn1PXdaFnPhwNJYxgcsc03HYmbFMtJsBrnJAIYD6nrebeNNuyv5/0x374GDU
         YawLooE1mSE9VAF+1pb4xu2bj2ZvAvhoDG3S5IysbAcvJq8cruyKHX9C9NeFsCgTYHsZ
         P78wGtUohwKYvtYEerVLHVbe484xA1OGGGiP3ED2XxRzsbRH70YyjAI7zwYpgUWxwHA6
         crun5g3HxLYc7yxQvwcpIJwKDoyNKw+ehTcZh0RPoWxbPw0faaN030AbKBWH756dR5KW
         PFYQ==
X-Forwarded-Encrypted: i=1; AL+hErESucg4QRHQsGDhZz6YbIecyiX7/rFGl/iJo1ZELoSM7Ae+UWGYJGkx8dxJHVEeKYlqib/FwHgJeDf/dec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BpPiOSFyfvdW0An4pdqbLuzxCOOKxaezAlVLNqchShdR3yeSi
	kFjg5kUsm3APnQRyTazs7bf2zXqgqypS6Z5RlpK0tXT4boP/1rS0oUNWSu6188nAMaSVb1IWA+J
	zxB4lWp5Nqg==
X-Received: from dycc23.prod.google.com ([2002:a05:693c:60d7:b0:383:9f52:e550])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:894c:20b0:381:2f5d:a696
 with SMTP id 5a478bee46e88-382815231femr6073879eec.34.1795108027821; Thu, 19
 Nov 2026 09:07:07 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:03 -0800
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
Message-ID: <cover.1795106955.git.irogers@google.com>
Subject: [PATCH 0/2] drm/amdgpu: Initialize r in VM and TTM buffer helpers
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in drm/amdgpu for uninitialized return-value regressions
found via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build:

1. Initialize r = 0 in amdgpu_vm_bo_update().
2. Initialize r = 0 in amdgpu_ttm_clear_buffer().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
AMDGPU hardware.

Ian Rogers (2):
  drm/amdgpu: initialize r in amdgpu_vm_bo_update()
  drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

