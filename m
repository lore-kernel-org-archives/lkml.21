Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638160;
	b=zB2Nf6yr/E21RnOEi137uAC+xh5RPyqnrXQ0395XPpBbAmDAeUkYjZpao5iefoqZ6W5y
	 HNJEdh0s8rITX7V0ORIM9WEueJNtMI9DwvVBtEndtbnX7Ys8XBkX3MJKktGB1zH3OaE19
	 cx2V512Y/WoP8jV8KlesIWLpnYulYIKItaJOKD/nrujbEP/ZxEvefRlV7CUsImseLI6+I
	 +VA+bqFQ+7JfHFFJVcXcW1aq1PP4+Lcajz05HVcA0h1A3tsrCvTzf5VopiDoooOyzHg7g
	 6GOoOnTqzuILDrJwmn2K4OKSJYIBNr2IW2jz/JAtPONRK71HbHUNMzpQ6qRy6w9MXJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638160;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=1lkuKfWbZDWFuBg0A1hsuwCrSIaJ59LEhxzzatqQpNY=;
	b=cbYLOAz4XorlYBnVs7ZHjXU/I2RrB2DABEUmQOtHUOEuqn1yDUxDs6/MY4ZRSWTc4PC1
	 4nheWM0uE5lzV/bu0thGwO/l/5nnemY3JuMObw6lEB5GhNOoQefVQiaS4raZvHzSMOT/H
	 oYJWL3mtiSNF1vstdARVo6i5tVLOrTtfPccb9caXGUS6u7wYU6U0RBVnlXP4zvmj0bIJw
	 PeimI5BWEfm+wloQwdzqV4rO92vNyOMOPGdYWsdarwvmOf0VebW04g2hOHX+ZABjfe+L8
	 NprtWweMI2aPjkoCFIgW2SqxR7D6wpn+kd9o05LlbQ/0sTp1eOELj7kDS0YGznWQhkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75893606A6AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75893606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso57836017b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638159; x=1796242959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lkuKfWbZDWFuBg0A1hsuwCrSIaJ59LEhxzzatqQpNY=;
        b=FiY45IXbnq2U04QHscu1M7ZlCZq5yvUpZtIFv46ScGHu/lN4SqQsykwwC+w3xWY/M0
         nBAOy/ZSuBqhiiteQWdL2pdbJRjPKJYIgwBZm3UVsentCVpl1fi5ZNjCa4zQ9K7ot5+h
         yNQlLv09QW/Gn+oAYBsnxC9fD0iA1ZG1917yX5T1KqPawFgOpT/PuR8lY35xGpSWQvK4
         9mGJqvNDYe1/1W4iHsR0pInlrlXelVEOWVHQ4UkbxAtNhsD+Z5qix3RuV3wJCJI6xix+
         01Ns4rNQV40I3NFnsYbp489zLt++mIYTlu8F4B4JthD3Jzs+2OLRirxmCOsdQNOnfLxy
         cNwg==
X-Forwarded-Encrypted: i=1; AL+hErGVc1ECrc+aSYj3qVLJX0QFvSgCm9lA71LPLPs7c9reNUpOu/adb1lIt3Ourqe7IMK/7ueJEsog0HfaZuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hZ/hA3296rG50JonYAGcmeOp2BqmcAkWUlZPrNxo0p2lepsky
	vNpFJYOtzaTKlN1LFHPcmaVERECS9fuodDYGIKYpOq5qtO2NX9ag1uAdKqyoz2/110o=
X-Gm-Gg: AZFdTZf3wrvDbTgzMTQaNHxd4r9BTW8GnmEkDEQ1jmFXE6Lp7QseCtP8TwId1rnr+u0
	m0FQSP7ePS1HUTcaLzNks0tnerLrhNVNOk5Nt2JBH1lXDkos4wqenka3IZtHghdpQ4G12P9N2m/
	atd1ZDFgNe5EkkRgyFkoKCajXLI7opHVVRKcN/rYr8jmerD/s+eijngzwJZFUselUOn7Flux0qW
	UFp6NyW/fdf5x53q8fQYr2uEjRuti175RZ9HXJZ7P0ZwuZhtMnclEBHhVpLfTEuCRV9kR0eeaT1
	3gE7RpZIkUb3U/+f1WKCwQavpDoN6Ygxw5XI318jWfK9dS1U2p0q4oljkhgAuMYrAHpiUVMWvh8
	9jA4qPyh0/AUGZE/zzqw07Zsq7axmnlgm47oORJI/TjzlkEdv3SjGpzsCf3JvW1b2XyY3x2UE3x
	tbuVNdCtCbpBJSYcG80aEi/wMfkGx3/RW5leN/WfXMaNuP8H/ks6CDbT05nkuRbQHhMbRD93XsS
	gPFjTeJIEz9Awd3DLafY3vUkLOzHoLOaw6ZK7cM3gcaSSAmp74caGL+PnohkfrgicivrlpSBTUG
	r0LkWVGYIn93I03aBIs8PxTRL6hsHk3XjE2KKWKV9EvG2/eoWRmyBxm8Zkxg3GgATpP9JMAKji5
	bWd1nGzmH6/C4loSeDHSqR7QfAvtfM67mlaaAIXcYh1tZo6n4Udr3TPAB0weYWn0kyBrb7uMx8Q
	Y1JtfJ5ODA1j3Xe/GcgdZCZcAw67ouWq4=
X-Received: by 2002:a05:690c:6b81:b0:8b4:c191:195 with SMTP id 00721157ae682-8b52051969bmr90063687b3.61.1795638159548;
        Wed, 25 Nov 2026 12:22:39 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:39 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:32 -0500
Subject: [PATCH v2 5/6] iio: potentiometer: mcp4018: Move the scale divisor
 into the per-part config
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
Message-Id: <20261125-iio-ad5246-v2-5-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The step is kohms / 127 for every MCP401x part. Keep the divisor in
struct mcp4018_cfg, so that parts with another step size can be added.
No functional change.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 6ca6cd7cbf71..75a63a01acef 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -26,6 +26,8 @@
 
 struct mcp4018_cfg {
 	int kohms;
+	/* Wiper position divisor: R = raw * kohms / div */
+	unsigned int div;
 };
 
 enum mcp4018_type {
@@ -36,10 +38,10 @@ enum mcp4018_type {
 };
 
 static const struct mcp4018_cfg mcp4018_cfg[] = {
-	[MCP4018_502] = { .kohms =   5, },
-	[MCP4018_103] = { .kohms =  10, },
-	[MCP4018_503] = { .kohms =  50, },
-	[MCP4018_104] = { .kohms = 100, },
+	[MCP4018_502] = { .kohms =   5, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_103] = { .kohms =  10, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_503] = { .kohms =  50, .div = MCP4018_WIPER_MAX, },
+	[MCP4018_104] = { .kohms = 100, .div = MCP4018_WIPER_MAX, },
 };
 
 struct mcp4018_data {
@@ -75,7 +77,7 @@ static int mcp4018_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000 * data->cfg->kohms;
-		*val2 = MCP4018_WIPER_MAX;
+		*val2 = data->cfg->div;
 		return IIO_VAL_FRACTIONAL;
 	}
 

-- 
Git-155)

