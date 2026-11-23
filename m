Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452803;
	b=cvxY0AZ810f4ez3wO5GKKcgZ6A94d+b5Z6h7tQcn2nBIuGzCCbHxshGH0xZkkI4EgbXh
	 AiP4BVstzC2cuFlzuNbdobvz4QXaXDbZojOJmHh/tM74hLHo6lBnluqdCfFFPGsWUruOo
	 NzpkOTQAN7nhBt+We8IE9VZl0h7zuy9lePSKrXVqK9mDzMkdJNsLpmSbhYPPoc1lEDIhL
	 EgIgykQrfsqhn4ZaMfsDVFJUJTzkHhttQWhEtQd8yesWUSY6pIXFbZVeuYMtT3pzyPiFF
	 pFVpxy9R+o+nD54iHf+RagnQfRMrrqroxq4yPS5ySg1ThXFMRPtrohyTGvPIWRV1LNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sFe5nxwzMHr62FTOB7ETEsALfWA9QNj3sEz73U795Ac=;
	b=T6L2HOWfUsMbm7bNzKKBfet9JOH5mPbNN89FBkEYpE3r7W9QNk4awTksDbXzPrrVTMKT
	 gm9aq3h73rkxL7mMhFCirZKSakQzviD951hyRRUeUsFwTTZnmtRcmFY+N3Rgi7lT4t4Y7
	 eXmjSLzm7vx7Z0MnnkWaMqJlGnSB+MuREEuvKRKvQiNCkgoXv4P3V7ZTEn55sT5NnyKwV
	 ZScd7ikW65hTThTmVJ56TRBMB54zBhqllUIzT6lzt3xk+6zfh5wH58GGZ3j+SzhYZgdhD
	 +q5rYLtwhXJMvpuOk0dV0ooRY37/ZFi72/H38oYt7Tn+6hLykJLPdWSsHgaoUMQuz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=winse7d6;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904A606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D904A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=winse7d6
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3869f03af6aso2646030eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452802; x=1796057602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFe5nxwzMHr62FTOB7ETEsALfWA9QNj3sEz73U795Ac=;
        b=winse7d6xiGkgHSxpya+j8IjkyoRt+uXJtwxdBmtXVWMtTir8GBAUhXLik1zVQRLon
         pCONUNL5b9nO2D17cF+DcCktNsmKUIYyYzaf4tak/NNBY2NNxXZTEA2OtSZXd83YVQex
         b9A5o5cniXBeaaKUVDGd7h2ppQD/neLS1g4kVeXddUsm+P/x4QVQAe9q30teh2lRMpcD
         Ljd0FDrlSReJMLwacpTTTWpVLv1biP2Rnq7iFHpx/UlcoCxBLOIjUDf2jNrKao/Ue+hy
         xkRZTXYhL0pmY4U8vb9b07H9n9h9YopopqOCksXxdciYG1UfWXpNpccHst/EOlMK+OZx
         sJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452802; x=1796057602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFe5nxwzMHr62FTOB7ETEsALfWA9QNj3sEz73U795Ac=;
        b=uMERwkbMl0lm2XK/G7ya7LcamFYVwxC9DmxxQsF+F8EiunBUYUXRTQynU9Kq7YxloX
         rN3wp48CGxrWf6fKqwTBRjMUq+8qTocXdRNwhIUZrsZOeHTuLu+ChPWxFzNqzqcnaSa2
         b5Ifyp+pkKt8rcmUzB/ATiJeW6O5aabs2HERrAMTq+YuQ7nCF8Jm9RJ+CWCwmTLTIiW9
         wKOST4rTyfEQyPKZ7n+knBr+yf3bk5L7pUEqOJJjBm9jcEuampYpE15T+zJFpZ+1/jpO
         4driz67e0hlP4oCJqwB6/9kR3dkPGsjIWkAH76px1PSEGcK8Wnz57T8lA1WWqxnodtxq
         JShA==
X-Forwarded-Encrypted: i=1; AL+hErHLYAFBxVDlOzc1rr85iq4qlQoYMb2wAdTgFJ84YiwJitRbRqvrkDHxm4UKXnITbINfYOl4d1EMHLtiVzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kxvJ131ijbM0MBqcH1MUngKnRHYNBbt4XPL6IlmdE22EyBJzf
	3J8/wvZq6nQc4UeAgUdElkMoaGAVzeUxttu+CI61KLPv2QBmMJTuNUTf
X-Gm-Gg: AZFdTZec6labYM4kZmPOKI+vLIyZ5IW1GfupLb7h/II2VbVDnS9V1xdbf4e2lDchQQ5
	yCeGsVfLBZlZNVlwH/cRJ1PW16DVhNLo0KC8So1uMxmcAgJH+arblJFar/o/Na/gROREqa/FcAj
	dEfBotnKcgC4uTmMVsQusx0SbCtY3eEA2tU3IpRCswezMXEzOG1rnvIj48X7iH+w73FHXBuns/t
	6zTNWXmVpUfXbK2hq9Ss+yvp0diksTyjs+BoLQvEyL9CgBbry4lG/eN0jZ495edsN59BZkNLXi8
	a7VV7Sw+cb1DwxZ5WgImrTnC6+it5wk+1pWnX9QK8KrIkNmFIbdazgQKJHZkb2DJ4U2aLFUkWyh
	nFFd2aK2kKas5hv0RWuVCmULT4GTt250SFM6zvDv8Bp4MvwqfWc7rGe6tlk7aVtlp3Frr6a/q+v
	WOS7UewM4+e+Le1Z/kmHJcr9z/Q2Dad3w6oNVjbiCPlW+lfGX69uLWc542x5YtQuGqFrpiR5q6o
	3+UGKDCb4uSkcScVFVmRKf/hb47cW4Dg5JsRdxC4LPdsGgUp8v+hD96tXdJDKsV6f7ADKtpzd7G
	XkVGyl6Hj+AeofdsrVShyTipemFGXYUtn6NyzhyMC12v5HnQS46fEhZv6BgiBl6yiXeH0MaFcrA
	SPgEViLX0vopvmiWw0rXPfCHP7WybmplX/ieMaNsRXTNuOgqafXfOy1F6+BNYvOKwgDtGfg2idT
	U6ITz6nkLpclucPcq6f94kI+S2bz9RRmifu0Lo2u/9vg==
X-Received: by 2002:a05:7301:6482:b0:386:b39a:883d with SMTP id 5a478bee46e88-386b39a8d30mr3055139eec.0.1795452801834;
        Mon, 23 Nov 2026 08:53:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47196668eec.5.2026.11.23.08.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:53:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 4/5] iio: proximity: hx9023s: reject out-of-range threshold values
Date: Mon, 23 Nov 2026 22:22:50 +0530
Message-ID: <20261123165255.239490-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123165255.239490-1-kapoorarnav43@gmail.com>
References: <20261123165255.239490-1-kapoorarnav43@gmail.com>
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

The proximity thresholds are 10-bit register fields in units of 32.
hx9023s_set_thres_near() and hx9023s_set_thres_far() mask val / 32 with
GENMASK(9, 0) instead of checking it, so a value out of range is
silently written as a different threshold: 32768 becomes 0, the most
sensitive threshold, and -32 becomes 1023 * 32 = 32736, the least
sensitive one.

Return -EINVAL for negative values and values above 32767, the largest
value that still maps to the field.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 5b43dc9b112e..1545b4ed2ead 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -441,10 +441,14 @@ static int hx9023s_get_thres_far(struct hx9023s_data *data, u8 ch, int *val)
 
 static int hx9023s_set_thres_near(struct hx9023s_data *data, u8 ch, int val)
 {
-	__le16 val_le16 = cpu_to_le16((val / 32) & GENMASK(9, 0));
+	__le16 val_le16;
 	unsigned int reg;
 
-	data->ch_data[ch].thres.near = ((val / 32) & GENMASK(9, 0)) * 32;
+	if (val < 0 || val / 32 > GENMASK(9, 0))
+		return -EINVAL;
+
+	val_le16 = cpu_to_le16(val / 32);
+	data->ch_data[ch].thres.near = val / 32 * 32;
 	reg = (ch == 4) ? HX9023S_PROX_HIGH_DIFF_CFG_CH4_0 :
 		HX9023S_PROX_HIGH_DIFF_CFG_CH0_0 + (ch * 2);
 
@@ -453,10 +457,14 @@ static int hx9023s_set_thres_near(struct hx9023s_data *data, u8 ch, int val)
 
 static int hx9023s_set_thres_far(struct hx9023s_data *data, u8 ch, int val)
 {
-	__le16 val_le16 = cpu_to_le16((val / 32) & GENMASK(9, 0));
+	__le16 val_le16;
 	unsigned int reg;
 
-	data->ch_data[ch].thres.far = ((val / 32) & GENMASK(9, 0)) * 32;
+	if (val < 0 || val / 32 > GENMASK(9, 0))
+		return -EINVAL;
+
+	val_le16 = cpu_to_le16(val / 32);
+	data->ch_data[ch].thres.far = val / 32 * 32;
 	reg = (ch == 4) ? HX9023S_PROX_LOW_DIFF_CFG_CH4_0 :
 		HX9023S_PROX_LOW_DIFF_CFG_CH0_0 + (ch * 2);
 
-- 
2.53.0

