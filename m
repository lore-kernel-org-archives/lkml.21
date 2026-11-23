Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440051;
	b=fXxWBai974z3hmf0dvRugewYLlJhCq6b1DOsxu3N0/PIlVs7FAzpAvIrthg8AzkUcUYo
	 5QDil+nnNIRrUHeZasaXVnyP/6UbjU6JVBB0mmymLJBbBzZxwwoX4mmN48jyXeB4L60qH
	 cavVazChXzn3QI+KwS5jxsHcCc78GhW+Iny9+QWUE1TOq2GPXx6h1WQpyO4bta/wmc5cr
	 kazCBRWnwqJ9QXqDqBmO6mRSBBnKpLwSYhpQEdh+MZfFGotLwyGelfY4I4IZjjjXvAQVm
	 7RK0EbltAvgPYiekxgTjC9sHJ3Oq3TjUpq1RzL+vV8q7uZxUOZ7ArMZLTE6fZd4pnWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=0vGNyzaHVqr7cdz5nWqPjLRfXfGYkfsBDDj61ImzMyg=;
	b=Gv1GJQ0qAhMHSx3lrz62bOumapXt8axNGudmrBwY1z1MnKFSUuKQ80gDjOu5Ssmq/xCW
	 tEeC8ecpMzWxOUZ/MfQCq1U7m7ck7Tv1OH2jBNtqq98MdbvC6wdTWFQR+46RTc3hpt4SP
	 M1FBktDHX+pbTbp36Fqj37RLmlry0WJeKDAMvNQqj0RXPaJ9+WLLMWAUu7KXrtai8Cvy+
	 kVbRAjYpGDeTEpdcFzwLLC7mTA7qjkIz1Oua0UQ8OyzOt81dZ7lnRqc4e4zR3p2hu0JpW
	 +Nk1+NHmLxQnOOuXUz/OyXMvlgE4NYmIvjWtd3nrdg1EzfVFSJPykpIB2yEtdCUmfAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6DrHXpo;
	arc=none smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D91606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6DrHXpo
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67db23d8892so3400162d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440050; x=1796044850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vGNyzaHVqr7cdz5nWqPjLRfXfGYkfsBDDj61ImzMyg=;
        b=T6DrHXpoplQb9U7DvPjOG7pH1NQTwJulBEYJseDZOEsX/BMWIT0BE2eGydRRkbiEan
         zcDyg9zFaP7DlTWXYYpj5i2B69YLASW9Olnb/6yWGeC+sxB9gdQ+kAGkxoi+houEdZzI
         zLaz7/cCYEjos9QFHFHRt5pz0BmvE92RfIot4K3hiZFCjjMI3dm+4MzGWTR/joBF0FyY
         rmWsZubWp9d7eSexRBNshApA/qEKBZaSO404/F0DFi5uMpTDm4+Wnrcc+5QP6k6CMdHA
         EnlKD8Ch4tV6z9my3OWTLaY2YdU9rb0qzm+ni9ya1RH/92M3OPFx2Zp6NTVMp2u2/mxZ
         FHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440050; x=1796044850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0vGNyzaHVqr7cdz5nWqPjLRfXfGYkfsBDDj61ImzMyg=;
        b=yOg0iVAVdi+DXxage1dvEPcnyJyf7Huu3b1NwnGlHzWLY6nu5l0swP5RQIEP7dyyhh
         BbzVd1Kz25Gj8YQMzs55wO0ZCDqV0LYssds4B3pRCL0YbZZP57p20rfgTF8PPYgk6X/w
         TYmMYF14u2rkKUylU+cEEF0H6NVU47MSKBYt29BxNi3dOTj0R0PBMxor1cqCLz5Dy7LD
         RyOy1nP6cJPxRLbRX7dyJeJpjNakNaueytNV5xxE0I3Fyi4+j4xjTt0wAcGWGnOmDNmn
         BOyjt+hUIvN0O2QmznXIHCu7fGFHzPLJA7s0Myc1YOYWTentNpLLyeX2RAc/ytoC3Ywr
         R8Iw==
X-Gm-Message-State: APuU4Z9VtKCZplYeDWhzko4S3ecNpr7CBCjxvhAERiMoxeaUWgt6nMoY
	AV9sg1XDwjloumXOJWV7RMWGvTCttkhtWpdDzyWrOi5c7Rkog8rF8mPJRyDPIPjo
X-Gm-Gg: AZFdTZccn3KAbOAQt5OuoTe5+fDfNqtQ8plkqi/8cI0Vn9L964l0sU+BboSlx2iX6WP
	EsDFbTK0XGV2923F1NbU+YDaP2oxqZ9RgqWCPV3Lm10CU0HhqowVWPZVdING2nOF9PA00k8Q6qv
	yRhlFibO3FvlspCjo8lbSaYJA9lfAXDCJY8VhZucTJN/SgNO0sCFH68uhw143l1Uy5H1WLkXkqd
	OlSgS30+inN0vn24MWCe9xkWEEna7ScyQFARIVzMaIv6EwZhkkeOR9S6Lmq8y/oIESmBEDz/Qdn
	p5j6f+NjBAlnpf+1Ov7+FIMfVQ+0IkAEyGj9+92g7QoUsNwLGSOO+U2djZuoxmfYYKSYG9TtF3M
	2iWie2uBjnC7phyCY+YQ1w2pQn32gWbkacdnw0YpmTJshVUWUNlMz7nLnRGAOggFGmyOoipklxS
	IAVFl61RrkY9hU8egQC5hPzzsPgaiwaNAavE/iXmPh02mmc+4fvDf/ukM9PgL0nkYyHMRs2bVB1
	cYQMkNiyQX0OhsCyQYiWvDGCCT8PWZbYZqXx6sMYMwarOQucknWnAlL4jWLSBg/w8w1jYB198+1
	IE+r0Oxuk2oi2u0F
X-Received: by 2002:a05:690e:168c:b0:67d:c1b2:3e3b with SMTP id 956f58d0204a3-67df42b4cf1mr5647390d50.1.1795440049732;
        Mon, 23 Nov 2026 05:20:49 -0800 (PST)
Received: from pc-i7 ([192.3.12.183])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df330fe0esm5503938d50.8.2026.11.23.05.20.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:20:49 -0800 (PST)
From: Aaron Ma <mapengyu@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] HID: pulsar: keep battery online across RF standby
Date: Mon, 23 Nov 2026 21:19:35 +0800
Message-ID: <20261123131937.5473-1-mapengyu@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Wireless mice using this protocol enter RF standby when idle, causing
CMD_STATUS to return 0, and may wake on motion without emitting
EVENT_PWR. Tying STATUS, PRESENT, and ONLINE to battery.available marks
the power supply offline and absent during standby, causing userspace
power managers to treat the device as disconnected, hide the battery,
and stop polling for updates.

Report ONLINE as 1 while the receiver is bound, matching hid-input, and
gate PRESENT and STATUS on battery.last_read so the battery stays absent
until the first valid reading and retains its cached state across RF
standby. Because CMD_STATUS does not distinguish RF standby from
power-off, the last reading remains visible until the receiver is
unplugged.

Fixes: e55cf379e822 ("HID: pulsar: add driver for Pulsar gaming mice")
Signed-off-by: Aaron Ma <mapengyu@gmail.com>
---
 drivers/hid/hid-pulsar.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-pulsar.c b/drivers/hid/hid-pulsar.c
index a1f0dcda92df..e726dffb2f33 100644
--- a/drivers/hid/hid-pulsar.c
+++ b/drivers/hid/hid-pulsar.c
@@ -362,7 +362,7 @@ static int battery_get_property(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_STATUS:
-		if (!drvdata->battery.available)
+		if (!drvdata->battery.last_read)
 			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
 		else if (drvdata->battery.conn && drvdata->battery.level < 100)
 			val->intval = POWER_SUPPLY_STATUS_CHARGING;
@@ -378,8 +378,10 @@ static int battery_get_property(struct power_supply *psy,
 		val->intval = drvdata->battery.voltage * 1000;
 		break;
 	case POWER_SUPPLY_PROP_PRESENT:
+		val->intval = drvdata->battery.last_read != 0;
+		break;
 	case POWER_SUPPLY_PROP_ONLINE:
-		val->intval = drvdata->battery.available;
+		val->intval = 1;
 		break;
 	case POWER_SUPPLY_PROP_SCOPE:
 		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
-- 
2.55.0

