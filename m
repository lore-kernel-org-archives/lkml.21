Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164075;
	b=UV7EoXnHK3xMBqLAIs1L7TAVIFpQpWJ2oogb9e9N6tnJi1Z9qsy4tHxXZrz1eCXwa/0d
	 0RPjeIxalEB+4oiUruGIRqzsozZY4DSowtRmQc9/6tJOqDzrxHJf817OXzISsueSiekhz
	 3HjZgxIGW4Rq3ooYG3Y0e1UqEaDiOwaaZgyq3ySqg213/WoMFBcdvjxJI4ICz6mw+Jq8l
	 4R/iP9snfAvucnG56W54zXpBfGwUerpPz9TRzsgHAA66TBCdYsp6pqL9Mf/tBNfM0KKHF
	 eLoX0aH66Ismlzqclf4g0AOYWXuKo+VyQ+mAg8djFVGY/wn9p2AJC5fNZK3HoGCrIEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HGzRbKnELJ8qkWoVQZYvDioaGdGM1A2dPzzsZl9uGoE=;
	b=V6Yfe0YFG3iHouy4Uifo0DNmY31/VvN3PakTqaAmFNN1oHjrGgZfrG2kF6Z+6pd1Pdjb
	 1K7ikKkTkIeR5SP6yj71U08S6KCrHRR03M4c1R6LoviRzQmgV26T6rQ3b/axJRSRGISqH
	 5AF0EvcadhDcgrNiSOTKtjjty31zBFNExsf7uO3uW7+gPdoV3UaeozlXxcX9iY9oWi30s
	 uN54WfRJOwL2pViJrdzK37vg7vHRCOKFkFiUd7b10h6TrBP8b8Sx264buTMGe5BiTpR/+
	 +wj7iwyLsaJltsb3A4wGg6oU5K9klYq6rqJiDrgGczwiNZdX1QajJwh26/Z78Vx2ncQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zalxmY5k;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CF60A6F6B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 603CF60A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zalxmY5k
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so123284eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164075; x=1795768875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGzRbKnELJ8qkWoVQZYvDioaGdGM1A2dPzzsZl9uGoE=;
        b=zalxmY5ktb5q1XhAa6vkc7KDCqft8ehVrCQR8UAfYIseCffLXh2tfM4A//m+HSe31A
         qOgWnLMMUWwV2ujE8uB8rkqzSS+RxLIEhur5RgW7Y1vUPQd7zQNqqQUf5VBPM4q6mJ87
         dQi2dfWRe/IURzT7nLFAik58d6IH5qaxzCAZbdG6zP4EVdm4LdDxQyUSgKFGhSNUgGc4
         TgsTg1CfrxuYMYT/NeCxwGY24nW6gaCrzw+uDgSI9vLOFi7OeS+XcwLfR6BE4LkQcsU2
         ZEjUzb+2pmSMd9gPZn04LQuv5ScGLdfyAsWgRJo8zA2GB+kU9aIRVcCkdT8fQFU3Nx+k
         SUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164075; x=1795768875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGzRbKnELJ8qkWoVQZYvDioaGdGM1A2dPzzsZl9uGoE=;
        b=EakdzW/snhcMCUDeViwzclkEqVT33cqeKbBso0ymMvOdg1/+KYxN0prPWLKe+TkMJX
         Gr3BbbKmUwFj4PPcVsQ6tgFJ/oH/rtu5+liUzoTgXVLwiLHlqoEE1ImHyhMQ9A86lUgq
         alurEOrdjZS2W2mlfpvCCib97NlkUFEyEgv6hx/Se6yVpCZMaEfu89UoXhefeGl3EbYW
         ouCNiKgiZTq/BeL2ucFOwH3JhIEZzlCpzVi4R9LPrWTA17QEnNzV5Yh7xf/KhHOl95PV
         I9jxpMSBeRriNyCOZqCYttYoB8JXqTVYK6fAZaDhQssjHf8956hiWDOxVeH2gm9DWLVd
         5dmA==
X-Forwarded-Encrypted: i=1; AL+hErEAfXID0WN9snLDFPLHfeuI2G7c8Yp8wZ/6DiFM7UR28ykl6kd6tR8k+QhK+SKDkMu0dkgVW/3wJW94S+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z98hFPbojo4JtqzxvaXRstzYcGAFF8OiILaHDkT1aOCjLYOrTO0
	yHQJeM8DOE8WXICzBdMECqlZ3vG8U4nedwmpOmYXiFLr7XpgUworxeJS
X-Gm-Gg: AZFdTZeS58aFY+b9E5Tkw9UQvMnMBJbVri4IOWKOHsFFv/gukaBzkKL9vfZBHK5aXrk
	hXkeD1Xj/OBa0tu4aBRKtLqcJwt9fwgBzLXwyKUQUZOOAOKQEodYX3kiTNgYE7HkC4w8tiqxZ3c
	6fihSnd7zjgHaMMr9uFIQcixrEaIw+EnvsWTvluJWJn/kl8Rx3cZJXUssprU6Ts8Q6OlBKe68N/
	uLF5AFM11TaByDVSR8zyvOcpLwZeEB8dy1k9syfzt/2XKRv9OXJHE8DZMF5XQp1+MTWMF9RV+dS
	El0pTZG/bnaxVxdzmT+k9+o2eqo2QUhaxUmXyC2mt/OAVBTCGXrwZXe3f4J5yU1vn6tECfczJHP
	79W+PiQeaMBFjwvFojwB5Tla1NTnPxKBWJ/mcNwYGeyj1+0tOOkGWIxwF0eHjRDqfBvD9b2ybcQ
	qNeI5G/jASL8qgqQfk1Dv/AHdf/4miUjBiCJ0nZ/t1QlW9waikFdfQ5vP6pg6rFiLfpC2L7YKcI
	lKe3S9P6X9/Sr7dr9akQeG41abvZBbyWDF0LUoQhICNl3uR8PRVavU9Lx4uYZ/vT9GXof/hF4kw
	XYnzAOmlYqJg7G+AGywb4MwFSgXS5CRPzHUX5lCoPtyeN3i84VyvPoKc2x7AM345JbQs8ispUIJ
	30kaOsPod/uAT9xDRUA==
X-Received: by 2002:a05:7301:182b:b0:36d:9900:bb92 with SMTP id 5a478bee46e88-3856f256533mr1782564eec.10.1795164074557;
        Fri, 20 Nov 2026 00:41:14 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:14 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:59 -0800
Subject: [PATCH v3 11/14] HID: logitech-hidpp: handle negative errors in
 hidpp20_get_adc_measurement_1f20()
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
Message-Id: <20261120-hid-logitech-hidpp-v3-11-cfe2caa1d0eb@gmail.com>
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

When hidpp_send_fap_command_sync() fails with a negative transport or
timeout error (-ETIMEDOUT, -ENODEV, etc.),
hidpp20_get_adc_measurement_1f20() only checked if (ret > 0) for
protocol errors and fell through. It then parsed zeroed response
parameters (0 mV) and returned true, marking a disconnected or
unresponsive device online and triggering spurious "possibly using the
wrong voltage curve" warnings.

Return false whenever ret is non-zero, logging the debug message only
when ret is a positive protocol error.

Fixes: c361982a13c9 ("HID: logitech-hidpp: Add support for ADC measurement feature")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0ec2f2fd6dec..28402baf04fb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1952,9 +1952,10 @@ static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
 					  CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT,
 					  NULL, 0, &response);
 
-	if (ret > 0) {
-		hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
+	if (ret) {
+		if (ret > 0)
+			hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+				__func__, ret);
 		return false;
 	}
 

-- 
2.56.1.750.gf70dc682cf-goog

