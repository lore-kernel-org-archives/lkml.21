Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323208;
	b=qEaJPJdkd6tDPnsLtQ4QO31HTwWP+924bEzPiE9GOtgrhhw4q87fkoYXmnkAsEfDNIYj
	 vG3ZDRlJ0kdWglwT6TFXNRwFof38g1DbavhPVN9cbll79NWqMOcouQCaJvsleXvAfrXwP
	 PoZ6DWkecqJV84MZKVjKgGobpWPQQG1JYDffWIsF12WZoj0cdZZg9/MEqwFo/aPDCKYDy
	 4uQfyQLzfAm/o3ck4SNu2K+wpW1sbGFWIxLQPgKsj58kX1PEzqCoy50y0Xop5L10Aaqye
	 I6LTObxqjEm2WRtVXR8C/RmL5QpNKw7moXaTc4KIXdYZCHJDSiKMRXzwGIBqQR1VjrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
	b=y4xjNH5C7A4mL9e6T2/eDzeSfb7gsbJmaPU8emZKA0/ESkjiiJfRBq/GP60IpJrCXZva
	 Z+oR7kcxJESzYJfJCHHU4H0qKvMAcsaphkxqCV3LicZczN19ju/h2uJPrZbcN7229UksP
	 Z42RG7lzGMUz3HF4pZFNsLTnAjY2EGTiupUjvtyCcnT/06UlHvnEZooRG34oUVy98bmX+
	 kiqa1o9QQDhOc6V4BG82z/IMksmZQyWpUbQptkFL4bA1w/z5D25uoG7EIK4vYpl4qkGYy
	 yZgcoGB4usEY8CM3OvhqYpvMogfPL51cNj+mu2QYU59vQmZQblQf+rCsquTQ75wSBxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pX6EuxDD;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F4D606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F4D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pX6EuxDD
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so6709201eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323206; x=1795928006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
        b=pX6EuxDDH0Ys18jiyCaxzaWvZaozaHYjsrzEBLW+b10wT8Vaxjf7inpy7niBolsu9i
         TZn6TAxx8aC+7VdxvaUJxCYTfa/7MNWvj5OhvNWWabLPNmsgCiQ9B4UAA+5e6m1kpvaA
         6UxFDjxHI6TlJHiUtX7AA/jzFM5DS5vGom9NCB99eW1o+3K0Ku93jHjEmqcqcOPxNntY
         vXSMq06ZH6fJlXnIvr7M25FWmtzCRvi8liuTK+KyGq/w/ffEp9fxwqhsmCdKG9iwvC6s
         GpfiD3RTFS56C7q/UNGDFL/M25ztFp6o4/lJi+MV1kgpqO+3ERGZR0dT/jlAjbgZuwsA
         X7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323206; x=1795928006;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+8LakRjMdDQ9LrYjApbpVrM7y/vhgkxVS30t5HKZuE=;
        b=uuS9rpRBH0Tiij5JCOzILO6MgPzZGZcvqdbrCUUVL+PNFaE0zyebfHELkY/uE1X2OC
         z34M3WG8kKxN9LSfVh40VC0jcj8qFWEMJ30OVUmFKLDNz+sbn4R4vXIbQD3NkMu7bPUO
         4jnjSA7t28vrq6IrOZlE1dlgbL/Z2PM6KG2eKwCuJrKjKF3wOLdvtC2TTHfjN3NPZcat
         Qyj0PnvqSBtgz0JaVtxCLn42DExIq7l/iEigEyydPfw4VQerX+3Ik3h2rAxxPFDfmZyo
         eUG3jKXXiIBng+//8qLJgMOC1WMA/NoxmlM7uMjdbC7FjaH92e8a2iiWZLKGf+6qRXIG
         E2ww==
X-Forwarded-Encrypted: i=1; AL+hErEVOcRT9AI4AuXxnFmIe5JfSG6FT0bz71KfiR9fQiQvnC2MLhL7X02VDF9h3PvSl0LXJeBx3ayjcgnTjlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Swz2x6c26XEKW2qy3AiLUsUDAZhbNrdvq/Tb8hAuUAW+PTllb
	JmdVZQydFFiP3pS2CwlyQ74upw7GZXVPgk398ifN3b78+h4A9eJtM7HTyKZAjgG9QPDKKR8ubUX
	hO5cGqIFXAg==
X-Received: from dyvp7.prod.google.com ([2002:a05:693c:8847:b0:386:9ad3:91d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:fd06:b0:369:f05d:6c5c
 with SMTP id 5a478bee46e88-3856f549471mr8286070eec.28.1795323206053; Sat, 21
 Nov 2026 20:53:26 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:17 -0800
In-Reply-To: <20261122045319.18651-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-3-irogers@google.com>
Subject: [PATCH v2 2/2] drm/amdgpu: initialize r in amdgpu_ttm_clear_buffer()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In amdgpu_ttm_clear_buffer(), 'r' is declared uninitialized. When
consider_clear_status is true (such as AMDGPU_GEM_CREATE_VRAM_CLEARED
allocations) and all backing buddy blocks already have DRM_BUDDY_CLEARED
set, every iteration of the cursor loop hits 'continue' without assigning
'r', returning uninitialized stack memory to amdgpu_bo_create().

Set 'r =3D 0' after the cursor loop directly before the 'error:' label.

Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: 23bd7e67961e ("drm/amdgpu: get rid of amdgpu_ttm_clear_buffer")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Set 'r =3D 0;' directly before the 'error:' label instead of
        initializing 'r' at declaration (Christian K=C3=B6nig).

 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index 0f86777250fc..693f25285f2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2711,6 +2711,8 @@ int amdgpu_ttm_clear_buffer(struct amdgpu_ttm_buffer_=
entity *entity,
=20
 		amdgpu_res_next(&dst, cur_size);
 	}
+	r =3D 0;
+
 error:
 	mutex_unlock(&entity->lock);
 	*out_fence =3D fence;
--=20
2.56.1.750.gf70dc682cf-goog

