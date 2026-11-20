Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164074;
	b=CtHMjObyfsIq8uDqC8+m9Cy/RVInNYOHkdEWEbfoyMYMs6FsVW4pYLyzTtME0sVIrvyj
	 pu+muS7sOFLccX/QrsvO4Kx2BM0bRODxJ8nup6vBtTSLmnxYrIzD3FuQi7p/vlSovgKYz
	 uvyEwTJFcnihmJn/e0wMwKWgh1dPXsRVkxbpYzDBsBlIZ6h7LYqJVF6l/gp+sgxfjBejd
	 Uerl/KCmISlvjV6tQr7W0IhrFABJKASGwRd+drmq2c95YVtplqLhW61eSVOAlL7m1B5iX
	 tlqXCTN5D3IpJWwltG8qtBLANJRB5NklS/NGlwo1QGz/dy1PDwyGGVJfX4A63UQyoeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cgMr5qNlIMfJEblzb0pv0k5MT6Z5DtqCm3U1oEMsFog=;
	b=4kWSZorW0dMmx5G+hVE3u57sPrEUtLngKeIjOja0aq4vYqEhuM4MmUSDOD8Ws4xzSBW4
	 CCpNtlzeytkq95kYG3cFUKKVy4DacZ3m2wPRisd8KkCcN3DO6McYt0ArdyQahRAAnw9Iw
	 uDHw2IH8HpPduegZWTHnpFg3W2cebrChsoAJ1WhVMp1BpODlGNTafruhF547bdTYjFwOa
	 wl8mMoUFmBF+IJRd+O7POoxfUXjcoSlrZViECuvHn4boJlmGVKGCUe56HMeXt/fCu9KN0
	 BpXPB26/UaldqxGrbijJvuDK82kuKQ6ixr10M+Lr3z7EVwZWiPAUhJrc9fyS3QJMQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIyoIe78;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2725960A6F53
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2725960A6F53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIyoIe78
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38587f3de36so709695eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164073; x=1795768873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgMr5qNlIMfJEblzb0pv0k5MT6Z5DtqCm3U1oEMsFog=;
        b=dIyoIe78vmMKmgjI/H1qq/CRdqmVnjiI2Wctq60aJtCFmCkWM6KWmikYWRfJx3VdGe
         b0WLL8wOt1qG25CCSOxCrukPNq1gSOVm4QiHhzXE5/bw8kwgPGNLCGRW0vGiWrI09bwz
         Cv51G/xXzOu8ey1N3patrzhkybZLv9G9cl4Q37BXpcablTrg48/dX/a2ItKBbfOjk9hv
         UIUnp9WfT8WbgzshbujmSyZiO5k5GreQziiu6dhv3HkA+ySKFmBg8Mt/ftMx2bd17NHw
         behbKRSgs4PPZEzlfOvRyGVBgkkj4pTa6fM15H9cFk//A3SiscRvuM79GdyZ4kGYCZXk
         Zz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164073; x=1795768873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgMr5qNlIMfJEblzb0pv0k5MT6Z5DtqCm3U1oEMsFog=;
        b=TyJ0DcN/OuwPeDdxp6/cn3Mu6hX7ArKuNXm5gFYByAKb1c6emLBmttYu/8kHLa5xrD
         zaKh8nWzARIBtd8EgzKHTe6UG6z4Tf7ch6drdTdMLE3Ttcqc/6IJ1WBxX3wazNl3qYXD
         hRdY9D35HVPzjegn6lLKvNw5ouaxw+97FTA2rlcPTzX+MCW89RHj1RB+lq7xli8TU+jc
         TqGS3KhDW4aSO+xAhbYlExlpcfPu07tYPPzojnFnC+KKE42iug6T8KMEkF+m1w0m3i0W
         vvOx5EFtgVDJ+/OcdsPBOgDps50JxXX3J5LkoeX6i8uiPK7pSnAZBiUGZYohqOCWcsEQ
         LvEw==
X-Forwarded-Encrypted: i=1; AL+hErGX58s/I56JWeRwjIXhlnhay33KdwQzkJ48FMtAvvXbrIlgIu7DpE02JYAAPheorqNkPKN6NhZx0n/ZZ48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gTDBWMK1gP85bFxzZsFqiqOMuP3XwSz3STnqHO5Q59CRHBr1P
	f3omfaIME1pE+3w6o6Rgq5CMLDZxrhrtUAMroo+bNOjPfU40mPFRDqYj
X-Gm-Gg: AYBFou2qfLIMX5O78O8vzSbwbxkwNGryih5WtjAo4X9pugjd36ghpPEtynrWRgqttq7
	+QoSUOMt9lf6V+Yl2ISEl624rDrOml7RKrj1nCJvDIzCAt+aw/AZNdL/nMrlhjsmu0Mwf6Y8iPc
	yI6f/vWrlD3Y/p2O4fZGBeO0eHxutTHiSafgAPQjqtyHpckuTDQNkB/ppF17WNg3zTwkF9ouAV9
	JAYVv5+1CIZ5BDb+2JNL5ex+NZspBz6kmIPLoo3VcKWMHYGoS+TGsNpcuE9VPg/btk94ZS6ACBB
	ewlypVGd3YcJfvcFspzADpwHw12dhOx0iKqeBVb5POJsn3juZfb8IdNC+k6XJWsYiLzcoaiymV2
	xPLs8w1cnJPVSLJdtGtEjwj/6qCAAGCla+D7iBRWlTZriERCsYeDycVSmbiy1aYQvSPc6bWhlzi
	zFBvotdJKftlxpk40BQmgqnCRbvMVfy32BbM1PIvj/rjh+OVT4BqnLiHRaQ1vdutqb/sUpQXSWf
	9WPgVxrC/+/I6MHzxxODkbQhTIfZNt3ha24BdspS2XCRyGGFu4tQBqtin4jlpxVQtWTgPu65VUd
	El9jdRx/QBwro4pcaD01F4XnNpITmP92XcS3W/x4+1lVhcTnjJdW4UWV37Uy1egliK7pzEMM5iq
	vzf4S14zwvCfDt6bgeg==
X-Received: by 2002:a05:693c:4195:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3856f0511fcmr2053564eec.10.1795164073138;
        Fri, 20 Nov 2026 00:41:13 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:12 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:58 -0800
Subject: [PATCH v3 10/14] HID: logitech-hidpp: fix HID++ 1.0 battery
 mileage event parsing
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
Message-Id: <20261120-hid-logitech-hidpp-v3-10-cfe2caa1d0eb@gmail.com>
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

In HID++ 1.0 battery mileage event notifications (register 0x0d), the
register address occupies the sub_id field rather than reg_address, so
the payload bytes start at rawbytes[1] (parameter p0). The driver
previously read capacity from report->rap.params[0] (rawbytes[2]),
extracting parameter p1 instead of the battery mileage percentage.
Additionally, when a change was detected, hidpp10_battery_event()
updated level and status but neglected to update battery.capacity,
leaving capacity frozen and triggering spurious power supply updates on
every subsequent event.

Read capacity from report->rawbytes[1] and store the updated capacity in
hidpp->battery.capacity when changed.

Fixes: 7f7ce2a258b4 ("HID: logitech-hidpp: enable HID++ 1.0 battery reporting")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 16dcd79059d5..0ec2f2fd6dec 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -829,7 +829,7 @@ static int hidpp10_battery_event(struct hidpp_device *hidpp, u8 *data, int size)
 		status = hidpp10_battery_status_map_status(report->rawbytes[2]);
 		break;
 	case HIDPP_REG_BATTERY_MILEAGE:
-		capacity = report->rap.params[0];
+		capacity = report->rawbytes[1];
 		level = hidpp->battery.level;
 		status = hidpp10_battery_mileage_map_status(report->rawbytes[3]);
 		break;
@@ -846,6 +846,7 @@ static int hidpp10_battery_event(struct hidpp_device *hidpp, u8 *data, int size)
 				status == POWER_SUPPLY_STATUS_FULL;
 
 	if (changed) {
+		hidpp->battery.capacity = capacity;
 		hidpp->battery.level = level;
 		hidpp->battery.status = status;
 		if (hidpp->battery.ps)

-- 
2.56.1.750.gf70dc682cf-goog

