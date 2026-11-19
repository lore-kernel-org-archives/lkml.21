Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108032;
	b=r01yKLdeiJSDfcvmM3tmERfx8/yjgkprBc1Lupa+RP/nOz7eE1Y0Q8XQniYj7iMzFRQr
	 qOTI80LSAW3Kr0IbxjDSxT8MfeZe9V907rqP2B3mnSF9nVpGniiyj6tSY7Vz5W4HxpBAW
	 HEi7M6uMvbfh29LO2/uDh6yTyq5x/BT0ufafReO4fOprCMjKLlzfk2X393oVKvy5kanwd
	 Ol36Hn3G8yv4wmbaY1a5/aRyDMIV15TyBFDPPsh4HmbYUE3RURkMh+Cof4Ni0CmgAJwii
	 3uEdKNHAjeZtn7nfdWpedYG+JEJ+WCDCH2JH7dVXQbnCbudGn/s4ddSLAwfh7uBClcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
	b=wJ2sifzVVmr2yCQv2B9p/h5WLh3W2KIXjkJWAHoN4PnOCndAtKVjsmsHRhQQvrSSyGPu
	 sPfStsqybR3Q/1icuiXYh28SbTGBXNMiXKEtIEDnBqPJ9jI3nbfttn+LGetXY7ELBbnO1
	 dfaaBCoebxH1aP0ycgLlvpclRfoPvZSzb+NnCLgqR/mEynNE/nfcqeGFf/Sp7CBOOmoxA
	 +pjtTuzn99u8Gv3EmvRkUllC3aeJHHbI5xC0hJZjXLlFt4Yk5XGq3UaGiWL/KYFks4zoO
	 bQY6606Q/HzRGzYjk4KsPBH6jNJoEPPADPK7Xy/SB0VOPchPaS6faui2KBjAE8Vhb4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOoNc3el;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E698E606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E698E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOoNc3el
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-154e9d2d94fso5084127c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108031; x=1795712831; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
        b=BOoNc3el3kG0ZQCg/EBl3SO3/bTMIrExfXUYTwFORl21CwmU0f+6pUB0x6aoBYl1e4
         6+Aqb+4HlqxzGRTTqdoEGYKbgMbXYCOesjfavC3/IK0W+ixn8A9gcJePcpMf/fbEtdUm
         dUhCCZoDF6z3bmIMPl9YDwwPty1yyKZSyF/ggwvzG663oEJozWC81Ix7aF2FfxshQKDv
         ANBrw/HP/u21nXniie+DntqaVh77tsaHIoGra+0VdiT27mF5gNt1B4KbQp2UvY60JRSA
         bOTDu/1QyRr+BNoZ9Nc6lg0oTlZWXHFmSZGDDsNqnwjOg5eG0kLTsb06seZaAsMMgiA+
         7wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108031; x=1795712831;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+O5fTVKRKtM/LnTlOc2xLfq4r025GdIDtJ3B9d4nmVw=;
        b=oiHSqOVC99ZKPKlSEte59qLb4F9TJODLl0EGRkj5mVXA5ZbRNzoYa2m69YU+RHnYbX
         2ORBtHkMvNDG4T61pXVpMA6kFxLn/CP1DAvNvmlU47OadqD8ank9ySGU+TbvmqN6FUPn
         fzofuJX6uH8tmTw3KjLHGq+jHJ4XYBBRxGJhWG1XfABhbfKPW2T9O7Q0tMNdyNFtH5ft
         dBEerBIOvaZIIkEKDdvT0atLN8pCWxatQ9pYjcVVACAex6JazX7DGIkoG6R4o5u69oDO
         H9UWjzvUfsmQFqkS1JNFxdp3M5+SUnFL8/Fjz/eqLQPvO89g1+T09VHfP+3U7rhCnj7S
         0UUg==
X-Forwarded-Encrypted: i=1; AL+hErHz5zHHwlag1MFVg5daX3ipwBmlATc26pI/hATjiKSkZ+9WWElHapUivujFhKrHdOSyxdLtrkNx9sc39QA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3DH9na+ebnRTwjm8Zcu8Pj1Tn9sj8mHDKZ1o6A2YSooosN7tI
	5Pb+rMEJTzidAqnxQlkIBYAxk1hX0Vm2IXINqUGcYplnsiAZFKyZ56K2e099R9EEfDcbdW2Z1+y
	CH869UXxghQ==
X-Received: from dlai6.prod.google.com ([2002:a05:701b:2706:b0:1b2:375c:814])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:20b0:149:1feb:6d9d
 with SMTP id a92af1059eb24-1b55689e6femr287285c88.19.1795108030586; Thu, 19
 Nov 2026 09:07:10 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:04 -0800
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
Message-ID: <e8d983aa6f81be52ea1bb9afc9c0f47d4632c1db.1795106955.git.irogers@google.com>
Subject: [PATCH 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") added
an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
'r'. Because fpriv->prt_va has bo == NULL and is updated on every command
submission, userqueue validation, and KFD VM restore, calling
amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
empty skips the mapping loop and returns uninitialized stack variable 'r'.

Initialize 'r' to 0.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 82b9b2d5d0cf..091589b2c524 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1303,7 +1303,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	uint64_t vram_base;
 	uint64_t flags;
 	bool uncached;
-	int r;
+	int r = 0;
 
 	amdgpu_sync_create(&sync);
 	if (clear) {
-- 
2.56.1.708.g77570a6a1d-goog

