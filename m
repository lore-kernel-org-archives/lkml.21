Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636257;
	b=n784A21vXZJX3hFWi7NPhpgOzaC8NLw4dyNPv4zEAEd2EMzEq4BhRpHaWoN3sI93q/4w
	 JohaxxBmU0IIxCfDlgb2kOuLkhFj63a4J7yWCP79rAXraqFCenFPWMS2OOTpMKVvR0F6/
	 /EqIz4U9EvOwmGkVe80TChZhW0j6a/sEoTmWYp9LorGVdYKJWM3xOTDG7QqLnIHFncjU2
	 nNgQcDU3FiTawG/hmTTF9zBBpPBcBHj9SyXrVWoenp4tNET1nIuaSJF/3E8wE6lMOHkUi
	 z68cxKjFV/MDYB+KYCP64RlhWFXKrpIWPtTdbm5tptPk4jZCOJfcuRcHEpEEGhozuug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
	b=HxwBgWp4KgZ+E93C7/9wwg3uMGXPULkh2VszkLJcZ5jmt4rX5Dg/0jhSBPKYpDH7xaHd
	 2zHhKc0KPt7FoPRARia2fWRlcB112bWQ3usG4Xc8d/IN0Eq1UEGxajeIRJwKKV/pP94LS
	 5fsWiNFfnIvDzDUzzP+DxxXDcOAUsBtiWMevd/0+MKHcdK+4cKMEMuj+7HSJ8VLoCj7fN
	 AN8fOQlZ7Mm7BN/X/Uf/NVRZnsSiKpEi8kHM+hWpT1ZP4QQhWJ6JV92XrmNtGw7grRwYQ
	 L2F/1i6CAbqPhNH782OiN8bWQIWmEUUhxiEHFNLqeP8QFAD4a4EDXgDyipEcDzm5PLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2PFv0l6;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDF606A681
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBDF606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2PFv0l6
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4932b13c4ccso3497110fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636256; x=1796241056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
        b=v2PFv0l6OPudhCfDi6Y+NqNFWvn8dGkGt/YsK+k+imhZkvnl0Hqgo0HN0t3OJktqve
         DebPyHsKdN/ZLIteIgDnWxfiTOcVlN2o+Q7Y71pbK5F7n0+f/DySbDHipqYSQTRaIez/
         qntaOV/+x0Qnj8dyVemhFcpgE3VPmFrjX33wgDqdYSux2yep8EhGvrHO6O4Mz3YmWqI5
         PNWWb2SZR/DpNBfMwchd2CHMz08VyqY6Tv4joOqV9nputWYZUW5YccwI9gM2to1RuQMG
         K0o57/XNlvucej0nPHPrhwDItp7M9xN8zeDTLZBX+g3YPmRv8Nt65Ojn3djPdu3CMgeE
         RmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636256; x=1796241056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPnxhmlYfB/5e13ND1JsrZD0QHbGBLqSmWEbuVGGmkg=;
        b=c7ShadkAF43R/V+stojQ3us1HFMTquKeKr3ngkXaU5gXGBPg1ZWb7aVzyDGmApX78M
         SjAI+HtVDZCk4oATHBbmfQe0NO7SA/T2L9WuqXt8ZSyaqcDTnZ07NpYjVPtxPNCrKvLv
         XCRBFQ5KesfyQfxCQAwCvoBBBR+J9ciXdItHu7B2i4WRW7dMVbaliKBge2w2x50ot1wO
         SoRkUPqHzxA6/5kH5naW0n+GyaEgkCVpyhGHuBRPJPuhKJ4f4CqzjO+sMxX4f9UUQ1yH
         53xIIJvNl4iIvRLX4WPYvOO6psvT/BM2jM2aLKC1Pgbi50zId9uuGaweQthK2EYHLhO5
         QaXg==
X-Gm-Message-State: APuU4Z/3H5w6vfiBTCirk23yYHR2BuGylrBg3nDRvCxroQ7PVlWzGPkC
	YHlJoUUEWDEparL0w1CbNg9TnZ/B7D0EZp71kY5VQBvmdEoDnBhdQ/U=
X-Gm-Gg: AZFdTZe2F9hC2pclVhPzPSKSyh1o9tx+85gawB6nVjfuyB9flPCCxyvT5raQ+STsN0q
	uGlJSOtJaaJwjmkVm9JHk+29pWk3XtHsOnGwrYZHmuWm3mobl1qsKVTRkw3rdxNXKHLF/rMHQay
	QGfZcmfJ88+tusmzJKPJTvAaj3BWkMPWLbGIW8UX9rXfTMVlIDSuf7o1YOhewz1oRKC0Wayjj0Y
	zAsWwztCy1esj9C9zLHH3iribnZrW6QQo90bWeC4QxJfu/k/F1rNqUVlVPfvoVvN5bbsLUpfKxu
	8z6hgqmgUDUxcolsIzP4dT+rJHWTH6EDx4yzurZ0ecgpofV9woOGS1l/lnDfAAVMuj1TdGN5DjI
	sX4APVOo3GNzJFzEoiQR6eTVfGTCkPejK7MRQPSVCN9pceP/HHtcR0+W04/NEvyCOueGW1VYif/
	P69z1lu5usrnVMFRGu2hjpJO8S5hBT7gqcZLxFomRxNsjpj/wjcChyWFAxXSV0gcjjKzqiSqbkm
	8mPPoodXMcfQGjhSUl9nm1i50v7e8tO6jv4151QgVCvTvcVfRnpRYhw4mpfCcHjoDDiHltFA751
	3/B4KaTzJPLhky4Wzl7dBspiB4MLgkZJJTBbs7EPIkQE3iFQquzen1FHzE6C5xfqwwOAh1RPz6o
	+cA==
X-Received: by 2002:a05:6809:1d1:20b0:57e:6f22:6430 with SMTP id 5614622812f47-57e6f227deamr1069244b6e.3.1795636255691;
        Wed, 25 Nov 2026 11:50:55 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:54 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 05/12] media: tw9900: program all mode registers in the PAL table
Date: Wed, 25 Nov 2026 13:49:44 -0600
Message-ID: <20261125194951.19072-6-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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

tw9900_ntsc_regs set VDELAY_LO, VACTIVE_LO, CROP_HI, HACTIVE_LO and
VBI_CNTL, but tw9900_pal_regs only set the standard register. PAL
capture therefore relied on a runtime resume having reset the chip and
rewritten the init table since the last NTSC stream. Make the PAL table
write the same registers as the NTSC table.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 42fc2afbbc77..6309d9eda243 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -112,6 +112,12 @@ static const struct regval tw9900_init_regs[] = {
 };
 
 static const struct regval tw9900_pal_regs[] = {
+	{ TW9900_REG_OUT_FMT_CTL,	0xA7 },
+	{ TW9900_REG_VDELAY_LO,		0x19 },
+	{ TW9900_REG_VACTIVE_LO,	0xF0 },
+	{ TW9900_REG_CROP_HI,		0x02 },
+	{ TW9900_REG_HACTIVE_LO,	0xD0 },
+	{ TW9900_REG_VBI_CNTL,		0x58 },
 	{ TW9900_REG_STD,		0x01 },
 };
 
-- 
2.47.3

