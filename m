Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032319;
	b=xAXlej4OYZEw3/MezvgoWdZYKufARJU02Zj11rwj0GWOcyse2TJaXunCfWJRF9KY5Mum
	 D5uWhEHRitvtDscTHeoiB7R8gyXdffMoGlHGZefrgg1SK3JaHaBHPocgQQvG1y5BWU/iW
	 t9oCy4iMWOxzH0z01cGAp3BrfSYtp9UomnQNt7B26z/okP0hDQvPtyU3kAlp5vGkNwrUW
	 QDBcqpP+1E00jF6ChMriF4HnQSgZ2bV5d/OnV3/i1jgnVU/ZjudfwrfdovUIg3BolZNlm
	 7+OZeRxksZ26jyhiZMnyjuO1SXhXGsHe9rgz9y5eW6dEnqHFiIyqGqs3Se/rZlfMvFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
	b=dqqqcPDP5JT+YNQx4QZlsZ79DsL9PS5zwBAv1CG+N5ylhbmJRNyZ7VKtWiO/p6LPvOCq
	 7oCa3ucc6hzTr3vOWGyokB1UhgGi591bNDKRiSfRjTL+bkftHdLaZD4dQuNyNLzjZDxh/
	 irKz61VDFjYUqG9IkXlDEB36wdJfBDV88LbDQKWIwVLHjn3t3OXzLH1cxJaXewiUbUZMf
	 BKAu222xZGK+Xwd0OhMeoDm+wYoNatlJq5LxD0B2G4l+CAaEFpIrlkBcYnxuj1ufRrBb9
	 1i8k7I5X4jIC9nIBzrnS/RkjezIgH79ueyTAxWN+DirENa9p7ZmndLk2n6q1I/+Ud/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUvJnVHZ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A1F60A260C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A1F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUvJnVHZ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso2216103eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032318; x=1795637118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
        b=JUvJnVHZqurjYHq1C0KX5/Sy8Vku8v8wxCPRuzZpNiECIbe6+7XinchU5NE1t82Pf2
         KZLYL+CXK1HGymg/V6CXjLYUYv1sNjw9b3O6HsVubiUL2gJGar+Q7S/9XdOawhPbMw2K
         9rY+TetecM7K9HcNYrXHKNd7TItiE2sdMCOLJbYnYNmr11wW3f3t+bgLKYAk2QDEv8jH
         NUwt6aU0c5XimAnH+FhvyLW5JXjX9lFyEXsMiEJ5sz26Z/eoOvrfsqu0pAeX/iOXaYQI
         F3x6k2s6JG2VIvhS5NIpbroKcwepmQ2jVRr5UtuKJd1FQCyQes3JAOEmC514WQFZQLHa
         AJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032318; x=1795637118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZplnOpSYZYLf9hINwzyXjH3xpqTmffb+IXOPd4GLR4=;
        b=GCdN925TsncUrHpFvcJgJoM+H89LrtN9i+lyHUfQaLyy8v99DoRxia13bvEUhXIE4z
         ZQBfB7DAqfJpUI9dP5FkpWnzYjvzdPv42Igqt8YTm9jobaR5k92hN+fTNiktEEivxVHS
         HAW26fPDKM804l3OPX/L9UYgurKt0O7E73I1CYRHwtOHdKaf4lY5i8acfnMSXUrpA/lI
         vky0FvFcp+UFgaLuPRiS60EJxoJxzKl1l48NF/V4TbHenTMmon5i9RvI1M6TimgTkWSz
         Yfl9cmhm5yAZJcw63xy5CJ5GRq4vHedtfOB2X1Y6K6nlEXneiJMPX0F0ugOFLLi1oTNN
         BjUQ==
X-Forwarded-Encrypted: i=1; AL+hErHsW58ig5s3OItaEBkv6TAY0IZtrBiKU2tZrii3ctXpi7+Dys3LjAIDmG94Dy/lNBQPhp2iN/DU+XCBOUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1UifGfDC21cmjIQc6CAgBcSJ/ZMDeVHDh12ld7mQABn0I2EZU
	kI7HW02NCCp6cPb8fuqc+z4IW+juMCB4ygXYnoPnZiBFX3oFYz2NnhL0
X-Gm-Gg: AYBFou2V9/SbqljGlvn5gCwNn9nPFBq4L1H3IH1eebFjhtxHE9cgtpKKqYBDsN9ZtxW
	RXyrUYKrpTN7sm8cJ9tqTv/cyls7eMp9apQRVt1vki1MTN4r+d5bzD9AeWkCJrOMahgaxXfLm9c
	yDw9OYpBXRLsdkMzhsBxmlA/h0xvwX2eRTRbwzyLdZ6dxpuZP0MX45BGNjwbAaJETOioM/yZTDQ
	qeydTCtQwe6VV6g0UC2N20gAPNRMjlFdMxaEGPNYuyugEs/XznnCTL8RsHa1A7S26l1+oNc5gwl
	rqsMwhjCLTof8JAxV+dxxU4G3FNzv4aHmTvnwHyMQjrUYkH2iCGaP8I6mOVgJWl5Ix4IC8QpmjS
	Hy3vZHX3+C4puZOn4dRa8V71VSVgELa5/j/Kvmvh6rGyEC+hwgk6tMZ0kPdmROQQufdAfk2rvP5
	fUbYolYw9+M+PuzMs8d2hXFU0qCuTIkx1Q404R088xYthQNUPJDmfOitpJGIgooMebcpPR/eaMq
	kQbZmudEP3vUVBOYd7VA9i4b2ZJMQ8HsAGTV4RERRSsH4DzlBNjAYw92eyY+uwUwe89qUzIBk4U
	Mh+tfEqMFssDWBo+M+TRRCmm6RwXPuf+MivZJ8PYBloBkmtvn/0azM0BZ5fvFSnLK0817hua1sd
	W2tytAtrsc1xnns4H0dpiCn68BCP0
X-Received: by 2002:a05:693c:409a:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38280c2fdd6mr3790822eec.18.1795032317937;
        Wed, 18 Nov 2026 12:05:17 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm10506308eec.26.2026.11.18.12.05.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:17 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Wed, 18 Nov 2026 12:05:15 -0800
Message-ID: <20261118-timecard-common-301f823ddd-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals, or fail on ART.
Use the table value, as the sysfs path already does.

Mask the direction enable bit before the frequency lookup. Otherwise an
enabled, direction-configurable pin has no matching table entry and its
DPLL get or dump fails. Apply both corrections to all board variants.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 478f7012b2..d449ed8ca2 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5900,7 +5900,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5918,6 +5919,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

