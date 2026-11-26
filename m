Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674326;
	b=eQKp57CIjlBmcHIEV+qj5UAslkqtxJzEoFC6NaSOYJRrUOyWK/MljmTVTM86r+ZwJSzm
	 5Cpe0GmvCAJpZ4/4krEMaGjWF8SNlHDNzqkew+vjBZ4cLCmkEvKJmskQje6zm+JQGiKkI
	 GbreyCiYfu4UhIy3Syxc+JI5/WVphUNvT0b9AJifyly1EFzk7goXAPf3g4JkDjVsPcCAw
	 +PtyVZhRbigIW4oOS8srby/i5LLwU+boXDyW9j7y8gMEus1wHGrRRSFhCNR2yjaeL/V3o
	 VWNISg59FBpyaZIv2L360ph+ooIvm/P5Kj3Ovi8yu8ELRYaaQVbkG8VZ7Nh00xNm4mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
	b=jRZy9cZTe+BizCDUG56cKeKE/talxJO5ppt8HQwuzPyb7bc6qrL64OsJ3Uv658xmj6wT
	 3ylgEx4fXEufeYB0Abm8OeTRlLk5lKb6T6NcmsPrkHyDB+w6zkGvYlfk6Vs9tgVEyU4vr
	 LjP/YSADY0abscx+6TXz19Yw1Z+OG/tAvRUxDfWoiEzNxMrueFvICiiZq3kSzqOLY6IAV
	 wm/y2F1y6VphMVeSyB2ueUyK5rhcpSZ+5Jn8NtDDjFPiC8j9010vaXVsFqCOavRCs8nOG
	 RtjwBwgJdPHE6yxixVpGzh7IsiFX1GmofR11nkLdhAOWqBhq82CAALA3S7Rf+4kcDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4at5neX;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB2606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K4at5neX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890722c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674325; x=1796279125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=K4at5neX7QHiToiVo/vG/UxC2yV/7Yyw6zsQA82iUfKQrk0pXd18XCW/Jz5OlUkgBC
         tXraDsQJx5DtuQXoSmD+cpIkWBviq1m4Pcz2UwD3CShAnXXLmSOK5MP/mtIe29M1rtTu
         ibc/L7X5xbVH/fWOGQrBHfZcevV3pnZSDweRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674325; x=1796279125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=SMlWA6w4d8aRA42x6urqKIC/B6QmhpLOoDMcpdGF6yyncSFOkkQ8QSeeINErZpxNct
         X2HtxvuYkcp7cVSLwOV7BjPxqJ2+T7j0UXykW7j9ChkRXfC0v0g3lKw8RJKmihzbKtbA
         PVlPXd7pDUHk3UbP6HVxfwIMzmhBPCqA2u/Yf1ECAN81EEwi/4H/6Vplq3DTnvBvD8OX
         evkojHwi9+PVqvkLJk6jSdGeRbBQKYE9K6bHFISx5Qm4YAPUn898GECGhYZ+bqMdqIRw
         Mo5BamynFv9IUBJDSaIsTm6bkkuRrPUCfNgbPhHNPnZbsCMuzw8ghI8ielncBcX3zcZt
         hlMg==
X-Forwarded-Encrypted: i=1; AL+hErEl9b5+gZrwf+oDxIkrSARbbubWP6SqqcQhC91U4JOSMTyEGTwiSwxnDT0UJAuez2Em1Op+lfONu6OTFqA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d5MqrvsAouGrnGxhUqGBdD0993UO2JgAOctm1BrRcT42yhq68
	HeEfE5my8S/sw2glUjp7pP3e9TyRVtWiPz0w1pWEfgEpNAkq57YgDfSokZ36Lv2bbQ==
X-Gm-Gg: AZFdTZdpVNiEgjhiywxBCu+dJNoGklmb7v/FzB5Nut+AriuOP4q5IDyaCTNaTZNSauZ
	hg+svj2uMdCNoRuL93RgKDAo9dJeGvGkA6FAT4dQjkHjLl8icaoyaAhP90+hxUrpsJIX86iAkeb
	0gQzb2tAOMm8+zlv9Z4J/glM1Tuh0gdslna3afuwKNQzjwm27NkWP6iFELVfe9j7SIeiJUBsOXT
	IUEwLlpAlFky2G9AFxCf3XknhuKd76gJHKj0QUsFKnhPsxUpYxOTGPUlBmGjmqNFGrJYIWXBILm
	eF9YOccZwGkJRp0pwI/u0O7bppnh6/H7525/t5T8FeHTji7EYGrL1xyUPOKsDzIasx4XNomq+BB
	MwZE7qLeYC32A0Z6K5q+k3rqEetIM9r5cEblSYCvOUuRkdPpr2Xuw1b3rhohvDRJ8cz15KEUgi3
	TYO6jNVmKS9bL+4R7WIgWxYmHj+GEvbQ+rAGrrfUD7dCZl0WGYMgsokf/c7PBc7JkFtTxoQEkaY
	YmLeYl0/hirclS3fnsv7pUXl3qh2W/dkFdQ4+y+TNrKld3tqwxYAqiiBkC79JcxSTdJnOD/ur9J
	zGvx9xZUfnSKAqy4DlyWEuYkQyCbBkowucDjqXZ6T8ezjkpfV6bd+QUnqkv2HtzPgnxGX209wK9
	JkdOd2veGbjCUkUGAsIRfNQ==
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr17922707c88.29.1795674325489;
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:50 +0800
Subject: [PATCH 8/8] drm/mediatek: Expose GEM memory usage stats via fdinfo
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-8-7cb1d1a5d6ef@chromium.org>
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

Set .show_fdinfo to drm_show_memory_stats() to report standard GEM
memory usage stats in /proc/<pid>/fdinfo/<fd> via DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..9d646740c468 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -607,6 +608,7 @@ static const struct drm_driver mtk_drm_driver = {
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &mtk_drm_fops,
+	.show_fdinfo = drm_show_memory_stats,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,

-- 
2.56.1.839.g22a8290db9-goog

