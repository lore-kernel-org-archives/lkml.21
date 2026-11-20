Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171631;
	b=HP0M2mZ+OdXHrkBFFkY4npwn5E83fhUKxrrSMkv6Md+4F6tLYus7Z2n/ba4OoS4v8Cal
	 WuM6038F8tjhZKr4T7zCi27oUYphtQWeGL76sZQRop8VCLEwXycbb0/uQMX7MB1j4pJ/U
	 ZSi3t7sBtxRkeUV0IYueKpfD+Oio9Ogo4ynIlb5PCUyDGK7kt9vGJLJr5WXGjRfuaeQcN
	 wPyOrQAfmtLBTJE85eF7PLh9RGkhxy+JTaKSqzjiSOkoDUC/My2KPwmkZNMD8Ro9NN3nV
	 ZZDgk824eAPR9G+MdYsr9mDSq3VfL1Uk88viBv1z0jMk9EvayiEpqIjC3Aeayd5xXqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
	b=g9DANXGH/LP/txBMgF9zx9NlkeS0INyI4hmwbvt/UT8datrZ4PNM+AyhPOyvgOaWArJj
	 Q6RKUmYqdC1IYrCmCQb7x9icfStB2a+v3CjY8wFUDqzV474lgwMpvS4DWi8kygCy0Sk6C
	 lTPhjz1hQTNElxMEyAPvGMajByYaxl8YxZN1e7ht89o3lLoq1hRCG4OqpSaQ9Yz3EJt7d
	 +tvWIpi33EoawaMLp3Kfl0yWbVLne4gWmYklFPMwKd0qpNKFmsf6sk53J6PsjWXaXI4I3
	 Ikec8pVWjqaFWRpSTbnmLR0rzXD0N92NbaTj5t9AF/aMbc67pBFz+9J+ZER3zxQhzMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRbXNFdH;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C3F606A336
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C3F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRbXNFdH
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so899008c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171630; x=1795776430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=PRbXNFdH1tl61XMbtVD48fFCXbhmymkgVwyQ/93GUHKktdVOxd/pxeOOeIMwsM/swp
         byBJWIdYypsgKTjCesALWHAOIxsV05wxxDJJYyOKdEmxTqMr6pHhVWMIXJdiLvbvTOE3
         vYGrMNNV3v818XFc3abRUqVeV2W9boJjtEKlrMBQjgEwug1b2NyPAvMTs8uOeIbLvQ78
         QtBlKfK1wGMO7OMyBfmIRsBqI71S6DL4/xW0Z4FbWj7CzjpLjEq9QajGSVSCPlR8aasA
         ff56guEpOTbwE9+Kb3gNiOAfOZisF66tP5Dq7tqO6XJgRHNQR+tUUNGJfKeK/GZIXZmX
         OAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171630; x=1795776430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iJsINDvFyzxeeW6ZSnxvMwnBMhyxjkOH+VNJICnyh2s=;
        b=WijV09Hah6bltAkqRAkmilmqOhCAPmLNGVXhy7DA/itlnXzusxopJsn9PSFeHGU9NW
         59+61vsGD/dwKIssyCZd+ck/wr/6JX+joV2ZFzL7kggqAd8Ax8tZAua3Ml/ax/PK1VpM
         ZiyWJya/t6bmxaSG5Y/sUJQIQSZAGZSWHD03a3rF+e1GO5KabFkdiqd3ki+/y+4HR3ha
         44KwDJ7Ptpk9vq0ksbuRUf6wQNcQ2Wcskvp6JfVVz0fIv3JRUiqTAJNRHnkAvLSPz/Ws
         EmwgEQ3di7plplEx6M8hoVZ2pFbw5GVC49XXreJNmcJ+j24P1IEOIqNXd2xnXV6Om+o4
         BU8A==
X-Forwarded-Encrypted: i=1; AL+hErHaVt8o3fqRzqjkzVjGrlkgaaoL+TreSE1TxPPLq31KkzGnWS4eVqlGoF383NG/zdV+0Lu1gcsbSdCkRCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xhor2eAT4lrnEr03ErS6PrGJxUybXQOHZclOWafNfEtAaY6jP
	YOU/vpNqudZqytXY2OL+WoeqYVwMI6/aFq68/cUi3OcfY8a0NfjSN3Tp
X-Gm-Gg: AYBFou2HspTbJEiA8bkOmxLNKbmRCaNvA9YP9Fiy85+umY3D7zec5PPN49KJx3RxANW
	D1ddHxji5GukI0CjfFLAB6vuRh7RWTxdJpHS/cDfLX1SL/B73AcTjfeZX++/Ubq89GlASshmkGD
	mXs/YZAJz+2mctuSb3FlSEhBxhIHMvzbfiYTePktACftZ0G3+lL/lMd7wnIgXIJAzov1Z0bb8P0
	738SyIHbRr6IeEor5CQnQSk+8MzakrGg0yW5nd+OW16RUgldHT34Oasxg7SSzotWs+2FpOMMYKl
	AUw+YipGyAqTPVywlKNuft1gN8UWW0AKxF2DjlQeWuFYMYn1nfksmuYZHABPTqqgAYfkIVYyVQ4
	6xDcVSYVg6pzzohd+rnB9L14OYMNHm1Dxeh8MuvpBjsbFG2+9lSceQvYQjijD/YvElRCNYROshs
	TzdRx23tOHqkzUkjEGiOh2j3EQz8CgUgxfencf3MZOkKG/a2h/fNAIPpVdse1XBNRn1sNgtSFKm
	4DWpA1FnjYJnFznru5Un2NlTCs5tQvH7/w0WS0uYybFGlmx+qn9LIB0NU9AbdEitRD07tan91II
	Pj1air1IFzr8zttbGWY1K2owTiNHBoOPEyJRd06Io4XOV8L4dliWD7THNFNc5t9Cz7yPVNqQttP
	H9Z4qX5x3Li43LwAgn7/ShIq8Uyix8ifGq/+sekP+voCKyA==
X-Received: by 2002:a05:7022:7f12:b0:1b2:4f97:27d7 with SMTP id a92af1059eb24-1b55692891bmr2432306c88.36.1795171630011;
        Fri, 20 Nov 2026 02:47:10 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm7326292eec.12.2026.11.20.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:47:09 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:46:30 +0700
Message-ID: <20261120104630.10240-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120104630.10240-1-phucduc.bui@gmail.com>
References: <20261120104630.10240-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. Neither register is marked as volatile, causing regmap
to return cached values instead of reading the hardware.

Add a volatile_reg callback marking IMR and ISR as volatile.

Fixes: 4bf54ca60f99 ("ASoC: mchp-spdiftx: add runtime pm support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the Fixes tag based on Sashiko's review.

 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 658ff667439c..0406a11caf7d 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -165,6 +165,17 @@ static bool mchp_spdiftx_precious_reg(struct device *dev, unsigned int reg)
 	}
 }
 
+static bool mchp_spdiftx_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SPDIFTX_IMR:
+	case SPDIFTX_ISR:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -173,6 +184,7 @@ static const struct regmap_config mchp_spdiftx_regmap_config = {
 	.readable_reg = mchp_spdiftx_readable_reg,
 	.writeable_reg = mchp_spdiftx_writeable_reg,
 	.precious_reg = mchp_spdiftx_precious_reg,
+	.volatile_reg = mchp_spdiftx_volatile_reg,
 	.cache_type = REGCACHE_FLAT,
 };
 
-- 
2.43.0

