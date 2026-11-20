Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177010;
	b=O+72flvWaSHsa8PSIdOkDq294+K+Gtd3Oaj7KF2lXXRnKNr9PS1aYHquPB2ITpJUnV7d
	 D44w9QgTu7TPdaBrBLrKDussR+tO4qFNk5ixa3bY+Z0mMxNgsDHkeJuWo2Klgf6fp03Au
	 5YzB69U/prhrXQ5edI3r9wD+JlTl/rMlCSSpW+R/17OnOaxPa7E1BexKEk6Ycm0NhHBZp
	 5Wr5z8ZKu3Y19l+3FTHXP6XB00BWieJqfrmOKawnen1RlfjenPxIFSEOYHE2/X8aEWpff
	 IXzQPLHNcQ6LT4t5j9oqd76WvUlJWtRtaWNKkuY9EIPPTGJfgQQpg1VxnZclUa8TQGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177010;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PSxLr1HHsETskvI6VvCsOfwe2CKjdeVgSnc6fyenuSA=;
	b=rimJz9t7sWWAibg5K+TvFu3yYg9xsLVFpG8N/GfbWBA4qqBXir7wx6R6rvE7g3t/fhkg
	 KP2Wfh2u0wTTcLaP/B5ZBVPu4WxLcM4kCljw46EijiRt/UgclWyWrBwDQCOOw3o7gd503
	 BhrSLvX6H0/O4EpBDPcRlK+TXa0X7VWf9CTGV//lCdpn07fX4OoeQJxI7kWDRjhXAEUHW
	 LkidJawm8iTAvg5oaM7rr8Xh5TDZkJy9w8kTWhhycWFDWRmnK61pUCVZr96PgUHS9yCtz
	 m6Sv9jjnC63aexaPYvxcK8m9AR1+ks7c0YKRhOZBLDsjSA/WCvtbGSzC2y585kiiANQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ew7t0BiM;
	arc=none smtp.remote-ip=95.215.58.54
Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65E4606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65E4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ew7t0BiM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8XiXryHIULlaN/y2rMXAN7tXMcBUgoQa55KwIlOF3YQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795177008; v=1; x=1795781808;
 b=Ew7t0BiMr3e7CVmdSlurASVTZhKw1/jT/GA3R/abcw65m0Z+SuR+peAbPzIMnEzsqXjh7HZV
 Ozo/C2SWRz+SAS+NAZ8L+dZ27G5so1ghoVYUa1jPuYKd8sPaOQyFR9iLUfoFTchFMEdImD+sXiR
 eGbs+VozdluDtnHCmM4UrXPs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3526d582d4043ac;
	Fri, 20 Nov 2026 12:16:48 +0000
X-Mizu-Trace-ID: b3526d582d4043ac
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] arm64: pi: Add an ISB after mapping the FDT in the initial ID map
Date: Fri, 20 Nov 2026 12:16:36 +0000
Message-ID: <20261120121638.194154-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120121638.194154-1-fuad.tabba@linux.dev>
References: <20261120121638.194154-1-fuad.tabba@linux.dev>
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

map_fdt() maps the FDT into the live initial ID map with only a DSB
before the caller reads it, so the read can fault on a translation made
speculatively before the mapping was written. This early in boot,
VBAR_EL1 doesn't yet point at the kernel's vectors, and the kernel fails
to boot.

Add an ISB after the DSB.

Fixes: 84b04d3e6bdbc ("arm64: kernel: Create initial ID map from C code")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kernel/pi/map_kernel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index fb44cbdd2f292..f9338257adb7d 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -211,6 +211,7 @@ static void *__init map_fdt(phys_addr_t fdt)
 		  fdt, PAGE_KERNEL, IDMAP_ROOT_LEVEL,
 		  (pte_t *)init_idmap_pg_dir, false, 0);
 	dsb(ishst);
+	isb();
 
 	return (void *)fdt;
 }
-- 
2.47.3

