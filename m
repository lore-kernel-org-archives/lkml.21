Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164252;
	b=XGGcV22EHB6kKURQVwTKgAaBvd19eCBQGwtZfwwVue5TiC/FK5PzYfh6oj3+zD/LeN6S
	 O2fR7pH3pxXxVZ/JhbjVgwa4Bok9Kc5nEH9ywadjUKRQEe45p8792/dZsMylER9m9coZh
	 6RLxv0Sm+Xg2DHjYdmV+85bcL8cP8nR/RUEVHNUiBrVqFba+gc19XjicTylDyf7oZPuo1
	 gjZ+Y0kFgh+MaTA0ydHHE8+PhOezNMAdn71fHiDXAEj6my7Yjmt1rCm1QTm0W8fqp/FsP
	 VZ9OOsyhHAyAJz7nPsLtDfW2OhzPCULkM23g6QaJ9YEizSM1Bbi48yOH1GTY5Xik7Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vV2d7SamsF9BbiK6MJIIboxgwzjtmzdUXZZLAxIMzUI=;
	b=z4XeT9dfLBUtjDlGZDsv2/TQeylVPXUnKf1moErPbjO9LTQ5gVxUrwiA8rTK2tGvP5qK
	 v0DD6hB/8GfvZg2f+fWj6liZ6TIqAmZ+S0GWWrzuc0Aq1WI0wX0wbirEZAEMmuBgveSUt
	 /fUX+tQoG0j0nbjEhY59pxHL5Ji52oYVUgcUwmHxodb5Gqh7f1Q2QSziNhcKwt+ZfHydt
	 I47DWwU/VXkRul0CV6td5/CowsZDju/xu6cKIKfqXWV2o9dyPxtHfgZ37REZ3H/1zZ6lD
	 LWC/wCmQY2DCrz2Y+nvlmEFdbpSmjuJGKezOf87+5+NP43ftb+hH96FsvE5Uo5R1hlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNm9FCL7;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F29606B487
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F29606B487
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNm9FCL7
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38564b4b017so665905eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164251; x=1795769051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vV2d7SamsF9BbiK6MJIIboxgwzjtmzdUXZZLAxIMzUI=;
        b=nNm9FCL7p5JyHEBpadR+ese9GRsU0ADRQBVc/A9DoLDIObbzlosZy3Y7j4Kht8hJwW
         Tr2FkS5u9dvfBN5iHcFaG5j/i3uqfm7oXFzjzpnAsCt2dtD+XbrSVXgPfSZVlm+Lsnwe
         wD8xzo3vIuXUVbYngblAZx3IUzvxwgrnkEj/nBwLU/8J2ZwZNTKSNOLV5kpRsURiFGoz
         SYjT7Up/hdyIoJT0LIht8xp0ze/RJ4aOyGmYyKf2IJ9l+nKYbDXeJSaj4n2Qok6Xuh4S
         YqCD3ALqfAYvCEhkD9gZoXIM15rqu5g8/u0c2wH7eBj/YTkAMqx8q+dkixxGIPPH7ulX
         xZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164251; x=1795769051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vV2d7SamsF9BbiK6MJIIboxgwzjtmzdUXZZLAxIMzUI=;
        b=OLWD+oOiJt/3e7k5mhiZXZNL2ywHzgjqYpCS1k+8Za3DX05SohG1YMO4WDQeMHkQ/B
         94hw5tEV60A0a5bnswB+g7ebhV6rbq7FATSumFxuKVssqdESMYE9R3z9KAHiaKrYtpz/
         b1jrvyvrgp8uJRMFjHcVahVX6KI806uYX4v2qXKHcpU2RkHd56B/hC+3A/8CMzS0zMX3
         wRXfwMwY5AMhpS2Q5uoxBHRSTVoYI42I4e4MGtmAwgFd5nFe24ClNd22mABweldlO7yp
         khTW6MzuYEDMhWSHT8m+uD1lv/Ha8HlxjtkLp66D90qKPZEWS+BK1iANEdwWzrR318Qv
         YhDQ==
X-Forwarded-Encrypted: i=1; AL+hErErzhjFR0rYpeepK0aY2kOGlZBtYUS45CLu3rUj4Qoh9Hj9WNPnyhckabOtbTEY2h+EhreU8a34NS0mBBs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CzfCH6rpt1SFVBAgMgGDlvdvCPeoXDy5MLktM44SjitQt4Zvp
	ByXMa4hkuuoqvP1vKPlSis+w2Jp2xvkv45waotpg6DhbXeAUvfKmlu+l
X-Gm-Gg: AYBFou1KBzJOuRuDLuBFxmBrsRytRaEXZejP7h/r0kZLEi2/1zwieEMNsN4JjqqmCaX
	uT+/jT1PJ3EdG86AecNwu18MKBVEqBRK1oXmmwPRxGk4mFARdynvioMU0/M8nCXfZHKk5IDjgIX
	sMJqPtd7iTVlDE4RxJNT9rmZ20rXN97hHfMsUBT6qXcE1ILqupXGzsOthfyFY+U/NAPK6FcHk5E
	4+HNap408+91Cow8pyTkpuB0qfPcczQv8pLfjZoq7rQ30OvRICcgYaOegSCgSgjgb5F1NkypQtA
	6DvuEsl1p9WApzpANReCX9hlWzTHIm9A04yRB+3hcnn2BauejrDoJxoc8X957vkis8nnLpEJvQB
	jEcZwXHIzecMIVWBzOd2edNnobElmqDss2GXrIIuCN2DufqBnw2aXghbhpU5eW2y7dCrBlhlrII
	Ez7/4IEgutgW5Y8mVljMB/OxN0meTd4UfBPsNSh2I940mSK4uUEACWvad52bY8xGPMM8kNKJ/pI
	fYNeiVuXoKU/kXomK2PsvaK/SYlBSkRMnBH6XkgeyAL/q+O51OM1ulLwWzLUTq2TFQCfHrhXx9G
	+t/bOAZtmDQCFd4rmEWX3qrffc88VHMBShBI2bgCJwwXw59AGt5apF6HjH/SboLGXSLeQpB+8x4
	8kWIoQdpwBt2sAI2uhDP9w+ng/4eIAXOv7ASNFAKh
X-Received: by 2002:a05:701b:428a:20b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b5566e0ecemr2281882c88.0.1795164251283;
        Fri, 20 Nov 2026 00:44:11 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:10 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:43:52 -0800
Subject: [PATCH v3 01/18] HID: logitech-hidpp: keep connect work disabled
 until hid_connect() completes
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-1-ba39242d4336@gmail.com>
References: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
In-Reply-To: <20261120-hid-logitech-hidpp-next-v3-0-ba39242d4336@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

During probe, initial feature discovery and device queries run with
device I/O active before hid_connect() exports input and hidraw
interfaces. An unsolicited wireless connect notification (0x41)
received during this window queues connect work (hidpp_connect_event),
which can run while hid_device_io_stop() has paused transport or race
with hid_connect().

Keep connect work disabled from initialization until after hid_connect()
has finished and device I/O is restarted, ensuring that connect work
only executes after interfaces are fully established.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 966c5932528d..cd42783f85b6 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4774,6 +4774,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
+	disable_work(&hidpp->work);
 	INIT_WORK(&hidpp->reset_hi_res_work, hidpp_reset_hi_res_handler);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
@@ -4825,6 +4826,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	/* Check for connected devices now that incoming packets will not be disabled again */
 	hid_device_io_start(hdev);
+	enable_work(&hidpp->work);
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 

-- 
2.56.1.750.gf70dc682cf-goog

