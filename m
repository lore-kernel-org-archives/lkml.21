Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674318;
	b=HK0bknlFVR4J+dmItSg2R08CL5YSMwk8Zy4E4iwVGsZ6wUroS8+c9gCzrElZ5vSAFcrT
	 SsQQ9tVAIuUzvr0mv6TaOxxmVR1vP7oMgnA3UQQC5vpYah7gs3LfWs4KQtv6lY22XOjgE
	 s0cIHXmZwUWIhkb7BFQjonG4t+4wOLrH07tDTfVE9QtMaPcNnqZDISVhKB1fEEqwejjCT
	 GTK9MrljIEP4+zpphQP7+rAjEiwNnUNHDInJPVD5S0nh/5T1o/Zu06s3CXHikI9ZsRMRe
	 JiMI+VenQNROvIk5PSQAlaS43qZqz2LbTlaVky4zb1oa47kma4ppS/rHAuihSXA5WeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
	b=VHZlNOIZ+WNWz9t2MwgS3wtDGuZMvOnaeryZzwB/km+/tsCQvjHU4p4BQVY+fpPRcRPF
	 k6rfxDYoeeIhNdpdKZgNjliEKHd6oApbRKA0tnRz4n52yK5PDlt2ryOeLQq7D/IuAs0e9
	 mbHhugFh/+S2FdbSziAVB5+ZICgrfUva5vDuIRIj74wMbgOA7bcaOZg6FbyE9IfhcOCZB
	 hPMcfQrx7g9ywvCccjz1s9qcF/wMwM40b2mWAeIpcuBhKKm4rKut6fxZrHjYtVV7rfR5I
	 QBgDCtkOitB/WKzYo5nJsKFQGJstiKI/C8WhvScbSQhhpG3C7TbJqu0XXUUfUOfHa2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kwwZM801;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B53606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B53606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kwwZM801
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so10090344c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674317; x=1796279117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=kwwZM801xwY2OIuhFX6EGU46pbfEvMYve2UtJxsXKahMtppPFbmsogbWGtMrnYDdVc
         MkqiRHAKH8ft1s6KUT0PXPxlPEAOV38faYLXe6n5JYu6Htke0YbaTE8HLngPKG58wJQW
         6Csmja8VRmmYoK1gzjRlIATHGv73Z+cdim0MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674317; x=1796279117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=ZckcO5QkSFYymTppRSUNy3Lp8aEkCKR0SJxPHY3gyspJK6GVLuIQf3u0LPe3hj4zRU
         /FDwfyHMh9431lC6c/yVrIYUhEfJOMUk9Lp1wLlW4JuqPC5tLLP/X2hWceQaUPfqCjg2
         UGRJ9PANqlbZI+ubNjCWDydB43ZBQ80iS9QaEM7jHTqKzGRuZODCtPEPOR9zyROsj0Fi
         LgTdvgXylRbn4bmiv2/mgQWgLwm0VxRhSc1fV9jbf+4zv8IUMEV98u0f99abWvnL/NcW
         3quDROHpNIfRfkEz1dw23k3c1uMpm2NHvSWIW1/VqvLhGkNHK3y4XrMRtIryxMapT/DX
         JP+w==
X-Forwarded-Encrypted: i=1; AL+hErEKwESxtAsLI0bvvLdFk9u+sBDXLatz92QOuMAgBJTPeX34gPJ5ZFt9kj63VHqtSOTYRKgz4VrgPo5ruIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z97yz10dOVa1fu3u84npLsaAIhzxnq4rd+facDQM/rG/wD22Ycq
	j3Yj5W3EmwmQ+pYEIpT44i94+wgiRC/NCtw6GcG3MJhhan/6k8Ym8QRJxT81P1ULTw==
X-Gm-Gg: AZFdTZdm8Rs9zPqpuay3wMB1FgRi6w//xXyBkwlALhPfuNqfPFfOINDDajXduUkYoUo
	sIrUvwUlDm8FSlBtMzOWunBdazpEil0mjKy+BOz+I1wuodiHGe+2vCrp8+dNJ5h0aXkyGd4VLRX
	k9s2+s48eOTgmeaY0qVR4kWiulkCBLr2FhqBFxsBEkCIZGgYO7nzzrVginler95t/67JG1Jo+rP
	6E3T1rwyHh9IzW/q3xmuvyXw2K5/Cwv4H5ZjLDDSMEXnO7UdFnv/8ksnYiBLNNzG47KERrzGHEf
	mLxM5AEqOGUfcuUBxm2h0YcscQzo5pgIJ5Jn73b/eRE/QTSqV1yPQriBaNczzRzgr71e9qzvf/r
	wGwjsJZ2eTuKfTGgnK1hXUQPXGpAlobiRQovPvpG3P9tu8NNRQ6RShLbz1KOQbZeMZYTMhukr/f
	4AUp7NGh/R6WnT1UgNnqQ9HrWMrZFn0CtpWmAcJ/48cHCpqsYUk0gIOxkO+HWIG9iZhkr2f5iZ4
	Jz5Bk5IMxbxUA3aszkPSizxsJPHjKBOLGSekbugis1VDugSvn6p7GO8wR6mh+JJisPTp4QE6Nyo
	4YOK8xgTotX5F+x/PGvhs85DuIeQNxQ5ICFD6FgVgAcWDB1Dq+WEu3hjrqqqOuOq6npLMyoaB59
	j83aGZvyvfnO4dGTgW3lo0A==
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr20072859c88.34.1795674317094;
        Wed, 25 Nov 2026 22:25:17 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:16 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:49 +0800
Subject: [PATCH 7/8] accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-7-7cb1d1a5d6ef@chromium.org>
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

DEFINE_DRM_ACCEL_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default (evaluating to NULL when CONFIG_PROC_FS is disabled). Migrate
the driver to use DEFINE_DRM_ACCEL_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 28cb18dcfa9b..933edc272f05 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -609,13 +609,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 	return ret;
 }
 
-static const struct file_operations ivpu_fops = {
-	.owner = THIS_MODULE,
-	DRM_ACCEL_FOPS,
-#ifdef CONFIG_PROC_FS
-	.show_fdinfo = drm_show_fdinfo,
-#endif
-};
+DEFINE_DRM_ACCEL_FOPS(ivpu_fops);
 
 static int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
 				       u32 handle, u32 flags, int *prime_fd)

-- 
2.56.1.839.g22a8290db9-goog

