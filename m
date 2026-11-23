Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466054;
	b=FqxiRLUBbLzheZPVGGZM7EQF3+s1qz6x0GM4g0Y/TrBYnVuXzhTxObl+5D8LAgImYzP7
	 FuwvSVIsLGkSLAZknzQuwtkoGce90ey4+QFml8BM2mGlThJcL1cm1sDmZ4XC6n2Jj9I99
	 NZf6j0EIL1Gzn7c96Z31340QaB1UQQ+P3vK1pTBrDdw8wOo0qBcX7P7e+njVDmUbsP4Zi
	 y4u06vAroMfBhhj1OLGWLzPQBeqgx782BnONpxv8hRY15lV8xAhaMVnI296yNnxuCESQX
	 Qu4n8LDdstE1+TNEcgfcBw+Dm2yrBuXDXNTbohZY9gUZ9RLicAR0K5/9vJb/kHFNS9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
	b=nprKaCIqf2TIfMIDTOThR6F8WrUgGS7kVJZNCLHtG17aKCH4HTUFa9Yb37sEGkvqDKGT
	 mOFDM6QcMxbbBIZLEM2Qrpgl+8flPx0HitL+PVMHYw95YiIUkvyM9X0o5GwI7r8CnofWC
	 lq0KEJxZYNtgh1m18x/tgaiZhqsb8Rws1cbHOupZ/vkxI9gqdHqzw5EoqVwhUM6AZgaYN
	 ik8ObI6cnf5tZY5ch91E5wRxVIbhrEP3f6sSlulr+uq1oCFv2GT85X0Tb/O1IDKeevvKU
	 C7Cvqz8rxN9860YjJRTYVh/QdJe8XCTkIk/54ltoRcc0OtY5fpOfOBrNFDJwPhvfPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A88606A6B7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A88606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KvwE2H
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so24029885e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466053; x=1796070853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=Z8KvwE2HmbcjiuKTw78Oy+YNYHN8GNMgYBZwyBWDc/CS0fSAzLEia6d20eoogHK0Hn
         vOuMZc1tGZkHl7DRiiN+t3bG2IFgC252SnyjViZZKXxG9fRFGcYKfrBO+gk8UHSk3PWe
         S4iem9nIFGhaqX9NQ4Js9uiYZ1+inGXClZv/XXVbBl4Y69Qr784kcrIcx08WVIOgzljm
         plrZjF8lPFXblMkh0/Wvq2uMJQ9p88D/hQep5TZFnT808MyazsF/ICLskauneupXUkER
         9bkaRo6Qx+GEcxY/itzEn9R2ug2yuZuI5MRf0EGq41C1Fta/MjuipuTd+qCOu4na/voY
         H/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466053; x=1796070853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OR603YV4U0OwPPTqnIgdhTgPtFX3ZXpQfBjAD1u2oU=;
        b=AckwrEOceL46qi+W8lwgKrkxN3gBtuWAEQRt5JXGPJdZGOf4C2rsCelOoJcjZO3wNA
         FKBh7+G6G3xRDWyWzoSN2URhUK5l/wjgFccco7TMu+75EgUaUQrBq/RlLaqwQzbxVSoY
         G/QSlY/nz8nwn75NZ3OGlq4oaf5p7Pr3Kr5cJWQY46BDoRhOGaTajCcEZ9VDzlgOiQLt
         WTwXrzYp/c0XtINASZNGWp2B7bBdyv1VhXE3qogFA/IyiwPkYGTo76bys8lY5ONNN4MH
         uoid1CVROcIkn7jrCw+BkFFxZamkN7ZInvafSBrEehVaR4j/q/jxHp6dk8/UecyQPfJ/
         RT+g==
X-Forwarded-Encrypted: i=1; AL+hErF/v4IbG1kg1i2KH/brAEzgeJmdq0nHtPvoeLRp7E1TlkJ9MQvnQUdgjbdcCa4RJ4jKN1ZLqAUjEZH6yro=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K88NpGSd7MGidW8985l8fkfBPNTgXPnW525kal/KAvnwxMloF
	kjmP7WBpWM9yZIg8dJaJ1DzWxuQmETCZdtpHfqaSLyz6lmNufc3ZpG4p
X-Gm-Gg: AZFdTZfKQ/ghShahAyyq+hsNCDyNTEB/jM3WzGZBX2F3qEjbUgvsL1uYWTKDXrhMaYx
	cL0cPaWbIdD0kdA6A7h3//1H9yFyhah8FkmLZEWTw54KIHHYnC9MlSPzVb8TZ8CLJ5kYtLJW9Ry
	uu8RBCzqX+Z4NP8YdPyalRTu4bKiXQNXIRXf6wSZ3JpAhsJkjqDmOTSh6l4QMy/fVJQ5K1wV670
	z9Tbq815mjxl+8ADZ80pDVpQnY9xlzopBpyokFVZNZ9ifwNSfhTPR+kK66e4K50FekAwVO6E5sr
	XL5TWeOUNBi8mG7rdEFirg749FoUx7bto7pNIFwouLKWIrzcoTs7Lf09UrzIA7X83pbwIXD0GT8
	eqn4NFjMSwIMVQuTUOCiMuHjLOA2jD8y2A/TdSudhRQRfs4iwbh/6KhDTty1kL0BWwQ5+my7Z0o
	uwTSPWNsxdhEhzigWSJUacB8e1KmNuZySdbWuC7+B4Q2zur8IGLxlMYNdyCvKX+f2nlMDsEiDFz
	WZ2Rbd4r97m8xqciLzcWhqmQxOGY3wcwOOnllrbxYqeS9w+jN0qBSVSfy/OsGSv/TM9EyyyuYJ7
	q3GrUXblqL7DewqlGzFpYqv/jmGZlA==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr275019355e9.14.1795466052668;
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:12 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Date: Mon, 23 Nov 2026 21:33:55 +0100
Subject: [PATCH 3/5] media: ccs: Store the format set on a sink pad
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
Message-Id: <20261123-b4-ccs-imx376-v1-3-2b26850a6f11@gmail.com>
References: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
In-Reply-To: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, stable@vger.kernel.org, 
 Gianluca Boiano <morf3089@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=1782;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=4SRiFW3bBAJ1IlBIN9DDyNFw3BbzT3m+KdYlz1JrA0Y=;
 b=l6DYb4OFrWa8aj8hDAV/Ql3Ppfpp3sLbxSS9XESSX/YP2O41q74bDTNHZvj54ZnsZPqr/xJx3
 rqMTCmBBAI2BQpjfkeyJakYJMMHHDCYCa1+p9Lfedm9CmP0aFocujWP
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

Setting the format on the sink pad of the binner or the scaler only
updated the crop and compose rectangles of the sub-device and its source
pad, the format itself was never stored in the sub-device state. Reading
the format back returned the one set up by ccs_init_state(), i.e. the
size of the pixel array, and the selection rectangles, which depend on
the size of the sink pad format, were bounded by it.

Link validation then fails with -EPIPE for any readout mode that does not
output the full pixel array: the scaler's sink pad format is the pixel
array size whereas the binner's source pad format is the binned size, and
there is no way to make the two match from user space since setting the
sink format has no effect.

Before the sub-device active state was used, the active sink format was
stored in struct ccs_subdev (sink_fmt) in ccs_set_format(). The switch to
the sub-device state dropped storing it. Store it in the state again.

Fixes: d8bca3ed1d70 ("media: ccs: Use sub-device active state")
Cc: stable@vger.kernel.org
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..a4af27de5453 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2275,6 +2275,9 @@ static int ccs_set_format(struct v4l2_subdev *subdev,
 		      CCS_LIM(sensor, MIN_Y_OUTPUT_SIZE),
 		      CCS_LIM(sensor, MAX_Y_OUTPUT_SIZE));
 
+	*v4l2_subdev_state_get_format(sd_state, ssd->sink_pad,
+				      CCS_STREAM_PIXEL) = fmt->format;
+
 	crop = v4l2_subdev_state_get_crop(sd_state, ssd->sink_pad,
 					  CCS_STREAM_PIXEL);
 

-- 
2.56.1

