Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108132;
	b=yLyBIOKD60cKCGGULLMsretIYw7C6fiHKvSMPuxM/0VfbLdBY46Fa6PwRZggjZbQ8OWm
	 Ha69dtBrAK4aRfAr8t3gcNMWQYvOQ8gcxJbiizsqYkHebOua6ZhUs+ZpOxKU2XLBGxyoK
	 JuMAAZsTDhGmcTOVzNxhg23V79wmvW+7krO9iJv0QA+I5qvxvDRkYec8QBy/YWxNCzSfi
	 JkwaC1xFmpGjmQPReCyR5kbKD+71OnXL4FhvIub8toKfcRCe/5TCIqxOEVaVF+my1y5qf
	 geugmAb3Xh3i8UDs+PjeatRo71qPDhIZKfF29jhyW3hdRCbuxkGjzJjPKY/8B9UHRSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
	b=oD5ecnw6FaVfX5bCdm2Jd/pX4j5hfkeo3Z3sTlhUFDG5LNRGtStRK+VrViAG7ngIwZxt
	 eD5bm6oFPv1LgdMTF4wtAtaC0DOybZkSslvCNIk1x88BBRYN3nmA+UbirLDNagX0k0TXF
	 udyWRJeZBmp0WjUY+KwK8e70WCg2RGZovj4Dk065LA5QhdJKtxxbE9iSqVBc3ELycOYvd
	 LLzYWPWwHJj4h0+2TrYiKufAanqtlZYc7iI+SarwZYYh8Ej1VatHeARnzmpdRu9MMyQ3U
	 ZgvWFpXehzjm3X3zmvgEyI4ro5/Rx8gcY2mm2BqPO9AWJhubIuL67wqbVoase0Aj6dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9umcA8m;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D5B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T9umcA8m
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee04c49451so32412835ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108132; x=1795712932; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
        b=T9umcA8mPjYl9rCh8YVv9LHcTncMkNdQaFt2nmy7GiGoivtrMfDHfw+TVqANN052Bl
         9WnRIRZ0LSSXzjmzv3HyE9q+WhqbVHanmaifFtzzJ42LZ8AQRkjWSpjcuzL9SN1XE4Gk
         hR8OypvnuWV7JudhqD1qS6MCNmr0Kkv26pqREAKKiRyqdLuAHobIzd/kJBI3M6bZDSP2
         gmXT8FXh8komqzC3JvIdXmyT6meQwQbemobqWiP3WAQx4lEOtCr/ElPzsOxlxUi4QwuC
         6nUx787HU+ovfydJve28RIfAJlX35e4ovP5rOX/7zUj3a1aU+nZtjT9i8pVIN8ZlXebb
         aBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108132; x=1795712932;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leZoYmjJmyNxHBhQX+s+ycI0JfAwE3smojnVnGGLUJM=;
        b=SUhrwDOLQFtH216ZTL266emRCYB5bIwGJtjlWy4fglrjmpY4Z4SJ1PZy7xutQflUWW
         /YiPJSbQFltrW9IYeGUGNq8a+KKhn0UyYw3iHzLSuahjkt++wGogLQB0DNTRcCO8AKNw
         bWtoWXirAQnb3IItJTvc2AtVaXS3MIGk4ieyiDb6OnfE+wKowJZGedG02lyEmtrJoGrn
         VdPZHrosM4ag9WrT4Q1VMaTs+nc0aqOHDsnQLKzs1ugg8q+YpMJgrzc8vDd5002JKRMe
         0Fe5tTlY/3GMJbuXLCvl1S+7kN5RHWzb9XB8wfBiBk79m0n76NSS2QJryo6UWR3ZORXU
         xhiw==
X-Forwarded-Encrypted: i=1; AL+hErHuS3QRdM8DDz6ZZDEEbu0C0mrOoz6EKwfmXa6jcPMsZomuTwUImg+/JtfkTqRkhmnpYHXAMixEoA+9DMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PAgSawU2TG0pqBgpbG7og0IxBh9HWc1Wx6wojh0KJdEJA1S/U
	S4wCzkfQ9y/DLpXQQIW8Fj7QrQagsZPd6G5pgLL3J2UertFQ520/E7IySL9/gmDpf0qW4EnLgdT
	92r+a6wqInQ==
X-Received: from plri11.prod.google.com ([2002:a17:903:32cb:b0:2ed:a98:181b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e807:b0:2ee:1fab:158f
 with SMTP id d9443c01a7336-2f03f167d4emr5365765ad.43.1795108131385; Thu, 19
 Nov 2026 09:08:51 -0800 (PST)
Date: Thu, 19 Nov 2026 09:08:18 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170818.1528087-1-irogers@google.com>
Subject: [PATCH] drm/panel: dsi-cm: Normalize mipi_dsi_dcs_read/write() return values
From: Ian Rogers <irogers@google.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit d4cf15372868 ("drm/omap: panel-dsi-cm: use DSI helpers")
converted dsicm_dcs_read_1() and dsicm_dcs_write_1() to
mipi_dsi_dcs_read() and mipi_dsi_dcs_write(), all callers in panel-dsi-cm
continued to check 'if (r)' expecting 0 on success and a negative errno on
failure. While OMAP's dsi_vc_dcs_read() populates the buffer and returns 0
on a successful read, mipi_dsi_dcs_read() on standard MIPI DSI hosts and
mipi_dsi_dcs_write() return the positive byte count transferred on
success:

1. A 1-byte DCS read returning 1 causes dsicm_get_id(),
   num_dsi_errors_show(), and hw_revision_show() to treat success as a
   non-zero return value (exposing 1 byte of uninitialized sysfs buffer).
2. If a DSI host returns 0 without writing the output byte,
   dsicm_power_on() and hw_revision_show() read uninitialized stack bytes
   (id1, id2, id3).
3. A successful 2-byte DCS write returns 2, causing dsicm_power_on() to
   abort at 'if (r) goto err;'.

Normalize both dsicm_dcs_read_1() and dsicm_dcs_write_1() to propagate
negative error codes and return 0 on non-negative return values (handling
both OMAP DSI returning 0 and standard DSI hosts returning byte counts),
zero-initialize *data in dsicm_dcs_read_1(), and zero-initialize id1,
id2, and id3 in hw_revision_show().

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Verified with a C unit test and build-tested under
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not tested on DSI
command-mode panel hardware.

Fixes: d4cf15372868 ("drm/omap: panel-dsi-cm: use DSI helpers")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index ae6e9ffc46cb..1b40fe4f08d8 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -109,12 +109,25 @@ static void hw_guard_wait(struct panel_drv_data *ddata)
 
 static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 {
-	return mipi_dsi_dcs_read(ddata->dsi, dcs_cmd, data, 1);
+	ssize_t ret;
+
+	*data = 0;
+	ret = mipi_dsi_dcs_read(ddata->dsi, dcs_cmd, data, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
-	return mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
+	ssize_t ret;
+
+	ret = mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
@@ -238,7 +251,7 @@ static ssize_t hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
 	struct panel_drv_data *ddata = dev_get_drvdata(dev);
-	u8 id1, id2, id3;
+	u8 id1 = 0, id2 = 0, id3 = 0;
 	int r = -ENODEV;
 
 	mutex_lock(&ddata->lock);
-- 
2.56.1.708.g77570a6a1d-goog

