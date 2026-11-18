Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997176;
	b=K5GzzOvio6v1Y+19qo5U2COXduH9xSS87jwxcR7oem6n65HKr+NiuR3Vjf4wEGriamQN
	 Keific2rL+8zTfqaOCQ/WroC0RyINWi62cFQ7zuLUcEZnQofBgwFNlqGV9f3f8+6MMRDn
	 cZz7Dr9DPf63pnG5oN2zN3/bHZ56GQTRxROSvCTVP+GGNb7GVDph5FCRxxGIL6KNULPsb
	 vIkplaQRB539cTTodeAr6hy9mP26NSpJUkaum1pjmxuGUFehoV+s9Od4mipPoo9G3XD3N
	 Nyf/qJFKCYOz1MeNdvaL1VIs4TxG2gzqOND4eu0WCy45Fyb77eBjHNOW8o1ch+WDdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NLaIVuRrItq/K8XGKB3939YkOngM/rpDK9AY6I9hNIg=;
	b=CF7RKp0fngrP1uuO1b6WLSjndchcCCekuZ2Ls1iPXvvph3u1kEHMBDnQMUI9RHP9+dsY
	 gdZLzqXn5liQyyBI5Iq9UtQ88e2Age/8qKkwwdxCSjYGiTWgSG8R6voIu0/tng2abKMXh
	 VTkGiSS98yLsHJZR/aMCH2A+wBLs+G88hSSbnTvgrjwlZfLFLGC1TmDFoiYSnICPYbnyt
	 D20XFAgxOshPzA0YuQH/yQPW8pNyMPhGG3qsyxCqKK0iuIn2aTBQHTAr1U/lkmUSd/dkI
	 iG/3db3TEhtEVwuakR+oFYTHjL0ASu/XHF+Hi7SNTjMhOyAwjRsgV8xEacnytZnEdyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BOTa00Xb;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C029606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C029606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BOTa00Xb
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso7470115e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1794997174; x=1795601974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NLaIVuRrItq/K8XGKB3939YkOngM/rpDK9AY6I9hNIg=;
        b=BOTa00XbIqmw9i5pJD/f+f8gmUcWdZ7Ur0snq3My/QFs9S0YCxmTzbrvtbeEx5Ua3x
         AajQHg6onZJU7Z72kPj7aE/0dG/RfCJf9NCxuXxIbd9T8ZmGcoHoa5UXu3/JnQ213QaI
         4gpHUUG56Q/I1M2pnhy/OpIRBUf957fN1WGpYAbsgAr9LhavkTUTRXKNHaEsRIJWW8k2
         d05+n3U2+CTVz4hAz/uYxfvNKB8doLKgpPunOeJFCwZnos8uwdei2Etxbn+05BIgeFLq
         wNpy9iQQz42yEV2KWMV/MEeQVmRymUzwcRzN3g6D2b3rVE+UMu80b1igCQjh23jB3xPA
         uIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997174; x=1795601974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLaIVuRrItq/K8XGKB3939YkOngM/rpDK9AY6I9hNIg=;
        b=Vb2PXGsoTiMxsYkqtoH/SkPSNSnTRgU7STTNPGRxHMF+gpB8pqpiSEaiEIKuH0tph+
         kkxAL2IGRx9ZuSpYsNyLX1NQWoCusyzBZCf3lKdO3k68t83HMfbiW5GBGZldSy/S/d+K
         Ic3KK7MXxzqlHEKX5GFSCZnc7EokLNaLOtIXK9GMLwxC8/lZCGZrViqbXzonusAHsqRD
         rxekHE7ONfLx2zy5eCCg0X3xBWkZ5QuJKu6CBTsCt1ek72JeoL9BMDq2ElI7xBjFGRYr
         28MPibQtAinRFKlgLZLmbvNxnTE3QzGD1qqbpJF94y4ovvQse+efBBFlUUsoY4mTqstU
         WEdw==
X-Forwarded-Encrypted: i=1; AL+hErFbLYlmQUfrIqoHmC7ZI95XfGTKBpp1wuK2zoAmJ0SoFSyIDFnVmK3IOqTWeJ0OHLS6L189fZsZlNyF224=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xn1toTnDJHaKdNe46si8AVKat9QWIAApAOijYUa/1jIJ8WMyD
	Dmz9h1USINBNwk1GCcurBqFgX5SHjjtW9mmBWhXLLwR6LFdk75XPtYKAWGbqZuCd1x0=
X-Gm-Gg: AYBFou3XdXeQCzWmPpyHvcJShfr0PwH73vgXpxs9L+s8pAzfAK5F5s4Ls9t/dTeDdYt
	G01sevPc71zLoafn2EGLeoeOuTf6/iNNuOwSymRHAXuytbLnVWPteaHrUIGmDGl5gRiyqvytmFV
	zP0WugAEchAOFFtLxTI5kZSd7rvvtHxI2VI8lh+Y2gEFVyV26D+aI2veinD76DoqNfO54gL4aF7
	YXiqNZpKbiwCASIAdukCohsGlITRwjH3uHyhFy5zQLs6fY7otDScC8JmBnK9fb8+qSrT9ITJAeZ
	rvtxcFdABS3Y8oFYHH4skk9RRNnomJmXSWb+e6j2d8v/KvzGQTae1TjPpQ3XjPdP6IEYZOzJtTL
	HipFG+4MGE1yc0OcoltsKgkEr5HLg1YgyS2FX8xtIEElNeuNVIXldVOvhLCrOc03S5LmyJHuk5c
	icM13b/PIirYSdWorvLdJV6V1lK9GHewDqKFMYIffxMem3pspYRiCdOnSTvpyZeo4cQkxfjqUFm
	no8/GwsiZiMmcI2mhKfwB6TaSxf+pn3BtcyU06f8Xe8491b5UtsJwCKdw5N5f801JBp0FxastGz
	ZkYStZDhaA4ACBLNdQl49CDElpGIknAtywi5KVuJacMMUnsMMFFOgpONe/HvejzyxMo1YEW2uxs
	rlbeLv1B4b9INNE5GWVnG+j+cSSaMXi7w9hWHmDNgo9HLoi78Ew==
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb7da349efmr45418205e9.22.1794997174425;
        Wed, 18 Nov 2026 02:19:34 -0800 (PST)
Received: from alcachofa.home (cst-prg-52-235.cust.vodafone.cz. [46.135.52.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm118711585e9.13.2026.11.18.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:19:33 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: Heiko Stuebner <heiko@sntech.de>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Triet Hoang <triet.hoang.dev@gmail.com>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] accel/rocket: Fix up sched array handling on open and close
Date: Wed, 18 Nov 2026 11:18:58 +0100
Message-ID: <20261118101901.253550-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.54.0
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

Don't WARN when drm_sched_entity_init() fails in rocket_job_open().
It can return -ENOMEM, which is an allocation failure and not a
driver bug, so it doesn't deserve a stack trace.

Also free the scheduler array in rocket_job_close() only after the entity
has been destroyed, so that entity->sched_list never points to freed
memory.

Fixes: d341ef030f3c ("accel/rocket: Check allocations before use")
Fixes: 9bca2b5f1a4f ("accel/rocket: Keep scheduler allocation in rocket_file_priv")
Suggested-by: Sidong Yang <sidong.yang@furiosa.ai>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Link: https://lore.kernel.org/all/20260826113538.42111-1-sidong.yang@furiosa.ai/
Link: https://lore.kernel.org/all/20260826113538.42111-2-sidong.yang@furiosa.ai/
---

This addresses a mistake I made when I missed the v6 of the
"accel/rocket: Fix allocation handling and scheduler array leak" series
and pushed v5 to drm-misc-fixes.

With these changes, both drm-misc-fixes and drm-misc-next contain the
same code in these functions and there should be no conflict when the
two are merged.

This is to apply to drm-misc-fixes only.

---
 drivers/accel/rocket/rocket_job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 7b798a90bc49..454d465a39e3 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -572,7 +572,7 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 				    DRM_SCHED_PRIORITY_NORMAL,
 				    scheds,
 				    rdev->num_cores, NULL);
-	if (WARN_ON(ret))
+	if (ret)
 		kfree(scheds);
 	else
 		rocket_priv->scheds = scheds;
@@ -584,8 +584,8 @@ void rocket_job_close(struct rocket_file_priv *rocket_priv)
 {
 	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
 
-	kfree(rocket_priv->scheds);
 	drm_sched_entity_destroy(entity);
+	kfree(rocket_priv->scheds);
 }
 
 int rocket_job_is_idle(struct rocket_core *core)

base-commit: f9fc6da01a290609428d308033143f1d96ab658f
-- 
2.54.0

