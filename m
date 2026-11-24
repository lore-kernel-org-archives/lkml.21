Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795553007;
	b=dphQaBTdQzOyxYMyqIiu7AxNDhZuK3/mnLmu5P7S6tqcllHdZYCliIb8KP+y1avCYmH+
	 eaRJdnVP0jmEXOU0afRwRabGOM45rzLFSyEMa1nGjuWiDWP/2t5r+8UPiPDKxduevmThO
	 fs+Ucf0C5GG35Uj6XdYstNwF/jMm6JCk6g2OHuHGhrpMaWMqwnzg7zn0ZI0LzVf75C/ZK
	 RiI7o5jVnyibOHyXAWn0o6OdO27MSeQw9GDR8PUQQwatS+GAkd+A/a2sjEMh+H96mmOuy
	 DIPADcvkzsx+LoSP3/RajACF2KRTPnTWay7alpdlAFcv2T0uKZHgqnBkKlXjCsdmJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795553007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=wffwv16aDhgOHgRJNfimJ93EfWALxpawng2gAoer5pk=;
	b=0Wj9PjlB3/AJSyG2pAkla/z4QlVyBY/gcd2zLJpes3BE7eWALyNVvt8lV0uvrKxRyiZb
	 JNlLpWLhXYz9gviwgvwL07xjxiH1eWq49IHvxX3l0KgLZzJR6q9XlC/Ezl1wYmALK8d7Y
	 bZQ5dYvgmOIB4KPHLcAIVYis8i6jG+ccMOQOwB+KMXVS4/43dWedF20lOQPQJ1g1zXv3w
	 SIo/2S8o0FQYfQ2RMftE3uq/nITbOvu/0abkRPcFNtBFFF7yADGhulCrtx0oPVWr5io3d
	 Q6VkLEP+4j+RaTA828jZQtp2UiBoVGu7KP9cJ117nSEoF4MdtLmpU462oMHKiJLQ8lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gr8vucTX;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B976606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B976606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gr8vucTX
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5198302d38so151569766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795553005; x=1796157805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wffwv16aDhgOHgRJNfimJ93EfWALxpawng2gAoer5pk=;
        b=gr8vucTXCLBGUkcFT5OGO7txLV3Mc/tM844NtT/mavP4IQRGmsnM4m92oKe8oo58yL
         LrBMpdkeMqh+DdFnmZavCI6XiKChzEFnULhVoLYoE04eoDJZ9z1kZHc7rkot86w9drKs
         cRn65lqbnwEr177/PYN3XP4MP/LYJIljrdqaDhiMlJTDyzQFUvxvJSAKm5Br6e9+9y40
         VLcjpnKWDyr+l/6gdNr9Pf0cvfwIoHgpaabvqVfj621M6usVXfenxyr9lbUTK/erWo3w
         odfukVEiLdWn+cKTSSAjuNL/Ch3Rh38XP6hF3RWCg7onA5oynEU2yPNyyTM6CRZnK+bY
         6Bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553005; x=1796157805;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wffwv16aDhgOHgRJNfimJ93EfWALxpawng2gAoer5pk=;
        b=z9SD7G4afhFJ8zz+sG8xDlqx7O77ss7qasE/1MYZoDrS6+B4OFd0FPG8Kjbg/s+vv6
         omEcx1UVzEV8TwdyU+/uUswU1J5xr4oDjYNiTi6VykVd26r7Wbej+oHDeISx3ECCxiBo
         BW1HyrJCSNX4Bk532fF6qc1D3/Vdny4ljWGaC3Ptb4erEYCBh3qAlNWzuhl1dYTRnspe
         NMFCMKZj87vTcqYkUXO35lscllhnyxyP4G891/WK6AoS7fN55Zqyphvhj8fqr6QIqDkp
         MW3Vi9HdpiDORuv9sBDQ3HAFeLs3v18OKQpv4vOLYt4wx3BXitfHNbEjc32Ka3DgXnK2
         nNdg==
X-Forwarded-Encrypted: i=1; AL+hErG78MUFoPO2+vGlwIeSl5AbaVUtW35IFryS3uBJxJSQDESKiY/fdhwWhollvgTbTl4Jdg3xDZl2IMvXisA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eh9gr5zvTYpPfwIVL0j7gc5A/Pxh+xxeLassc1FiB1PT9bSgH
	f3bOIEdzcy2sbhu/2OilbtMoL+vAuncZYQw8bqTmh39vWNjd6PcCnlA/
X-Gm-Gg: AZFdTZeu/l//0XsBqyBmrtQFgteur2blfD9bdYA/Nj4mLXoXbebIIX5q/itGHbQw9iL
	DXYtnScUR/AZ0sy+MmRNqJPLFrKacJ/h2LBgn2nb80Mg5hzYDfaVDlNHKqhafuHRZiFI+5d3AJ4
	ZYduCIfym1qrWF8wBVuCxpRWlQddMnjFn0qvTZLbeWNOesOXJDbWHiPPNf5d+kYHVzjqCO/ex1O
	URuxaNnExW9U16ZlVdD+eD3IyDN2urNc55HtmkipMivah1otHyYs1ThDvlmz/BzNDef/DzQQIfX
	4sMVthWTzC41udv5KPZX+kTayK95VaYD+ihDZgzYa8LDkP82vLIGhUzw3LUTr9GERXdt7Wj9/NV
	zIm7uprqvvBXgUq0oZbberr2UODHG7XhwcjthF3rNCkslAM50K983XpiEOW3txArGQZbT1AIIS4
	6lacY7fexGp1/dpTJ3GzdhGaQgehxjEzD8ZNnY5z023t3jaFYmTWhFDFJ0EAzFZB7tYECKw6ql7
	VfNgy41d46oscoDn4RnQWSPvcEVFIXanVtlZy9icDQMmsg2HP/eVmP4hnV2X8JVBTlAQHLlADbV
	Lcux7abScKGdwpe20l+O10m8ar/dIPwcI/p46GWSw6iI9lgGDJDMJXRGtZVJ0MCyZp2SLT73C5E
	7bzzeQS9Ec/KSl46S7RNyNkIy2idDWXW8weLjbc4TDg==
X-Received: by 2002:a17:907:1b1a:b0:c46:7ec3:fde2 with SMTP id a640c23a62f3a-c513a5ea1b5mr1248192266b.11.1795553005278;
        Tue, 24 Nov 2026 12:43:25 -0800 (PST)
Received: from localhost.localdomain (78-82-127-150.customers.ownit.se. [78.82.127.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm576160866b.12.2026.11.24.12.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:43:25 -0800 (PST)
From: Pooyan Azad <pooyan.azadparvar@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: u.kleine-koenig@baylibre.com,
	meatuni001@gmail.com,
	w1zardsec@proton.me,
	robh@kernel.org,
	jeffrey.lin@rad-ic.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Input: raydium_i2c_ts - use a fixed-size report buffer
Date: Tue, 24 Nov 2026 21:40:04 +0100
Message-Id: <20261124204004.98278-1-pooyan.azadparvar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3e575d6e2eb90d4a3707319d37134c1a@gmail.com>
References: <3e575d6e2eb90d4a3707319d37134c1a@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

A firmware update can change the touch report size. The driver keeps
its original packet and report sizes while updating the contact size
and data bank address. The IRQ handler can then read and parse reports
using parameters from different firmware versions.

Embed a buffer large enough for any value of the u8 packet size. The
managed IRQ is requested after the driver state is allocated, so devres
releases the IRQ before freeing the buffer. An embedded buffer also
lets a controller that probed in bootloader mode accept reports after
a successful firmware update.

Stage the firmware information and report parameters locally. Publish
them together after validation and after all reads succeed.

Fixes: 48a2b783483b ("Input: add Raydium I2C touchscreen driver")
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/linux-input/3e575d6e2eb90d4a3707319d37134c1a@gmail.com/
Assisted-by: Codex:gpt-6-luna
Signed-off-by: Pooyan Azad <pooyan.azadparvar@gmail.com>
---
Changes in v3

- Dmitry already applied v2 patch 1 to for-linus.
- Combine v2 patches 2 and 3 into one patch.
- Replace dynamic report buffer allocation with an embedded fixed-size array.
- Address Dmitry's devres concern by tying the buffer to the driver state,
  which outlives the managed IRQ.

Testing

- x86-64 Raydium driver object built with W=1 using GCC 11.4.0.
- Seven mocked cases passed, covering report size limits, query failures,
  firmware updates, bootloader recovery, and IRQ handling.
- No physical Raydium hardware was tested.

 drivers/input/touchscreen/raydium_i2c_ts.c | 43 +++++++---------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 68ada037f694..fa6e93bec9d2 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -19,6 +19,7 @@
 #include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/overflow.h>
@@ -129,14 +130,13 @@ struct raydium_data {
 
 	struct mutex sysfs_mutex;
 
-	u8 *report_data;
-
 	u32 data_bank_addr;
 	u8 report_size;
 	u8 contact_size;
 	u8 pkg_size;
 
 	enum raydium_boot_mode boot_mode;
+	u8 report_data[U8_MAX];
 };
 
 /*
@@ -333,6 +333,7 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 {
 	struct i2c_client *client = ts->client;
 	struct raydium_data_info data_info;
+	struct raydium_info info;
 	__le32 query_bank_addr;
 	u8 report_size;
 
@@ -355,27 +356,6 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 			return -EINVAL;
 		}
 
-		/*
-		 * Warn user if we already allocated memory for reports and
-		 * then the size changed (due to firmware update?) and keep
-		 * old size instead.
-		 */
-		if (ts->report_data && ts->pkg_size != data_info.pkg_size) {
-			dev_warn(&client->dev,
-				 "report size changes, was: %d, new: %d\n",
-				 ts->pkg_size, data_info.pkg_size);
-		} else {
-			ts->pkg_size = data_info.pkg_size;
-			ts->report_size = report_size;
-		}
-
-		ts->contact_size = data_info.tp_info_size;
-		ts->data_bank_addr = le32_to_cpu(data_info.data_bank_addr);
-
-		dev_dbg(&client->dev,
-			"data_bank_addr: %#08x, report_size: %d, contact_size: %d\n",
-			ts->data_bank_addr, ts->report_size, ts->contact_size);
-
 		error = raydium_i2c_read(client, RM_CMD_QUERY_BANK,
 					 &query_bank_addr,
 					 sizeof(query_bank_addr));
@@ -383,10 +363,20 @@ static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 			continue;
 
 		error = raydium_i2c_read(client, le32_to_cpu(query_bank_addr),
-					 &ts->info, sizeof(ts->info));
+					 &info, sizeof(info));
 		if (error)
 			continue;
 
+		ts->info = info;
+		ts->pkg_size = data_info.pkg_size;
+		ts->report_size = report_size;
+		ts->contact_size = data_info.tp_info_size;
+		ts->data_bank_addr = le32_to_cpu(data_info.data_bank_addr);
+
+		dev_dbg(&client->dev,
+			"data_bank_addr: %#08x, report_size: %d, contact_size: %d\n",
+			ts->data_bank_addr, ts->report_size, ts->contact_size);
+
 		return 0;
 	}
 
@@ -1130,11 +1120,6 @@ static int raydium_i2c_probe(struct i2c_client *client)
 		return error;
 	}
 
-	ts->report_data = devm_kmalloc(&client->dev,
-				       ts->pkg_size, GFP_KERNEL);
-	if (!ts->report_data)
-		return -ENOMEM;
-
 	ts->input = devm_input_allocate_device(&client->dev);
 	if (!ts->input) {
 		dev_err(&client->dev, "Failed to allocate input device\n");

base-commit: a74c1c7406d06839d0eb15b69bca344e62e729fc
-- 
2.34.1

