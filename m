Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795330672;
	b=EWS1BnAGy9li173MOTvc68vR4yqdXaqKxueGROvdd8tfwsJZ4BExi1v9VMcYCkfFkf6r
	 mhrVLEK3i/Ff0vxrHLMbM1novJKWUSTONO+5b2pjJZnfaAaVZ5TG2ZC4QZh7L1nwg46sI
	 aErbKEN7Cvay/4ggsK8X5NMlPR/0T9j61FEgJ0HTU5Sv/EaRITK0SYxgxXLDzH746EuMx
	 KT/6OYmrnbmKOi4NtI3NoCYj4EfLuZiB83ZtcXBmDozebgXXmYBypousPrGplAP7UuCVY
	 Fsr4fRwd1cZ2IzJ9G1Np+8U2xcXzLA/NLRrwNCxG2mwufnT9QTBPE0aUhrcopYoSA7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795330672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
	b=A0RvVhmbIA+tCtpZHGLgHfJpQvqiO6B4xuEi3YjHfj6dTGuwYExnpoCMUNgC0x1+TKgW
	 q4EsnX6vUzDmFw5ljq3mLz0eYONL/AwGFueSW7t6yGQ0/e7Ris1e+SgjHjDADSINfEfOi
	 WvfSdbupW95MOq0Smx9ImLA8PGstiq+ONfyVTPPDDVJzV2Ny3JadM8Po5yawESHB7dO7y
	 ueWGYn8mfN1zsZ0S1HavJYGp2inmma+rHFp6bboY5Wqi6rhPEFORVR2VgyIgSsWQJljYe
	 1ZjhMJzSMVf5iXJIc3zFbfaD2NuagLyKLeRVa7/25uRBGQS+Nx1ps720Gxvuir7aTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrCWerjj;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB8606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 06:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RrCWerjj
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f052ae3c86so9604865ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795330671; x=1795935471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=RrCWerjjKeBMc1l66n8wiglAZgNNPSW2pmVfBx5+eMaeOi61YGftujVGkNrqoTlKxY
         mCWux9XZysNxG5aUT/i6Ww8SBPOviyTjDiW/wq4Mg37rVuxPCxDEJZySXajHC32gEXJQ
         mnltWemiT1/k22w3TUd3SSFYu3Ddy+HNFhgervGMewFLAxFk2Czq1eaXvlOzEsW+ZBhf
         PtWdjqVs95VU4pRSlv1F6pllbWP0oS713d7hG4O2d2BSkknMUeKapppzFhPVSLYDdlBD
         XzPOfIS6Ro53H5L9xk6l114J5ivN+Xw3l8zNutQij3kRqrhLDKtsH2+SroTUZ8Y/bnlT
         jv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795330671; x=1795935471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCWypRvGlSZbPduNiUdgoulqQKISARZWO/rbiAK73fo=;
        b=BkydKK525c2qMJjbOci4GTdTdzHIs3IxSd5vf4VapuBuCXm/wWzxI4yRhleX/mS511
         2wYev/68+Yq263VTpy+bEB18EsbN+DEh7VgBIM7E9gnzLJJUZVzff5nkTG66jVcopu5Z
         NDPJ2HvRZ5jxTIosqbz5Q0RVATT0P6o/+Ytw7AFNGSAnn7AEvRFI5a2fyf/R3h2fSR96
         1rLRtC896YQc3LojFWEPOT/WLMqf+FGOQfqT2Lx7xI0Tx70O/dnWSXvhSekDQgK53eVi
         V7tX8vnewOnWeFJV2QSQuAbpGt/PDgTvEXj6VpSHNZp9vJkXmr1dnZ2vO1hE2A6rj9Jt
         ma/w==
X-Forwarded-Encrypted: i=1; AL+hErHmkoCB4txSEe/38WLeX41CQuYS7etYH+QmCRln/pmI734K9KRQ3Fl9TP3rL/bATfTrKe6r2Iaoug7qWJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vS/hUQf2TgzXoXdKxMf8f1UBRaDGph/ZeZcrPv9Ri12p5PJtD
	70di4fyBWH5cBjcwr4vfmgDwDKGVQL8E6k42QTjdA7FcrzZHxlQIVDcS
X-Gm-Gg: AZFdTZdNTpCerulwQktj4J+wC0DRxU+hU4/fKBgFTzK9EJ2vhcJPz64wtrvbg5E/vSC
	Iq1oi0jOhPLLpPKmpgaKNrwh/p+aEOabn2s7YB5cbtmYiNvWvyhD3VYkvBRttDG00lNGlgbuG2c
	iCCA/PX/VoxcqFVwubTAzVaPiTTSsSHcOSYt3CdmUlVGx2H77v6yYEUkQipaeV/GBTgKLVAMMUj
	sguacOv02QaxW4b02YvRH35IWrDMC82ynr6HqGSvPrW/cNcy5+nKvAw77G5GgIsl0gBN016dvvR
	FrQpe5FJlMyxaK5Oh8cBjdOnmYOOPVraV6hGBRylIGxD/KWPr0Pe1qnyQYtAjN2FB2ywwdt/jwh
	sNwI4K2iNkqpDw8fiDdIyIbTAUM64R+fPbjKRgyewTq2RMGiO7WYbZelODXWg0nT2zUEd2o6msJ
	bO3l0ocebT+GhSir6rcbVRnGhN5xpw94NNSDRGkRdVyx8wAPYyUD4RnuHqF79Pp/K9/GLE+m2aX
	1M8dKIWgpXAXwgNVUK9a2orEms8rWUDh1c0dIJvprs69IlvSlnJwJbhcz+VrCPkbW/J/ZutJNYM
	kDUJB5lsCCsrEzFB2I0WOXq6L51a2vyIfG/Fb6wk2b8wlsfQHjq0
X-Received: by 2002:a17:902:da48:b0:2ef:ddd6:716d with SMTP id d9443c01a7336-2f03f18fcf8mr80685675ad.24.1795330670778;
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:6213:28::4:379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120016sm34287345ad.58.2026.11.21.22.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 22:57:50 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: linux-watchdog@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Sun, 22 Nov 2026 14:55:19 +0800
Message-ID: <20261122065549.3265519-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The watchdog integrated on HiSilicon STB SoCs reuses the register layout
of sp805, but deviates from the standard sp805 in several ways that make
the existing sp805 driver unusable on these SoCs. Add a dedicated
platform driver for this controller.

David Yang (4):
  dt-bindings: watchdog: Add HiSilicon STB watchdog binding
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  54 ++++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 287 ++++++++++++++++++
 6 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0

