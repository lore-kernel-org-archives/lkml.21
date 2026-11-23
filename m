Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445176;
	b=HqSQkxOogQxd0xIbk4lGZG9yPfiBA7bIUI+LIzZr36ADdDMieusXLznSB2ZEZJZce4UJ
	 FMbDvht2ElBi9WF25IWt54e08hw+r1Slyt2qtVt6quvdGDEWbhw6eLYJkybT24tYEYCZb
	 CwYECl1uqRFF9niVqeaMvu0xtGZfw8TPqmlcwFbsmMy06M3+yFvWcFfnqaoeRi89hxNFL
	 kXwLMPuxUKg1Jdjy++UWU6VVObMMUYboG5VbJslA8MhcovY07BYDCKBjWhVOugw8gOAxU
	 6a3huXet1cwqg64/2JyZuvSr9KtHn9vTc11pkkY5HSXDgkbbB9aVHjAVd3+4mHUBseg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
	b=30UWya+oZlPCHYyYtvE/w+msa4zxgUs9T0o+q3/yTuzGRPr4zWZD5/cvGDOSWi/Fd4bU
	 PeTWynsaFBQwlbPRIFxyNHiBAGcc8VQ1wNp9OPYKU5ce9FIJ2mz1xFW0fYE9HpaEaac7e
	 ooisHn3pSIOV6ATkp7z2TSi6EL4q/746szL0A0A2br7Uox3T57o/KiTEtzrjArQesHvKl
	 KfmConf5MqSDie0Jhqi61XttB7EFArDk1cMvjRA3dPnMIJZmhvZfu1ncaJVpUNONlRTAD
	 yC2qbksAIkqeQhMLa+YoW5SSFTOkE67rgpOCoG+V//YQkskU1eBot7fuKDDuI7jXqLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmBRlaan;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBBF606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BBBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XmBRlaan
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so28354815e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445174; x=1796049974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
        b=XmBRlaanp/S3kIuOv91ohJWgJipziW15raw1EUrIzYECHSxFXZzCasv+Vr3nzifK2J
         kINRYH1X5XcvTdf+rG7PNYdRGgz+0OhUYKdvhDQTvt7zSpmeqG7lEFhTMJpGV1MKE6Ta
         X8KadNhDzCUZ6wVSU9AY+3Kdrxzomk8MOYzwcm2SjLieMDhIm/sYAp1zUdoeUic4xJXi
         yLo8Yv5ilGB9zfvyFm4c7kl2cFa4PENYf/jdOND3E3/wA7ozXcnvl85fV/YNmf5IjE/X
         RhppbY9lk+f3G0W6peO3ztORYrLshJ5j21CDxWibBsHDZ8AtfShJ+95ymrncfJAkb89o
         xxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445174; x=1796049974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/Rw6c+v2xkYoeB0pzZ3YgrcWuL+BxFAVTdnLu9enUE=;
        b=hPHHzi0Hi8J4OGt5FhxS2WRlM1GxRyt6rH5es5E8sk00Wt/wzRVUpGRztM/sbVl+rk
         3Nw3N2T+dhs/K6caLyUj0jU5nIiAk7GGyMg/yvD79fKqGLjrPkoSHprqygc6XEeua9CF
         wAzFSWNlUfZ/HWfWFh7DBnMZDu8EWM1KK6oWBeqMHPvHvSqW6wc5p3EaqPvjxglZxSv6
         DaHAlKgcrOuzUhiysoOrK15KTS3eYWWn0amfjK6RWGpBvdsTaNnbzsB18vzYyS5BH31r
         iJIfFN/g5aO8PhBoCRr7/xJu9MMcvcPLgAqwcHPEqiIUd8B7dJzO0tunsZO1xSnQLHv+
         /s+w==
X-Forwarded-Encrypted: i=1; AL+hErHnxjaYGew8zggJIrrm4BvJmDUeSGKUFQAtXbotOeZIULHKriTyd8AMQPvVxohPQILAY7NnV7orHwAcFnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dG84hx2OkhRZ5TTwsyPuGa5fEs7aef42/S+nHuRn0NcEZxWeU
	/3hxAB/FFh3qT6HszN5tgDGB2jKuv2YZRed1K9sTYLT3zHkHksoOoLW3
X-Gm-Gg: AZFdTZfB6t0lrvasrMNmjotnXcm594ocn0VKa3bTfsQINHWmgQPd1c3M5NeoUfUsfpa
	tZtLMCY0Qgvvoc3g7Yc0mXDPwWxNe6jr96P78YaYplBlG8uOrG3ZXNMy+mdSyXpX2mF9DjIiMZW
	YpRuHeD6h048HmzUCY6sv79F5iPsZ25NRPAjWA2qDRepOeWeE2r2hpTf5aWd6vmPaAQBR1PG4LK
	atVe96onC1APXhplwE3jsWcnSdamTtRhQG6uwWKTx4OWMV9Nf6UzgbjfHoLFvK90VoKfjH8in/w
	sBHdlllRqJokwnhKRWNK/6xSuFUF5VpnH13BK3MAQCyUwfPH2VqzgdMIU2hC7iXuUVztZ7aQafb
	xoatX/hXwZZ70sfUQm3RGJxOswYoYtU9aG/wgI2VX0/d1MWx0S7iItzZB+5Wfq+PHhhxJ/NGnsL
	txOQOSWHfH0QKLfF+CJtzmKa74CcXjtamLqVgNgqTzOssbqmJ5c6WELamHXjKdheN9030k4Z2Ys
	Sf0Qu2DlYfemqyuBDp0gdO3+N2Qi2iT85/P5hxh/MFkK26D+LksaGJMWbi0LAtIVw45beYmToQy
	QU5CVXwPau+I7aGJyflyaqbsmspfj6NSr8wqB34CRSY5HCDzaC87LSewTIJvmYRSoACNDD9KJm/
	03QaHpG1noQrEraRAV0TQ/Kvv7lCcBBc=
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr282302765e9.23.1795445174301;
        Mon, 23 Nov 2026 06:46:14 -0800 (PST)
Received: from Alone ([2407:1400:aa0f:8050:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm24104820f8f.33.2026.11.23.06.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:46:14 -0800 (PST)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] staging: greybus: uart: replace IDR with XArray
Date: Mon, 23 Nov 2026 20:30:56 +0545
Message-ID: <20261123144556.72471-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The IDR API is deprecated.  Use an XArray to track tty minors.  The
XA_LIMIT range covers the same 0..GB_NUM_MINORS-1 minors as the old
idr_alloc() call, and -EBUSY from a full array is mapped back to the
-ENOSPC that callers used to get.

No change to the tty interface or to which minors are assigned.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/greybus/uart.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e1b73db6a..d7a136fcd 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
@@ -66,7 +66,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -341,7 +341,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -358,13 +358,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	u32 minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	if (ret == -EBUSY)
+		ret = -ENOSPC;
+	if (ret)
+		return ret;
+
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -374,7 +380,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -991,7 +997,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.56.1

