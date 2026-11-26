Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795736627;
	b=W9VxxY6CSjoknFlZEcYdwXWSd+SVHbQRa8JEVDgv1MyxhLc3HGIAuGy8YXgEUB1cj2Vp
	 Gxdwc7Wv8csIblTpilWh2kK677BsDCs5CwPvZ6BUzwnmcta0Hzp3OqA9blUtGeQ2lEUfR
	 6nMAlkyNZPZpTbDtkbGPHNK4AzU4XXWp1U6Iru7IadwcHEuXhZ6DelI3Ti3FgGIcp3vW8
	 cEKtm9eDvZ+2Uz0v8No3YJb5FH8LgWuTiQrHz65ft28NHonNqKgwB03vR0L6wv28jL8dK
	 9DQuTSeFmIT1kAh8vF/xahxxF04GEyi2i5zUciBx2Uv9mAO1qIZ9jD9vKGxfX/LqmSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795736627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3htbF9Yrsa3dnBt/nq5An7sUvlJzo+crmssFJrosLQw=;
	b=Zn0d5eJOFiWq4RBTi8z3ciBWYQ9+79rkgnOj67IaG33G7IBgkjdu4pn/bSO5dhmK2fUn
	 CWslLOexqwQ76+YLC125ufsvLRk+UBZl0wQZn8baj4TIyK5dVetlyFdS3BxL889jfVM70
	 fyKcFME8wQQi8wvtl7TmXFN2gbxQOQuYUQ3UfK+/dyICWuET+mY4tp/pTt4ksnqV4BtpH
	 /X18f9wZQQDZW5BQ1qZV+frTquEsfzxoGSVy78kxBM0rkSNTcKAveEh5XHRZ4S+lq3VF/
	 98MxE90pXsZFd5pxSucFt2ItG5njoZDupvV/aHG6RueUQvaHM5WGYyEC114DrflE3YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="wKpXo/ns";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3263606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3263606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKpXo/ns
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso4596808a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795736626; x=1796341426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3htbF9Yrsa3dnBt/nq5An7sUvlJzo+crmssFJrosLQw=;
        b=wKpXo/nsQjXctCEIf32kJowgsK5LI1X/PTQRoqM3b7KHTuSJ5/9TRYcAvhtlHXK/gr
         H1L5qJAs1TQWB6VVZDf1eLjEe/wDnGR1S/ogaUUXPKnYfoaJznR1zt3MQPcxjiZj9YPQ
         18v/umtDejJYm3oi6iDr6Vu2hGve9wTNzyx+jT+VEBQQ6z30JvdBMSZXmS4SzIWcePax
         nx2wXptUElibm6JS2yQvuIrwOVepguKXCp0qp3zt9Wy86m29vyHT+POl1pq0orgFDY1/
         vsnFNoBy1liuzpB3Wrf+XZpx56lLJj/zCiYCWefktcR8js0c6CxVZ6roQzoIOASouiSK
         j2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795736626; x=1796341426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3htbF9Yrsa3dnBt/nq5An7sUvlJzo+crmssFJrosLQw=;
        b=DG/A5tlEvteUTNkLDb3IsBj0khVyBc6679Tv6G9zACmGoBTLsQW3c8W5DTqExDwW3v
         PpT2XWxrnHo7pWwIY2xvI0dqAg/X2tp6mhVF8vRFz7e4kHUcWrNCYdqxY+50F3UWX4QS
         wT+Ej3cTjqLUes4RP6Ks+WIWYCRM8G9aWImDpmN/HWl5nmQ//m3RXw4b+gpf80LEBo62
         AQ1rkfGNYSjzaGoglXslzq7c8nRY1Ovlaq0+y33tEHCRUFhNXGQsovOJKJUL2HyV/+J4
         0294deds2Plr/m/aG42faH71Q6pEpoziExKVfoVSj1jDehMktd5QJ6b4VxX7sQGwmPpr
         TJWw==
X-Forwarded-Encrypted: i=1; AL+hErHPe1LH4+R2fn+F3W2wu3p0gRYt1vJUTXBZf/YO1LctA4v5nMsy3Fub0PSPNLdHl6PGNf13WCaeJB9E6ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4AYiuBlGmBOuHrKlKIth12DAutMPLvCulOvKuSyB2UueYspYE
	U6u7nUxHJlaUuGYX4Ot6Qb5RDf5IwEX30UXmLE/hNuGVssAQ00P4O5N7
X-Gm-Gg: AZFdTZcpZH+EJSXWa59e97MVe9ZeUAHiBT5IGR8nD+SdBMnYSF803Zm/kP+vEawVNcc
	HTExytvtLyw7ORBHXLNrkJGbekh+BNJsV92JsgQ52pwcu1XQuXCUbm4q2nhUwjJhekCxJh69FS3
	LO5jOAg2Zo6giDb/uoOGyxaLfqymPXIKMkLGCx7A/LyxapYSqWZg3wzBbqNTw7evS24JnzA9iEm
	xvOSEi1Rl6zJAVOdVPPQFGpM6YfUXCz0JARyXQ6odyEVB72LTcM4N5gz+FSwWr9NdvqMhEVfkuS
	v/ruIDvHDGyMmgQNFdpMOqR9raVPfPartVSifrHxbVUUuWCeOSXJUApIXkzoxRInhn8vMO4oD79
	0XVVpukGlauW/8ZWaoT2miXPSEUk0dyvwPpjh6q6IqIBJwnRnnsqHi29B2MeeshaeJBxmMzSXl7
	s5LjX/kq6T0jrfeeQvJ1tGcT1817nICCVgDVDu8V0P1cVjCD1Y7neOuj1IcfGy9iJgCEb0Dv3kV
	FwDa7KfQqu/+7rO52tXAktDVI09Wubb8nxlySz7c87g5MxVv++yXkxMXItvPjMUp67T/S4dKKRg
	LEVWI0BuPYWvadvIfXS+Uucf4PKS7XrZKcSaUexyZ9lZVhzZUoY=
X-Received: by 2002:a17:903:298d:b0:2f0:3dc0:9bbb with SMTP id d9443c01a7336-2f03f2115e7mr162175365ad.34.1795736626027;
        Thu, 26 Nov 2026 15:43:46 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm52493035ad.49.2026.11.26.15.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:43:45 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] sh: Kconfig: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:43:43 -0600
Message-ID: <20261126234343.74235-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Remove trailing whitespace from Kconfig entries and help text
in the SuperH configuration files.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Kconfig        | 6 +++---
 arch/sh/Kconfig.cpu    | 2 +-
 arch/sh/boards/Kconfig | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 5512f446eed1..aa579aa041b5 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -234,7 +234,7 @@ config CPU_SUBTYPE_SH7201
 	select CPU_SH2A
 	select CPU_HAS_FPU
 	select SYS_SUPPORTS_SH_MTU2
- 
+
 config CPU_SUBTYPE_SH7203
 	bool "Support SH7203 processor"
 	select CPU_SH2A
@@ -485,7 +485,7 @@ config CPU_SUBTYPE_SH7366
 endchoice
 
 source "arch/sh/mm/Kconfig"
- 
+
 source "arch/sh/Kconfig.cpu"
 
 source "arch/sh/boards/Kconfig"
@@ -608,7 +608,7 @@ config GUSA
 	  This is the default implementation for both UP and non-ll/sc
 	  CPUs, and is used by the libc, amongst others.
 
-	  For additional information, design information can be found 
+	  For additional information, design information can be found
 	  in <http://lc.linux.or.jp/lc2002/papers/niibe0919p.pdf>.
 
 	  This should only be disabled for special cases where alternate
diff --git a/arch/sh/Kconfig.cpu b/arch/sh/Kconfig.cpu
index 336c54369636..4f03b29c7b16 100644
--- a/arch/sh/Kconfig.cpu
+++ b/arch/sh/Kconfig.cpu
@@ -2,7 +2,7 @@
 menu "Processor features"
 
 choice
-	prompt "Endianness selection" 
+	prompt "Endianness selection"
 	default CPU_LITTLE_ENDIAN
 	help
 	  Some SuperH machines can be configured for either little or big
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index d89b74177233..99fc5183e2fa 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -36,7 +36,7 @@ config SH_SOLUTION_ENGINE
 	select CPU_HAS_IPR_IRQ
 	depends on CPU_SUBTYPE_SH7705 || CPU_SUBTYPE_SH7709 || CPU_SUBTYPE_SH7710 || \
 	  CPU_SUBTYPE_SH7712 || CPU_SUBTYPE_SH7750 || CPU_SUBTYPE_SH7750S || \
-	  CPU_SUBTYPE_SH7750R 
+	  CPU_SUBTYPE_SH7750R
 	help
 	  Select SolutionEngine if configuring for a Hitachi SH7705, SH7709,
 	  SH7710, SH7712, SH7750, SH7750S or SH7750R evaluation board.
@@ -56,7 +56,7 @@ config SH_7619_SOLUTION_ENGINE
 	help
 	  Select 7619 SolutionEngine if configuring for a Hitachi SH7619
 	  evaluation board.
-	
+
 config SH_7721_SOLUTION_ENGINE
 	bool "SolutionEngine7721"
 	select SOLUTION_ENGINE
@@ -95,7 +95,7 @@ config SH_7751_SOLUTION_ENGINE
 	help
 	  Select 7751 SolutionEngine if configuring for a Hitachi SH7751
 	  evaluation board.
-	  
+
 config SH_7780_SOLUTION_ENGINE
 	bool "SolutionEngine7780"
 	select SOLUTION_ENGINE
-- 
2.56.1

