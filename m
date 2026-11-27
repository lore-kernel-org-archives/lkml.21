Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770565;
	b=C3SzSCcuntdtaVoP38P1t0QfeBpx947JT7fpOArOIPh8je5z8EqAzJLJN0TC8ypP9r3Y
	 36qGDJzD/MHx389+Yh3hKIDrSqLI8/4s4dCWKZAxbq9aX3owvpdYHjv8dzXr8v2jsxiSm
	 7PbTUrn576/7o7IoLKil8GGZj9qZ1X07Xypm5F2lFZdYyW147HIoPz88wCDqUHyzKl0HJ
	 vZ/8OGl+dVwH1YNHkqKgHZfaASKOfanX0uSNC6zWxHuiwbDOuo8qEgD00z/sGnftdG1Yi
	 hF/thneJ86No/U6Y/Gz0bzyVFWh064nRV8XBPSsbelbq+PRdelgeL9d77RRE9Dnf3jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=mxwe2ghXBlgxoQF00SnJHhK4hk9MokgaGbsd1IMwinLg0aUSxMm9lH0BNkF04A/W0GD1
	 ZkjhRozIfcIR8PiqxLMLNP9qNAE5Zo1tWmRxSc1msvxNGHp0KweDPzlsir4qmoneiplXH
	 H90ZxHBAUxxLJdT/V/J6IQ2jJx9BWN7qjg9G/08UYzefFUWAJ6E6vNFp6547fMHvm7n15
	 uTLKnNFg7X2wUjYfcsMDYFDJ5ZBFnQ0pBGUEKHrkSHRT+sNdB1hPeT89i+igd/aC1GqOl
	 JTssHrU09mN0ovBo8ZvFYp1R9FVHO7isFOFmIoNbuo5+U8DJ+7kCNlbTBvxm0n6SPVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsE6b10;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E08606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wgsE6b10
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2effa00323fso31000715ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770565; x=1796375365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=wgsE6b10W/5lEmbl3ug+kzBc6JE3d4Lt9SVY1osWfzLDys/F6aq2sEE0Ei1zsbm2uC
         o1pqOyBuaYIvcYu7aZETSAaXGm1X6XNUIkzCwzC2WGshp181qMG4RqTxv65eq2pBcL+P
         SRBUDtCYhXAyEiPB4dhZC6aJ5Qr0XeoKXGqUd8vIB00h/6AtSZgtWRl7g4+cB+Jccuqt
         +woEjmqw2gEk/fhYmKtqTdEQKXK92n+gSAd6SNILiTHSnl2q1E53ZT6knU8aBcpScFSr
         MWLlQ7giIGUBHkRs6iySHAGGqvcqgzvbj8LsoWWhpPZss7Dh+mJD9tiQJpLqX1TPMHWO
         vCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770565; x=1796375365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=n3X+7APVDen+OvhL6Ihg5Q6UaBlUPRrylsq8Abwa+4bqzsBMBvngpMQ7BnWXm2QugA
         ls6NX7l0c1OWhrx2G44nD2bMRAIMF03yFTxxvSzKYmHvXESHu3nBwpTJ5+sxYtZUOZkK
         pH1DjwwellIgmbf4EMZKJkM1XDEOJ292qUHuEbSy4e3ez7P+Pe89yrfICC7uEvFqioq8
         AT2Nbrrd7temvIt4oiuazhUNh9g8yuECkxNaacORtnTsyidQluYguNKDOTCskc8k7RUc
         S7sYyI8/4e/tixvaWISg2oylTMk6Cl5JALsIkvToWxFf9Lkgwoq65Hmbf2aC0XQt3w4V
         /1Vw==
X-Forwarded-Encrypted: i=1; AL+hErFTUcZF3BzW6zwYygJ5BiLhpfg1KLElOHYr1ovoO0SpIORE5XiNjV4fqS3/0JCck1pI8ivdRZNEl6IB9kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EJdkolEhU9HBptNffbWMLWL+chDoWofYepkiA7wIiREWrWusA
	2mwvD49qa6SvQh26vQsqfwj/XsR9IpgNdLztQXuEvrebxF/ov9VkP9mb
X-Gm-Gg: AZFdTZeVF1uXp7C7mbeDcCIFi4v3fm4wDuM7qAJl+TogHqbtZrxpzbl3RdTSBFSVlQ0
	z3w9y2t7mM49gNtc4na45ySeH9sl+pRtoZI6m144eHyLCXc+uSmwijoZGvDJ41VRIZ8sRRlPU4u
	SsjRmvuyz3bOHeItPjYraSpIMgpSPDJyLnFJIkuIk0z+oUCT+ShOPUpuc06ifXIJhihl5qkyWv/
	tg3u5i1/KFsZkWQVcqa0SpRHLzmjLGW/ddh5cnj9i4CGlmvJDmB6t6mbXAg+fapHE90VmLrd5Sx
	aqLezIDoJw6N6Ex4DORH8na8XPeSsXMLe6/0D0osJikoFthg2UDjib0t49SbtuJ9Q6pVlzMmTM9
	UAs5ETBHJ/x92L8bAuZaGLOM1DH6dglH8+cIozhZwRDv+nDmWUi4YL2P/bG4qmaaILO2LrraUqV
	/DYAZ9PQkLV9sN0Qg9vtvarhegPxICqxtgQLEQUqC1/bvu+jAF6NYW4qfvaU/SzdTimdr89KwnR
	KC5t/26CwHwldlKvG1HSc+gbcoWUHJy718WQ0sEPp+EgsACfZjsO7Yyc73GC3hz9xg4EAv2nC2J
	5VdihF73oC9+6B/Duxnv2fYc1awVwdH6yE+c8l33GQ==
X-Received: by 2002:a05:6a21:3a41:b0:3e2:30c1:fdf6 with SMTP id adf61e73a8af0-4014e5562aamr21306213637.89.1795770564971;
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d06ee37sm11718725a12.28.2026.11.27.01.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:09:24 -0800 (PST)
From: Wandun Chen <chenwandun1@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	ruanjinjie@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v10 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Fri, 27 Nov 2026 17:07:23 +0800
Message-ID: <20261127090723.741253-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127090723.741253-1-chenwandun1@gmail.com>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0

