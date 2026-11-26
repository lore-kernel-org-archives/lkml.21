Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674269;
	b=YEDjKMuKwS2/wKM6P/tpR1ZHGowv7oyin2l3I6PwFXOoJcBteN2jwz8fWjptLcUoGi5H
	 kDRGulEhlgJ9yM+ndsZHExcHxBoDJ8vjQc6ZGJlV5sBJg2SlO/OnYMrEpWoIfQ6ayHlsi
	 ZH523mG+yBg7+jUBTzBcaSBPvHPYihxhLCrxQQSYZcW8KC6s65hwYOhnbhffa28keMciL
	 fL72GbjZu6nlYIdMXS4v25XMLCx+5b7czQ88MssQ/TjjpW6lKZLuaHJFZ63VXSNBdoai4
	 9EcDuDnpQPva1iErMxDzXk3uPe07fsurJFs+VjUlYqanPz5z42Allv1s2TYdwtETNRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
	b=DnbLs2g4Lq5WSh8cTbvw1FDoOHwXwtu7rdWiesFQpKg24GApqQeaTNZJnI+MHyPixSu5
	 I3K4WPY0/cjfVGygPcArapHlmWLShtTiFi3dUifVtwVrwMITY3YqFkf/xHIt02WrAWWv1
	 lAqJY95WDzhdYSv7Ihu/DnLe2jIEW4BOzbT5if6dzkGW3DblDMcfpPujBCjHQ2akLkw9c
	 tcTKtAuVJ+eEU/mXsvgkEITuIdrCYe0IVsmMd0hMGkCMHyObsp/8sKEMuJ/DbjkU7SOkn
	 gTu4uTjwnI0FCb2lKz4A2oBfV6TQOv/ESyO7lIOZgpMzzUCqW5ZP6/QcqUyLJ5IuGgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltL+DhQ1;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB501606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB501606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltL+DhQ1
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4854845c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674268; x=1796279068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=ltL+DhQ18GwagErLqFPosKgi+goNKBOfMebH+bAYkfSLOK4/+WFExtNh+fbsL9OkSf
         xdOOI8uDEoPf+/dWzyOMSzMi8bRoT+i7PTOwdyHlmnBdOkHAU+zCJoB0BjyOwgMxlwKl
         c5xiUxGNXWCQvcHbzP5SoijhOFhdyRE6FX4zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674268; x=1796279068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=24mzZYnSXWtPBXEGQWdrJTQd5KPt936jWJ8bO2CIB41NmLxETJQcqZI5FOt1X877W0
         QT0G7nX6coLITSQXyfvCpkYfLCpqPFTcC1EoSME6zutd8BDUMYMTc+JOuSeL3yXmkBMc
         ZGv0djqOhxDqYdHUAvJIbYXhH/UbmjtWrQbIC83mymLBBM0pPnWqlYfB289ANge5eEi/
         A5BdF9+btuOcsM+nc7Ai723wXzZa8AkGUbdZFjsWheXrPcb7PyT1ltLqlwuI1JtKs7uT
         FqN+vzIJLSK1589upi8byO647gnh3XoorefGHbj4uc5f0378ID//AOuzCPLBKUAZp3+r
         /gfA==
X-Forwarded-Encrypted: i=1; AL+hErFTK0tEENF2/BHZQ/Reks0gokITUe0DPZCd5OWBQMGp6mVwlal89baRJLbaAqk9ePYBfQRt7s4flmBwoZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1UlbU+OodZNlni3G5MULwjSl9rDoq66Z0izH6XPI1WIxWVzfq
	P3UJNSlx3fQT072MiGMbElM4mBKCcPq6LsDPi98SV7DnwpzuXGw23E2e2LLo8xUfYw==
X-Gm-Gg: AZFdTZeYraNVNqUpygha3WNkyf36AyEeH1gnlY2EQtDZg6h8X7t+5MRoGOXUiT7p2jl
	2VZZHcYxHeUeaKq8zz8yYuoJlHRsxPhJ+WiwgosaJTgmKvKnNlbIcnC0ODbxJ/vEM8l/P5Soh/W
	ZsNNhyktT2HLGrIy0ZUC8IkFM5+CpGXiwyl3jWc3KloN2hwV1NULBX0/WTYPCXgbjFOXw9hGqz8
	/ZVtHSxmBtyiPawvLo4GPNIeCjdCxuEcIxrhaKuIIXXzpcsWbtIAvBuVbiYZhdWbR40KLO9ZgP+
	sDayLMrRp59kFoQB6/InREBW0DwExjxIlJDbKaTUrVZWpv7HY1cEwElngKalGp4A3Trx761CkLM
	LLN2EGWdDwgLGZRE5sc4HNMPFWWqUkoZ0sAfizN2CU9b4yICYgzcmPN4uTUQUP9ERx4QQ7PKtSu
	y5ryZmkx0DQ/v+qqXHnDnv7HidYq1tDdiwfjPOhrJaFRVU6OmizQ0f0t++yY4z2q4zkmawNM20i
	lczRMKbXgbhZJ5TFR3sK/cETxqGYI2toZ9d3pcB5np9MHv0spJfWv8z+YpPGyGzjKiCJw/ydi8i
	BDCgVulwgthTzDOwwZXohEx9FINbIBHaaDsZw2RmwSye1RT2D9IBedL3OhI1mQwlKOOLcqA/D8D
	FrYqOABPL8I4ETbVtevX7ig==
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr19652296c88.4.1795674267942;
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:43 +0800
Subject: [PATCH 1/8] drm/file: Define drm_show_fdinfo as NULL when
 CONFIG_PROC_FS is disabled
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
Message-Id: <20261126-drm-fops-show-fdinfo-v1-1-7cb1d1a5d6ef@chromium.org>
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

Define drm_show_fdinfo() as NULL when CONFIG_PROC_FS is disabled
(matching drm_compat_ioctl() and drm_gem_get_unmapped_area()) and guard
its definition. This prepares for simplifying .show_fdinfo assignment in
the DEFINE_DRM_*_FOPS() helpers.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/drm_file.c | 2 ++
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..bcc1b47616c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -961,6 +961,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
+#ifdef CONFIG_PROC_FS
 /**
  * drm_show_fdinfo - helper for drm file fops
  * @m: output stream
@@ -1003,6 +1004,7 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
+#endif
 
 /**
  * drm_file_err - log process name, pid and client_name associated with a drm_file
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..6fc3d7060f30 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -525,7 +525,11 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    const char *region);
 
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+#ifdef CONFIG_PROC_FS
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
+#else
+#define drm_show_fdinfo NULL
+#endif
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 

-- 
2.56.1.839.g22a8290db9-goog

