Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690122;
	b=ymkG0sxx1+0Lx9EjL7fskhZLfJDFjzjfztZu7bcwMepepCYLLS/RKvyhpnmD3WzAbyAg
	 ioAUkazZeka9qWvSx6QwjLG/hkoPElebdOz2MM8Hm25Fi8XugyeEsKegERmL9YCyDXnrd
	 TgwQ2Q+bgGSl1YogrvAm9psrCaGBUflkVwVJJnxBnhr7Hw26FTah6rT1wCnt9THkU65cF
	 fDTlWLEJxG/fjZCyXWu0fH/QrBD+fDZFscGSUZ6/g7iyVouo/yZwXYkAP44kDl3G273qG
	 lWC35ue6RYd/j902i+YfpA1AUV5ftRNMAjhUHVIdExxs+ggUSJDWfdSAxeNYpVuLXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
	b=vHkc2NtOPWneCfezBRIN6w43dRpWNOFWdkQocdh8xNEnB7/wDgfYJJqLiqOizBYkBnwu
	 TGqjAD+ONlk6GbRg4bUVguIr4wWdMQLbVeOEVP7luBBZEwRrs14v/g43VB/fqgse3Lw5Y
	 OGkROsuupOSwFCzBr9BKfEm1CKRxB7/PdQnjuQI18E7s4ccogwY8JXBUz4Wi0kES7AAtF
	 J7YKfmpd6ttF55obTeWQVANgq1pRTpb/NWEDPfxBhqtYVP92fAZWQn/pTEVixdGBtCbke
	 f42GtT7I73sVGfjEzqEAHbY1CQQPd0GUxdqARR535S84VAq8FQ24zjOYi83aJ1TRllw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+JSa+Ut;
	arc=none smtp.remote-ip=209.85.167.72
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A11606A68E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5A11606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j+JSa+Ut
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5be5c404468so2959171e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795690120; x=1796294920; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=j+JSa+UtPjpLo+sLj+TvPPvS+VD63xvtyFAdACGiYvbxcHRidvhEQo3BC4MewFvMDN
         zJrwV4oKir+FT6cOucBHDIo+Gyp9y4Ceyuy0bhyhV7Pb0py8HD/4PMQKUXiYUnFoWZVC
         WGMUhIa1Ecb3o6+khs0L6CBZqbAFYcl2FqmPLG/keSGCdndjVpO10jxNt5rcPf6ScdK7
         gvLGrSobF06UnvXpighfRp9YBMvT8cFK+fxHSPQ22rNxIqMaTcnrA7xQ2mwms3vQxT9T
         iRJvwc0QaAn24GiIA1PrvGWvXgsZFxZtNXquu8m96D075i50zKMlnRkR3m57dg5H2Bxq
         6zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690120; x=1796294920;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODOROgglBubCeueofUdqrgO8xPhnTBc5wYg4QXauX+c=;
        b=06TRIv+WUtb8wppwn5roRfocBbv10nTvXtPqMS7Y5SxoHvOw/2kCm3cUeV9sU4+BhD
         wAG3Xjn7IjOnLXv31yAZ0PlSCDS6PvgZX8oZ0IsuFKypaD6TIInICc5TrlPn2QPI5Yj0
         V6wpMOXyjZIgGu5oinNsTEjK2K+5vTJ0tY9O/mUrx0Jrv+2xs3ZBb2uHLDBAZlO6ffUV
         BVr/iahcwP4/nT+WyxJUI/Pl0iV3PTQL4a4Cc1fxU5f45IoV2XsMQYXKZ3S39VtYiSP4
         ewldmDmdbHEQUxZ3Z5BgkmMXEsdcDu+Silp2vXtUcYmbVeUgFH5OxIxKZtB9uu/knS7K
         0lZA==
X-Forwarded-Encrypted: i=1; AL+hErGywQw4SBQTsNaGl1W2Tyfpi3WXfVrdS3q4ARsSHfzowIirEqq21dKG0efxS8z4AebUe8z0hji8+jA/mJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lRKroOYKqFObQLZVzCkXq3/ZQ/wWA1X9Vgy1jPtw+jTgOegZm
	vnw6jBpwB2dBo9yoKYw+llr5pU3jY/tCf4YcCyhIMpIV27Z5S3BOBl6u9rcBVRX26XmmnQnOeQo
	Iwg8HlXPKMA==
X-Received: from lfbfe13.prod.google.com ([2002:a05:6512:620d:b0:5be:4c8a:2f0f])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:a819:10b0:5bc:f29b:1a5c
 with SMTP id 2adb3069b0e04-5c1bc7d0b80mr4028854e87.23.1795690119891; Thu, 26
 Nov 2026 02:48:39 -0800 (PST)
Date: Thu, 26 Nov 2026 10:47:57 +0000
In-Reply-To: <20261126104757.2860272-1-dbalint@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261126104757.2860272-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126104757.2860272-3-dbalint@google.com>
Subject: [PATCH v2 2/2] mfd: cros_ec: Load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, mfd@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mwojtas@google.com, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Load cros_ec_pwrmon driver when the ChromeOS EC advertises
EC_FEATURE_PWRMON.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..9cf85636b7f9 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -115,6 +115,10 @@ static const struct mfd_cell cros_ec_charge_control_cells[] = {
 	{ .name = "cros-charge-control", },
 };
 
+static const struct mfd_cell cros_ec_pwrmon_cells[] = {
+	{ .name = "cros-ec-pwrmon", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -151,6 +155,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_charge_control_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWRMON,
+		.mfd_cells	= cros_ec_pwrmon_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_pwrmon_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.56.1.839.g22a8290db9-goog

