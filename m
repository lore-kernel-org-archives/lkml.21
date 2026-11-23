Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795407666;
	b=j46rLuxJyln0fTlatGduqk9OAWy3UWCvB/iJW1Qt2H94D4RiRqOaktZlgXSZYWE53uvA
	 lYebViLqWOrdHicQAM+LAJhomP/QwH3ra6iXCquxy21Bl9241KwgXiEXeUzZL4QrDGJUB
	 b0eaxb7SBCLHZChNVv2ksTqFtmkJ7ykkF1TzCZPvsCtxzNtxU9fQEQL6zqWodUmxjcJd2
	 dkpSKdddYb+Itd9PuJaCEt61AwZGjRF+9FSNll/rzbRnDR8oeHKBZVVc62U494mH5chTv
	 pasBzuITRfy5Pe41EDeGZjvnCQBbcBsAQTQArq2p8IZtT/jvSh6BfYDMqricSMGNyRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795407666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YOGMhaTvgl91T+1hGIfMJHmqW01SHIVg0B9Bu+UXy1Y=;
	b=pZUNgT29v+LYxbAXMB3T868l0TvZrZILCDpwE9STzo7ycpBzx0PuMLBtz4+fHhy42glh
	 h9ywAUN6GFguL88pqFTFkgwXZAz3DzhP6erHe0c+UEhrDDY2xJM5KbaY33iRnQxEvUxk6
	 q6A+Z3ck6xl9QOhbdQlmdI8rPkoKjhBW1fwRbpMvMbFaVwuiyyp98xVzOxYXi8KlycjRS
	 h/TKUbeCZU1GA9x7UJCDhVt6/e+TfRT71ZW/2h/wnJQqliFS1+wBZ4CD47XWX76R1pg1e
	 J0NsDM0ng+sQKFpsYblZmLCd5NDoUL+IraVRHu0Ddep5OTr4wHCwXafwuVPrT5i9nhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TH9OHNto;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE13606A68D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FE13606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TH9OHNto
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38431138772so3663826eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795407665; x=1796012465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOGMhaTvgl91T+1hGIfMJHmqW01SHIVg0B9Bu+UXy1Y=;
        b=TH9OHNtouUaWHVdlbHnmOKqZZV5aVvBBCAVsrNAQN6rxqdlWkGsHoXcrrZc8paPN77
         EzuhnKIxlxqDK+xNe+QvwKikItm2ab9Flpit6siAchF+F5AWabrKlIJgcQsEMyzmgCYW
         +f1g7zMp/1PHX9ROfWpgRxorTiUh5etS6rzfVa/r6dpPLpS3GDshic0VJ6Ffmf1mXymm
         BK2lF+ws7hOifi4muLNwDc/dxl/2cHbSlpu593ZG3PNr3FaE9ViLchZdYF17S9sWQjPz
         fRFYvge8gG+oA6wSvSZ9d29JORXWp/NDB4WBWk/vri6m3rOUTRzIkUjvYSUkW/eH1x1n
         OyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795407665; x=1796012465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOGMhaTvgl91T+1hGIfMJHmqW01SHIVg0B9Bu+UXy1Y=;
        b=OcDTihQMi7T7mKg4iCXQ9JEuRoDGF60UcVVAKCw6lq1BoQRqVAIze5S3PhaqiWc0EQ
         DTHBPRR16LCbP+TWsVJiE4g5VyWJPzOoIZBlN1Q9ThagxjUs2XGHUKXVfPc2m79EyBQH
         vIlZozQu+bD431vFbmtkO/3XayrzgVT/ESGPTFNDu/jkYOG3TNjZD3EFhFgXrb93Kj+h
         VY9Lvu3wKaMKsZW3K5a1fE5P4FcW+Io2Pl13hiI5Dc3LCL9bRvojiSPQXF9eWDfXdSO9
         cJUnngfC870uSLymSv44zraHN33iHtql68eJ1qwXUlMuIPXmBPhh/kLU5DRpK5+Oj+Ir
         0QMQ==
X-Forwarded-Encrypted: i=1; AL+hErFx8vnAQaR4YZBBTILHUdB+A0KF5PK/TG7MTsjzsTEgD5EvBsvgPrRJcnQoOBU3Bkv3J2CNPfdEodZSe24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OoDAl1vDGkiA+bl2b8Y0FwN61v12qH/uCkUduemZx7ct2X81P
	TTJZL7n/mzCOVCh7DGdD8Jh0qWnFpQWQBT9luQ8cVolBXp5F4Tc7ThAt
X-Gm-Gg: AZFdTZcPEkx6bR57QR43nkL9jxDa/3ouY5b35GmTRj5HsDz9lzlZ0F42bB+WZYQHLGM
	xi1r01z6dQBGh+z0sk68N1luA/0lx+KotfRuS1/2R0Q7bFMPkeN33Rmy6xTGphL64tfFS1S9wjY
	5z0sUU8i2ZPdMvvUdn3aFM7mYisfO/REhBICg4idfH1vVIMULFLXSnGXpui24eumxNYcVy5Oj+9
	Y52+2WmgwSJZXFKoE4zE1O7siqvihyJorAve4csEFGpAGzp+u6R5jvKjA8C6rCaMNgrLcnV4aBE
	i9AGW0gdILrz7KqOigUqGRyXd2JlN4b8TpsaAdDXoDICpCFYMmW5FArLK2X6oB6LxStKvTi1/y7
	UbqVgolRjEvUySVgu6TY/nzTM2mVLTyZZ9nSe4Ai13EuEyzQS/IlKUw+gqAbwcI47r4Xe8KY/2G
	cCUHDObKGvxVKnYWcEpuhf1VVoYVwWPrkSMYi5ml5wTVcZDRepEAkxoBR4TFzRhbBZK+ypiyswl
	UIzWHQhyrRYUo+iKQTkaC345zSIPeFRszDmu+kWkdPeVs3znt68p6WTaRKo8V8sCu/Gb7vNQRh7
	EUghJZwRBQORiR2GUilglslyGD/hdAtPVASka4XMJylS3GHWJu5/iunpF75X7cJ4/KsjzMHD60v
	lp6VUVQcqcWOY4B3r3lIJOFtkc2ERqCTpfCALDfDP5fPeYvw=
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr11790724eec.12.1795407665090;
        Sun, 22 Nov 2026 20:21:05 -0800 (PST)
Received: from spark-da2e.tail8e743c.ts.net ([211.105.22.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm30804737eec.15.2026.11.22.20.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:21:04 -0800 (PST)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	Claude Opus 5 <noreply@anthropic.com>
Subject: [PATCH v5 3/6] HID: wacom: add NULL input guards to wacom_intuos_irq() and its helpers
Date: Mon, 23 Nov 2026 04:20:12 +0000
Message-ID: <27712cb2096f247d723284ab0c59da2ecf4f0146.1795405057.git.jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795405057.git.jinmo44.yang@gmail.com>
References: <cover.1795405057.git.jinmo44.yang@gmail.com>
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

Since commit 2f985de0afbe ("HID: wacom: fix wacom_intuos_irq NULL
pen_input deref"), wacom_intuos_irq() no longer dereferences pen_input
itself.  Its helpers wacom_intuos_inout() and wacom_intuos_general()
still do, unconditionally: each takes wacom->pen_input into a local and
calls input_report_*() on it.  pen_input can be NULL when
wacom_setup_pen_input_capabilities() returns -ENODEV during a successful
probe.  Both helpers are called only from wacom_intuos_irq(), so guard
them there, after the pad block so that a device with a valid pad but no
pen keeps reporting pad events.

wacom_intuos_pad() uses pad_input throughout, but pad_input can be NULL
when wacom_setup_pad_input_capabilities() returns -ENODEV during a
successful probe.  Add a NULL guard after the report-ID check.

Adopt the same return convention as wacom_intuos_inout() and
wacom_intuos_general(): return 1 for "handled, don't sync" and 2 for
"handled, sync".  Update wacom_intuos_irq() to apply the matching
"result - 1" transform so that the NULL-guard path (return 1) suppresses
the spurious input_sync() that the old "return 1" would have triggered
via wacom_wac_irq().

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index d5c2efcc09b8..b162f40397be 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -581,6 +581,12 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	      data[0] == WACOM_REPORT_CINTIQPAD))
 		return 0;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pad_input is NULL\n", __func__);
+		return 1; /* handled; the -1 in wacom_intuos_irq() suppresses sync */
+	}
+
 	if (features->type >= INTUOS4S && features->type <= INTUOS4L) {
 		buttons = (data[3] << 1) | (data[2] & 0x01);
 		ring1 = data[1];
@@ -716,7 +722,7 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 
 	input_event(input, EV_MSC, MSC_SERIAL, 0xffffffff);
 
-	return 1;
+	return 2;
 }
 
 static int wacom_intuos_id_mangle(int tool_id)
@@ -1089,7 +1095,13 @@ static int wacom_intuos_irq(struct wacom_wac *wacom_wac)
 	/* process pad events */
 	result = wacom_intuos_pad(wacom_wac);
 	if (result)
-		return result;
+		return result - 1;
+
+	if (!wacom_wac->pen_input) {
+		dev_warn_once(&wacom->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
 
 	/* process in/out prox events */
 	result = wacom_intuos_inout(wacom_wac);
-- 
2.43.0

