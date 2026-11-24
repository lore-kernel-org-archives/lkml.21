Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483712;
	b=I2ccBUs+OwIrGvehuPVmE9wDaSln42JGu4UWYIEX34hluSwDA3omgaWyAgiMVk6i6Cw8
	 0FYq6eNGCn8VRoNepJwL2ETG43rxyrMZn48HjvjCWpPD/51pfc4TatpKTivFdVNz+B8e8
	 vu/2gkuiV9mAv6oo20+1CGsL/RWNY7mN+3CdU73e0YStp+SyTMeDPVF0gcxlC2XvsIfRS
	 9GHzXwLgosm+33lkv1JajV+ZwL8O1CRJP3tfUgsx4VOQDAjDpCWCf6oDKQXxd/zzF5yfe
	 eHHQZ0KQPAO0wDBTAI/5JW0QOgi9nMYMtHE3Bn1pGkQGKYdHLbRKXOPYjhax95ywKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
	b=SARciButTCkszR7Euw+I6VopMM/6k85c5eXc/Ym9jDoeAH4EFlsvJMPqdB+XALslij7H
	 aroW8FooVlPqtUOAz9EwH7LROs1/UoVJTJtZ8PqbtwBe0sl7Z0uM8BY7M8epwE67xpFTu
	 +gvckKfLUUJtDu0wiLGwdazE22yp9U0qT0Apx738vIDohj9+VlMBIrsR9h5j7oEkDDCAP
	 8j+U1sGKPvjDReQrbcZf+omDRDPAMKOJUpm36rowkcnvtH0jZqDvAXrg5LbKZ1+DsYnPa
	 MJ0h4Z9KmZl22ljlrdrVMvazOLRKGgaLy9s5d2RO87jmu4m6vDrSlKYVWkrPzsLLHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSW+NJmz;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DDD606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DDD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dSW+NJmz
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05b210703so1806168b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795483711; x=1796088511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=dSW+NJmzISfK/j5aHCTR6DFklJgcWC+dMJDQYKMwBVBVcNFTqNsk1m0Pge9sSadbP/
         xM+ai5CJVbyqjyg8gowTYXCN9EKeJOKDjJjF9cIcMgqh5rjYSJ5YDGoCL0p4ax2HsyfR
         PQlR4Cc6rfPIDvJeSG+t6IQy2ZqE4B7tDxR7vd3Y2/Min2ckJcQsUjx2nwarvSqGA73g
         m55dOWlDqOZwsvKg5v53Z8p+jzyDv+k9sJHv7E/SPCQwPzZRYan3RG+cHoCulGsPTmVa
         XInkezb1+2a+/LVMpHOCB8D62PyngqclyqSIDOdPgGoEvoPs6+PB+fkwmA/Lizi4fQZU
         T2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483711; x=1796088511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1hUmWFG5GUv5dEmsxSMypms0FRXPv0dsfB0/VoVKS8=;
        b=m2g+Xxd1A2FAQuNlMfEw4otMNr7qXsY/A45i7znmBsSz4DGOvWf96E0HzEPZ/1h7Wp
         ARzmV/KKhomOmOP6lHBD5Ad1yXlLf/sYb/WDvk9Yi0VW9eAoE9jGyZK0IilymBBNYDAL
         APQ0IOXLqNvtEs+hWnVRbut7jnz6dWxHtv4O06UUxBC4Ms0T2b5ZOB0E29xDbZQ5y8v3
         KvEEs96z/ZT92G9I65kjBevDC0Pr7+QSvC/+F66YuAenmbm2Zeo128vf2w0U1J4LP1Bn
         Pw0Sl4hukqQEALBTpAHfofEE6vGuVAyIQ9p839MFWPCMTVciDpFytVG2AXCZduWgU1rv
         euig==
X-Forwarded-Encrypted: i=1; AL+hErEvf2TcjMERvPg5HoREMxN2CPbnG/iu1Y4bHcpr4H36IPQalAQSspBXJMNt0NTipt8Q7fst/T4rXN3w7+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Byi92aLs7ViKdQ2CUkNppZgwMmdM9leqtvSfZwqQoHMOGCoVv
	zLKiUbb4ansiZaB+1Pt4dPcvb6VYesc1xpmpllOR8FCPkmsA3Pf9ZgPj
X-Gm-Gg: AZFdTZeQ1XbPCcVq0OdWxQpgztYgaBzBggJ7X4cnqeOb6gagFpWThq5XMyp5eR+5YSW
	l77a1pU5KUohsfy+4a8jbn1Wl4PTFq0S82zuIpFpgDJ4XL+qfGdHxtxGu7FYxwpYXcxCbHUhbyX
	7109YCBx84rk37d/GxkRRiLPpkQaVLSxY7unwBZXaIkBW2+S1dtOVzl9BR61OrbacI0RfA/vG4q
	YHcFiZ8JIuni6XaU7vLz6DW5e4pA72RGDhsmgiY2PjiaYIikDikeqxjMpi+Z8l+unVFXrgN4Qp/
	1VDC1VMHk7Oel9jgLoexIKAu4aBlk/HA2qXsoZVzNh9LeV56JQFOYRLRGsUZknAfyLCZaFOLjkU
	XnDTb4FPCt1Yarsta60clqGvR6WGJpOYqhR7rQmvHpAtbtR7CQmd/cpZB0gUHldWSXCl9hU1wo2
	ZG8wXOIja3sGftXHOIe6Ciq2m1+EOJwhpm0Z90a/Ua/+c9sV45DajXCCEx5hg3AWhfAI+6jH7UN
	LxjMauBLCEekv+sRo/Daqi7Ty+aSVfjaqBEK3HYdrLJeEBp32WYsa9G/lcF9TkVvwWXnFGFEzWk
	HW952PKAbvKNbu16kniHVDgVdYBXBrraOxS52nWBw21t7YbP2ZBtL+MLE7hgrF8HqytheEL05cY
	x
X-Received: by 2002:a05:6a00:1788:b0:88c:fa50:1a86 with SMTP id d2e1a72fcca58-8c87c09ec5fmr11915415b3a.25.1795483710678;
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e457d1sm6115243b3a.30.2026.11.23.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 17:28:30 -0800 (PST)
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
Subject: [PATCH v2 0/4] watchdog: histb: Add HiSilicon STB watchdog driver
Date: Tue, 24 Nov 2026 09:27:34 +0800
Message-ID: <20261124012755.328774-1-mmyangfl@gmail.com>
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
platform driver to handle these SoC-specific semantics natively without
regressing generic SP805 users.

v2:
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261122065549.3265519-1-mmyangfl@gmail.com

David Yang (4):
  dt-bindings: watchdog: hisilicon,histb-wdt: Add HiSilicon STB watchdog
  watchdog: histb: Add HiSilicon STB watchdog driver
  arm64: dts: hisilicon: hi3798cv200: Add watchdog node
  MAINTAINERS: Add HiSilicon STB drivers entry

 .../watchdog/hisilicon,histb-wdt.yaml         |  56 ++++
 MAINTAINERS                                   |   8 +
 .../arm64/boot/dts/hisilicon/hi3798cv200.dtsi |   8 +
 drivers/watchdog/Kconfig                      |   8 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/histb_wdt.c                  | 305 ++++++++++++++++++
 6 files changed, 386 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/hisilicon,histb-wdt.yaml
 create mode 100644 drivers/watchdog/histb_wdt.c

-- 
2.53.0

