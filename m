Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446467;
	b=dHjI3xumS7Ej161aKmBLRpQi8+VXXsUxi/2E3D3Ca4vCzlN+7hepbTZqvRrQTnsyg3UP
	 He61IDoX5ZoLkDG2gbQK6ofvxaTBeWnGbUc5O/5fcbpJMa9MNSZ1wedmNCJCzoodJrWoQ
	 LVuBMpzwS1cN3P6EEZDguY7N14bOKEB9Z4nrA0x0M8+WIX1SnaOJphCrZo1iJa/LlKPeA
	 ilMoBz6/nPfIqW+ygAv0gAzWcrzOSP7HXr3wEMMKRY7exAR5BDotvJPDxcFOQlpTZG8Qe
	 YtXpDSPGdrECTkbk2X2RPOVGliJjWA8aHi6UbGqke5uA51IxpAAPEqTMXfWNjVTT/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
	b=kCq4MfkIFiMFYxo0UdLGPTjV9VdbY2E4SbPBOXn9Prq0N6bZ30G6Zk3+1MkDg5dbZ19R
	 ljU4ptCk1GDOp2aVZd5HCJXp14ED3kyHFaMSoVMbOjU89t87ugqMhc3B+lqk/FJD0+66Q
	 izuwxPf2Vg+XYMar/KFhuZY9NJ0wPdce7nSoeDg5Yp3paBxW7ScxCVjYdAZyQ2Iiqdw1m
	 IN6p+Zc/7GFwPtarVhFz29r/qLIqtZ8kSKf21z2Vqi+Z1F0Y0RCwiteZviRJD+xgaYSjw
	 /Qv5qT3m/o3h3UOMr71Swq+Nb9sgHeydBuHZ3i6LgRoO2JhGis+P+RIiaUwRd88qbgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3xcFD0X;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED59606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED59606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z3xcFD0X
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so4285110a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446466; x=1796051266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=z3xcFD0X6rjc7qxVPfx4nIHKdcQsvmgdw6i5mi7HnD139rzKT/gw0Ape8OiNUGzE/v
         P7uRLfxSHx6KSzuIQNTBC5PoLU7MAjxqXEcF7DfP63UQFYM4UBAbWCCFCfJpOvIG+3uD
         nvqhggWkw4NdXLJ4moVlaOHGCPXRKyjt0/eN8+zGWKWnhc6dryG1WL9CiuD3QR9zy7cp
         1sXPYwLR7Q7Hk5zFm7rfKmURIARmWP3CklIaRV+mjCUWrVBOyapv4eWRpo1kK2FnTEln
         AE+VkbAp3ZpJjiZqBajcU7QrBdsRotLMClMthu5BWOvnLez9hQNtLNdBPmQH2nXBi+Fv
         Tt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446466; x=1796051266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xh8JlClPQjIKYSMwaXks/N+gTEcs+PhZFyDS0fpX7rw=;
        b=YczFh1woKMc0lISKVLzIDHuxbxC4NZAzT6Hi7g0CDlyllH04mdjc2NoDDYUsoAD14B
         /vU5QNUQeKvpwXs73nKLnZswODCeJozi0X4YpO6AGLSTmWVIVXXDHBfn3AO/kN5rB7bw
         SFTvzl1hIerJougDe087t3nOaeiy28Ed3Hhi6xjLVwJRjejhC0sP22CWh9SK2lNxaAsk
         t67dg2YykWN3nWcUOL5Hs5OH/w+ve4WCl22PpbkPvCmCKgK7V3bWPnyeUhb7hfPYAORI
         AKtlatOf2NTDkJ1etC9ZLOX+A8UZRdG6QFIJD5Eywv5gtZ8mnFgcyxNnlRUfyYlEkA5d
         cIbA==
X-Gm-Message-State: APuU4Z854qcn1lPY8o5Q7TtYFiyUFGY9iWt0rJT9bSxMZdZmbyCLkuPQ
	CtsejBfAAlOMNyA3CdgP6w1Pp7WRJhHELTykJUYFG2U8oftNmZ7Go6F3gyVZCQ==
X-Gm-Gg: AZFdTZcyj9TvbzWkCUchAVM+Z9dpwPlWstx0hiqcHrivNF75Q0ce2fs5Omys6hDcTsh
	pPR+Lzs6pwdVjJhfcurntpFGKL6X3xlqfhigS98BkIh1mLcvJyFhXsppCNf61AMV91k9AM1RBhQ
	qC/pOV5ur1xKqhyyoFY3mfwTeHDrf+Wj/NQU7z7js/YLGsi7qjqWnr111NhHlg8m8tM6wsDHGeU
	CEZhHVjHkR+x4eHLlop2cbJOeRA7xM8qXQfMJC2xQgFJXe973by7q51vhGG+bXgzh1OJLkzg3jG
	TE++TVvKWcBfoYnR1GG/MT2R15xvKUhh/UV1y9K5sGt3lFs+v5IVkTgRM7qzdYGaOY37GqfLuG2
	ohlXMP8+8Nl3cayZ5UZLXYikzlxFyqN8eKoiC2uvOQ0qUB+CufLk7tHvNerjf3Lq7BOGqwsxn/+
	+YhHFVDEx1xFCi+b3Qyk5szbpRF+aTTXkT6Yx4B5Lf9wmG8gvFS0r6rvNdbxf6NnDGnciheFCCy
	Y4Dkre1knMZoomKlQyIxzshe2XDnWB+MxCJzPx7PuG52OFHK41ZG15k5qyB5uexLsSK1wluGQeh
	JqRRd0LVdXOOjlvul+zsyIxWUEs8yN224SN4ljqzplM5UDY8bbJVI5ByGeoSPJvsmnYBrhDq3Iq
	gE/c3wxl1YQ==
X-Received: by 2002:aa7:d789:0:b0:6b7:6c8:70d5 with SMTP id 4fb4d7f45d1cf-6ba37c76e5bmr5952130a12.3.1795446465996;
        Mon, 23 Nov 2026 07:07:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm5446279a12.25.2026.11.23.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:07:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v3 4/4] mfd: max8907: Add ADC cell
Date: Mon, 23 Nov 2026 17:07:25 +0200
Message-ID: <20261123150725.212836-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150725.212836-1-clamor95@gmail.com>
References: <20261123150725.212836-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 103294c76b97d..ac7b41ad400ed 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

