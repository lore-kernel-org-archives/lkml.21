Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866957;
	b=LkwP0ejsfuAXRj7fQWdha5CUFENS5//RPDQ7jA2CJP0NUJoS5DHSl9zGkce93GWh20RW
	 aWGDly1X4ACoBp8vsSbHOwE+tpui9ma+wDtIL+mo+tLu8lVykJB4Iv5wknLaxMcuX3m1w
	 khxCUbBNX1WtjOfDGFUaLjvvrv/ah0UOFxd9PU3/G+N/Su9nadAun6XncIuIvmjnyAtF5
	 vymgzsI/4TleLdLxK8+VpJ3uc515Oixn+jctfuytC3o7m+IY9YOsTAwm6TB70pL5sb3XB
	 1WTBAi36ew7+QOGsW4A7at4xxHTwCMLOCmLoF7SMmD9nmY8S7/xoGcALaTL/18qZSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AhETqAy2XUV624v2uYTcVSsHVdyYQ/4qrBgHkFl1HuY=;
	b=pxJTVAV4Fv+U7ZGgbuzxE4bTb58467WNtJmHVlnXvIub9grBlyUd/affE5fMp86/7tFb
	 EL3RljKrUF5aOV/DAeAEpvcAD9I3GRptrkxUQ/AgUm3a/VMqqIBl+RPq1aU8Dj7kckZ7Y
	 UUSUjy86523OzKcqQcc3qdQVNQ86gZqyb3mfsFCsp+iRW6+OihbAPDKDad+YshCBnDptF
	 IpootyOO8i1LmyKU2s4uuqC4yJYzOM8aRMemQ9k4fy7pjxHsqilgPBTasq0wpvo1B97io
	 ojePz7iPd0bSAKk0061Ir+1mlVjuaHk5bDzV2BTFQiPKOCsuevLUC+1gQjX7kBEQ0QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7fuqdMi;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291AC606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N7fuqdMi
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so12531535eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866956; x=1796471756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhETqAy2XUV624v2uYTcVSsHVdyYQ/4qrBgHkFl1HuY=;
        b=N7fuqdMikzKrZVwpCswI3HmoWohZFsV2aPrtjtPm0AdT4Uybaq5hdbcvLwlfCBRRcp
         YF2Vh0a2s+E4Bwftn8sE0tKODGgGc/OZUShN0oc2kYwFy4tpiRBNAaijlBvLBNhx3tN9
         Y/AYJczdol4KdkgH4f9GAGqoDUORQQ+7L0IQLKEm7O6KpG1DnRO1q4PhuRRD5/yS3TdE
         uyR8ViWDzt4nSNn2wdTNQwdLs/W1c6AUefizpmtzsijaoOqAHdrLQTDKz+rwWD+a69Kf
         wU8/jc3pbD2j2IYf0NdJ1yH8BN5DD9Ozm8keb+nA06sgv1uEAPTxwVpwyGtY+wnNWeNg
         PMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866956; x=1796471756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhETqAy2XUV624v2uYTcVSsHVdyYQ/4qrBgHkFl1HuY=;
        b=dmidr7oYUcuHSZzHSOkrKc5V4tzs9PyapiPcM7uyZhcFsTnNX8OL/g2rPVbTkOJZcH
         +EdEcGMfyKWbGofE+W5BhaytL7hvaCe3ZsAMb6FV1EhV+tSZmHx/P/j6JsB4xTIuiVJD
         z5vP5zIKHpPIEO46H14UWmhkPdaBzIwLemIwMJEwbByfacHxrF4/xecmz45T6XGorDDO
         tF2DSvDHBa2eucp4RpC7gdIcz6Q6BzcRXBbJmfqlzWADtVFzED7PR5z/OdQ/QqXlipk0
         rYb2McfVJCEWui4W/rowS6CNwAsj5EzF/GoFOAl3pHWMcYybLILi9LzQZ0icE8TKLYvr
         CSaQ==
X-Forwarded-Encrypted: i=1; AL+hErH7sFTNyGhOM083uiEkNwoIM5wwebUqv3pkm2b2lEI6iwPWmC9ZOj6UQyZbEqGdVZXxF11snIjO5QC6d6E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5u8XbroIzPdY3cpf7GE84N6iRkTePNU3ZpWTXTamu7ZOWuscX
	4/hwyZl77hadyVF2JAT3H6tCGIqVJ4QGIkw25W8cNmn5WB7QJTCdksBm
X-Gm-Gg: AZFdTZd2u9fjfN7i2ws0EVfnTvb87/jCn8jbt7NzpNWrpPOFijea/Dm0xvccfDFMcAv
	/30dEEkj4lYhRmPmbk6lO9tbqBgaK4pYDjkBwBlhQL1uzoz5+2HKJxSm45KIz5YcsbWuIKhX85B
	PBP9VgoVMXTmMWNvs/uI2UIEU7bL5sl2eDw2IQM+VQtF9bhhkOQrR7yWaJ3WAWWZPf6EXISPwcL
	98kbG1wiMZHNt+DukAhGubX+B2Ipx3ThlMufGS4ea3QpGICRdenHlXo8+Z5BdBDIGXQmaUhX2xX
	bhoKArw/HI4v8l7FCe/QkWi4TYM4gQKNaAHPpiQtbOicAAz/vCMA10MJ7y7tBXqAcZ2/6q535ew
	ss9zZyBKPusNEc8AQuzUiH5xcc5wAYzVfSS9jlIbpxuz9pag1tI9ydT2bEqvdIm64G2fXaQnMJy
	K9U1IpbGespzyFwMVRpjlo7KoCxgd5+1CWl2zseclAaZRgH1P35bmEn0TDACne0SoHZDiJ/2sOj
	SImnoLqVVuqPOI+HQeCSN7GHAkppz59bgpJzbJjUBCQdZDLbDxckDHRzA/QZTQDevm+NTnuL4wR
	YK2asdjiljHh9i22anojVhsv451voOESKp8PR/hCmiutnrdzuO2/62BOLx9TUmDhnMpC72YScsT
	RC0NkMheueOJR4SoaOWSMNgoH8OK9TR2UZqwUaJ+Eb4gG7VcQljJUC1NWdxaOhFKchfPvsHojDO
	k8fVL3xBZEqVaVAC9r/roxSrJDnueNxx4LY39P1kG5BML+p4UVhPvGl13vVVbcBiE=
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr30775124eec.12.1795866956143;
        Sat, 28 Nov 2026 03:55:56 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm76783178eec.13.2026.11.28.03.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:55:55 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 2/6] iio: proximity: sx9324: fix proximity threshold writes
Date: Sat, 28 Nov 2026 17:24:50 +0530
Message-ID: <20261128115534.558478-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115534.558478-1-kapoorarnav43@gmail.com>
References: <20261128115534.558478-1-kapoorarnav43@gmail.com>
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

sx9324_read_thresh() reports a PROX_THRESH register value r as r for
r <= 1 and as r * r / 2 otherwise, and the division rounds down for
odd r. sx9324_write_thresh() inverts that with int_sqrt(2 * val), which
is one register value too low when 2 * val == r * r - 1, so writing
back the threshold read from an odd register value lowers it by one:
setting the threshold to the value it already has changes it, for 127
of the 256 register values (3, 5, 7, ...).

Use int_sqrt(2 * val + 1), which gives the largest register value whose
threshold does not exceed val: for r > 1, in integer arithmetic,
r * r / 2 <= val is the same as r * r <= 2 * val + 1. The result only
differs from int_sqrt(2 * val) on those edges. Checked for every val
from 0 to 65535.

Also reject negative values. They are converted to unsigned int, and
2 * val wraps at 32 bits on both 32-bit and 64-bit architectures, so
e.g. INT_MIN is written as 0 and values just above INT_MIN as small
thresholds instead of being rejected.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 762c327063f9..3f2f15d237e9 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -622,16 +622,22 @@ static int sx9324_read_event_val(struct iio_dev *indio_dev,
 static int sx9324_write_thresh(struct sx_common_data *data,
 			       const struct iio_chan_spec *chan, int _val)
 {
-	unsigned int reg, val = _val;
+	unsigned int reg, val;
 
-	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
+	if (_val < 0)
+		return -EINVAL;
+
+	val = _val;
 
-	if (val >= 1)
-		val = int_sqrt(2 * val);
+	/* Inverse of read_thresh(), so that writing back a read value is a no-op */
+	if (val > 1)
+		val = int_sqrt(2 * val + 1);
 
 	if (val > 0xff)
 		return -EINVAL;
 
+	reg = SX9324_REG_PROX_CTRL6 + chan->channel / 2;
+
 	guard(mutex)(&data->mutex);
 
 	return regmap_write(data->regmap, reg, val);
-- 
2.53.0

