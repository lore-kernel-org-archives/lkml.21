Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164069;
	b=iUCzDNnstGhAc92RhLEQy4xJ4RNI8n+IrTdtDjOBbW8fPvuk3kr8MGPIttJ5VMY+IlcC
	 t0NWmFeub9UOxBrU1j/zrt7RY84SK4GoMtG+QnUa0Yq/cfNgEayUM2zzmK535vd+0Hsv5
	 idkc+7T9xew32eEXsJIT4M8kgts/ZlyO80CpeWv27AWfTxRTIlyzujgE8+zZeTLGZvOjc
	 16UMQD97Iq6yMQZPuzYwo5e5ILFCI7GiQu45uPi26LTIEehgtO0AGI58Vnq4QwFLqLEtc
	 3df7JXU2n8hMENUhFLVpAhZLGS+TxyZZzJmq5dEcpj82UhteO+3nkcTbQpGPCATj0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vkzLSGS2/EtfF3lDjWx5RTNsXPS6BLA3nJkka+odvM8=;
	b=RzftPDrHnIzpGzQlRvZ5C+9OcK+eJ3ZX44+2lzgCIdDM+hOgsSUKEZlq5bc4xKck1+Kn
	 CA6ZzmdrJYzs9Fk2EF7io/m/om0WZ59wEfoZIw33JMPOPyvUOhTp//F9iizOGKqbZdoBV
	 ziOoDt8RaG7vmho0XCj6Oq734KRuwg7HrenY6a9mwr9YY1UOiKZ6PPaql86M5yNEFN0cZ
	 +F8ivwQTB3t9Q19Z8/u/RgMPXC4DEuVJnG1Lk8RlXWnxJ/rBmGyuAfUfdk3GWvL1fhX+u
	 k3I9y2TRBW7M284fKilRydWbYPXyYuUN+A88cGG3R2Mzbe0ijw0xbQit36EbZbpVViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDbf0pDW;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173660A5BC1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F173660A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDbf0pDW
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38587f3de36so709621eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164068; x=1795768868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkzLSGS2/EtfF3lDjWx5RTNsXPS6BLA3nJkka+odvM8=;
        b=HDbf0pDW6HRvSYER+4Zy6Bhgv8bbnW5DHw3wmlOWnnSjh28UrnreoWPPR3KIK3CTp+
         tOFtoFVqPoG7g5v481mOcCqC/RJwSYvrTzR0kO9ANWnLqXpe9wo5cAAxq3l00SER5FGf
         ApeFM2fuPH4cBLyU6pMq15YCCweyfo0fN7u+tjGMNu3tO+8tyJaCHKHbLsnEv0S9NHm1
         oqWvmQ73wt04VjtGP1Y7659yFGbSdOeauRpgPGQ2Niazh1k5rv3cuijUtexEEaiHTC/i
         o8LKwNde3yrv7D9Lved+AP5Bj2sb6UZdpTjmGMK85y8GOnQBsU55IpLos075iVRbyNIl
         JC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164068; x=1795768868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkzLSGS2/EtfF3lDjWx5RTNsXPS6BLA3nJkka+odvM8=;
        b=06fC3CFJ6zQwG5cu/nUjUwu2/SCClo7ylBY8nH19VRqMppYwmt5uALYzJcV9yRB7Uj
         Fb/x6AxCfV9mqbP8vdfU/yBNNtXIfxTsVN8K6cEg//vy7w8GaAXFi2NCMLV3mHZfiJ0W
         Ibr4jAcgavSggVWpfxDmDuU+LssoOkd9xvDT5Pgb4XgQvs0aS3oVpESjvAzN9X0waz32
         gN0pa/YdhezxhiAzROaBbx+dEqX1kvhIaQONXLOWpIep1tkIeJvjDMfUpKF0lzK/Xqmq
         yJveFAp4XaY/lDVRELvRXIoqSzHuKyJsGX+xG4ajXy4nhhn3rgxMH9ANFyFsPwnNkJ24
         jZSA==
X-Forwarded-Encrypted: i=1; AL+hErHP3zbo3X/8xgK7XE1B4lspw42mBqg4qba4KFhNlDG5jgymDPNVkw4lDN8XVjzOBTB3Va4sHVaLLabnyOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nyhbB1VrJMhSnhgbWzw7y7cgzqzKu3mZPY4O+eg0c3HEdOgrl
	2D2iYvZjguNQi6HLVsyN/mPRiqsS0LGsQw0HBoCclCB2Wcw7NKJVGdk8
X-Gm-Gg: AZFdTZcZak4tWhALuc3ORQGeEsi13g1jSKsNNVmYdu9hFaSSyaxVkYX8WHCSkD7BVkm
	cVRmtC8f7TtXLnMCB1Ek7nbFJaT6YMIDj8gvhRUJi6VIOqEkL+D17m3lHS2nQr5wtZshP1DuZN3
	Jct8F3fV+lkk7rjF4W503wx2AwqJszkuoS95Ncto0xS7rKxurUOMqo6O1VyorkCfQWvp5GhFd/b
	3/7rJyGQOr4XO6W0Aa3lA5agGW4hE+U9TctoNUsfGFYfDJiH5hepPzxnqcXN5oDlw7fO7Cihxm2
	cElTTYbmYEXo4BpkVwFSWN+RYkn9dTWRoy3NN2TjFLGpwB0p/rz2YcoohN9eLSqnqshmKtBcPZt
	0dt6syf6XG52g9a80449pvyJaH2eI1gJD3lITqLiQBva1vQTB09IM6AWhsbPb2KSSOqDu7kaBWJ
	uyf/U8n/rnWzfjASyehAgfI+OW/yzz5VOI6cGRtPDxOuwRvpaT/KWfRgqY0XPwFCgpczVg//HUu
	AHRGzmUlgIVKudqgEu1S1VBt1xd10Xx3Hvsa1POKdqVRMUyNp8BJ8Oouq5vv3Nr6IVBvv0WfoAr
	HJZAdxBDejTiPLywDZuBWUym8gyB1/gExYEWZTnrBM9pMt6+Mu0vpyNl8yP8nuWTkHghUXIbEXG
	R7mhjohsBo4N+V6CG9Q==
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr1937266eec.36.1795164068086;
        Fri, 20 Nov 2026 00:41:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:ea97:e47d:2ebc:210c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm5793181eec.23.2026.11.20.00.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:41:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 20 Nov 2026 00:40:55 -0800
Subject: [PATCH v3 07/14] HID: logitech-hidpp: fix off-by-one in G920
 force-feedback slot tracking
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
Message-Id: <20261120-hid-logitech-hidpp-v3-7-cfe2caa1d0eb@gmail.com>
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

Logitech G920 firmware reports 64 total 1-based hardware effect slots,
reserving one slot for the built-in autocenter spring while allocating
the remaining 63 user effects across 1-based slots 2 through 64. Because
the driver subtracts the reserved slot count upfront before sizing and
bounds-checking its slot mapping table, the 63rd concurrent user effect
is assigned hardware slot 64 and exceeds the stored limit, so its slot
mapping is never recorded or released and remains leaked in wheel memory
across device close and reopen.

Keep the full hardware slot count for table sizing, lookups, and slot
bounds checks, and withhold the reserved slot count only when creating
the input force-feedback device.

Fixes: ff21a635dd1a ("HID: logitech-hidpp: Force feedback support for the Logitech G920")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 53c171dfcf96..0264e4541edf 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2872,7 +2872,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		for (j = 0; hidpp_ff_effects_v2[j] >= 0; j++)
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
-	error = input_ff_create(dev, num_slots);
+	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
 
 	if (error) {
 		hid_err(dev, "Failed to create FF device!\n");
@@ -3486,7 +3486,7 @@ static int g920_get_config(struct hidpp_device *hidpp,
 		return -EPROTO;
 	}
 
-	data->num_effects = response.fap.params[0] - HIDPP_FF_RESERVED_SLOTS;
+	data->num_effects = response.fap.params[0];
 
 	/* reset all forces */
 	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,

-- 
2.56.1.750.gf70dc682cf-goog

