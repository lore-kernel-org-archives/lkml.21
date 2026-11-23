Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450772;
	b=Rdm9Qy+hiFKYv9QutWjug5ovZYQpG3iy/NELRkJGkPF/sbw62KGN8xeh8zxeSZ3HWOF4
	 FoVcQh9H8TFVhFP9x6DRAj5allLow3wckSHSqSxAk3R9W6RSAE+ztse19qRwyoU3n/LjQ
	 zagr3938C5u9z6yaiclVldfxf01RY0ag+sCD6snlHlOvL/fpMrEzR7m2aPX9NyygLrMHm
	 IiGkxSvrwStONVivOZOT864us5J0htkMhNSM14u+7GWvf+AjIZf3GgJRD2t5tVCaXlReB
	 rDveisLAw2EJjwrRJKeaHZD2XCAzJxp0BQwsLajFS2GZevPLO4UEAA7Lrp3kgo1OPyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
	b=ipj2A4Nq6Dl0X9YfPvQX+iwzzakJv251DQysd3txWh/ff1xkIv8RYIxbZW2oO+wO99gy
	 1OjKmsRA9pmNsiBP5ui+FHsLFNRoiWbR849A20wDWKlaAyKtkdTWV3jpdwB8ouqM030Pg
	 JfEUS5W3KZ1jgTT2IiichqjRRrFB1+LRZIIKeqYPjPhcMdYT4HkebfwLjUUoP2qvRpOFe
	 J1d+lQC5iYKLCkX+JN29HSzqlOH1BSlZVepgr8iB8CEhSGXWZDfrkfaQL0zkEMYaMmQow
	 /8Hk+mFJ/TW7AXqP14Z9arg5f6NLkSC/V5X+HnqCnxYrOV5epzXft4P76IrYXgPP5yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3HE3anr;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2199606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2199606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3HE3anr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so2446607f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450770; x=1796055570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
        b=J3HE3anr17CRfmjbr4pYFXmqMFAxO6vTBN9siso/42jwueDIz3Ror5RHxzCIdQPHLY
         hef7m2ym8srdpC236g19L7Xqj9nSyHpsjhHGA8wHSSMqswuOyJcKT8HIZo5JjFnu9Oax
         w4BoNSYcXS/9qPInL0CA7ZaaDSE3ncQNvXIDxBBxtsqcntekfoW6WA4AOueSf40vfR4S
         +u3R6bYHolLAZA0AFGtxli/oKaVJ0zTXXBuyJMQMO3fSO/JfNpPAZuINSCOffsjOdxAZ
         dc7Zb50h5ngIgUkDBzk9eJBThIrdYHDbLERaa3Sq/usf5xjER5+9OTWBs2Iu4gGOxLwV
         6HHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450770; x=1796055570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1NlEZrDBkcD8Q83Cfn+yNtsJtw5oz9oIXe3UlhpKnQ=;
        b=Foy/PY+FljKuYp9QFqjoGJtIM665Ecgf0eLyZXw//gqdz1OR7RSVd8NpERD5umG2n/
         zdzAxp3/ta9RZTxH5Vu13z6+PsGtzZ3h2UTTmies4O/x/6EajYbdXNSs67/G2mfx9ruP
         CMDAzCGsu9t0yXP+MFj77TdWKMhdSa4IY1tW9DLMQFlKw/YiR8NrBWCHlBZp+QfK6ZxH
         H06gNawBgHHc4QkamrLktbzcWj6TYEVHn7Tyjs/YLU0xGlHaXIaICEbCzTGXJBeOr+K/
         S/F9xMhQArMn7eSe1W9Gw9bDYN+6QC3mpHkR8gA1cNHk/+p55qW9OHG7Fnq2zPfsSuc9
         Zx1w==
X-Forwarded-Encrypted: i=1; AL+hErGmcofuXyNxMpEvro6TyAfJqfkBpBNJxFuBJ3RQbdzXG/dDkFZzqgIcHheI2dRgHc98OepPH012aRo2JQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EEE7+SQDfQnvVtEhpxeTPUwa3P3CIvGJn2yoeOKzYI4QO9o6W
	U0p2+zvWrH49xyA+IVzxMtDQiFMyB0q4BxJ8H6CVWB8Iz/LZI3zV3wPg
X-Gm-Gg: AZFdTZchn+TdLu7uqxKDW2K06tbZQ/2aD5JSsRBKwDZsF/S0qIDkQPt9q/Q/6grSiuB
	KdDzQ65nzb30k747ccI2noLHfmjT3eGsnVr+H68v+ke0zJbWK776SKeZLfUiLcWla5P/gueSPJa
	PF4D9HxjfTPLmRWxGL6Ql2Bfx+QUxKRv/24ZNQmZE5hpbQf5no2CmwK1GDNWKdO79h7CIiIyRII
	wHrH9bJj6nioK3pzLSHnop3a8CW1j8aBNMtiDr7trGDkj+K8JFmF2lTPyVgfUfpWoRDSA35zzhs
	pq9VxIZkFhcrnV0R/7q7B6jZ1WDivqXk+fVHG/eQnl7Hv+Pi/0KBpG+cltSANmKl7fTRvTZBYKY
	5Wek2f5u+xhzCbxK+nl6ETs6FghlyKF5/Kj1UgoFUTqxdoTroXZ65cqFjdvqDgelsyvfwJbkqd3
	LoKdMk+YGA1uo6EffHzyQocf4PcItYDogQQNfSfgoPKA5Q6VNNqK4vJE7csnSglh8w/8+qZ1k+0
	kcjHuDUDe9BMWdhBTzphp/oBzEh0ZG5gsno4xYk1Fgv7oxYege/I6ewUo9iY7iKTRjGQQCTY+g1
	txAcOa5TXSfbIo64pEpCAopJIkPEN3MAIjy7NJghl2EeT2Hjc+N+oruuc9ZE9lu2/y4xme8t5TS
	FKmBvAyKFWKl6flN0zxcBUVkUmFbj13bLItndX2wXxn1IAXTDpgn/fuIjy/djl3z2KDD6nH6WrA
	s/
X-Received: by 2002:a05:6000:2282:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4aa4e01e1a6mr30798989f8f.1.1795450769822;
        Mon, 23 Nov 2026 08:19:29 -0800 (PST)
Received: from 2a02-842a-e30d-2a01-e309-fec9-0c54-1c6e.rev.sfr.net (2a02-842a-e30d-2a01-e309-fec9-0c54-1c6e.rev.sfr.net. [2a02:842a:e30d:2a01:e309:fec9:c54:1c6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm22323000f8f.0.2026.11.23.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:19:29 -0800 (PST)
From: Valentin Allemand <valentin.allmnd@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Valentin Allemand <valentin.allmnd@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: i2c: ov08x40: Fix burst fill writing past the end of the range
Date: Mon, 23 Nov 2026 17:19:10 +0100
Message-ID: <20261123161910.31956-1-valentin.allmnd@gmail.com>
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

ov08x40_burst_fill_regs() sets the length of each write to the
adapter's max_write_len - 2 without clamping it to the number of
registers left to fill. Whenever the requested range is not a multiple
of that length, the last write runs past last_reg.

The burst fill is used for the two cross-talk tables (0x5a80-0x5b9f,
288 registers, and 0x5bc0-0x5f1f, 864 registers) after the mode
register list has been written. With i2c-usbio (max_write_len 4096)
each table is filled by a single 4094-byte write, which overwrites
thousands of registers past the end of the table with the fill value,
including registers set earlier by the mode list. This shows up as a
fine 4x4 pixel grid and blocky patches in the image. With an adapter
limited to 52 bytes, the last write of each table still overruns by
12 and 36 registers respectively.

Clamp each write to the number of registers left to fill, and loop
until all of them have been written.

Fixes: d0fef6de4f1b ("media: ov08x40: Fix burst write sequence")
Cc: stable@vger.kernel.org
Signed-off-by: Valentin Allemand <valentin.allmnd@gmail.com>
---
 drivers/media/i2c/ov08x40.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index df2c63d64e62..4ddb202d5c32 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1461,22 +1461,24 @@ static int ov08x40_burst_fill_regs(struct ov08x40 *ov08x, u16 first_reg,
 				   u16 last_reg,  u8 val)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08x->sd);
-	size_t num_regs, num_write_regs;
+	size_t num_regs, max_write_regs, num_write_regs;
 	int ret;
 
 	num_regs = last_reg - first_reg + 1;
-	num_write_regs = num_regs;
+	max_write_regs = num_regs;
 
 	if (client->adapter->quirks && client->adapter->quirks->max_write_len)
-		num_write_regs = client->adapter->quirks->max_write_len - 2;
+		max_write_regs = client->adapter->quirks->max_write_len - 2;
 
-	while (first_reg < last_reg) {
+	while (num_regs) {
+		num_write_regs = min(num_regs, max_write_regs);
 		ret = __ov08x40_burst_fill_regs(client, first_reg, last_reg,
 						num_write_regs, val);
 		if (ret)
 			return ret;
 
 		first_reg += num_write_regs;
+		num_regs -= num_write_regs;
 	}
 
 	return 0;

base-commit: b7ac871daee981f1963f632586ff9b9d898ce5dd
-- 
2.56.1

