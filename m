Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729089;
	b=ypdvpoT77i6RYpFBnYYuZQ0ln96FJD5/1dDfl51oHh/XdK15U6rEhZUrd1JOOTxmi+LA
	 YtRcmB+HFuF9l33adA6Ny9fz5APLwHgOjCQEQ1iqfT3DJspjZmY9Raqu82fgQbOTXY7lp
	 05IhZGX9poj19nZvoAM5qZiNk9TQroAkmSH4yrSPEpganrUA3ssJ8X/YFno+hlCx9jy9J
	 7w+9wZQZWaStv9GXBq33CmHPX/PR6s1j7fr6wGFbGPxcEwD6Emb53EX002dxoSX0Krf8e
	 verlT3NFk/OLAnMu00cAnHoRFmmLUgWtyx7qksPXRG1JeFJiQc10ALkbs88ewYc4Eig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YRpXQrHWpFwrOpMV8MW5AI9XJefGuUFCrzL+sHdF41M=;
	b=e9HUL/jixrzAa6IBEdjo+q2oHuFrqmmQsitSsmPrqvCmAbvDjjr6vlhIsonAPSU+7RPS
	 jlA6h2P+Gt1TY/C+BLh9JvDJrBxJ0d+ZjtCY3qM4CiKfQD0FXbN6cYaEGwVFQ+QJzsZQX
	 Yd8sy45Ytn1Mnf6GmTDPywdtQJheBDYSKkTBG5mIJ9V4BD5cklRciwTbGZ2Pro3HJhHZS
	 wdDX7eES5AomHmE0ArJ86vWl3ZSxlEJTTnhbxcW8ku3pfRwxqRYYb/VsX8OGh+kwqPvNJ
	 CFrpPkUvSSS70OPV0ojDdFIpA0LFFCkhcgbzpcJNHBThZmHc4TRymOxzZwXlriqBB8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPH5WV37;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPH5WV37
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8c6c06b3321so5896190b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729088; x=1796333888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRpXQrHWpFwrOpMV8MW5AI9XJefGuUFCrzL+sHdF41M=;
        b=UPH5WV37lSVsSIP0gw1HSz46gqWtdd/gaSgcGVnsHCi3yvyHJtcogiKy2W0NuBJMs5
         SQxZMgtibaVfb4HWJlXQiljw2JSaMLbW+jDjBGzm53iv6T8IOccUu3BnJqenbD+IGta4
         jJVdanFXAoupcK3qYYKXaNo+K0TIq4ANUycAcMw+gZkdcSoU9GmkC6bgodODUEiKuS1n
         +vn1O2feaiUeZTUZ1YZgsp2NLvULXMbyIV0VhMeKHvZMV6eT6DYqAOimcucWSXy1JzNp
         aJ7aYks1C02eyM4aBbFX8R5xInvKSZN+LXN8owREq+nPgXprhn1xgsjzauYIQetvq55n
         ah/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729088; x=1796333888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRpXQrHWpFwrOpMV8MW5AI9XJefGuUFCrzL+sHdF41M=;
        b=CUk32ZqtlQft6vSwEs51ArAVV2C40V7+6aLIHi8GHls9bRClQrf6D19b6T6wQWj8Kz
         BhnB+k9zW5g3V1zJ0zQApeezq6HENYtKWZB9aM5uxxrN1ajGfYiSPDVw6TclSzJjWy4l
         PZaTfybS2AG0ePOXpwusiJVwGG7j+Tc1M0z8l3GHYmEBlLJiy13McByX0Kq1Ovtcam/o
         sPmkegCi7x1YcwuXkuRmN3tP1/veF1+pO76c2U8RcFpbr5biV7fyqYu0O/RzeoonAEe/
         CqfVuycWf1uaGqEPL0CgF2aweYIo48m8/u58soJtXG1yrOyO+4zkNgd0pPPTx5S+gS/O
         d6Jg==
X-Forwarded-Encrypted: i=1; AL+hErHVlb3U4NjLwu3CMF4jauNb3GxYdLTe8vkFEHRUJXJlzo/k+67zeoqGnb/hYuI4u1CO+I7iaYR/MB8DNfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nXtgQNBOG8bB0LaKy8fa3L909xytg7bI5z9cGJsjZFBaaWVhR
	yJ45bGR8avyY4QAMS8GSng8B/yvt9LJW9MoXoCFxLNhy9ht76MEzIVU7M+9hQAL7GBYdOA==
X-Gm-Gg: AZFdTZeCfsKw4FibjiY3eDHKL/nllMNWWMFHSBjNrZ8GX2180F+N3yj4OkaVM+7uAdh
	vwcvVbmafMG+9lHxjz+zNuiG4/ofpXi/d9cIEp6DNMoKz5xoZY1ccjW3AbPCusYOxAHevICy/0B
	cYsVHFun6d4TOxqDXu/oAoqAhLuGZHOpyHdJiCFfR94Sxk08Gn2LN+Z6wf9X4zHBs/G/ov5HgnU
	gcB4zxKxhtJyOXGD8giStaT2otp1jBEV2LSS9k2ijiFtf0VGh+g0bStK7J8SLR4WniYKxcD7x6f
	24culj8CuG0pYBBdVZ41g0ZusHM/OrSBhrI4nmaoJKD9le0qJifQFEhif6+Ok1MKXnIXIbe4eou
	4OeoizqUaKxxnAQE66xRbmybJzA2QTateS3wWxuYlqU87UxTR7ENAV3aDujSsMHbO5Wkub1ybi1
	DQwSORHlLMLVP6HPsVNCVGMBYRmunNnaR07W7urgYsH1SaeDFoS8Nja+fje3oco9wkXq+IzV4sI
	RsIO6YLUQ4L6lMHi4RxpjsHYBY2eigSDklOmQQ8Qau5AP60l8J06cgfdiiv+PXb318JKqM9RM7/
	YaXUxsUa/n6whcT4jeP4G0UibnrVWt2ibItkfRqPsi6x7Cu8SjP3jTbn7hg+oM9aNs0cCNsCoeH
	M0Nvkh5sp/Fnt3mPWBM3aJAAIgylQCdsENR0wHbFDnadydV9nenuTjjwCEFNIK11XRBIG2m2KsT
	vFBkcGlcbLu9HJW4V70eUpmg==
X-Received: by 2002:a05:6300:8095:b0:3de:8ee8:8323 with SMTP id adf61e73a8af0-4014c946a9emr20399641637.29.1795729088320;
        Thu, 26 Nov 2026 13:38:08 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:38:07 -0800 (PST)
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
Subject: [PATCH v2 5/6] iio: proximity: hx9023s: reject out-of-range debounce values
Date: Fri, 27 Nov 2026 03:06:50 +0530
Message-ID: <20261126213710.1047676-6-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
References: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
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

The near and far debounce counts are 4-bit fields.
hx9023s_write_far_debounce() and hx9023s_write_near_debounce() pass the
value through FIELD_GET(), which only masks it here because the field
starts at bit 0, so an out-of-range value is silently written as a
different one: 16 becomes 0 (no debounce) and -1 becomes 15.

Return -EINVAL for values outside 0..15, and use FIELD_PREP(), which is
the right helper for building a register value.

Fixes: 60df548277b7 ("iio: proximity: Add driver support for TYHX's HX9023S capacitive proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/hx9023s.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/hx9023s.c b/drivers/iio/proximity/hx9023s.c
index 2d2774398259..c2718723db27 100644
--- a/drivers/iio/proximity/hx9023s.c
+++ b/drivers/iio/proximity/hx9023s.c
@@ -359,18 +359,24 @@ static int hx9023s_ch_cfg(struct hx9023s_data *data)
 
 static int hx9023s_write_far_debounce(struct hx9023s_data *data, int val)
 {
+	if (val < 0 || val > FIELD_MAX(HX9023S_PROX_DEBOUNCE_MASK))
+		return -EINVAL;
+
 	guard(mutex)(&data->mutex);
 	return regmap_update_bits(data->regmap, HX9023S_PROX_INT_LOW_CFG,
 				HX9023S_PROX_DEBOUNCE_MASK,
-				FIELD_GET(HX9023S_PROX_DEBOUNCE_MASK, val));
+				FIELD_PREP(HX9023S_PROX_DEBOUNCE_MASK, val));
 }
 
 static int hx9023s_write_near_debounce(struct hx9023s_data *data, int val)
 {
+	if (val < 0 || val > FIELD_MAX(HX9023S_PROX_DEBOUNCE_MASK))
+		return -EINVAL;
+
 	guard(mutex)(&data->mutex);
 	return regmap_update_bits(data->regmap, HX9023S_PROX_INT_HIGH_CFG,
 				HX9023S_PROX_DEBOUNCE_MASK,
-				FIELD_GET(HX9023S_PROX_DEBOUNCE_MASK, val));
+				FIELD_PREP(HX9023S_PROX_DEBOUNCE_MASK, val));
 }
 
 static int hx9023s_read_far_debounce(struct hx9023s_data *data, int *val)
-- 
2.53.0

