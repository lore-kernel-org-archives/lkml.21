Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164276;
	b=RNu1jAkemPEx7p0+eqvbGjT94nX+xd0h8NHNIai9KbEWWz73ZMyJc2i6D6y3U2iXjOvB
	 e2Kc0+7iWLKVf6ueHWsNeObkzkF5geIesGgbhnOR8IZghFJNJq6OUOTkKeQJBgvUSfdrN
	 q9h1P7fRdKV/PRlisuPwhDulNihPznuABVYguXYjxTxs2o1CEJIlz8QbfGQQmxs4fXxMs
	 vv3sLpMJzgGudYzJEy8IVFsnMDr85ODGQkbJCSdpjIyLS1eypf+NUhGrDLJwVyf26tlSz
	 EQvMe3paBEmjiJ2GK5Z4Wryn1G/R9lmnGIUjfTFA6QCY7/kwZs1KxKcqdcoLHt8Xnqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OJyJgZhm9cp9UYClWtGOIe/UnREzWNGjtCvJbSuxIDU=;
	b=bAyLlWIxpx7T6MF0mKCmzWsKew2XOFbIwb1sZ2CgnEs4tBVF//Tla24O5DxK1HMd4h6N
	 5HZw2/20DdvVNC4lnq+LFRvvcWLTsqXMuFGcoTRtS1IOfvdYMC1Kh6BBlDBT41RF9Cxz8
	 sayNkpymE3k14JlYP/KdXw1AIMf5RTlt5drDej/27XTTuGTqNqUMgEi0eIqRJEMjnWEiW
	 g+SR3KGurhIE2gVavqMMQfw9ZYimo/8SY50tiwjL4koJIlPEIsKHIvRn7uI53GSsI/VSy
	 DEfEND25l/VB1PcAvk4W26FqtmE6oUJdRz+tjOHLif9an9r+BWRlLuxKazZrxBfoQcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gADtE0ag;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D869606A7F8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D869606A7F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gADtE0ag
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so933498c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164275; x=1795769075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJyJgZhm9cp9UYClWtGOIe/UnREzWNGjtCvJbSuxIDU=;
        b=gADtE0ag0Yu358+Jr2GttRb271ajTVW/rczWLDYGLiSCnFk2L3Uk/4DIqfEEqPYuQL
         2omcC6Ui8YcQRMZlz0LPckjt7iYctQk1V2clhNQebMgKG2F3iv6waVVOEkMTjHqdhkI0
         n4H4bd4VyNrEVf+nWwD0nLqyS2v1f2d5o8dp1g0Q/GE+vOPwCb2nrY2KFL2Iz8sG1pp/
         ficU5N4ivECGkuFVVsTLBheO+GaQCpqIaR95ZsVc5u+5nvB2kxzR2/Ojmo9ABpWrghjS
         xksu3DRb0Sp0cWaY9RubgO0zfwzxKrdGmoByJqjMLum2OzxFKXcO7vEde+pOjrY2K50n
         Kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164275; x=1795769075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyJgZhm9cp9UYClWtGOIe/UnREzWNGjtCvJbSuxIDU=;
        b=KGltGrojb17ZNYFoxgE/8dkE2aXHSMweGu//eqEiEB6fbt4/yIM4k6vtLQ2C2wJd2+
         BM3L4Yq/c5xjkn3i8bruw0ahgMuIeH0mXUQEVLEvoZlIkSLWu8H8ZKXN7oQp5B2qwewO
         LgZYQydsEGnuDbYwb79NLEUcqfP63s+MJdtnOQpLmBU+Vn6PgdIRfG2qrT8tHV0St7wY
         oWFyBj4odg9VwD4qj76MkXmY7Q0irhePYZ7dSJkyRAji5of2ldIb94ao4DEK97s/0CBP
         QYP5Liqh5tjpmOiREak9T1ZnCrv9uqz8YrS+fQ70d16q23tKz7jrKIQK0n0qaMMmv3zP
         AFbQ==
X-Forwarded-Encrypted: i=1; AL+hErEbGVohVtpa6SEzfbhAb9EJ3rkG3bdEUwaiZQW1cH+aWa5fEdoeY3tcLSNHdHnyiV09ZmP3zx4orpxB9II=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AkodjKOgpFNiaGMO02pFqqre76pyqZHw/Dcg58Y07awJUG/oo
	cU8y2wmd5wGSqFbqyxCLMwIkdm1Pfeiv8dpm9zFj6wwE8HwCLX0tIP/e
X-Gm-Gg: AYBFou24QBuO92AyPXF82nbN3ag7MA/hPDTGHRXCxOnmnyvfgfGzV9ZEQFtFfilyYf5
	QaRRO3+YmqKP+7SaZ60pnBMkK3jSF5MxgiX0/d804cSAs4/gnPCkrz2Y8MswCqJAB9Wgr+nxABh
	XTdNBu+pp2SaEkog2AS9QcDHeFcB6MBMUHz4agNLm70S+HpD76lUp2YngFolRwefAJkYupfLQ5n
	TjZMaGQg87IrUDcC4LyxDLhnxdETF9NM29LX4eTJ+MAAYcKzShhjHytit+IeQDS+1O3lErTT56L
	PElWemql3jq9n64MNURJVU6Vcov9/qC2yrHi+Ts/OjvPNtPiq9hFjTlSzQiF4V7tmN/+ghbDfiW
	ECJpmtojbNql3j3wPJnlyQhiMfxNtBA+qAGxDE6gAKO8sfoPGcY8OawYRdljX3zZgu52VIgYl5u
	AG2K/lrIIw8lhvfBU2da+W1vcBJ0TTuZN26mZiJULvXSsAXii7Bu0dOrI1uEHUh6SVSESp6mDOJ
	n/KUtfqIUp+3lbKSxJuYD45FqYwl6M+jkwOIezkyqnBtjeZp7lTVVIzLLNn6O7w+ekYr4Ppghx9
	0jssjY5bmFNkgyhB3yLNQlKGyy3g/9WidHEdmFzRvtSVJUYvEO783f5i8e02qALbRG5UPD+mAW5
	79Snp2afh9z6b5++/Hg==
X-Received: by 2002:a05:7022:23aa:b0:1b5:23e7:3387 with SMTP id a92af1059eb24-1b55688dd29mr3272803c88.19.1795164275440;
        Fri, 20 Nov 2026 00:44:35 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm4808244c88.0.2026.11.20.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:44:34 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:44:07 -0800
Subject: [PATCH v3 16/18] HID: logitech-hidpp: manage send_mutex with
 devm_mutex_init()
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
Message-Id: <20261120-hid-logitech-hidpp-next-v3-16-ba39242d4336@gmail.com>
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

Manually initializing and destroying the HID++ command mutex in probe
and remove destroys the mutex before devres tears down managed child
resources such as the delayed input device and battery power supply.
Switching to devm_mutex_init() eliminates manual teardown boilerplate
while keeping the mutex valid throughout child device teardown.

Initialize the command mutex with devm_mutex_init() during probe,
returning early on allocation failure, and drop manual mutex
destruction from the error path and device removal handler.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index de9087459273..261022e4088b 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4618,9 +4618,12 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
 	disable_work(&hidpp->work);
 	INIT_WORK(&hidpp->reset_hi_res_work, hidpp_reset_hi_res_handler);
-	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
 
+	ret = devm_mutex_init(&hdev->dev, &hidpp->send_mutex);
+	if (ret)
+		return ret;
+
 	/* indicates we are handling the battery properties in the kernel */
 	ret = sysfs_create_group(&hdev->dev.kobj, &ps_attribute_group);
 	if (ret)
@@ -4697,7 +4700,6 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	hid_hw_stop(hdev);
 hid_hw_start_fail:
 	sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
-	mutex_destroy(&hidpp->send_mutex);
 	return ret;
 }
 
@@ -4724,7 +4726,6 @@ static void hidpp_remove(struct hid_device *hdev)
 	hid_device_io_stop(hdev);
 
 	hid_hw_stop(hdev);
-	mutex_destroy(&hidpp->send_mutex);
 }
 
 #define LDJ_DEVICE(product) \

-- 
2.56.1.750.gf70dc682cf-goog

