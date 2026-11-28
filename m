Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866722;
	b=3hs6X2TIvHSnkM3KCwGc9xY7YNc1he79eIPNGyxMILfV2Td8OIBejrzvBekUZAOMvOMx
	 ikmifOzxieMqbwf6qwg+kHjQC4Gc3BaK2rI02gpzRKZXOWfxmzfT6zCDn40mk3RjMqbJN
	 dykEGz36IutjUq3jYjRQoB2+EMA6cCebl9VTr/y5Q0sPb6P5JR3UEfvrkZTPdx4Xrbest
	 p3MWhMUOYGzmSd+bGXVixmPcPmTjhKVPLo8QlXkwH7ir+zUr52TabEKHAqhY9t6Q7J2Iz
	 eN+1q4DFPAdiWIMHue+jp1QxBQ9tTIgyoI0jzVBSVRbAbqhe3yR8sND4p7WTesXIOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wQAIunjbZ5VEO8eGZeZfnFQxqO5F52y9Of/nUTYaqm8=;
	b=4+6ylRNmnjR1pY9r4NI8IMfOhX8aq55f/NdNy4XSVbAE7bhUIc884u8W7hsCwaMn7CpB
	 zTgLJoVaMdRdXU8NPKiZuyiBb0Rbmo+TK9RTTQbP74F8kkBgBUQO+Fi5/Si0BSZM8tJFK
	 ji7amzlIeeE9+DY4WDepg0tckgsEBcYmOUU+EljhZgrr6Q0wdd8sQKiRCyMIgh735LWGk
	 jU4Zzwm6r2lZs6t1Utzh7aM6lxSol978IodsByBGyuc0+C9xyKIIz7Kdc87XIpMO+dktc
	 dizrCkj+QCczxTTdT5bmND7ksXywHqYoE3IA8JYPnMX0VWpFSF3LPTbGjFxQwGK6X0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap6jOXkm;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F943606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F943606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ap6jOXkm
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386cf1041cdso6619333eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866721; x=1796471521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQAIunjbZ5VEO8eGZeZfnFQxqO5F52y9Of/nUTYaqm8=;
        b=ap6jOXkmKMicDfUfxgcnRnW18agrg9BaJqYYH+bjyGcleTXPC7xrANAF6BPmZjCM8p
         xgt56SIWv4rXCC3XwcJJFChJ7qluep/p7ccNdsQhpzy5AXMlCwZvm8pf7ge9n64OyGc2
         Ki6pD/KaqcyqYY6isA1KeiOavhZZIBUQdsNBO63HWpDezIihlhk5IJI9jR+EiBQvHqLA
         07r622D8xZVtUpt4sHvwQI0eq4w3fDgDFWKc4LAzQk8sw9kFmpluL7WWffcSg/fLWZqy
         b/wJmKbrRALh69MgPiTeC+a3+I6kOj5VMU6S1pfCgMS1NOerL4ExJLq8wXSVA01EXl4P
         HIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866721; x=1796471521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wQAIunjbZ5VEO8eGZeZfnFQxqO5F52y9Of/nUTYaqm8=;
        b=RXXFnOQrYgGcunP5TvcKEqjqXJ6eUEuXTj+pv6A5ilyIoDQMMT2U9fvMBs0BhpRR7e
         hSbc3qHKAjRAZCynowyEUsxyh5eh+pHiTzb2ft07xUxiaBeS8kQw05IjLdvHfT8D3vN+
         T3ppGQe1Q+7xlZ2GVHrhHnU+j2rkL9f6M0bBtooEyvOavkQEUPyw24R8d1xrGrxICBUZ
         7wPljbFNAo0EmoVL30QIS07SpJTOD2lzi3h0v1QE/Te/3mQE2eBpgl+vS4nGjcWQJ1hS
         +8ETgBxlL5G+vsO/k6lzZ2JhgOiox/OvW7AHl0h3X3IB9mfVq6TLV2rSVp0Yy46EY7QO
         sIKA==
X-Forwarded-Encrypted: i=1; AL+hErFyiFHjf4abtiJOqVP+jxTXZp2SgUgDCHNMysPtRqoQTtrCvOAa2EsfRqLamyElme18FiV4WtKuX2NQLbg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VW2XG1n4tOQ0Jvr3qfDWupXp4E097QOonF8YreBKyieEyOHPP
	1BjtDlnMccak+3m/vd3yAQq2i0ati5y0hJg7wNAKXYLiD4V2ZCKukOxg79RP7k35Ihg=
X-Gm-Gg: AZFdTZfL/VBb1tFy4qaPjZTVWaqMIMKHHwJNyD+u058RzyzzANy5kqZaXAHpFxVCV3G
	7OinsqqbUgnv2G7gYNbVR1tWlyO2LMdICkwwmMEYIrsKCSYiRpx33Hzaam4GQxP02oO9pvOOGek
	nv3kzHJpUdFx/6nMHLAlKAz/0gLTeRgGtYPKsPXNVTcs81iksJehPelHKXTmlGMBm2BXo5tE+U6
	iBfzEkcbgsKgZwTZoh8/YbQbCVIYDKw1HcUZzDgIDRGYf4QDw7pl36oAqylw/vJ5Sp93P29fq5P
	rGK0zDYW+NHBV4acJtnYMhcU3geL3CPD7hup+12eIhDbtYtuFZgm/xxZ2Dep8Raps060rLVm25W
	iUr12oMEzCUoKbislLWi99D4xmEuLlkwD8UdFqI6Z4AYSP+bovTcufENR1kAh19/f1rtd5Tvfjd
	i8Y06yRFupx9gCT140q5Jue9xehMXRC1QJyvkyYJZgCX849wJ/jYlnUA2HU3evu9kdPlC6Etv0M
	cwzg1dOpugXRRfJANoHT0FNs6QxgteDnSoonqCzNKvzAXenf5S4fjurUlWczSuuVpL4etHihwWn
	hIZjf2weNvs/nI9cTjBPHWBAhVdK35//58v+xi0gSjPKqFBuiH5eb0VkyPLJNIqLLCuOZ862/jk
	HDn/XhR0EAo5+BG2SbMnPejc/QhSXjdGZm7kTZdf7fwZmCxq/Gzj64sVKZEvN25dvJ9etbf+UdL
	U57T6OMOqMpoI08o52OYqxSG2KzE8bOAzIolvawvGDIg==
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr13305569eec.29.1795866721134;
        Sat, 28 Nov 2026 03:52:01 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm74256544eec.20.2026.11.28.03.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:52:00 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 1/4] iio: proximity: aw96103: report negative proximity diff values
Date: Sat, 28 Nov 2026 17:21:38 +0530
Message-ID: <20261128115144.557411-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128115144.557411-1-kapoorarnav43@gmail.com>
References: <20261128115144.557411-1-kapoorarnav43@gmail.com>
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

The DIFF registers hold a signed S21.10 fixed-point value (Awinic's own
aw_sar driver documents the diff data format as S21.10), which goes
negative when the measured capacitance drops below the baseline.
aw96103_get_diff_raw() divides it as a u32, so a diff of -1 (0xfffffc00)
is reported as 4194303 instead of -1.

Convert the value to int before the division instead of after it, and
declare it as unsigned int, the type regmap_read() takes.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index e3ab55170b6c..483b3bf18d19 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -261,14 +261,14 @@ static const struct regmap_config aw96103_regmap_confg = {
 static int aw96103_get_diff_raw(struct aw96103 *aw96103, unsigned int chan,
 				int *buf)
 {
-	u32 data;
+	unsigned int data;
 	int ret;
 
 	ret = regmap_read(aw96103->regmap,
 			  AW96103_REG_DIFF_CH0 + chan * 4, &data);
 	if (ret)
 		return ret;
-	*buf = (int)(data / AW_DATA_PROCESS_FACTOR);
+	*buf = (int)data / AW_DATA_PROCESS_FACTOR;
 
 	return 0;
 }
-- 
2.53.0

