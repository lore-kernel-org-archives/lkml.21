Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674285;
	b=doomPZJ6CEb4Xq5jGWmjsDqOij+KdNGGfsJnY53FDtbd70oSRFoeNcKqsFJO/7ko8ZGJ
	 5GS3LYnKHhEH0/Xg8L3VzDepwUGPcHiJNhc6GWQpwd3R2eOtq4Kg5Q2b8fi6ydMwZHuR8
	 R7PyLyOa3TomWKecFD1/PVdlqNvsf+oR5DxxSoOpkk1c38zHFooVkB1TjrwiT0sY3VX6a
	 paTFuH9si12qbGMShZHm5Rw/3T9UwMMlCNQ6F0Y/ubLmF1NFn9CSKCRl2PEkL37BOfzt4
	 /s+n+D/xd/dFQU2io4NycRv2lciyPBP4XMCxPMBnIqYICAuOSFhwfFPB/lfghKv4BRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
	b=UciiP9ZWWUH/GdW0xRpNIyu/dSooFUmOgFT3mcQIZaFBFsQc8s8G2j00Rg4nw/fXUuAs
	 wqiKI31+RbCI2NHsnGkSoxNTd3PuEuyr6uhLPZgwpaaILZbJbCuPU0VqblRD73gbew+JS
	 2WzO9LU90vKugvZlWyAFLs94zm36UiJPO5Qod2/JcJSG/WfdvK8S/vfnIs8NZh11gEvPA
	 x3i0zEU0ithdKWIULz+p1jHfMGdRJqeLUfOcwlG9uBSGWQgCnSqi3uhaQLDnmLsrloHdf
	 R+3hNs5OOmbixlzykNfnFjYE41+u6EaPgXop/VckIQRadZGFPD9BqvzxPZbTPEU5TvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NmQeR3Yv;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B175606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B175606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NmQeR3Yv
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7385216c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674284; x=1796279084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=NmQeR3YvouSPoejt2/ltTFEZkJF4kWAkE0yu1LWqRtQ4a58YTZHG511fPlSYFWNhSH
         5mxMjd0Hn2LLHkU1vAcLnQ9H+6+4hArdJm7mJdXuyBzMoyhg60WnT8jB6voMAIiwCSqH
         L5sWw/UymwNVK5FuApsHLMjth149Wa9arOt8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674284; x=1796279084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=dw5TQLYGigw4lCn646Z9oH6AVAae7eALkfDnMQCQD9JouiTFnVAD01TPrC4x8c/pIo
         bzmWq1eDbz2NOraiXOS+4c6MHBC7g+gUEzMxHMC7isZsVjmwRGQ2A28uvwhGrieu9PmX
         blGRrSFJMh/f5c19UR4vpSPfTxptiajfQSJt0+wuVdwLARp40FUX/vSTsLt2MjYS9TLr
         171MRh5FFvLQsPS2CJkj6esroxTuXsKXfKUTaoYyeQpWej9fCs0/aNoOFZS8fGORwEqg
         oCyEzaYjv8gbFKnHMR3qwq4r5mCukzfWHmxz7Tgp9uPe++musFy5/KMP4zpqeT3DJfI5
         pHCA==
X-Forwarded-Encrypted: i=1; AL+hErGUqa8KAjKoODZ2Z8CziJ3s1oecn06vpm8OL03npKs1VAz+ohXb/KwobzfA+E6vyvNFRyeswo+iVw/HP2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HmgZgDloAy2/8axo0AXgRSflszypAjOkZ8dPPHwINp8li8KRm
	i9Ce6U1cB5hNYb9FfCzq4qGeu1qtpGiS3cf1zNZirEL++V1iLpN4lz26I+gwexNxfg==
X-Gm-Gg: AZFdTZfc9tf3vP/1usUmwcFyoc99RQK2k59RwtFcVGHo5nw8/4bPPOqIQVsm0wxbXdp
	7g8IeSM7uhIKabZwBkXTVHZivvg8rlyTCn4SvPFe1Gfr+DgJWg/42lNH6pvThSMR/c3uGYQ/dEp
	Av9POh5yqttF2JzH/Bms7XWGkRJfGQKP/e1KsXnA8M++45hB/ZOphJFbcYZAjl5QhHnQBqX2Gdj
	S3h/ypldHf+gD2zrEXF4LJK3uF7BBUdiq6tnNcu54ekVB1rMAVUJaUOeHoLb93wPW0cHGgcr1Zi
	N0sSIPorThWoWqGtNKx64L1F/yehRt0aLsZiJWU6NpZg7PCr+R3NrLe41HvjfJ4uaQ76CxQNhx6
	AIYQTkuEZsE72WB3aKz2JaXfmofnZt0W7/LTLNMsQcSkrj6vzAwjp9hyheo5nLib3dkMh6i3mby
	TNiaVTHEPeYhgIwbFNv7pK+8qZPQJ2hO0lUZ7nrNN0RUzrHtjcQ/LlYrxow52KqZor6fNqXZ5Kf
	rMJ3TpfZiBCc40RQqbH2cl8qw1MB30p42wXDcVLfmqDipdCC88vIPhyyvJusxjZHomklg+vezMT
	WcoijGxVrDcEzIzk5eCSZiWu2bhTb6zgTiPmjOch2Fk6Qw9wMZNyiik3plbR3z6kT2awuKXpSd3
	XZpWUv0ZeQTBjtgMdiZwLZQ==
X-Received: by 2002:a05:701a:cc82:20b0:1b5:5a81:d388 with SMTP id a92af1059eb24-1b55a81ddfdmr16361341c88.4.1795674284302;
        Wed, 25 Nov 2026 22:24:44 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:43 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:45 +0800
Subject: [PATCH 3/8] drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-3-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
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

DEFINE_DRM_GEM_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default. Migrate the driver to use DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ec1352c1b09f..93869e8f3f96 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,11 +494,7 @@ static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,

-- 
2.56.1.839.g22a8290db9-goog

