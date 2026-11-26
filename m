Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671060;
	b=ObOBcrAE2C7ms6X9imLx/ndz9oV/NBzXYlRY+c953T+6eZwrFymABacQNLct4+6u63Zt
	 T3RNmu3buyk5OPGjwfxr4Og4RhIMFNYV4T4kM+8XldopLtPth9O/O9pYKLGqfIk+1ujSX
	 uWK1X8sY3xEN83ahwK1bSnX/4swfSzCzAK46IH4xjk/naYAH/heQGRDUvSh8IN0Jle/vW
	 EBDhLZ8Bu9EcFe+ieYz2FeGGqYULBZj3QsV9B2kSHwT/jN3rQPvnE9q6JLaKjBwp6uHmi
	 0XzbiYkMQZJWmqoBkh8SOpa6NRv99A9EjmGrtdC5yfmCuZBkBHGAXs4O4C5pQi7ylhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iopZBYuyd5Md/S04U0z1jsyC4Z5+nPgq1zvcRMuA70Y=;
	b=kzVoYHPR5jr4kdqDqUTZEgejmXzies1EdIYCavBWFzKfcF/DWNoPJNNeC+beCEKFXIDl
	 qcPItEj2DIpTYmhgjtsv/P1OYOMzCsmqQ7m+1EeURTZzJMN4nUJ8wY9XI+/vrfUyxLYXi
	 LUl0k2gLIcU8gH9qJpjGcfMBu6GmXtNGUTbruTa/xqReUJNFuX7XRW7AwZ+r+7ppl0KY8
	 W87LAndZejMSSYUpKNkD6d6Mus4bD6BpzCIXTwk8x4ltddWzjKpfmGc2l2xBBIfpjsD+S
	 lcCD918Ztavp9BHXfxaRTksyBaWGVCpsN6losK30ItKT3YRT1HbCRjOgkZakIBC4oqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mO++9KXu;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22157606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22157606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mO++9KXu
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso6120773a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671059; x=1796275859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iopZBYuyd5Md/S04U0z1jsyC4Z5+nPgq1zvcRMuA70Y=;
        b=mO++9KXurWq1xtaZn1Fs/rnO3p0nGq49JlnP3dndiBcad0Ptxcgz91D3XrwQGoj7i8
         sS6yKaLG2PuWmj9W0tXAkU+VcFyfweziKB61assQapulXENKXv5v38S5ZOKHO/o3ew8b
         yX0qcb16Mp1NVoqsA/umdUIZBVkUsTt+QGwWyOaz9NakdLMd4jHFIfr0MQDiXE6dukFR
         fxXv3eNRbsad+jszQ803Sf1EcRhBeXxnnbALiaB9zM96QFyA1c3eXq2k6TLQ6Pu12TOj
         cn/t8jFQVGaXUDFVMmx/5H94QL0O2VC7ztzZzh7oIucQJcUoy73Rijz2yqePX5tUBj8y
         hMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671059; x=1796275859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iopZBYuyd5Md/S04U0z1jsyC4Z5+nPgq1zvcRMuA70Y=;
        b=rtmfXZ3vZEFuFRm2bAZf0333x7Fr72cxInpVhnElC7FysplJ3xu1a+ow4dOqCHLlNH
         0FEql3zzXTs9RoFbXACsWhQmTBIOtv/zXwny7hqQ1YI8yQI5q6lfs5bP3w4OVgOU19oz
         0Bik9Hxs3m3LUlI1OcnFb85bB7XEaXRhIeMMyGnNxMFIIu+5UId2XBiWJrQuwJoM2ueo
         2qH3mUZIl1bfvQbiH4Inyn+6fnz02UvYU99rLbQf+uTAjN0A71pHUTnWeIAnCtTPYc/u
         EzXSPO3Q6rby7gQQodhNA0FeHXIVw9O0Cdj26LAfGOK7Y8MyEFqWZMwlWTpmCsQok5Wp
         6blA==
X-Forwarded-Encrypted: i=1; AL+hErFAf6h0WVCbUQzjGlLVe/i867LunT1YEPXWVPL/OHlvLM5/4RLdfuYfHwDId8OAreXCY4nuxOAIHa/6+W0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2EcLRZNnIkJcJx2ymWYedRAyXOKve985lRua4g360TXFkhgvv
	xQNYP9DIRkPvGG3S8IKBfWLGuy6YEXvGiyDa3h4UP7HcHl34htVbmuLw
X-Gm-Gg: AZFdTZfdEfR3z3YONZLJndfLdLZ36Tu+ktz/wpAJtxtolk1bZ9eoDm3B0xbB7qEigNN
	8fi6DJqE3C0NpL9nMvLW+eyu8Rp1Hz+2RMVe0FoeEbVn4PTFTEPvgWr0CGmyLBVnFiL0E2xxUn9
	KyY2CNRtOG3qsiB92Bg29m+Dq0PRJ5MmswIXP9lK97+JOgQ1B+Sx1f17TAJpRnvekddMTs4ULlz
	0/4LAOTjiDkjWanUc0kSVk9vH5JrcTCVZo/45R1nO7MxoND7fFzRy+VXFxQCJouAKM2/3rIPs5o
	956BzABpSTK87ksed6WAZb+BvATtA40mKlK9Bqv8PGpOIkSmQ+ot0+TAJ6LVApePZCjvzXvEwp7
	VzN1fcT8VKSpAUDpZSNRup0yCgqaw9WanjxtGtXGK96OsnwEMYyJSJ9dTJHjWIJqJQ204ECxaQ+
	OcANwk3iHLD1kuytwdaUh2rokgpI7U1LA2M4AVJgg8WNXQFgRbI1p+gbtnX6wTaYwS4e1wFZqK8
	U3KMXtx+3fxEGn4Q3DB0cCnK0grwuQTLpHXc2Q/mj34OeK6/7qYHPtzenlG6XTy/gI0lJkd4eUi
	Sy1OTj5u3RoIvguvYs68U3DAdm2AmmMZjLkThG2jBMl2NWH4yEm4GaLcEg0+twPZb7Nsyvjbmhf
	0zaEBdZso+dCB8NJ1OcJWlJu5ysXag4yS8YwaFujBBqG7TdO/NcdPSesl+ECgZEjDCcd2osaADA
	bnNsO6x16jCCBBN1KMAEEL+nw=
X-Received: by 2002:a17:90a:d2cf:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3b41c8e0507mr12673486a91.8.1795671059384;
        Wed, 25 Nov 2026 21:30:59 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm33700520a91.7.2026.11.25.21.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:30:57 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Wang Shuaijie <wangshuaijie@awinic.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 1/4] iio: proximity: aw96103: report negative proximity diff values
Date: Thu, 26 Nov 2026 11:00:25 +0530
Message-ID: <20261126053033.603086-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126053033.603086-1-kapoorarnav43@gmail.com>
References: <20261126053033.603086-1-kapoorarnav43@gmail.com>
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

The DIFF registers hold a signed S21.10 fixed-point value (Awinic's own
aw_sar driver documents the diff data format as S21.10), which goes
negative when the measured capacitance drops below the baseline.
aw96103_get_diff_raw() divides it as a u32, so a diff of -1 (0xfffffc00)
is reported as 4194303 instead of -1.

Do the division on the value as an s32.

Fixes: 07b241262dca ("iio: proximity: aw96103: Add support for aw96103/aw96105 proximity sensor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/aw96103.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/aw96103.c b/drivers/iio/proximity/aw96103.c
index e3ab55170b6c..1fd0ceaf2a05 100644
--- a/drivers/iio/proximity/aw96103.c
+++ b/drivers/iio/proximity/aw96103.c
@@ -268,7 +268,7 @@ static int aw96103_get_diff_raw(struct aw96103 *aw96103, unsigned int chan,
 			  AW96103_REG_DIFF_CH0 + chan * 4, &data);
 	if (ret)
 		return ret;
-	*buf = (int)(data / AW_DATA_PROCESS_FACTOR);
+	*buf = (s32)data / AW_DATA_PROCESS_FACTOR;
 
 	return 0;
 }
-- 
2.53.0

