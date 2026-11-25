Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645550;
	b=LY7gUW1wCbkAVZpEBVUh6h+ZJn0sGDPhJ+4VltQr8vbMQWK3IH1HwWAcN+AgULV065Vx
	 265HGbexmOrUFTk9yVPjjeCpjyv5QKSLTc4A0BrZId/KAexoxEVd7jAuuQj4kLvKFNWzS
	 VwskIlFRgHKoa9tWcvqkFplsRapi1DW3LW4Dll4b43isBpus64dK5huUbk75zvlaCuXdn
	 tcTk8VXokEB37tM41FXFi4aN7E9bL3y5eWk0nLf6hNV17M7o1WXVamr8X/sEeukZT2VF8
	 wD/E7onREfDcyeXpE2VN+Qdehgg/PZwkMz2k7/yee8lfE4c1zauhkvd2rjNoxgmd3Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
	b=M9DVaDwIFTs9zvlbOkfWfYIkjTPiQVZI8g6hDl9ohOiDt1XdV+Ax28PurHEANylPqQlw
	 Ywbqms6//VcfdViq5bN0mmDdVO+5uU3tqMAa0eu8nk9LO0WyTpJB+f7lgRd3yhc4b/llI
	 a/MOGD05S2Ogcudpn+iAlgqGKUIZlOG8ZDt5PUnags2zt7WTp2OL+zharUuU4cHlxxUtz
	 mRdDDuxMShgn9M2OC+rM/Hb5Z2Q8PxOGDiVwRnCXcS8GoG8EKLBhv2JHMlmkMuiK88toj
	 8wbSZgIGYi6fWdtu9RhQbuq/QaGPuXRPEWhzmyHjAYMZTYfHCf6riZB4vngsZ0KxMmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CHJL3Znp;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7AC606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7AC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CHJL3Znp
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b587ffea77so705810c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645549; x=1796250349; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
        b=CHJL3Znp/yHZn1CQn42wgHjRSGWtQc4VpnImiVX4Y2n3FR475hfbx/EMA0cHKmfFLC
         tYtnpjlw2xmKbPB7F907b3H6nLQhobXdBsQiv8oXnzilKZbKI0P8aXQiZRtd+eCuyHJC
         dteSGYxIv0jrd/QAgzvPh6pyyhD+xyxxlSM9pPvmnPgnEC4CiHhHDevkmSYO+UNttare
         HTt6LW5+E66KK3bc4WcogQkHq3kLTJYkVJDQOq8eZ7VqvRTKQn+qEoUikFkmg34un+Jn
         arL+hQa0cb/DI3fHy/8tC4oXnoJR3MgrmdyoVBYg0v6zOtUEf4hJdRgZ8+SAdo49UnQc
         3XZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645549; x=1796250349;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ue0clycRAKMXS44rtOTwgYfFDRrhexAInqWIAQ+09Ks=;
        b=HCTIo9U/LquJk/Z1/YrhF4MF9wXJZmtUWb5gB5TUE4avUdYzqeFB0XFqOgTnhvrWyr
         WjObdZuVD0dKEmIu07iVcK29LjPPVkMMY6+YjUOlVpCrdKGuZK4kHZvkACoNpXtEyX9h
         q3zsoHZjKJYETAt+suXEtVQ8NL8D5kE/FQ/UtqqmrIDo4pTka6VBxr8d+gcB0R4riyuz
         QO3btja7bTrbkVMp7cwgXW7sSU8yJh9o+G8+IPddXRmT5Hj54QcWnZFVGduIGM+mBYzu
         yLEisvlMyyITdmUF3EHf/xT8m6Ze1GUK7sCefEYWxMFf96l2sx1h+JW+ND4sSKVK50YM
         9Grw==
X-Forwarded-Encrypted: i=1; AL+hErEa3Cm3NHSNIyPByPQgpvzxIrBU8McteKpvTwWBlU0xYkw7GW6E8ssO2yZ+igTA53bHUQii0MS1GA/3TP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WGMRHjwWbexh0wbF0zNsveSxa3Bx6qMMPWLD8lBN2GQMHppe9
	Nl3Xn/nXmq1fu3/G/b9gZYwJV4jKrihsro4slUWRex+2XtTeo5wcC4aooqozGGBkLIThfjRahKN
	mpg==
X-Received: from dlbds15.prod.google.com ([2002:a05:7022:250f:b0:1b5:3561:2fe9])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:10cf:c402
 with SMTP id a92af1059eb24-1b5568a17d9mr20769440c88.10.1795645548479; Wed, 25
 Nov 2026 14:25:48 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222536.1447211-1-elkin@google.com>
Subject: [PATCH] ASoC: zl38060: use bounce-buffered spi_write_then_read in bus write
From: Elkin Cruz <elkin@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In zl38_bus_write(), the local stack buffer buf is passed directly to
spi_write(). Passing stack memory to SPI transfers violates DMA safety
requirements and risks memory corruption when the SPI master performs
DMA.

Switch to spi_write_then_read(), which safely bounce-buffers stack
transfers through DMA-safe heap memory, matching the pattern already
used in zl38_bus_read().

Fixes: 52e8a94baf90 ("ASoC: Add initial ZL38060 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 sound/soc/codecs/zl38060.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 02757ae2b58b..fc67999c84e4 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -534,7 +534,7 @@ static int zl38_bus_write(void *context, const void *data, size_t count)
 	memcpy(buf + len, data8 + 2, val_len);
 	len += val_len;
 
-	return spi_write(spi, buf, len);
+	return spi_write_then_read(spi, buf, len, NULL, 0);
 }
 
 static const struct regmap_bus zl38_regmap_bus = {
-- 
2.56.1.839.g22a8290db9-goog

