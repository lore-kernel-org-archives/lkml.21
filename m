Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795667178;
	b=KQUV2DEuvmhT2Pwv8qOSChvdiUDyc8WWQWVmCEq6Izi0JhzHRAlZ6Rpdg+7nqM6lQxTG
	 2TEK2gXP99hsbzIxubFvH/3Q6lux7zQZFLu76axAkHODJdVV0NwAtmsPwyWcxqboU5Lzb
	 ffp+x8QjevJshin8zs/qeemwDJS3AJT+WScuSn0saFWlanjNIR1X8kF/HLofFBJc0vbuk
	 TxH/pKS8tTppxioHx1LO4UYWxHCZANhE9oS2zii6dMpEEXedbZDoOOuDY5fqoyIhpXp2d
	 caZDv9vc7zTjYgdMsfBtyaxtYqI/6Yte327yFlaN+CRFxVrxgM3Mh/zYXaWJo8fwFGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795667178;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bBJoGKJyIYEsiB5zwIDSoKxvFTy4kcr2uROiFtHd/QA=;
	b=v5fuDzjTk4LcJPd08umlVHOcp747carSKC7Z+uO6pz3Nhc5b8dgDdY+yHhDBqiZq91HH
	 Qwxhg+xEkACPsWEUhY05ib7PjNxdAOZuT9Zl3zRs5QvvZFINpl3lepDpsF5JAI/5xSHBW
	 ONw0b9Y0bPqTIvV5pINQilvAy5CS7CWNzu/o/i3Vj6OYl5mzEUFJq5Ucgd5phY7YdHvXe
	 oH8rBuZMCO0uHzFqsRvFZtBSwoMxta2yVvH4lLuISerCr3HpKRp1Uzb/sSDGXRRTZAvwb
	 NpIK0S65Nkmw7OHDkSmfWRs0q6CsWEZsbIlx+GgdIsF5u1QmbJ66qW2/srgc22o8vhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAUdAUAM;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EAA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7EAA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAUdAUAM
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3863db981d4so9263596eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795667177; x=1796271977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBJoGKJyIYEsiB5zwIDSoKxvFTy4kcr2uROiFtHd/QA=;
        b=KAUdAUAMr7pluT7dK3FLZRcNvTPqywtCgZGoCArS1NW2kALpTT+ucQfpwsotMJ7Ki+
         +wDI0Z/6NzIsgQZ1GmPPG6ogZd6ngu1/rpkRJ8ZhkleI1e8QA1PvXDiadP932xoTl2xr
         QTQHx27fRuXGnNwCEEQCly+5ltvJQawfX9W5nKjvmoNazX9tffxSuzcVFMJsDKC2NXbv
         0LiBhHkYzpt30r8fgBdvBOfJm/vBff9iEOPW3acDBhBF38V9xMyGGT4yY5AuLprSHYLo
         IDXNp6454p7d9SrR4m0FpF8mrPhh3WmNM+F+cIfZy17mX++L9XFQgfCqXZOw7EMuZPrp
         De7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795667177; x=1796271977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBJoGKJyIYEsiB5zwIDSoKxvFTy4kcr2uROiFtHd/QA=;
        b=HIZeQE4TYNmPexxFWEVwvELEPCBvSV0bZlLZxxguDRbiDbBni3p9uFT7rHW7R2Y9UC
         mxz0+0ebr59CKhr8UjUy01CMYXCWBeba0l0edSu0mteBu0b6tpFToN7ZSK3I5lsWqkxI
         yNrJveN+2WYc0vtzTztzy8PDHoOat27VMklRn6dkcya/Scxecy8PwTpecOMTwPMkiX5d
         0NCLZmIv6RaNEbgn7/B1JEwTol/AifqQg76yPebSrGFlbXHWiljeVvXWVZ47VenvFDef
         aQmG1Jnv5lF/67B7YmDXVMDsbanN6GW99us/+pApcFX/0+mwCgKmO2kCi6Z5M43arxPs
         l7sg==
X-Forwarded-Encrypted: i=1; AL+hErEZKPNIZmuT5a39TyercoUVzKZKkf/8l4FSrEs1iHcmhAuaR7cjoBwL0dU+Aht3Z4QgoMn55JWta8erSS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+nvrp5xpqwQ30aSde8vDfXvCp6HX0a+V0a/2CoGYsXZ2056Kv
	eUhmLlmnwNMEvzG19mShQgSPZu6aR3dQjT4B4b86gPPRGui5h1T/PFjt
X-Gm-Gg: AZFdTZfnrI0UQACMtxXplnN5J/iGxzLYSdlcCe/CIXykKC+DAxn+lqFUGObK493hC3I
	CbScj2vtZMHeOaRM2ihN2/Mzgq2BMBiOb3vSg7q9LGFKSkSqAyPqhL13Iua7lWWca0PCS3/lE41
	O8ECbJ7sPVCYApsjrT0Q18XHqH9C+SmnreEOj50TuAxq2C7sNj6jSMMrAFtSDTOLx+9SYSzD4aP
	SKsv0BwhzfEt608ALFypvAp6hjinHXZ3KcfdSmVPwsFihQ6sQ4b52JVs/sNChbybJbt4+RqkENG
	RnOu2HwO315Afd4bOGXPjhnJfHANxJ06MFBkbV5npWR55JdzKASdDJwWE1qIK4LzoCSbKOenDn0
	HL3XZ5jjwhnJ1NIu1BeKz9MnbrlxOFX3q3tdcPeEuXtYd05LKoQCVuVQdyXrY44HVOe/Iz/1Gzk
	0s2Tfy5+oHhrrX9ey1k5AjHgByCSv1OdQHygSfp4Ny2Cgx+9M/t4iaXhglWZbWCbXM8oKxolYHz
	U3F0UlwBlA8z3T+emsV6zIiw+QsBKG/hJKcuLhTMVMl1JIVvOie4uux0y2Yqab8A5iZiBlMNmIQ
	oRybAq2SRbdi2PCYpVh/lsB4qEspVDvckA==
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr3033886eec.2.1795667176924;
        Wed, 25 Nov 2026 20:26:16 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54542185eec.7.2026.11.25.20.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:26:16 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v4 0/4] powerpc: kprobes insn page fixes
Date: Thu, 26 Nov 2026 09:55:58 +0530
Message-Id: <cover.1795666663.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Hi All,

Misc few fixes that came out of looking at a W+X warning at boot with
KPROBES=y and MODULES=n.

v3 -> v4:
=========
1. fixed the commit msg and added details for book3s/32 and 8xx in patch-2

v2 -> v3:
=========
1. Collected RB tags, addressed review comments & suggestions from Christophe
2. Removed PAGE_KERNEL_EXEC in the cleanup patch-4

v2: https://lore.kernel.org/linuxppc-dev/cover.1794572365.git.ritesh.list@gmail.com/

Ritesh Harjani (IBM) (4):
  powerpc/execmem: Don't leave kprobes insn pages W+X when CONFIG_MODULES=n
  powerpc/execmem: Allocate kprobes insn pages from the modules area on book3s/32 and 8xx
  powerpc/ptdump: Show the exec flag of kernel mappings on e500
  powerpc/mm: Drop PAGE_KERNEL_EXEC

 arch/powerpc/include/asm/pgtable.h |  3 ---
 arch/powerpc/mm/mem.c              | 15 +++++++++++----
 arch/powerpc/mm/ptdump/shared.c    |  6 +++---
 3 files changed, 14 insertions(+), 10 deletions(-)

--
2.39.5

