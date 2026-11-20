Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164066;
	b=gVyyIJvGLcnU8Qt8rTzzL56iUpzRxUvf1DPArIiX6hLno/G7/FcYLr3eJwG7x2WDQpFu
	 Fj1QM/FRfxYdHUjwlWU7Cyd1r+SxLuW9970a56nZ9j90G3ZLh5aGOPKUgsjkxnZpUeFr4
	 YeyaAluZ6ZNdxyFSFwCS0wSfciBnunrXlFBxegksbO/Ro0BDeXp7SGas2lUtTNl63A3n/
	 ttdVWHaOrcwTHUo8JPQHGtB50UBqwN058K1A1cjZ18xR1/nJPLz3zJJlZK9WImJvoWcc1
	 SmZHFxTRPOKcFK4hePHroEUacAHDRRG0AMh3cygktqwFJiMfIbNq9u43ZK7ywy125OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3EGbLc76XrKp/CthZWQqfcemDv7vxiole5kdBmE56sw=;
	b=aP7QehL07ysV4vsrQbQ4JbYxW4wfJu3rYWSoLILSA3vZ/QFTFxcd+7EHYRFbRpFroC7i
	 2LGTbIOK+KvBD9Siwqy+DmQCsrf0HtiZVa1zLsw1CxLeZ5ukAewv6kLnyabgLq3m74EDO
	 RSxdLDZEzqo5ByuQkm6PXV1S35191WHLiFAyBaQ3P0ojKLwdu8TqL6kvSjFnmV+Zxl+3y
	 D1NbEIO3W8ciWfvTggUp7W3Vvfto1n4Y+eATRY/QBm3dPFEbcboerYOBxK3kxpWwEX3HG
	 UbpUdDRJDlA4g7C2Z2CT0QBYLSq2GjFzJgQsvYkagxu4DeAtM4L+rSy2sg4eN4SMmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kM5EbDcV;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76160A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D76160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kM5EbDcV
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38318d69173so1335457eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164065; x=1795768865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EGbLc76XrKp/CthZWQqfcemDv7vxiole5kdBmE56sw=;
        b=kM5EbDcVcZMLd7lIvskBnnQ3pIxZwJ5CBHjmuAiFJgxGvi83QxL4RBozep8LuN4n0z
         dwpzTYHj8xhU1tJzP3UKQC9sxKlAEhP2UI3LgBzqHUo5XPc8NWxib1c4Ip1QjkYbKGX7
         k65pQEJ9ocDn9XUN+yyqzpQ261Ss/hosesm5G/HSVzc1pjy0Ay050LozP0C2DAm5xqxp
         74CXQX3uICrJK1w1aqKehM9SYGb0/wvzDI2DCnXlfIeUtSfHWaSOa3bSeQxu2nAw3dDT
         mMi1YhHqvRs5uQglsLHmSQzNmNEKbzgCUcph2gvaZ5ldtjDjMW+ftDLxd4TB0n4swD0p
         /Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164065; x=1795768865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EGbLc76XrKp/CthZWQqfcemDv7vxiole5kdBmE56sw=;
        b=s9T+lviVOAoQPGg36w8UmwaFlt5OK4qpHSpMe1qr40vwKGUzQnQDFOvBXWA3EL3k4r
         +04lEn2Fq2aak9O3UIKC/6HGLEdYs6kli6YHdfzAprotx/GxWdRGgK2Q9OVD9zoM4rKv
         1OO9K87QZmzbFDPL94AKzXte19+/xUdnjaINlouzOR/65t3nUQZYoD813PMpIIEtgrSl
         odgRvOSdnYpfQaNOm+/EmBfr8ldUizHwg+Dt2UBrc/J89HSwB3krMhoYlHALJS0o0xLZ
         el2dUhDmOoRcSr6Gxj1MzNlPhDVof10/DHS9rJJzUpbvuX9bZZCGBy+K2hHB4j2T5d4k
         eTMg==
X-Forwarded-Encrypted: i=1; AL+hErE0Re6YoOHa30JBml6ahK8imE3cJdQZfStZ2CfBjKxT9rEKoy4H+cCRgTylK2wVr6gD1dwrrmQaZDgmuCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rpBQAgjqjJEybKNCBINzq1HkAarAql4vCMCti79z852AIvHgg
	GBcGmrvjxktMIF71ByVI59IYL/74fYf/8sKXvrGNG2WQNgUmJhZsOxoK
X-Gm-Gg: AZFdTZccXoYoh29FbY4L8PpqUwLdFW71tP0Db1OHPwwv6/Abfdk+XkhsqGWygwFRokP
	o9RLmucelDrNLowgssIGc7UoqKm4G5OE3LBzMzWat4W1gjbqHazM8CcksZPJHZ3R9X7lyoQpeGi
	0esG/sdtgRxLlHmbZpmJPNRsdiCVd2BQrfQ+GA3oKjB0DOgt02Hds5qWg/Humhn3xJ8MJy6+pjj
	igUOq+zJYmOdu4e83+KA74m4Pqc9NnCkTzvF72Xz7OMXQCuZBuLoHJiDJt7h4iXVlxhXQY9/5KW
	70p6wlUT2jQi1ARrBvzK/1kUeednS/luBpM+nPNHfktcAv6OWxJnNOh5V1nM/giC2tGC0E59RRH
	422amSSWyNnbWoBxeVBHQWTwRYQQiKwV3MrN7g70sn9BUFZ2XdnGzOdlyWy+w7eVW5ARIkRiRl5
	Vwk4XJK7bdCrdpo/eJxY/4bY+cLi2WW5otQH2qsZNuAoxkMBParTk9GZ6shz8P2dh90lfT6Rmsl
	402UHOIPRPYp1bPW6zjpR3bbaVmWFikKsWqeQ0lNWtmKh8slzq+GSq2Fhxgm692dwrxnRlUuSS4
	tUQVsVJhevYVS3sf3AATcqQI/1PBuaqQ5SBjYFj9XbtFACcJoTgGbLMF4dVJX6v3uuZq06iy6Fn
	YGQwBw0qdeemCVn72Rw==
X-Received: by 2002:a05:693c:87cc:20b0:358:3426:d601 with SMTP id 5a478bee46e88-3856c0d0961mr2156455eec.2.1795164065159;
        Fri, 20 Nov 2026 00:41:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:53 -0800
Subject: [PATCH v3 05/14] HID: logitech-hidpp: do not store ERR_PTR in
 battery->ps
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-hid-logitech-hidpp-v3-5-cfe2caa1d0eb@gmail.com>
References: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-v3-0-cfe2caa1d0eb@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

When power supply registration fails, storing the error pointer directly
in the battery supply field leaves it non-NULL. Callers such as the
connect handler and battery event handlers only check for non-NULL
before notifying the power supply core, causing an error-pointer
dereference oops and blocking retries on subsequent reconnect events.

Capture the registered power supply pointer in a local variable and
publish it to device state only after registration and sysfs linking
succeed.

Fixes: a52ec107fa81 ("HID: logitech-hidpp: create the battery for all types of HID++ devices")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0e1a9fd98faf..6ac41b7d76ee 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4333,6 +4333,7 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	struct power_supply_desc *desc = &hidpp->battery.desc;
 	enum power_supply_property *battery_props;
 	struct hidpp_battery *battery;
+	struct power_supply *ps;
 	unsigned int num_battery_props;
 	unsigned long n;
 	int ret;
@@ -4413,15 +4414,16 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 	desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	desc->use_for_apm = 0;
 
-	battery->ps = devm_power_supply_register(&hidpp->hid_dev->dev,
-						 &battery->desc,
-						 &cfg);
-	if (IS_ERR(battery->ps))
-		return PTR_ERR(battery->ps);
+	ps = devm_power_supply_register(&hidpp->hid_dev->dev,
+					&battery->desc,
+					&cfg);
+	if (IS_ERR(ps))
+		return PTR_ERR(ps);
 
-	power_supply_powers(battery->ps, &hidpp->hid_dev->dev);
+	power_supply_powers(ps, &hidpp->hid_dev->dev);
+	battery->ps = ps;
 
-	return ret;
+	return 0;
 }
 
 /* Get name + serial for USB and Bluetooth HID++ devices */

-- 
2.56.1.750.gf70dc682cf-goog

