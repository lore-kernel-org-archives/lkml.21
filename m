Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164061;
	b=I79CRQg0DXKVX6Eur2206iNIiM/LtYuIWIHIkDQQMchfgwgLoetvYiJraj0fJWhAq9g7
	 luG7EjdGtEGur36dB5iPe1b40sV81Ej0WscdhHefvsMMfj37GxpVO87slAbyoOP7pY9jw
	 igKsc/tfqRTQaXTmTY2adWh6u8+hX+v/SUooQKd2vC5A9yCODiu3+6ukkm0MRrVFp8Tuv
	 Uioo0xnRhdJPeRgFHIIMMgCrnvzfhG3ksQHZw7SSS/xsU8FEHm9yIBeigYupyHBP4CflM
	 RomDPLp3qwJYxvytkt4V5iywHqYEqLqfxPmS80yojcPPd2yo87Qy3cGLxnYxLtfreJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PUXUXXOO5iNBSWhR9dVDhL+xLFTr0pkbQo+C0Dqwezk=;
	b=i+EQyrKzCV9pvL2Yl0JqHw9PyMFxM1YTimzIZqttYS19rvaSaxH9jGCvp0TdFo3mL8hu
	 739DmsxSCU0gex94mieS2GkOPFASGtQ/3EdPd0axL9EIgXNoGi9+f0Jm0DWOe5nj40YAf
	 P5D/0mHCK782LycEI/gS37zYsq5osxC6yoA3fvOJlrUG77dlzS7HSKHXYPyJLPPmBaKce
	 uLYNyLMA1IFESVspnwR3rGSYZU+7P9Pzg4d9BZTay7AAZir7z2rWD8TdZIQMJeJ9GHmLM
	 P6G5HHnts4jw4Yc6cw7BCP8FbvOIg0cm1HjZ4lhdOigWWXk5cg/Xg+nFGd21StRaesw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwuvkxuJ;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE660A260E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AE660A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwuvkxuJ
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3712b6d9843so553587eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164059; x=1795768859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUXUXXOO5iNBSWhR9dVDhL+xLFTr0pkbQo+C0Dqwezk=;
        b=XwuvkxuJZSWwDhEkBjSfmCIYGsCXQ7BuuRgzQxRUnw61kCKpn6LU3ucPcwcZE7bRmA
         n9ajyBH+Agv+YxQaO+deWUiXo+KmtdUmgRfebphuUBq+lgMWG7d684VVWw+HEwalRjPb
         KCd569zZAweZvWsCaneu9l3/FFTelaj67v2fuz7twfjt9GGvypvaZdshvoYQVxE1AClk
         dE12pOIxIsQlKULmrmh7TlV3hgtYz9vsHoQaz7Tazm83YXUwwmh5hzeylfvD5aITxMPv
         QhOv6Mnehxzp6wGGS+0zwHvsHrRvBOvu5LLr7I4xziV0OLIGXXtL6yDsBnCRhKrT3pPO
         Wm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164059; x=1795768859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUXUXXOO5iNBSWhR9dVDhL+xLFTr0pkbQo+C0Dqwezk=;
        b=X3ywuuPBxiKWWX1mkPDZzf7nDJrZ2a23AY0sH0Fz1S9WDynIT8JVyJoNNLC2glqTXs
         3CETmhiP0menLWajeT00Nk5gtnVZIsuRMmAaAC8eAoi0MIYpw9aq8u7OrADzGuw2cTbE
         8HajiL5aQnzUiOu86QFxJzOomd5rRojhJYD2MTQzXh0q6rMC4z56bghqAj3jK8ChM4vI
         pQYA9vzf74/mBrMeffEJL9PL1+EN9Z2M9Wg2W02kada9brrEYskmqojWJUB8Vzb7gVKe
         uIRxWzLg8tTBJVdazv2IXgZ01J2u5HEJ5txKFj+A8l9zy9+voKluJFgUaJqZlhA6UtLC
         qKnQ==
X-Forwarded-Encrypted: i=1; AL+hErF670kFxhnNFgLmpRdvc2WLabkFXSTYEoE7poNSShbMq9RxxKS+nuIPiZJfEZp9FvG0vO043crLnIr9Zkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8xCC/BF+pTK4rDEnGSSQ1+Zw0BpWh858sEf0wX5BONJFtD55u
	v4xFUY1E/1Bj/44cGSUotexv/CsFhGocHW+9PTelGZZz32gbr7twKM1f
X-Gm-Gg: AZFdTZcVhhn+NfJ66W4Qb9jLTwlZ9Ga9cQNBQHqdztv2jByF+zfIHSJW4JpITemDwiF
	luQcoXCUfFsSfXfPjdAaoK/ZjBQBUDr1q2ZFs839SzDumQNTIf2K7QW6614u+w2vQXDGRnffT10
	OQ5ql7M+5WtIotD4X8vbvE+/Yl+I4VBxRdw/+zla9nmiXY0grAXhfhSGceH/9rhOnBqAv3LxUMr
	C7b35Nr6kndYIULbhCTZ8JDEc58IRUuyTohSVQgXFOPO3rVMPUtj6OKSoSrEovkS9h5RuBX6Xxx
	e0s3ilnkyTkZKUea4c9GDQWDNvjzLpX601FE2i+pjSqCmGfwxskgjm1dxPEj9ZGtzJgDxAJ+RCG
	L8xcK4bPvoJoebkg3Fn8lLmxXMzAD+/0QU7FLnW/YRhjObGh05zKHGw5YqmEyuYmb4x8k439pgU
	eGkCjgKLOVNivyK3T5YbQ3x76f8TXnzjjhb2lEjl6u0SohN0zgezQd6bRNfaD+/vbkbQduR8Dg6
	T3OgMUTXsJKjouLJNp1fbnMvVB/Odd5mhCo5iIa8J6SmiPF6dz+jpgmY8YtcErkYASIKIZ5X05u
	p+ojPQg8ldmUSpddJ5i9+RMrT1nTPolPjSdpvoBB4AMy1J3yYRIQUsouiJB1rexoyDvCMn3bYHI
	liCQbe0wpcJcs4ngcDg==
X-Received: by 2002:a05:7300:c01b:20b0:385:4b9:18ea with SMTP id 5a478bee46e88-38571027a68mr2361900eec.35.1795164059305;
        Fri, 20 Nov 2026 00:40:59 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:40:58 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:49 -0800
Subject: [PATCH v3 01/14] HID: logitech-hidpp: fix G920 force-feedback
 initialization timeout
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
Message-Id: <20261120-hid-logitech-hidpp-v3-1-cfe2caa1d0eb@gmail.com>
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

Commit 544315e40172 ("HID: logitech-hidpp: move FF initialization to
.input_configured()") moved Logitech G920 force-feedback querying and
initialization into hidpp_input_configured(), which runs during
hid_connect(). Because hidpp_probe() calls hid_device_io_stop() across
hid_connect(), incoming HID++ responses from the device are blocked
and g920_get_config() times out with -ETIMEDOUT.

Temporarily re-enable HID device I/O around g920_get_config() in
hidpp_input_configured() so the hardware configuration queries receive
their replies during input setup.

Fixes: 544315e40172 ("HID: logitech-hidpp: move FF initialization to .input_configured()")
Reported-by: Gideon Heinz <gideonheinz02@gmail.com>
Closes: https://lore.kernel.org/r/CAPb1+K1-pirdLGZ1wTUw26G6pvhg7rGP3QZ172ys5DB7rNCf5w@mail.gmail.com
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 60fc6b86a085..85d8d168ff15 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4096,7 +4096,9 @@ static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hid
 		if (!list_is_first(&hidinput->list, &hdev->inputs))
 			return 0;
 
+		hid_device_io_start(hdev);
 		ret = g920_get_config(hidpp, &data);
+		hid_device_io_stop(hdev);
 		if (!ret)
 			ret = hidpp_ff_init(hidpp, &data);
 

-- 
2.56.1.750.gf70dc682cf-goog

