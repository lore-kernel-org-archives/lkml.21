Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333648;
	b=WkwoRYQ98E63pewRNsPa+O5Wpc4ClYdi2KtHoPp2ai3amUtndSSFxeY5ZVsOyo8A/Zyv
	 SmSwzaYYs+Gn7yFGDXBV28vdtA/z63m6NW3MTvqaGN+oU9dZSOtOFTnQGLL/1mfIYj7RU
	 VQ08qSDExY9jMpiYMfDENZaSYXqtHJIzkrhQ54ND7taQeRO1mi+A9kOeSI8QMb/An0I/r
	 lElJgqpqRcaRcvy49uLZH5FCj2HIMGTaEGKj8R4KoBVFEa/3tNT9aJPDK7H85EGz3sygT
	 +WeyPuXDG881sNijkBzTboA5K2fmFggXxocE0StEE+G4mvgvWGj3SMLwqB4DJM0bs+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6bsqUrSfHFWcb8bhzryBelIuZYwcZvusqpWZAUEkXww=;
	b=nkzvwpYsfUiFujmv1s7fVa5+Sy3BfMpbxjZWizmoEC4ddbt/EluKtO4NvgCcMBFOu54g
	 MPlJ0gQbn5z0Ucn4UAHh/7UB81xS0/UpooMSwJ445oWkapRcGu4zsLB696AEzwLtrLqAe
	 LkNDcCQLohoVXhesVBPmUYAw5Kwkk77lJbJvPhYHUVb9E5n/yz/rnc2V8mbkyGi+US1fM
	 P+AoGNG1DjHGObarawslDjEsX6JOMyNMV8tdKasTrj2KiomaxIcF2wjQf9SargwHgPTN/
	 m+soAEovtlyZGmaGS9ofXwvDYMitYyXZvn6LVIPnWm8tq51+KTEycc4Q5d1uhfEKtKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKtOvBup;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D66606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D66606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKtOvBup
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a315ed211so2857587eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 23:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333647; x=1795938447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6bsqUrSfHFWcb8bhzryBelIuZYwcZvusqpWZAUEkXww=;
        b=aKtOvBupDpSGwcSbWc3pXf41naDGMsi8s8wIwLO8kHTSy7b5BeOsflbJmZbzO43vwT
         Wtnv3Gpnaonn4eWS+Rtalg4QXlpxARRu0L13keMdlHSF4W2fYHxGjOpCnkCoCM1p818W
         ldxeamLjnsf3J/bPxPZKX/DCiCQF3jyDqSWh++hccmSEHhbtLl1fzuS5nH7sIoJq+6+j
         cITi4HV7lXKUfhGM6xiuToXXTYfX9MeLd5VPaQumamh+4xtfJfqJssLMEtfYzQGCRJgZ
         i9O/wmAv0irpVL7VU0SQiUTUgjsKYvJh44MTipz+7WuS6bIv+h5Uuv8oFBDjGn4uWMhX
         +1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333647; x=1795938447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6bsqUrSfHFWcb8bhzryBelIuZYwcZvusqpWZAUEkXww=;
        b=X5gzHAnCY1Xb8a8NQiYMrRElyrEdIDg/qjoL266yMUHcsEdOdiWynp5NCP6AHu5heh
         x4UPERCb4H/NuXFe4ypGDgDEg8WFHBBmx8zBEiIpBqK84VPIEozLmS9DOtfi84RLHJAO
         +57HVFqI8OzkBCa8y8vOi1+/LfPiCY/BdFBKdoUSPfpjmsKp0788HrhybfxX+aobTDcD
         NrFtBeL7KNUdUVLmKAtbfSt2opXnR+nGYsVVr/cRn8+J/Q2dz75MSab3brzugLCAroUP
         ecozaDtr/omGmoGH9tJ4ObWtxM4xO4xETrp2nZf6d0ZEFVkK6uHddEdIQB/2Pn4LuCU3
         oJ5w==
X-Forwarded-Encrypted: i=1; AL+hErFQGnjY0k20eDxSsEfY2FbIXbADASDEpkzsoCJR8KoxoVsgtGX3oohnxYrgH7Ee5HR71fPxIywJR7FO22Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P3Ju+zHQbT9H56BCCJQ1w5lq7zP8uHqFFLQAT78OE4h65xqZN
	c7NTvLDm/MGBA/6clEjynQloI8G0/j61Z3T6Wh5ZQb75CDLQjs0wsasv
X-Gm-Gg: AZFdTZcI1iVYAelx1pZCEkiMR6zH1IbS6dLGOmrLDRsS4fFBw0FDeGNX35lea4xTGMx
	JIMY4fJvKGPg5om8N0U4aydd7oLjRQp6T7RbXwNxFJ900Rrxn2haK9RKnwggufXvbvyq+2xH2rG
	QTpnSumjhkAryu367IiUNSBviNVZkBPoRCWexIyWa9nciZ5ia+juTq1mOcyQFtcGN2Xnyy5bEID
	hG41yQU+ybBHtOMBd8Q2n5aZkhURYTFOmMoF6GUsSCcuzMNeyT9OowH3h4TinQFFUKpwCyENswn
	QybKQlRHp6IeL4Y+6PFpEnKn2zq9eydBCJ7qjZNgZrJHN5PUFu05CXmsGsQxRAl5frfisL34a/k
	DBY+ExwidWM0twuNKOMuXpvM2BoFSwrxOP8t9bvvA8kALqB1XJu8jRjpPtkvk07BBAWBHFmAlkp
	+9uIAdYqY3kepWaVEikouoiytMQAbAEBfXMiFBhUmSZ/VTzbCG57i681rTNn5ZJupGEk/RKdOgW
	LV/O+GfH/quQQjjXyn/ClTdnIsvFaof0X2EcR/x1ybfLuKvBG25vvzbtHp4pchfW5W30mVVYQoq
	wE8AVgsmnOBwJs4EWXoJJH9f9AJMsPBqiSuKx5nS6EzLd1xrTSNb7cCUzsZt+EiGUZyYEy19Vay
	JxPgZTAn2w9/vRo4Y4+keNtQuXLWpApi3SDFusaV/fYIvk104NAw9PZRQsTIL0QAR6+7boKYvmd
	RLwwH/2M49PwIQkCSg8f9C7Sw9VgASsAiDNFX6t53qnys=
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr10030181eec.2.1795333646609;
        Sat, 21 Nov 2026 23:47:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385667decc2sm24898071eec.9.2026.11.21.23.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:47:26 -0800 (PST)
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
Subject: [PATCH v2 5/6] iio: proximity: sx9360: fix proximity threshold writes
Date: Sun, 22 Nov 2026 13:16:45 +0530
Message-ID: <20261122074649.239441-6-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122074649.239441-1-kapoorarnav43@gmail.com>
References: <20261122074649.239441-1-kapoorarnav43@gmail.com>
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

sx9360_read_thresh() reports a PROX_THRESH register value r as r for
r <= 1 and as r * r / 2 otherwise, and the division rounds down for
odd r. sx9360_write_thresh() inverts that with int_sqrt(2 * val), which
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

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 9ba967a33c98..9a2796f67949 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -508,10 +508,16 @@ static int sx9360_read_event_val(struct iio_dev *indio_dev,
 
 static int sx9360_write_thresh(struct sx_common_data *data, int _val)
 {
-	unsigned int val = _val;
+	unsigned int val;
+
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
-- 
2.53.0

