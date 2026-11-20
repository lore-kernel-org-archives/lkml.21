Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164275;
	b=jhddr1cl7RWt+L3uPUTyDAnOyxc8PmN2Cxph67hEmNlPJNRT4qyjUDDoGFtZhqqY3lVl
	 eZryps6ltdEV6LIEaH2wC6yRRip4h0Kqbj5XxIADRwyvzB/bGSUd08N7pTQ0UTwDuxfDu
	 rFGJ/nThKl9hEMuzQhTL6i2exc7cYOj5sc5Nvfbq268h7it8Zr+HsI+OMfi4tt9cenW0L
	 2re3pAubVZpsMNKuaagRTfNLAImC09vp2mqsXzXfJEF/LlR5+X3nPNvLdXnDzceIEJkfc
	 gwZSdC8rz99Tg9WDAcLTkBE3fqNkRHou+ZKaGK/QdeTaqaLMlgaomOmJbej4NWRJIrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=npTE2fiYMjbTekobIqGGljMdib3MOVJF3ledKQqDdEU=;
	b=3FBsBDaB72mMjUEwtLFIS1nY2C3dKkGHW6ERgjW9nzJPZZVVQVCe00kNPZgOC41ROyK1
	 Hmfb6xcwHERzJm4VwxJ3OZqWlC2iekwBbs9cURcgGD0x/yqaaP25fnKBOq6yZ8dQVjUr/
	 jw7CGhChS6T/kLX1eJ+09o4t0lekxqp8QtJXCJvd1zMLAa75xRVABsJgyvv+X1oS36VZ0
	 EC1oj1y6QqOOP3T1ENY6AEcO545BLAxIPtbqYBm2866LNxAmM6OO6PBbCJyMMIQLAsWP4
	 dbtXaIGXQK7DNu3nNDoweytWEnRqBr6LRXs6RQcMimymkxRQpXTVncAsCLtMYfahB3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVOygCWT;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD145606A7E8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD145606A7E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZVOygCWT
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so1079170c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164274; x=1795769074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npTE2fiYMjbTekobIqGGljMdib3MOVJF3ledKQqDdEU=;
        b=ZVOygCWTym/96cTN/M5WJpxlvTDlnudUy8qJK8TWWRIKY15N2mV2idSzvGQbOFeP8I
         UA3b68TbYmKIewum+7tXIkOLtAA4TlWYNhQIl/t0YaWmHo/HsjjBbxlujaecAIAA48mn
         Dxz3qrNOOKhW4BT9cof94v37SpsGa4OZiUjCRyDpZe67YS3XI9Q6OLWL0mEe+Df5DdCO
         BrtVdjb80NtViw8efdsv0dcUiDO1M+lxFiSMZJluO92FCcQGO8LLWnE8WR/Roiq042Ub
         Uiw9v6qXe52OJ8C9c+pAfGl0ejkVItidQ8tMyujyOUQNa4LQBzkiwnGSY/xlLsBYaJcK
         6YgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164274; x=1795769074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npTE2fiYMjbTekobIqGGljMdib3MOVJF3ledKQqDdEU=;
        b=CDVIPQWDGk7ZyUnho5pbzsjRPvTnlOUTJRGz387fCtn9qjuMM0HQntX5hPSLvnJjLj
         6zPXcXr6MkPRuPcfrM3/pLUi1ARoBjJuZEV4Ps3/pjrtmzft5P85+LNfy9mnCIIp5hnJ
         ZEn4tik5LVp8q8ZZjHpd4wswnj4N4CvEEHbWKOXKho4zv2dn4EAD3dPzPYONqFkUzipJ
         FG6eQuJc7JoM4AxEXKxJ8GGWu6LypBno6ICFLZoEEvevLbPb8vTlTLGJcpgNL0aPwIJZ
         UFHfaemgeW7bqxywTIwE1eGohaX5l5RelYEnTLg0RZcQ71vZniN/4gJN8UlJr8mTdUmZ
         78bw==
X-Forwarded-Encrypted: i=1; AL+hErFYg0FGaYTndmGFbk2G5pI2BATK7OKu3zHXd3F+F0bgpNBZR40Ot1GaFb+gmuO7dlz4uQ4+Bs1iPxSgHwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZWZf5gRI2TJpT5iQ9G5pR9K4HSH4FMMPEfa8AU/NLUi4+/eJB
	rjYG69o9LfP3cu12I9bFE2HM3ydkYRLC/ndIUHWKTq6yKVvrg0TYVQH+
X-Gm-Gg: AYBFou3SXb4FoWjjKDkdu9vMcedO8pwBoaDnnPtWsRHwq3HAr6iAIYvjpbtRIJEuJk/
	ucdQRc7HkV7j3tY0vNfRnZVHFgwpdjIGF3bf0boknZVxPSQ6doGirrFNywCW/+Jra6b7f3hX/N7
	K44A/8IN2QqeDS6vrhM36XE47dnMx3ouyfAyz2M1ZwSGXIcVMn2xAfPYG+LDFoDEzaP3qu0mNf7
	7fcFf6vNT6MlB4mXHgd8xDaK+KEQVEJhVEVfKpzdklScZUfHiX6Cg2IOPuoxLrv9X0Y7WZlEtk3
	F7pduafn8tq/KdEGXl4ifnPBI9xtwdcK74hKokMncjqDWhlzxitONFBlpF0f0DBp6btmnnt9Sc5
	0xE/IK3CX2ZY2n9yowzROazGl4yYuH6cOdu/6oNSCedv0n+xc7cmJ4aWqO4ae8eeamMSh5xqtiJ
	FKezEMmszZO4t1lLtzHrs/9IpkpN2/w2E1VpQB7TU8XZR9ULJE6cRkUgYKHbztGZ3pnmSquIKP3
	BW1UfosKVjmvGlPVzFe36uiDzUoVoEjS7fQKcCV5sWpdf5+sETVtjLg5DdCQmigARj9L8JH6DX7
	Q9C4iKrTzzBb171gWp9a4ydE0gNkOtVYYqqLbF0mBJBBlBr+Ohca2dcehJ+mw7tfK8OQ3Gjomhj
	F1SGiEpNXrcQ5iMdmoP8oYQDmykMpQXuzT5ZsowU=
X-Received: by 2002:a05:701b:4212:20b0:195:49ee:94c7 with SMTP id a92af1059eb24-1b556877b4bmr2456175c88.8.1795164273890;
        Fri, 20 Nov 2026 00:44:33 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:33 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:06 -0800
Subject: [PATCH v3 15/18] HID: logitech-hidpp: use
 alloc_ordered_workqueue() for FF queue
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-15-ba39242d4336@gmail.com>
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

create_singlethread_workqueue() is a deprecated wrapper around
alloc_ordered_workqueue() that unconditionally enables WQ_MEM_RECLAIM,
allocating a rescuer thread. Force-feedback packet submission does not
run on a memory-reclaim path, so allocate the send queue with
alloc_ordered_workqueue() and zero flags to preserve strict in-order
execution without unnecessary rescuer overhead.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 12b499fe08e7..de9087459273 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2778,7 +2778,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	/* init the hardware command queue */
 	atomic_set(&data->workqueue_size, 0);
 
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	data->wq = alloc_ordered_workqueue("hidpp-ff-sendqueue", 0);
 	if (!data->wq)
 		return -ENOMEM;
 

-- 
2.56.1.750.gf70dc682cf-goog

