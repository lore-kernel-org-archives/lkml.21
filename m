Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590370;
	b=dvFeJRxZrmoHgCq4ixxZzyQ9OpbPYoZwxzH6UrnzxvOjqILML6pR3YWxlDsjL/LhXt4n
	 yMobbLd+Dr9LC4jiHsJ3w5cjbhWfDhbXAS1RPuaxJgoY3+CUDztW1kTBZ4Iy5e/S3hrKr
	 8ObAZj35KHZrsnMSCRPZtJRq/lXvDuWyPuPuT6phMcn5+27I5a/0iHXDdpQ0XIxMJaUgv
	 wtIKVh2miggCAmtoctNgf8YF/jbcnHxC+pGZDatc8hWNJZdZyVecR4h/W4iIPzyBdBlJb
	 YRFq87K+iXSdt0L3UxiNPsFGVcDSQZiPmZmtJO8LTnokQalIsERTnILFH7g4YnSOoIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
	b=k9wsci8EwV2ky7YLcAXA3kNmonKn51wbiPSXouJ7fY28CTlD9piIfdJUYdFJwJ6USQi+
	 G6csuI9NQKM/O25xzoY0XzM4gSqKbh3o9lweaGohWGNGx8x9AueI7sy9xXJlbwT6Bgtsq
	 zepdNj6dL4I5hfGewtuau3bgA1p5ZNp4DpfCwMdJP8ytvbTt1SrfZy7cOwtAGKyhXI3Pp
	 q56gH2dwlBk+XFMgVGY9UEFT49Nkkvoqf/fHEwOo29pI7EdRWX9n52/NVC9jG+0ghkayO
	 a9afd3gWAtJsjyIuSlCaIJEzLuX3aAB2FfIIvAj5WZ1C9pccicMLSP5OD7yjwOZ8tOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOJMvyfj;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B158D60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B158D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AOJMvyfj
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso3757689a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590369; x=1796195169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
        b=AOJMvyfjFmFpvbjF3WCVVvpNfkVHjfirpKsd0ZXRBmnlJUEZqbuvGOM8BkaSsrIwOM
         HVcuPdy0Sg12hAarZ/eNmO9BIAjUKWDQnJPcKZ48cSHRqtZPw2ypinUQ0W2gVisUva7i
         xU5/0gOs/8Ju1Ou5Rl8arABaSOPVOMdsxvAwuHLbeZDw5Fd9AWbqXXn/9FKmzRCwLIOp
         0VZ9RBvCII31lkfsA1vQiOJO0/TUsQ2Pi63sj+U42EGcZF3Mru+TZq7wbaQYiqt1gK10
         lGroqXcg8vv0Gal1bnUUbhWWre7rTG2h3U/3+x+44G6Er9NS7c1qK2U0HBLWw2eJkxc9
         Cebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590369; x=1796195169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c31uTtty0UwsaTAcdqE6aehdmrsQiJywU/0e71XAKfo=;
        b=AgB2npNOTR38ief9VgHgPw5ddHrq1jzP8fPBEUqYGlo4PSI4VyzxTuBwitpaDywohz
         y45QAIImiWREXb12qP/yhd+ilnuO/uWiAf5YkV05c7Ngx6LUZZhhBSyinSCS9R6fxn/4
         Etbhhb9Wetphnv8xvvgH3eTSUCJ6O0ClPQuD4HEFQUyoQebQam61ROQC+EmtPmznt909
         rF5RFDNxISwJS6EEfpEoGoFmYBIDr16qcPqNsF8U4zSG30LRmUaLFbLnl2VtrbsuFokP
         28doOrWY1w6TO5B7iy31QrfSEo+qTj0JfXBW8xjUfy+zM3qCAoxjcErItjVHsX+1zKnK
         5F9w==
X-Forwarded-Encrypted: i=1; AL+hErFJM9g/uVqam3H6LssT4PSeYzVbO8MyW+t7OUj+ZXVK4dFFo8x7x5EOHcfpEkyLr3PX7o+EtKqrJlfa9hA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K89fT9RVSLN2O44HsVaSewLHJhqWrDiu2H4/Bfl+/x+HIjDf1
	Mh2gTZ+y32mWGUMdSJ3FpMTi+IDjxdpl611kC+/u4kgOshi2y/+hB5yU
X-Gm-Gg: AZFdTZedoGmYioy/V79IA7l+tz+0d48SMVqEqqUd5cVhzuoMkPAUF5g7LOn3POKLiQC
	hAnqE8qnDeMp+Zzis9GdBjvmbtOnIbSMdP5Pmel7jM59/d1HisvJX68p77vtISPpZqZDg8a/Iu/
	IKqp8pjrJXgea5gxDQIenBnQFWVcicBcGnLC7NkUCLM1Bg2lBcY9tjKGfYERt3uVWIFx0Lll0jU
	QvHSNntG2C+v+bHYNezpuF43sauhB4C6IwsrDUB3a2owQ6osDc3618jFta4JU6QGMms5+096ATk
	GxszhnVN0jANsnz6kO/kVgs5i72nPVyoJyK4fQvVjig5f/ZfCCFtl0NgW9evIB+uVcwSjHWVotc
	hNHfDODk/3cG3Q1/YWsSsh13eeFGIfLyoqGVRz7umt6DRaX3YCn5UUP8AYmhvxpjOil8J8yiHYK
	X4emw4Ct98gABaBqHkr/S6Le0DCtlu+4mm3qnZWJEQnuosKPdcvqXbqPVlH+cpTFlZFP4KTtfsG
	zept+TFg0H12GKH/lnG8gtQW89/uH8dYz30jLoazHqfRu4k2nisXRwk54r3TElbkDfN/bbJFaut
	B3mY86wJN7OQOBLoMAJrl7w384l+Pf1FbVL9s2i30JiyKv2s3KzUe1T5kCB/LsY=
X-Received: by 2002:a17:90b:388c:b0:3b4:1c0c:6863 with SMTP id 98e67ed59e1d1-3b41c557600mr16471914a91.0.1795590368971;
        Tue, 24 Nov 2026 23:06:08 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:08 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 3/4] media: zoran: reject VIDIOC_S_FMT while the queue is busy
Date: Wed, 25 Nov 2026 16:05:47 +0900
Message-ID: <20261125070548.28989-4-hiyoukou@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125070548.28989-1-hiyoukou@gmail.com>
References: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_s_fmt_vid_cap() updates zr->v4l_settings, zr->jpg_settings,
zr->map_mode and zr->buffer_size without checking whether the queue
already owns buffers, so the format can be changed underneath an
allocated or streaming queue.  The size the queue was set up with and
the geometry the hardware is programmed with then describe a format the
queue no longer matches.

Return -EBUSY while the queue is busy, as VIDIOC_S_FMT is specified to
do.

Signed-off-by: Minseo Park <hiyoukou@gmail.com>
---
 drivers/media/pci/zoran/zoran_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/pci/zoran/zoran_driver.c b/drivers/media/pci/zoran/zoran_driver.c
index 99fedac12b67..ec8ed5601f50 100644
--- a/drivers/media/pci/zoran/zoran_driver.c
+++ b/drivers/media/pci/zoran/zoran_driver.c
@@ -506,6 +506,9 @@ static int zoran_s_fmt_vid_cap(struct file *file, void *fh,
 	int i;
 	int res = 0;
 
+	if (vb2_is_busy(&zr->vq))
+		return -EBUSY;
+
 	if (fmt->fmt.pix.pixelformat == V4L2_PIX_FMT_MJPEG)
 		return zoran_s_fmt_vid_out(file, fh, fmt);
 
-- 
2.43.0

