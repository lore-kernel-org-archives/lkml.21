Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726699;
	b=oUCP2SqkPWWIGr2hiCSBF6zvaJgWak7qO4BiP+qdWm/st3DpAmBxjODuLkx3jGsH4rcP
	 bBqhb2J4Itk3g0cz4tWB45e38Hjg8I1WuEFeef30mE2ldbCbtycg0194HYdNlBcWtI/xn
	 Pb5v5VPTHX5dxEacwWFuH/gsRGoTLAgStvanQzC6ka3cWuDx9uYSJv+zdY5rtR9lVet1E
	 y0PgubVCVoqCflBmI6/kDe2fd8kqLfEIlzWh+AQNHDO3GUoQwsqNQl+z78jzNAZild2eb
	 Nl2rOH910c/Ts7Z1B1BnCFto0v81WWQQHxdYrrxVHsJsWzOx1LADPZeW02OuZyIsAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=z+QCDtjAYF4EgrAPbxgbLrZU1SIoHOt/s5+B/HO2kdU=;
	b=L2yypKqqu7bEm0txH6I+ecvlMagNc6kw5Sbs2WbZLjC07TIOwC2KDuUu0HQOy8hV9qdG
	 X0sci8bIJKMt8Vd9xoYf9FdyfWKPtnQNiqCobno88iWofwwNt1OzB1tzsnZ2wmKDSQnPr
	 XJ1LYtbIlVagjQhFRFG9DvxE2XNE2rOClwDQCkLYQvHTTDBLuwNexAoywFz/cjtn1YRln
	 IqPU5xOuegKLR/7WrHg7wOr1C25CnspRhlzTH615ElVzH1Q0rsTEKh1pqkp4SFTmlF/4v
	 LQUeRxY7YMtKAnqGC8MtmyyVkgsCiyjfbwa2bWYkzrRN0zLIktGg9Mtwz3szmu8pF8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slt1eceA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE1606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slt1eceA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso53472495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726697; x=1796331497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+QCDtjAYF4EgrAPbxgbLrZU1SIoHOt/s5+B/HO2kdU=;
        b=slt1eceALJ5Ojr8+ko7n1BPkcKl8rSdCXwBPjNYxp++wu9tQox3QFEZEwKykxG/AEk
         c7ak/CE/PwH9Ojw053V6OVFZN/gnwVnS+BynGGTuzOPlFFY8F7Wv4CNDeLXmfDFFOvbX
         S5qZbxqp0DP5u9pxK2RH123vDvvxrktkNb20LTLpu1thL4X1m6aLuHyQ2Se1iZUVMUmA
         lR5V1MloInQg2xK6t0aGdKwZHO6sSOqhxGYWS9OYbc3dd+iAwp/5CBSe1U4882z4IVS0
         m1nJRmN2ba3Z2200l75md+cytMWRumH+HcRycR7IXPrQNthup0clFCTMiOer04uOna+e
         HVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726697; x=1796331497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+QCDtjAYF4EgrAPbxgbLrZU1SIoHOt/s5+B/HO2kdU=;
        b=O1fMz7GavnNUR4m0UeNx62/KdcmwufCK5/vPYZH3GLtqBSgZs5PQDLHW+WNwf8X9zm
         yOSw7U03FuAGZ5vQdp0E7af51giSExmOvw9KVwiy/LG9RGom5TIRkhI0loPWxNVcPFIX
         FNc8CTwLZXBCW7gFwYvAgEzmHxQg7wWT34nn2CqXfXjo2Bj8q89ohv6k9XtEafHjK32c
         61aeKqwFxvlMS0hs0EwasibudJtR3HXuhe98BdDj0v0nhu+ioerLdU0BpKkyz2I4FTN0
         s60JHqkNriizE0Qn930QtbwdhNACEjrkAe8SOOPvGcLIU7C4ESvEHhGww3Vk+NG1168R
         1MUQ==
X-Forwarded-Encrypted: i=1; AL+hErFEC8px48m62SFleEmzvhjmU2X5XFBWzaZB5tcBWI2N5uERgtgTqMOYEAdf5OME/SovXvkRctaTkWjLTBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QNals60+Fp4SR4CA0F6eYirtuDnLIsczrdaNnCuqVnZwzHC1J
	QKoURZeGSSNS3SDvHhRoDdmhg2XWczlQ/hKPNLOPLT7RyxZYRS3C/wi9
X-Gm-Gg: AZFdTZdDtCeJOEsP3RmuVBHdU9BuWD44F2e7jAtvgwMM0vUgFbrChRSvo44xqGjOIsI
	hVeBxHIuD1dB9fg21nMum0/diVxz0ykNmIg5PwLZcRnI0UZ6nevRlXooqNkV0j0aTSqYg3rPXz2
	+a31rKcZmWAbiRGPwpRFeGi76qy95OxMousomINgmXc/bFmjp0E5nAor1MtIBDEbW9xhBSlquG+
	KqZSpvF2COQ0CnTK45VRIHr2mH5tFnDzehJL+4DoozXeqCvoob3uxytScB94SCz7daM/6vCpa/n
	Yk+6N25WpLTQoLZVoG8/ggOtFwS9/48C4QIiBgRHnflIJhV0TMIxHoY21jwuwVk+j1szo03Susk
	GT0CdRyOGWW6oiHG9GSqi5jSEmMBEu+QHvYJU8CAWa7I+UfU3xY2ucppOQZ0Z2BYBFylF08iPTP
	zzXoNVacIyX82AKdof+3paz8tgWTBVhh2vveOdKdvsAzBo94zmel+nCxORnYU5XcGGSy6UzK6Rf
	AnrOMQIyHoBi/KzJBomENNWPLHcODPGMwcshPr8hOdXtpo6cuyjxcZUvkvMLyD6hqKXLTugDK91
	Gs9S37IHsMPnb231KNq9tsgElTclN/UlGAeQW+bXmSwXuZTZTKcjYB71rZCY25sQIyn4YehRDZo
	V2CU=
X-Received: by 2002:a05:600c:4f84:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb88820f39mr423362785e9.30.1795726696806;
        Thu, 26 Nov 2026 12:58:16 -0800 (PST)
Received: from localhost (2001-1ae9-5b-ad10--33.ip6.tmcz.cz. [2001:1ae9:5b:ad10::33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm611178075e9.6.2026.11.26.12.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:58:16 -0800 (PST)
From: Arisa Snowbell <arisa.snowbell@gmail.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Arisa Snowbell <arisa.snowbell@gmail.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] mei: gsc: bind the xe HECI1 device
Date: Thu, 26 Nov 2026 21:57:54 +0100
Message-ID: <20261126205758.49845-3-arisa.snowbell@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126205758.49845-1-arisa.snowbell@gmail.com>
References: <20261126205758.49845-1-arisa.snowbell@gmail.com>
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

xe now exposes the DG2 HECI1 interface as "xe.mei-gsc", the same
interface i915 exposes as "i915.mei-gsc".

Signed-off-by: Arisa Snowbell <arisa.snowbell@gmail.com>
---
 drivers/misc/mei/gsc-me.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/mei/gsc-me.c b/drivers/misc/mei/gsc-me.c
index b38ddb04f..69019d5c4 100644
--- a/drivers/misc/mei/gsc-me.c
+++ b/drivers/misc/mei/gsc-me.c
@@ -276,6 +276,10 @@ static const struct auxiliary_device_id mei_gsc_id_table[] = {
 		.name = "xe.mei-gscfi",
 		.driver_data = MEI_ME_GSCFI_CFG,
 	},
+	{
+		.name = "xe.mei-gsc",
+		.driver_data = MEI_ME_GSC_CFG,
+	},
 	{
 		/* sentinel */
 	}
@@ -297,5 +301,6 @@ MODULE_AUTHOR("Intel Corporation");
 MODULE_ALIAS("auxiliary:i915.mei-gsc");
 MODULE_ALIAS("auxiliary:i915.mei-gscfi");
 MODULE_ALIAS("auxiliary:xe.mei-gscfi");
+MODULE_ALIAS("auxiliary:xe.mei-gsc");
 MODULE_DESCRIPTION("Intel(R) Graphics System Controller");
 MODULE_LICENSE("GPL");
-- 
2.56.1

