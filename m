Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233353;
	b=anGXkqQpQwbQoigw+WV8F0NBnN3dY+Su7NznYinRcM6TGXsR5nUHEg/JQrX81wDnERED
	 aUnrrOTJXUDUhWfSThGPI5AAtjIC9Bh6ZYRBqPFWrsYRtAGZwMkWsOBXYFP3/EaO6JHX2
	 uvLjRL7SlplfxOHdRlaEyuIVZ9FPBdByB6SkPlWStKDU3Byok1/sGD8KeDzpUYGqR1l8/
	 MXA5ilX75d0WdZaXolP4IRebS6qtqDM5vdu57cQJr7g/3/k6GTIliB6Q+w1dS9U8NWwcu
	 xje9AOgM2RLMfIaoDPpK3OqPD+S/+zuTZnRxv3Ru96GjIhPGqkzWd16DVBkFnzBXSMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233353;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
	b=ilYn5fxgL89RdM+jZcdJV1EtdmONbrBjQRzaUUoJooWm52J8wsJSYvX2MiMADL5D6FPa
	 EkMHNchk6709Lr38AKiXkUIZJSLk1JhhEtGS7lwXhLkg69oDSeII+9VAzJgn8kD6GufnT
	 lKqcDuxftTegyz8m1fSk1TSYbMBe4mIRq3XmCegfg24XBh4N707lj0ICLuKR86Q7Gddzd
	 RG4O7Q3ytj1FMqlokLwLvZ9DkdlYB5z7/hnKWjyUgfpU9YX7nLbZZBvggHfg1Sra2odqz
	 OdpSmGVJlXVwbf5Q8igB5XDhjQlSjgQ9/RjUeB18gvRmsL6/6JDCAautk1SvFIRSGCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQv8ONvL;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE83606A6A5
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BE83606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQv8ONvL
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-716c0217635so1945104eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233351; x=1795838151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
        b=XQv8ONvLZqRsaYpXcQGGBWQI/DnYZuuUCu/dTx4AvokqjkdNltxt6h6yw0HVz29w3T
         0oS4R6ecdM49/IAbDF1mgNvDBKwnbLW5FGjoGFO4aFfTduMwWnWcpbPCF0LcUpswbhZA
         r1MpR4Y3CusBE4fu1KqqIgLkCZHQyTt2GYvMCPgUPaIeG2CW+BTFww8D3wmb3gH6F81A
         eMxOpW5XiCAdgPNKp+Z6IbaD0+T1CQBKBP03aTf9px1+cepQGuLsU22sUy8fV98exrm1
         B3FLCKqsymlU4jhoqeBbSHAjklIXcDoogdTPcNWdadCg5uB0i4hFu2SdTdxs5Hz8zsIg
         3SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233351; x=1795838151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUr1L8X42Bzo0eJziGn2ZVZc2zLBEwew7i47qtMtnRA=;
        b=t9YmlmSQ7LvM0bzA5BSUZtgyEWZAheKs+vL5rfK7vv8GW1DGiQJdIHJfiUMSYcFk34
         Ecnpo8HDHnWtwYSW8uYIs6ONj6WjFx4Jm7MvImTUbnLZADFLAHQvT3BsrvgP4zg12vtM
         C4xpKzYIZj1D47XJjolCQIRzoOCj/wluxlt17tdijALQm13mpkxREk4QgBanA5ru7Fva
         2pExA1Ce2q2lEVaJgxLCHZknnYGr/VryDqQOrKMZnaLFXnMACxOKtiioFDYoQjOTTQk5
         Ql6Ob3CVhwMSAVRId2Jj9oGk7o97f+r/SdIVDNMSoQI5EoGkt4p6oPbkBEbok/Vas8PW
         Xmiw==
X-Gm-Message-State: APuU4Z/4GB7n7lNSA1ZISYoCm2xE3TrZTvgD5W0jHa55VWro54YjnL+A
	+XHOF7Z8lyPvemZKBvKMFgJoWuOZZjdfOsN5k/uS0oAgXAoz56JVmog=
X-Gm-Gg: AYBFou1e8HsAMIqLa3pcwDrUBAfixsIHHo8lj3xb0RmjYSMqtFzQB5MpTZPADbpz3xI
	OMtcbsH0/IS+jiY5ZmkGQVTR4GX1l7f3UdIG8K7zy3/IPHAO/YST29vkFtQtAiAXTo9vL/rgmlj
	eT0tiDM69YNAgQ33j3+6dPLeY577jDwm8P0dPN4jNPLwmhUwRzRLsmKPkOs1WBINwzlHglEZ9h7
	yGwJi0R6IEfrb8aNfvrXSzLwouvQbD94EIN8koFNm0sDWpnRtwGQJ4+ec3eDFmP45vJQiVc6k7+
	t9G7A0kMblau/b8FeBQty/s+25QgAWzz2xSGXYTiTaYKkUZLoYzkXawJ8YEUtF0hiNQvk4e/CjU
	M+lkaF3wDzs38wLeFPtx/fKmOaC2s/xhwOkfX5hq4CTX5Kgv4mGyZrZcbr5B4wDkBzswgXRN+uF
	A3CdexsoVsGGYoIaECpX+QsvSyU7oywMwqIiRqggBtRherbGmprcU7LLlW4ec1cRDXDmENkox/h
	PBSoWoZPgQ7VR3vW/+PXGzcbdfKO0RS0UPnLYdd+4D9E61UuYUjYUN1GsSxpI1GAwkoEwdm2XuJ
	7n5q4ne2ZKjGXduSSvedShNbcX7alalb5Npw1CFrv1iog3yj6OFjVFIS
X-Received: by 2002:a05:6820:c2d2:20b0:71a:e932:868e with SMTP id 006d021491bc7-71b392948d1mr2257944eaf.5.1795233351000;
        Fri, 20 Nov 2026 19:55:51 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:49 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 05/12] media: tw9900: program all mode registers in the PAL table
Date: Fri, 20 Nov 2026 21:55:16 -0600
Message-ID: <20261121035523.26764-6-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

