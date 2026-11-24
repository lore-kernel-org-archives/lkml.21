Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795503023;
	b=Js9sITAk8gaQBlFTLduQDMSiqWfqs+TtFvgvh6gd33beNqNzlV+bPU8gU+EBm5xsmoLO
	 3ocTXDygws2xfYOvBaD+v1csb1z7PngJlmPVU5uDiIq3H8W1jLzh1QLjPA790+T5weFEd
	 EIeOd7YUHCfGS8tzv9uosEcYaHeStUbBPL0/qQ4WVRv+dlVOUKGtHPKSAWYswzFmqka4m
	 Jg8bWAfeAnzchbyPuB9tWBXSj99F9LOnjwPEZLXFexIylteDVfurJI4txyz3XgK1xLKEO
	 wEOkPU5uKgx45g4Tw1C8LvDEWx/KnMjV6h+yM21CB0vooW99pud2r4hjyj02GY0pZ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ojqsbiWlKNfr1mrx1SXA3SitSn0FIQVstV4SumJAAn4=;
	b=mMj9iZWreyb3coDFzVPUstcSIWOReLaCLGOHf871KCWVUgjuMgbPkrWF7bYJfkUwaDro
	 8PqqH+NtYQXJBN92sG0L8hke3/MGFq7b/HVbsla2SDuQdD1D/iMGH37b7SMziHtRCcUEd
	 6h0SfzcLJQxiyWyfMHgwMYZ6PcOuqLg2jRoAA2i3uuzYfD7+oM5IfOFpwY0MJeZjPzDbn
	 fUuLN8GN3vExtNz/NtFq0Mpebrv5FvTe3dDmVPZh2Rf3HL944w9EgWSFNtdstgTxbk32u
	 snat9Tqw6A4UE0dW3aszvijbU8k30rO0vjQ9a5bnVdgBjUDVVgZW13aCeXAqJxNI3Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVX5ITCv;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934D1606A682
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934D1606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVX5ITCv
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso5157726e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503022; x=1796107822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojqsbiWlKNfr1mrx1SXA3SitSn0FIQVstV4SumJAAn4=;
        b=nVX5ITCvP6SU1Ep+7c2AwUzdtcXBeX/d35hdNdlsaK/r4miqXTV2L6+9wgR0m5mK+8
         /phdqqYxCZDjpkHFu0KL6rpvEzPF5CNWuRtOBcgDXZ5q9J2/CiguzYsz28FUD9zM8AkO
         1+e/U+f9/xKBxSdh5d58dnHjQ5BZh345u/wiid37ZXYDNfElb3GzYcwTI4yQrXB770Am
         OFSZftGqSgzcbQzYqAudOAtm62nriJpDM4wYkcnlTris6njYsVyVOyFJz2y7HIjT3F7q
         Ng4gobJONiFXe+HpBgvqV1/pmoUY1f2v+fS6mDCo5s+DCAEh5GhHlMQn108xCX6aoAeN
         skBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503022; x=1796107822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojqsbiWlKNfr1mrx1SXA3SitSn0FIQVstV4SumJAAn4=;
        b=CV+CNMp388tDODPvBar3uBEFNGvyKLytkfxAmunwGBz5rQmMvzudWuaZ3k1bIwEqs+
         mMMoLgEo4QE/EWdCdvtX6bokVmV9y7PTF23xm9af/hGJbhf49w3VCARYp+9rgNZBcjrA
         ZJiJXo3zkPSz7M6CgsFOD5kxZPq41kum0+cA7oPQlV7ZCkrMSgChlHPxPrzTFMlDALY0
         A57nZNAhD4gFsKTW+b/w2TQ5cOJfePVK/PVWVMikUuiXHM8waTShsVPEipq1GZGSKHPr
         b4wjk+dxlDgP9AkpGbqFfzyIvrnkK17t53fI4CbyIMbfMk7peHmcyneFyNWJUtQBCqRu
         HekQ==
X-Forwarded-Encrypted: i=1; AL+hErG9PR7NmgHgagwdM/Pn7UJ2D+1ATTL1aAfw5+2Br6SEYh+dAFLHU+Jl/Kc1X4sD08i+WZnFfyJLPtHKFPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Fw8B/4J+K+smARFH8cxfbKQEUTbO2Qn4/vQUK7t4m09pHjHF2
	rgBO30/P0L/7w0ejGF1N9hjWK/TU95MFxvJ5cUDg+UGPlykKKeMGjo9C
X-Gm-Gg: AZFdTZeyZL9Eg+a8N4eTMzZzeP4AfbTYSEyBw+i6UHcGDwZdZFWQY6VIeXlQB/KDn5o
	6CVOGX2M4odFaPYtVCW+yRvP/l8xogyxAypnd86kfX2L2KIgDS+q8tsJG0UjQhPG5wdElYGqLla
	QvDk3Vq2o6DrP6ogczG28mbCqm7dFEnuHgkLL0CaUvih4svv1bAqpyTUrtFG43iFdAVuiBW26K2
	wGAL/v5cFsESE/4f7ir6dWfQ0xqvTP5ONX4k/QMxFYTk7M4pAYz1NfedNO9/kTqWSvss5wfaJfX
	ETbRkw/DseqdUVWYmW6ClF+ntCFFKtkrTkHY1JISjjukOM7HwmtG1vUnpRs8M6DNmGREmYCy0x4
	k3FsdReduBcQDYTSVRYkFgeMP6ISjEak03DGizZFbmGu3SVSEGqBHIea14tnJmf3RGYa5X8KpCh
	vLddeiNr89Pw0V45PPhvEESk6E7Mk1QXrsdcnktaW9+JG2lDrcDEUHNvcDrD4kOIR36RqrQnGTQ
	+HzICwIQnbrNiqh4GwLmas8U74/ZZ9ynBd9jBUmMwdXintJpjMqxVEEtG8TpQlNoa7khNtApEc/
	79eA9XHP7aQIO2aSsFIFzr1NluKyf22/o7EleO609soLSmzI1dzgT+2UcAAdBRVM7zhis7uPXpy
	TatAVACp++ZSuAobGTJpm1r/R+qcjeviP4H67oQ==
X-Received: by 2002:ac2:4f11:0:b0:5c1:4e10:20b2 with SMTP id 2adb3069b0e04-5c1b7cd5ed0mr3313092e87.45.1795503021696;
        Mon, 23 Nov 2026 22:50:21 -0800 (PST)
Received: from yantra.. (nekmmqsyyquzw1lm5eb-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:3cd2:d52a:a1ef:5dd3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b45sm3538556e87.41.2026.11.23.22.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:50:21 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH 3/6] iio: accel: adxl372: use iio_debugfs_reg_access_regmap()
Date: Tue, 24 Nov 2026 08:50:13 +0200
Message-ID: <20261124065016.185124-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124065016.185124-1-zoone.rupert@gmail.com>
References: <20261124065016.185124-1-zoone.rupert@gmail.com>
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

The debugfs callback only reads or writes the regmap of the parent
device, which is what the core helper does.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/accel/adxl372.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index a880ff4bfce1..994c5cd58bed 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -806,19 +806,6 @@ static int adxl372_setup(struct adxl372_state *st)
 	return adxl372_set_op_mode(st, ADXL372_FULL_BW_MEASUREMENT);
 }
 
-static int adxl372_reg_access(struct iio_dev *indio_dev,
-			      unsigned int reg,
-			      unsigned int writeval,
-			      unsigned int *readval)
-{
-	struct adxl372_state *st = iio_priv(indio_dev);
-
-	if (readval)
-		return regmap_read(st->regmap, reg, readval);
-	else
-		return regmap_write(st->regmap, reg, writeval);
-}
-
 static int adxl372_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long info)
@@ -1221,7 +1208,7 @@ static const struct iio_info adxl372_info = {
 	.write_event_config = adxl372_write_event_config,
 	.read_event_value = adxl372_read_event_value,
 	.write_event_value = adxl372_write_event_value,
-	.debugfs_reg_access = &adxl372_reg_access,
+	.debugfs_reg_access = iio_debugfs_reg_access_regmap,
 	.hwfifo_set_watermark = adxl372_set_watermark,
 };
 
-- 
2.43.0

