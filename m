Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674302;
	b=u9T65g8HCG1yxVyal3QHCtYT/QgpzOZ3PmqSpYjOc70twucwMFccEK45WA7ShmFZIqwo
	 3NtUVzdqkCikHJXzaq3umZBDSl03KCLKJR0hSAeCpBxlaUgTWqCVmVRl4WWaWopSSYcdz
	 dXFSXuAhJJeHSlU4PHC/IRzDSSqy4VJjUXky6KUrvPdMWbzAoJ+1Rtl9NugUme9Sp7/Hh
	 +/EaXRKljIfdS2lZ45ZL9ddL2QoN9BMXud09l/4eMr3kDAeiJEpxSD8ZYwECA932RUS3V
	 82avVGm6kZ7uy3aApVSt06iACJCvhyc9qckj6FPP/wRXSw7TwpTvuXZtuBXk69oYcKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
	b=Zvnfllvk++6zLx7SYajXhtTxyjGfdRL6OCzeVFYQh38gZRA3IDYc2tUsu+MjeBroRqpS
	 AFRJTDKcLA54OITjtrHVNeVN2doAIxZmU17ulC979B59cqj2aDrZfkdU/XttS0DmVBnR4
	 vSAmZXFuZVIDWNT6hpPIxZckfOhXKX8nwaRneURJuCkKBGVZsrnKP5gMHKmnI4qT2bYzj
	 4JDI5zlbXjgkRsJZ3Y1Pmot4r1U0xtjHwabfbXJn9UXu/NUwXdp/+lBCBceFFOAf+eAAP
	 cb9JqpSiPz2XFc05hejG+G+B+8wFCg5D3+vNv7x67m7blVMm0rna6lGaW5ET6awjQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MkeGGUmr;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DE4F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=MkeGGUmr
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3477924c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674301; x=1796279101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=MkeGGUmrDtWCtIDeZrHuYM0LGN+o2+wCauGzhPYqwLyTs1hWJ0vY0IU3Sb4/mJViTx
         dgrqV0l154cwSUqC2KbqA/fjRIFh5aeQf/SyXeWtGg9uBRaNvjzobcx+bKA7SbrzVoHt
         +5o2B5Xx30JIHc1sFojJY6negcqhwL80Lm/J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674301; x=1796279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=QocgWPxpW5s5yfv5JoG4NIm9hpVpr7PnmRqoLLn1lElpzfM4B1gn2slxYQ8A7qMFYy
         0idwQkjnZSZtwtrqYBj1jVArYBMtJA4/Z+s2/g0FALPyH9wA7paq0lp/mMOjOh4eiAE8
         mNlaRYYe7LBoO4TFJmDjO9NPS535OKjAiRWTXaRJmapbHbS19Mf7LAKJXtcysOKizdKu
         QJ7PqMWCVfqvfejoszqMqMaTcwDl9GnJSyhM755HG35EyUnXJEFP9gQtfySqllEjrpea
         D5AjVgwT009ZYZxcKrlVDvrqv5Y217c/mOnCDBk53JgJ7KdVf5pu+s+ib4e9GYOz5a4a
         hSvg==
X-Forwarded-Encrypted: i=1; AL+hErFYfv5W/AdQQ7DnJQQFlFZGy8m5+WqUAQ+lYdoxz9lbCByo69mL69nCmHl4P14MR/RvGr8ZkB19akAwpAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aN+XSNaNT7OKZ3bp5tDb9AJK1mgC47bsrVOtk8CjHF+retKCZ
	n81d5BmyOl830FFwW4ZC5mkmJHVRYVT40W5mxU5B1nJ9Cb5RV0lf+65RSw7IECjruA==
X-Gm-Gg: AZFdTZcYJMx8J8qSyN3ruMWY+5WQSuy1zpLcRektNAOfzCFvquMOpuR69Dt+IJNgT4x
	NGGlI/YqesJRu/UgFjXBqpFcKRr08uXl3oBV25uMn+sfDsVRzfu3TnYg9aQf3HG0TzgWoyUKmDn
	VfkKFYoliJIvuu7N2FFFw9Lp2t8V5ktIsOwJuf9KcIDIoLfJaOygHNoDhpgtAku5U4RJ6gNmv+U
	O/fHst6yMrrRqu4uWsUOBzyZzgadNStyjIZ7PvphUebOIXcXj+jqoskwclASyIJRxWpb0IHiv7Z
	bi2V4OlwdL1/1dkDTWu3xnL12DXDw0NJwKiqO1jOc0PApu8jfqgojDhSe0rr8Ar7hjLy8i0tNtS
	BHnkcHwfPs98WFg1kq68XCOyiWw5xTZs16J5QOR0DGwBFF223uSXBTLcYTnKFg//RWQSHAZMzyn
	XUdzZdevdLVHmtpsk9wDWzjFWUrS/IdqDA8P7Eqi6e/M39KdcXHooL4XIs1AlavM/4CJYHUczWy
	q1vSy3+ffSwSGUOx+mgFDNlg7WszEr0Xe1hJ1bsZk9uXfU6HvgpY1slW81jyRUpZq8dWxegdiuK
	S9v8S9ydH2CoSmzF1J6P+hvB0vYUCLxwx7auSqEdwBBAaiRMoGaWHWzb6FQnl9VQP9cHANn3wLJ
	bGNETUsJCFtsjdTmwHRiGCQ==
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b55249484cmr20664343c88.7.1795674300778;
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:47 +0800
Subject: [PATCH 5/8] drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-5-7cb1d1a5d6ef@chromium.org>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eeda113037fe..205838513379 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,11 +789,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations panfrost_drm_driver_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
 
 /*
  * Panfrost driver version:

-- 
2.56.1.839.g22a8290db9-goog

