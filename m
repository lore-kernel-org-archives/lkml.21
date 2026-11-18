Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794962802;
	b=TgAeLI1L3FbHCQpsaCwLqrla8a0ZyWmgApXHgusmUkIF4o2aZKJ7q+an843zey8Cqzhe
	 rORmTuSxbJs0PiwEaiVkAOvKWaNS3p4I7oRVK0kjTJB+D8vYj9SAswd9ILW1KxnPkeQkd
	 hDbD/Yjv7bGJ0r44JOggBFOUZ0rhwv14ttixXOQUyPuAMwJTWVwQitcihlVILnyDC5tWw
	 JLCC7CoJQiY1NZpbJekC7TwzSxYwMBu6tysZYQ0yyjFPyyL537gefLM38BYj80T2wiIJ7
	 +07DD+S82CBHvz16lAY/SjXVMxhaegMSbyIT8o9bYre4YD75FsxIWvWn6BGSYwEg81w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794962802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
	b=AS0iF4xCRb6ngS7g3pZGP7hj3GiVbZ7O+0G/VVC9jaipWcGnm5G4zhNwqJwlmPUztopq
	 XxndM5NUYuDDyyS1l6KzlW/23HHEYeCOP5T6D5VrkQLoKfhgiVwveliqihzRRG6x3N7cz
	 ZUITZ2+uiEylmJO+TVqGnQlwEy42RWZsO+93s2J0HN/zk5+StXGWmv3gLmuCrESNr56BP
	 nPRP1lxEw1u63WNL7zhP1MQQdphuQiioa8wEjhyD/jUnB4b5I7V1SNz8E2FR0gjNlR3dQ
	 S7O1WYgxulNP/L1bAt63kujlcFdUMfjfo666ZPUyvqTi64ga0DaZv5+YhjDjflQC9Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUY7QHz3;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19046606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19046606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUY7QHz3
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so625230c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794962801; x=1795567601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=SUY7QHz3pMDMfnHttkyQCDMUYCeQQWYF00CuqnL3hqx4GgCkONUWo4pR3teU8v6NM5
         3K0xyH+zW3uaYaLe6aeN/yKqyPhgDAY87UUBQMwPk1YdgjtmSOUSQuFDyFQNwJldJjTr
         h8eRUWR8FJ2Crt01B1PRF7nz1CZ658b6PkNwQHHUdgDDO0KSDjfISPhZIWz7BWzSQ/jg
         Ki6Oqxy71CeEdkub4IXgEvtMTqAUROgaTzp6o+e+xvjlwyRUWWAoFuqkFjRl1muR+VQM
         1OrotrQ8TWDu45dDZUaX4kmadhH82uI7LrzAqpoKjZiFZBsBHQcJjXUxtcSQ36qkBhfF
         4gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794962801; x=1795567601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pllyLf+++bwuw+cTuPHNT6Ou6itzbDvqjnXe+1hShHA=;
        b=BQFoJwuCUoPCOl7maSedmFLCqdwZ0HT39Wo32dv7v8W2P1iQ2DHukv2yGtC8Yc5teC
         ojNY/dsw4G6so9txH0hxBcRF//y01gAlwEI3XjgKdhPCBY/hHEhbsg+YvoidSv8qkwbV
         YK2Q1EuKxz47jiUfKdUdjiQQc8KVuVC1775hTN/F93xiWoHS1gxyQUxB9b/J5xxEnRQo
         qSnkqatF6RhpQXUANKiyA1HCFUtBnpSui+48MSVXGMa/dbzlQsk7tawvdQRzM00sntHR
         ZtrQXb12JRqJLJUXL5G3FIinsmS40ELXqJJwPNregZz2weCqbeGwCBUD+spK626tjVIi
         JF1w==
X-Forwarded-Encrypted: i=1; AL+hErGdLvoZR13XCnnWWyuM/KsDUjcgMolfGdvT//8sgdf3ZhqF+1DjEzJAeyT2rzVfYOoj5iw3DSDTtuaKDsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wV+1SkFD/gBBnlFW/eKS1ujpAmtt1L2w+S5/R9z8hXeUgFOab
	MviOStVv2fAG2j7R/XZqJSKST3RVy/BHtScbdYyMzXBCKjLWh9uCyb6H
X-Gm-Gg: AYBFou1CKjcR/1cH2/1UKNLT/cd1hYI6mkExTYGZFhbzmQYspoShZO60dUBm1Nwk8EY
	QtAS6240FI0PvmFa3ySxjf7qBXYuwOQ2YA0dAMIw6IeQz8HxPbPQPquYUBc5beNYovQFzzFrt/1
	UX/rEDwaVwyYWle2G0F1Nbx/cU9haP0leb8rgEoKW3P7xe8L8KIufPAd807rw4ZvKW8oRDdSmRq
	h4LUtux1d3S03gJw3wYl+sjXXaeaPT2KbGZJgpuUx/AMmCs12ZkiCar7UlIhqGXff245LPUMKCf
	AbdQz827siZLEfPbDlfb73xHQXURDvDzEk1ya7isFJTc71PQwatIUKA2tDErcI4cjH6FFxgp02G
	3ZfuUiPikPMZKP2P17+i5J/HN9ZuYmGL3X9/WKsZvj5b/AuZwo4ZYbEGhIfQdD4n8+75TL4Gy4m
	QDnoznG9bcy4zEPOzUTc4FGyNnAO+mTVn57/i17ILgb2nmPe40h/bmIjhunwiwZQQV0813SGx3g
	YSzs+4+CPVWvUlW8iWP2+/QuTF482RYGOm7Zgdf67phBHNBC6P+/NRZ+8ixPy4fxb4CKzKhjnof
	5AUwKacf/XHWui9PDaQGxkjpzmhNdmNkYhac5N+7ZKjICY/1LGbGXQQEBbJiHW6o/sjf4sUOzUt
	0L9p/
X-Received: by 2002:a05:701b:4549:20b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b543d4b57amr983339c88.39.1794962801203;
        Tue, 17 Nov 2026 16:46:41 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm1765194c88.3.2026.11.17.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:46:40 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Tue, 17 Nov 2026 21:45:59 -0300
Message-ID: <20261118004600.369915-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
References: <20261118003742.363133-1-paulo.ravazzano@gmail.com>
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

Member entity of struct v4l2_subdev is only defined through
 CONFIG_MEDIA_CONTROLLER, so the unconditional
media_entity_cleanup(&sd->entity) added by commit 87d1307b6791 was
breaking the code. A conditional preprocessor

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

