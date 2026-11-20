Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795147205;
	b=w17RroNOuajY2H2i1QwsmqnyTKZS9CDW3DVJiMcbzTUSWt9KJjTwhI57Caln0rSjY3eE
	 t47SeRElAxts8HvvNQdan+3PG0nGEa9lormJ7kIoO2rz0c9P2yLP0F46VoCuO/aarCY2s
	 8RIL+cnIEUGPoQfoF9SIcplZwcqreiFKe41VjwE0Sk3eGxo2Ww4l557BJza1vG93mLVYK
	 nfa8sYMOxJKu66FgFbOlfUzUxAiky7whHnrx2xA34kjRVsWPyA4kocDbyMS/EOFEu5oiu
	 8nE5pDAPWBJ96tNFlmtdlPVGNcmdmFZ/ct38dPYuIKyktJMZilT+jak9rIWP1WqHJdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795147205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
	b=sAZZ3P1wEMSc+VLYcRvdJR0VAwsnjgpJRKWO8vxyYZKi8HTtI7WPpHMHJ6E8H12Kx67M
	 XX8qDYVD8v0jb+oXRU7K/1ixZ5WB0OPFhA0lCtj/GH6YoDZ5V46fCDHXoLvPYt0wOL7Or
	 z30dqpX1gjZ/VUdrsv9+ILtNsL+/8JmambCOv/1DvxVNE+OY3PykGuX/ZK9hmd3+artdf
	 lkM68AUMI2VNbKpKeFwuT3HszrSB3KZXEYSxqvHfIqbmQuJtyFhDcz6W8otf62mmj0ZKL
	 94dAfxCsoLm0XeD+StQ52ofTwfwuW1D9FwR833pcoM0ji/0tyxkaXkWSsdcJQbiC4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIk7AYxl;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB9606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DB9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MIk7AYxl
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2efd7259872so2668595ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147204; x=1795752004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=MIk7AYxlubAGO5iF6xq1gJSK8bb6mnscfLO44jNUU+Pphz1Xnz/cCtER7nlvxICf/J
         4sCMYbD7Qh5UgNzCoryZYhxnpCzBmo/w+HNg+LAGmsdfFTPj+Jyn0DjVQnx9RYEvorOa
         vUEdGPUURLAcQqngaNteUwcy4L/i2i7IdLaW64hcPhIVG0rR1Dy4M3Nbl6ZnLUSyeDBw
         /mcdjp/4ow8cJr0aHRyuQ9qY+kpCFQOC88V0n180NhH/+gEEd/wkpikG3G3UmoCMOZ6m
         apAcSttUCPPmTH+64TmEh/THTTPya2LtUs/8xDxIEVF1j0DEeCl3ictl37Vq1+dInU6m
         8bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147204; x=1795752004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3o8lIoxd/J68fTCxNjKUOwU7KIWlfdsl4McX0KjPG74=;
        b=LfXPMAc7RbjuVoNNMIwkc2nqWazl9LTNd5WH21or0d7aC8V+JptZcbHEqxfeOZVa7u
         gorIQE4fCaILTMixSoUgh3RiPYEPTzeXdDPtMjRkjPmsauMJ83Zpdwu6k2tr/76B0uQd
         k+9a+jhELJanGvpq/N7yMYnQl+PkRhZDGbWvPP9KutHQ+OyxqtzGebxO7tuTx4PJwMQs
         mjypUCs86oP0RqSxPel1lVYb0gg19rpslOfRuf2J3SeIm4a0rydaJZfajAlvhQQDnLzJ
         9M9xuhHEMMHH/vg1gQYxorW0UT4OXpymkWYCPVtWC/tN+WVMX61tqLmxwabhH7xOgT8g
         GCZw==
X-Forwarded-Encrypted: i=1; AL+hErHo4QW3jZlhJEAuRMo53lQTApb1vRmqqnRZChJATxiXk7uhX+jP+EWqkAPmhkSo/CbUCckrRNvoGJCi5+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z98SSfGyLkPfwjbEla/mHR7w0LU++pclg8nErBHzaCmdnxk0Pvb
	0i9DvIl+7yeOl7uFIFQx9gVn5EkWaJzUtSue1+eUVL8YeBD7KZJX7pFR
X-Gm-Gg: AZFdTZfzf522FUCuUUh9NKtZLvF2FNXbH0eVtFY7SeuLFI/7l+JZGWkrMgO7twcysEA
	NtnC5Qe+BO/28nrZLpWjNAxCIDI/k1kiOMkdZQOY67JaV2kFQpC5p5O69hRMC2Bruy31iPRkToi
	vU0zluhGHxMYrPdl914VGI1NpLqQ94QSsCDVJIGErM81p8Cz0VX7F4DsLJOrzNMJCj50cGo+G9I
	JT2TG8q1QKXClYcudrqwcD+ZdwlmgSaHaGmDC4FNjQJdcbS5XzRm49MOFZXfn5QMGaFdO+fNc3/
	lIlv9Crx/OjFCSED4RA9PtVH8EehvHisFnwGpLBBc5d3P4FoXfrigaGZUgIOJGXAoSQn7mGAUFq
	RJIeND7kzwiRWEHYajouZcJl92nTeIzh64cc3j/B00VjubSASLj/BbLNW4jhh5IUOY0lYb0rq0D
	1itKxjQZx2dF9h95RAzwjAkIMpDv0RR778ZNAGSt8IN9Hev2WJQwEDN8SkvW/f+t/J5OCY+F/Bt
	vmdzo0QXp+2nrQfPb2biPOfh5RE7rvLBwEEc+pm9PqPL8/IE92oDBhnN2pSctknAYsytdd6aHrU
	pPYWMMUKdyCjJVQGD2pCv7vSTSSAofzbjQk9VjRkQ+qTsAQs5GaaJPlM6hU7Il+rOeIOEW5XX9M
	Lnnpa3T9jThuHGX4tKl26dEs/lcKVNl8n10vDNLQd+lgW
X-Received: by 2002:a17:903:22c8:b0:2ef:dc24:c71f with SMTP id d9443c01a7336-2f03f2980f4mr21004545ad.56.1795147204267;
        Thu, 19 Nov 2026 20:00:04 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.20.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:00:03 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 2/2] ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params
Date: Fri, 20 Nov 2026 10:59:39 +0700
Message-ID: <20261120035939.12774-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120035939.12774-1-phucduc.bui@gmail.com>
References: <20261120035939.12774-1-phucduc.bui@gmail.com>
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

hw_params() overwrites the entire MR register, clearing the
VBMODE and SBMODE bits configured in dai_probe().

Use regmap_update_bits() to update only the ENDIAN and DATAWIDTH
fields, preserving the other MR bits.

Fixes: fa09fa60385a ("ASoC: mchp-spdifrx: fix controls which rely on rsr register")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: 
Hardware testing on SAMA7G5 is needed to verify this change.
If the current full-register write is intentional, the issue
may instead be in the default MR configuration in dai_probe().

 sound/soc/atmel/mchp-spdifrx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 06a2a5a90a63..e37470165717 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -502,7 +502,9 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dev->dev, "GCLK range min set to %d\n",
 		params_rate(params) * SPDIFRX_GCLK_RATIO_MIN + 1);
 
-	ret = regmap_write(dev->regmap, SPDIFRX_MR, mr);
+	ret = regmap_update_bits(dev->regmap, SPDIFRX_MR,
+				 SPDIFRX_MR_ENDIAN_MASK | SPDIFRX_MR_DATAWIDTH_MASK,
+				 mr);
 
 unlock:
 	mutex_unlock(&dev->mlock);
-- 
2.43.0

