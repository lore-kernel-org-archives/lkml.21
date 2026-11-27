Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795818783;
	b=5CvTHCKc9EXT560b3U7Mn3tyak5UYTX/6gguxTDFhj/yzagfs1cQmjmAOxmsPJ96jqUk
	 eascftlTumBCKwhLaLyoU9jLJyNAt6YXi8e21ZbO9qpqxXNKcJIqGfRtk8ibkWAHB1XGs
	 dMo+uDjgiTMocp2kD+ojy7CkNZEBWBI8+96ySHvJxVHo907c2hlSY/FegUcaU+rSSDiUg
	 kSaHFceNPPfounAHumq0LvzKupHHHW1DnYHQpR38fJXRrdoSKSqZ2Mb4uzqoya+hl6fFd
	 0ubS0RgfSN4D8h2kOVV1Ax1L5pzYZ4+OQuvJwdRDAgdMKhHIK8TsbMiDnowiXVUGtpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795818783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
	b=sf4t/p+j3yqC1CgSHnbYw4uh5+tNktXHILSr4p0r/H5dDCGRqwhb6WVLejWNDfdqdCo3
	 79yz6Eb4mjVUtQB74y60zefBlU4uXM1x1m2dYn/U+vUBsG4sNHSo0YpVQfXLcZXDQdZ3N
	 yukv2+whymA8C6r7sgbaCwQMiRLA9aB9+ex+TVP1g4t9JMZSCF6eRyGk+UsE0yVwrQXBL
	 xwxlL/ddEwA468J3lPO0trkBLDhOVl+IEYYmsd+U0egy95F2e1KYU6M1GAwdXg3Ca/VmQ
	 v8LOVcwKwqjkt1O33opitWvOPBJo7S2xy/j6ttWVBKWuyeLknHTPM8sTxmwz9g46mxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wJ7wQms/";
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C2606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8C2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wJ7wQms/
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so7084014f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795818781; x=1796423581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
        b=wJ7wQms/FbVFfSS9GId+NAkDIUaPJ09YungOD+wW1zjd1tf77BqwLwmlXhnQC6+BA6
         UL9lKsq1GyngUuFmiJOwcuVTmcWF3gbgQ60pPwqivQ6QV2IVYBTjsFFZJbF1z4Rjcgkk
         HyTZL83web5sRNEg9b6RdEXblW1miFnv2AuxhMGkTd+h9ezYCXoeR8KZ+DMkfoo2PHxz
         tKPZr7cFl8NoV7I6pgxzqfdWCM+EmPrxUWjYnCDBip3IC/OG6EvnJa3ivQ+WwIieYQgQ
         jO8vY+zcoe0FcKKaUu4jS9C+tfnyRec4VGwYcrbRCzgZQOgb66bo9BOKA8PgsSB+0YcL
         ZHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795818781; x=1796423581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/KosUODM3E0fiMrzq8AJvlBOzlPE3xFAe43O33GX5w=;
        b=PINcSkMeDvraGW0S1Y0CK0IE3wyu+YhSA3pSCNXbymLKqg8hxs0gsH1OwO7acmYjLm
         9wNNOpoYH/cKF7rGjUWDjPi/D9mUpy/L8kkbNZLafijzEKn1wvYP2BCIYFxVsXTxtP8z
         U6xMAbpbt182PGE/hHyi2RGuA0SGfxaKYnXyKK8Uj3zZ5qZvOVvWupwATBDCNOR0Cd/K
         /tRzQszvD2Bdmc508gCqpqYbxmQ+ek384f+kDiGAGtkCw2b1PO59dH4sCmAF3i986imD
         +toC/fJaHo8w0wZ1UAKBwqC1mNA/gk4ijM6ZmD5vaCHX738rpmd8+9dIHG7V/QDVp/Dw
         0Fow==
X-Forwarded-Encrypted: i=1; AL+hErHX7K/ygyRRkhf5yBkbTWCNMkRaMsrYRkFoWkJ02cf725qoAu8ilFqAVL/X8nkN1+KOAhhqPLKImNQo/v8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cIOi/yOTWnbOy8JcT0hDB2wzJZiy6axIVJJJxVb9gRMQcsAf3
	kfXCAhxVyAj+YSTX3RQv46aonNGkGQrW84ZbO8NISy6mG+RH1ohtoJOX
X-Gm-Gg: AZFdTZfMBIQoZ4pR2KZiHigg7odMx8fYoiT0PVizsyN1td8XwkbxQaHkp1wQtJZ14Zt
	9aKuKdx2i+GdKvYZtH8HiXTFJXOjW0AEqoqqhedoYhWPaiNvy3I4/oAcJh0bEQkWEcbLt4oKHnf
	5dFYRcuGoAjCS5eaafxTb2NUFha/RCEMxROhW17tthOijFD0s0IJnFesNthKNB6HSZyLxjXjFCB
	arPo26cqXEU4LS4BQNxdaqhBB9RtGsg90PZpY9ekvaWXJwVwfySvquETaFl56tRp6RsJj/uQt8w
	LWN+t8VQPXQn7RgreTGzQBmrWnUr0C1J8TvYqL61VrQAA/jG5cP0crEjOrwIHovHrV0MVpEUutd
	NN6fDB/iwXaD8iiBhC7capllqjVs/gok8dQiXGRrbaep5aGE+iPyqMcJXemcX8xUfp1ezTTvMKh
	J7sNcPu9oTKh3Q/noIyitsjew/PeePIXqQGdbJpaw6XuoCO9NZhoEBgzhrWgWgBNDlFfx8dX/D8
	BgWM7PMFaqS9bHMURVP4bZQAxu4oB/kKm3AJY/HDcaR9w4ByJXgEU5/ZZWJPKQyMcBi7B6taWGB
	P699E9E3+D7TOHZlf5jztBkLUfjfmy4f
X-Received: by 2002:adf:e006:0:10b0:4a6:8012:19a with SMTP id ffacd0b85a97d-4abb18cb896mr35464456f8f.22.1795818781206;
        Fri, 27 Nov 2026 14:33:01 -0800 (PST)
Received: from [127.0.1.1] ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm50430285f8f.20.2026.11.27.14.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 14:33:00 -0800 (PST)
From: =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
Date: Sat, 28 Nov 2026 01:32:54 +0300
Subject: [PATCH v2 2/3] power: supply: s2mu005-battery: make the alert
 interrupt optional
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261128-s2mu106-fg-v2-2-2c3142e05aaf@gmail.com>
References: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
In-Reply-To: <20261128-s2mu106-fg-v2-0-2c3142e05aaf@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 =?utf-8?q?Adil_H=C3=BCsrev_Tepe?= <tadilhusrev@gmail.com>
X-Mailer: b4 0.16.0

The driver unconditionally requests the fuel-gauge alert interrupt and
fails to probe if the board does not wire it. Not all boards route the
alert line (for example the Samsung Galaxy XCover5), so only request the
interrupt when one is present; the gauge is otherwise polled on demand.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index a76154e5a09..9798a62ffec 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -273,11 +273,13 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
 
-	ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
-					s2mu005_handle_irq, IRQF_ONESHOT,
-					psy_desc->name, priv);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	if (client->irq > 0) {
+		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
+						s2mu005_handle_irq, IRQF_ONESHOT,
+						psy_desc->name, priv);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to request IRQ\n");
+	}
 
 	return 0;
 }

-- 
2.53.0

