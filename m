Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735866;
	b=BCpE8duz90eXXDEDPAZYLO5J8X3jRQqqjor32orjzwD+UIoP9JES9yEaGSDoEDOMVe2B
	 P8wv4GN5S5X5kIWygeDM8N+dIedMPcN6qQ9NnpXXQ4Dz7gWb5EQhtYsQ0lVx2mmYpf640
	 iwj2DzBVQspgx+s5IsW8Bku96UuuxDqvuVRm+SeTMcbvC+Nt0FgjlFUr4Hnw+UBTaU6Ff
	 03+HYXCursf7WD9Z/JERkU+4Y2UtaCZf8QS3avfGhKbfnlrxcCIMLFzABXWF/dwRcmWHh
	 TJAzb4ZiXQ3ijjsegXq/x+KnFJAvfCURS2oAr2VKzLHeykr5pSKlZdF9cjBs/gIz8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=;
	b=ZTuszMpnb/6tIzgr8CkKoycrwYrLqviYUp4O//p0JLra1h83/L+zRhXzEIcOv4Z361wt
	 kXOPhJxPNa5dl6uu7oM9LsTrjUepuMkZR9dkgV24vhlNY4pc1qR5OEPh3Tqm+THr65Gfc
	 is5FEdvEUvaHWD8WBbCSmIOGAfIrY08R8P/vVi5nMzl4NvzUQty0ME42k/1mRrE09FQNW
	 JjzEd7wQZTrhs4acpr1BQGnIWzrkccqj+smIU7OMep4g85h+yXV7BlvvnPDFIxuoi98Vs
	 Eb8W2UY5lO1/jTPCsrbeceyNGsdPqVHJBDAkp4dcYo5fxFN3NHNT1ZPxDX/u/FXaTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y/PhBTg3";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 728F8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/PhBTg3
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2893531bso3928223a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795735865; x=1796340665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=;
        b=Y/PhBTg3bZX9p4YoPJGhb1QADb2+T52ftHeDoDTvj6O5LvgVsM187wf/3jsRxLBCvF
         vgFLrwlVtkZ488ePHhXg/ItNVjcEw10IW9wUWu+OyKi1uOFBKcczAbrj6h9HLFUB94PV
         idfy8e1fpTHx9WdPFp/AFgnvLuhCk+z7lTXTGf+v/OvvUIyB+0AlwXOIWfMfP2X6b60y
         njlQpg4CnJBXGCAoLSSK/Gef6h18s1TMnKzE1suPqdImVj22/CrfSUI0S3q1kTcN/y0x
         4H6mBXcBgdEszbn/H5CSu/lafAE5Y7hFyWIEDUodda4dWwTcgRMW1SRvUiwuPsNXIlQ/
         zQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795735865; x=1796340665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pC+WbWVslA3nmV8xzaJ+ixKFWi0v2A29SVH3GG/vGzQ=;
        b=ex3SA+Fvu71cClFDDJh+Zd/YH4rHcY4euean6i0ot+IfaNUtgge9B3pQM8W/TppFa8
         /y153j5ko2vOVFjK8Bi9zByCapts0whtnh3aP4bP5iwtxNtmfGwBN9NHIkfT72snyGLQ
         CkUPJDXkP1yVCp8uKvX7bsb3RCaNEwvwbUOChyHf8GO2ngZ0Ily/RL7eE3ulZeC5bY9h
         7jFXU50Qk48IVvvPGsvW5W8eaAXhBBr42Eo6ropPahPS5PwysZEowtpGSYDc0sXx5u2j
         qoz/Tsb66IWVUFkkJ82GhfR1umpJ8GnbxWukb+yWteMegkCh6kbtkNBTMy03BgCHzd4t
         iGbg==
X-Forwarded-Encrypted: i=1; AL+hErFawmNbh3QRjyH8+RZpoW01CuYRuMLzRoEnqTsoTQtYnJ7ubBN75Xxb8MakGrSTHgeD+WPT8MDl+hUNy10=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RXwSPNHpy+6ZFA8RX6F9+KRcuoAe1RvdLBA5O/3eaQ5KMkDMU
	gllsk8F2lG9vpcb+UpdVOLRObXsdBPL9OG6FpERb4XP0hLNsjFU4WGxP
X-Gm-Gg: AZFdTZfbCnxchSEi5GBq9CmvcGwhrnTMW9vM1kGJF4F729TEIV5kfx55lv/8vRDD9qs
	EYAe+UuZeVvJspG7AndxzYqBdbrCmLnF7bdnfweThvzFauK0UpzqR6ec8VMREadD2rlW/g7d1CB
	0ISN0/Z5ViFf5cDTG6DCgs05OhYl2Ht7pRHbASaBJwdtI3LUuI4qikpTPJux16rQpgToLJd9qA2
	ZGc1sj/j8TaVMmg8C4eISEzjrSHljrEcowmekgeq46DjUwi8FjkMgnUEGkjCsy4e+jralxxBaDS
	nsXjU3Arb6F1bxgMM32mDRWyNTPFCXWPV3npQo1oJa1Sta2tE20kgugzVt4Y6PJ6O00c0pRiC5B
	2ZaNGyKYa2fd4iXw04SCeEYk3SDyO3RfBgJg3sOb6Y0z1OfDLBqGM/p+1kY7K6Bae8Ig1FIZUvS
	1gE0JixE83+/5KejF8iiDYPAOf2Dty4Vn+3TsMMHTgM1pBkGtcM/oJDwzKYz6FdimjF11GxYru7
	+DrJQf8GKLEMlCyn2YDRmSBgThxGoydMaJ3Fe8jYToh5j6E1BcDCbXJyV7URpx0xV0AAG2Vdwk7
	yAdO2t5I/5pKM7XRri1KLSLdj+IG5wD5uUaDULi/49OkSlWdNw==
X-Received: by 2002:a17:90a:e705:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3b41c7e118emr21902322a91.5.1795735865583;
        Thu, 26 Nov 2026 15:31:05 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm15404974a91.1.2026.11.26.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:31:05 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] arm64: stacktrace: remove trailing whitespace
Date: Thu, 26 Nov 2026 17:31:02 -0600
Message-ID: <20261126233102.71335-1-artem122novak@gmail.com>
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

Remove the trailing whitespace from the comment in
asm/stacktrace/frame.h.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/arm64/include/asm/stacktrace/frame.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/stacktrace/frame.h b/arch/arm64/include/asm/stacktrace/frame.h
index 796797b8db7e..615c27d9a738 100644
--- a/arch/arm64/include/asm/stacktrace/frame.h
+++ b/arch/arm64/include/asm/stacktrace/frame.h
@@ -26,7 +26,7 @@
 #define FRAME_META_TYPE_PT_REGS		2
 
 #ifndef __ASSEMBLER__
-/* 
+/*
  * A standard AAPCS64 frame record.
  */
 struct frame_record {
-- 
2.56.1

