Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674310;
	b=P5MpkSk9Ap2+d3ml9pjgv0cxcdy+soeBY26mSHHeycgiws9nTwSsHx/tMZNCWbkiaMJZ
	 w+hvUuKs5dkw1gzyl6nYI7m8GlPGsqSxgtbN8VOwmrQdiPXMIgPN22bwaYn/blYEtjL/L
	 8sQmOkRyXlytNV8kWbATq6sOkTFQSBbOaAE2u4EE++wXHC6zNsILzva73iWWYlNcrQWgW
	 QkNrninh/It0zI1k5KRkdEkUxwokORcXyIo8cpyX1WPtcDDVRd57vbgvD08t93q+WKHik
	 m0hzSfqCDzC/DiB2mLRUb/AsiM5oEgVnVZFAAZZn7ZVQ+hs4jXr26vGCAf5LHVi72Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
	b=Uz7qt4nwzlfzIArzjEu/Z4AdwjILQV71omajJEUzFr15TIz37gbTVKhNkeReBf64vRZR
	 2RG74UKrOGbcY3xhlpDi3S1szSBQY2WjQmdOicUTpIQLoudqC5A+ezPMqKDL7fYD8te1B
	 OGFJsr4gYqorD2EsFyt4aSghUUJmesYnu/mJlAeMEYyI+yLVRyJtMBW7up8jdziJ9KTIc
	 RrKZmemmlPki+j6uaLCD4zjO5P8A/ZS9SGoVLR8t3riAhmy++EOnmvqe/gXhPv6un00YS
	 yCfAwBF+EeCRf0Ol21OdrWje8CKH1CJtG0tLRCPCHJtDJkFtw/vnBiD3jZHR3bIGZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M4YeWuw1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC9606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:25:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EC9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M4YeWuw1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b546061d58so15285009c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674309; x=1796279109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=M4YeWuw1PxXm0MlRnq22rrdnvINCFUbNrfgDVZakNVVXvF3/qJB8hQZDVX6Z6HgS2T
         RzZB/unnyym9I0arXNNUrzXui9lx4IhyWgN9olICYuD6TwsUTWOkOqqTKwcAFWEToNI7
         FiyiT6MHHIBJ8O7tcs5Ko751fgJDWPZGkTH2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674309; x=1796279109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=Iq8uurOuYfVPm3H6RkisOaI7WCYRn5xQIuC9eO49ueg5HxYRj9AVWjDG8mRPIc5+pi
         Gg7vETvkZwXsaGvUV3TlqcJYn1ZXTaKvlHUwFb2/DZTD8O4JfmmBXF1LulJ9l+KJeDbh
         x5povIQfjJzisfXpckuq7RfpF7bLBWE8fEnKX/Zcs22jQ5nQVzp5h7+MuzEmviAC8Xu7
         du9X6yaMxS74aSjujXQkFTlPtd0sVgRJ99qSxzlDijxekrG9VXg+X878vce7Rre00vIJ
         +lTkNCZ2IXoikOlKa7HB0i7YwVeKkqhDgAHjI6zyfvkBqOp9bDuV8/LTAJTy9h+apeu9
         WgfQ==
X-Forwarded-Encrypted: i=1; AL+hErFumNjtIwdEe2e6jWiGgHf0GBE0b+NhA8CF8gpUV0xaV2O3pdaf/2gJ+yzcZVieGEpKzfXv0IHdQP5ICaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pF5c3RnxL9gKOp9hV7wLlxuLzRguUJT4YXjkbTVKbeLTLOce7
	yazJJcLyO5JKjo+bvPGx7t9a1bqO08DYDR6O4WWZYnADRJpAZwe+DTpzoZMErlNDIA==
X-Gm-Gg: AZFdTZd7sQNaq4SfRA4scSLjCfKiLBOLFYheWveBvtwzLXcSlY/wv4uzfuiaNQfOAgP
	ZNORiVlArkm/5RYyD85gtOJIfhydGQQQ+1u6fdsNEMrMRgAI9VRPXI5EYhQzkqUbSlrCM4yoSf+
	y7+z7bbGJuzcizf0AFJHQYYzKBesA+ho3ozZwzWUC3EW69aw117HsEuzVoF2HoVdsQOgfux3wqR
	bNvyxW3jtJIaoUCKkhO/xuZdz5UlYekrt59TrzXpYM2GMxm6XW1WqdXKm9b73wxPtoujk9jl0fA
	b9NSsA+pQrX/4EBUQL8lL3cYcQ046CyrpMfmr7f+r6vjm18QyX1/ArkH02NN3RfIi4oBxdMKwg0
	a/J2fOmItA+qHLXaXByhGJUSjVAg/auhP/1CZxP7DhWMZJicKzEf8w2EpW9pCA3BbTUSFHFR/mz
	d83XpTvzK087eVch8MlegoLo1kW70knEgKIqt71bo3hjlAgudQinJHKg8KWQ4LDm+LbjdcHTuwp
	78KEFxYEUsO/R+J9DLQRHdx9nwhz9i+ApX03cqHza1DhJOmFLfBWEI/CgyND0GcmlmK1zzeUUGG
	x/05a/RzGEXulPwT0waa3Vm9HFFAXaQVL2lRN07t2MhfQF11jhVr6A7cTkE5a3Y5GD3zZ67Tb/1
	EmZ091A8bNEvlD7QO+y0VLg==
X-Received: by 2002:a05:701b:2918:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b570d52afcmr11431758c88.40.1795674308955;
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:48 +0800
Subject: [PATCH 6/8] drm/v3d: Use DEFINE_DRM_GEM_FOPS()
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-6-7cb1d1a5d6ef@chromium.org>
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
 drivers/gpu/drm/v3d/v3d_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index b790be8a7fac..bde3561c0e69 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -240,11 +240,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations v3d_drm_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
 
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
  * protection between clients.  Note that render nodes would be

-- 
2.56.1.839.g22a8290db9-goog

