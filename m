Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674261;
	b=4gzGmWxcKEun3JLZqfwlgApTh/BauZV8LrOt4ebg5RcwIRhI15ILm60WBXVUAZjpAapH
	 1QEHuqs/Ybjs2xnc0ond3M1J5Ymz98MUPXCV4weB9ZUpof98rjITo7BqsiF2PngMGmsAL
	 UKRIMvskB6FiJwlEboEkw8IWBfnaqZjb+uw6hZFe2SWhSKieH4TcxXD4pioVvTEr/N2oc
	 O/a2BfQC9+7DuMZD/E7la2YWAdIfQ9kCvQbTXMP2nkFVUgAEpFtOQg1CMDg4dGIIXXqJX
	 32HN0/BvdfqKfRrOqkKEdVQyMPv9Kk7S5tequTY2P6Y6gOU6f6OQqAG5xGGz4hBa61Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
	b=cMp6MKVgL8HMHt21KyvlrZShCqAZoSUaTShIYhOian8MM408YoJ0K+U6CKZhu+7TxOEX
	 R/Z3bLT5jVPDAeuy+tB+/fqh/wiUqJ3Ala9TnBl395Yt2rOVz7edw1wtyP+5txA9U9VrD
	 OB1vOfVVqZcwEmQ3BiV/tIblxRC79d2qT9vfcLYRqR2jfQ2z5nO8qz8NQ9SuagV5uUEc0
	 fqffLrAyAKO6uIyLl9vEgxFyUSA/gJZ3ySi6DRugdXIoPzVY2RVSmaqc17gFmwESV4+eG
	 KXn6QuUF1krHQBTNsCLbXTpv+CH/eO3mFDtuRfJ3397kKMSKMXVaRvXo+MaKYA7RKag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ab62A+iM;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C55606A335
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C55606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ab62A+iM
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5976194c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674260; x=1796279060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=ab62A+iMuBt1iX36hzkBlxC/Tpf7SHUQHiMc0Gan4VjHPehobNGK9R8hFOWT14bjeh
         EZ3jLspLwm5Qk0Gu5T/QM7RSRX0gGH70gUs+nQ0ZbNA6gJ/FF5SEL0qbNujIva7JPCGl
         b4TYCWZTCD2FAg3WJ9PS6OVlJ4KjvjvSSXQa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674260; x=1796279060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=fc1kEvoU6kERQ3YDnabuk0dTwiP462PBKhUB6gFZW/CRyrBeYbUOnSgay9+gpwQNxo
         R2WJK/JzH9S5BRCAukyKwMtEfMSObZjOi0Jue2cp1gD/jJVnLxCsQiYVD2B+9ysZazhh
         OWTwHsg2VEr7/Px32z6wmCVmtCC+Py0olWODGIWifI5X8XV1g5ksyWLbAcYcAfs+MPrL
         DLUcb7+D22SHGu2S4ctlyMaI/gHdBMgRZJMIbdfazcptXuxW93IEMQMLn60HM2bopGBG
         jBl3wQ52XFTIFo9+VIB3NkDk7KWqNN83YcHtQzLvOQwGaibpKUSppGSTTFOFIe6pB6SZ
         tXIQ==
X-Forwarded-Encrypted: i=1; AL+hErEjQN3QsP8T5b0xsFAnIz7sOiD8W0FKdsKuQHE0e0d9d/DDL/cZuFW9HabryDVW5KAjhEARKVQbRqM0WPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kI9CBgFe4MZOLLbpVTduXYl+XFzRpRakss3Zg/iPJeskX6xOf
	3UnxeKDbvE90Z0+Zhf1U7TWhZkFXCB+ENgiI63htlYPVoAmWfBAnfyiA658ohKc4Jg==
X-Gm-Gg: AZFdTZe6x44PZjP0XXsSnhTTLZE6HSnKbk6H9ysVcpOGikwrCI+vMPxLKKmhthXp3DK
	IPfOxrqEUwpOYBuSuAAZ9hG93u/0/JnKy9Rnp2XyqnAIHxYJIygHdZU7IU7qxwnwE4yNSU1Oc0d
	RzVy2TrGxtCUHsEK3vqJgE/xoICFzeAne1HKccZ5drPbH7EvAA4yH4R8nRg8xDq+mJxI06z1ZLP
	cqqmDGULgOLIzA0brFre6UGhQzGg7TygNsV9ZtHlZnTWiySYgK18EQBAGk2rfGVpuEGzpRxFCQt
	+G7gSBRuPNVYKJ0Osv5yhb0jp53AyqFGU6y88KuRn4C4wRBjCNkzNvm7EOLewWVs8251bkqLr+s
	s0eBsoGIeyqn93Es3JoAWP2tFBB4ISyYM54Ot17npf1lYvyrdB88bJGaIJmNYHBRCZZqcl8O9Nb
	mqLxn/ifjUEGvLyajnWoyv8S5l7vdWfLyIZObN4Ds/ZN4iQUwzibp/h0V1xVh/j0eUamXvQ9KeJ
	IC0OE9KzgOpJV0Za9SfLne/0doy+5UaTncL5B5MoMnXd//46qjtqYZVoWTGb/1VrkZUilX45xZH
	a/Lxy7+94pfrnfBk+fET3VSzkUQTUbgt8+OcLvcDHC5ow8P0ydywaE7JqdiuOvBVSJj2FuB+XVq
	cIOGI41a0U6f1CurbeBrcxA==
X-Received: by 2002:a05:7022:b902:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b556877a2bmr18501590c88.9.1795674259793;
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Subject: [PATCH 0/8] drm: Attach drm_show_fdinfo() in default fops helpers
Date: Thu, 26 Nov 2026 14:23:42 +0800
Message-Id: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/QB2sC/yXMwQqDMAyA4VeRnBdYgzjxVWSH2SYzA1tptimI7
 27djt/h/zcwzsoGXbVB5q+apljgLhX48RGfjBqKga7UOEc1hjyhpNnQxrSgBI2SsGmlvnlyLUm
 Aks6ZRdfftr//bZ/hxf59vmDfDwYnpUF4AAAA
X-Change-ID: 20261124-drm-fops-show-fdinfo-68f47c2182fd
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Melissa Wen <mwen@igalia.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Fei Shao <fshao@chromium.org>
X-Mailer: b4 0.16.0

DRM core's default DEFINE_DRM_*_FOPS() helpers currently don't expose
fdinfo, so any DRM driver that wants standard GEM memory stats or client
names must declare custom fops to attach drm_show_fdinfo().

This series consolidates that into the default fops helpers and migrates
existing drivers for consistency and simplicity.

- Patch 1: Guard drm_show_fdinfo() for !CONFIG_PROC_FS builds.
- Patch 2: Wire drm_show_fdinfo() into the default GEM, GEM-DMA, and
           accel fops helpers.
- Patch 3-7: Convert existing drivers to the default helpers.
- Patch 8: Enable GEM memory usage fdinfo in drm/mediatek.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Fei Shao (8):
      drm/file: Define drm_show_fdinfo as NULL when CONFIG_PROC_FS is disabled
      drm: Wire drm_show_fdinfo() into default fops helpers
      drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
      drm/msm: Use DEFINE_DRM_GEM_FOPS()
      drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
      drm/v3d: Use DEFINE_DRM_GEM_FOPS()
      accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
      drm/mediatek: Expose GEM memory usage stats via fdinfo

 drivers/accel/ivpu/ivpu_drv.c           | 8 +-------
 drivers/gpu/drm/drm_file.c              | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 6 +-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 6 +-----
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 drivers/gpu/drm/v3d/v3d_drv.c           | 6 +-----
 include/drm/drm_accel.h                 | 1 +
 include/drm/drm_file.h                  | 4 ++++
 include/drm/drm_gem.h                   | 2 ++
 include/drm/drm_gem_dma_helper.h        | 1 +
 11 files changed, 17 insertions(+), 27 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261124-drm-fops-show-fdinfo-68f47c2182fd

