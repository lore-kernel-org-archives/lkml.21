Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937439;
	b=Hooci9FpuaYOacWFvbkjlydf0MoZwTmFURqOBDYizFebZVcYs7rCzsAczKdJKmulE2AS
	 aeIcQYA+Of23oWWnhqCIhuf8ug7MtCqkXBamSHhYDIBY6m+d3eRIIwNS8vGfND82J4oti
	 a9tT1G6FKRiiMrE5B90sBeMJzDFkH/ENQr8BWAs5U2rpwGtQ2yNJ/51l7Ux/5uCh5evJZ
	 +iEhsDmu8R9/6meg8D31zxzvyloEd+nOFmT2iH/TePzoC0N/AABB/fqMNryHoRgbAwEom
	 1NMQCvHi/9YqMkg0+5FlcIrpI5XnU0O+tCrn/VLzktC8vwKi99SYqkzjYe76SQ6dVYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/eNHuGNPRSSMiJpVC8xJULC+1p4MqcbiqGuhs79KBVQ=;
	b=IVyRvxmniPjvWFYwVAFLNdgoIVstfSodL2MQIiE1a1r91MHmX/yZMzERDx5okQXwdd8W
	 TA0n8MRa5pzykAPzX+7RmLtXabZiXXL9ETYdeV0voAg4Tbff6pmiTg6UTdQmUVj+xLiqa
	 BR/A5H9rmjvDKVnKFoPIKSNa1Uim4JPv1D6vpj+4SUepfXE5IPSVQx+KpJFas3Ff9OBFQ
	 qjakoSuzEWfjhC7xHjaMLBlLesXax56LzH9PjcA3T1vZ8/MHGNcG6CieTJCgmHDr3sd69
	 0TVmJBQOL6S4skA6V6ddrSWAuKIrZbKhlqBvFMUSP/nmY6zWbFx5v3p/ksKp1Gxu8hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQqBf5CN;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D5606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27D5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQqBf5CN
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0dba37a7fso48389007b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937438; x=1795542238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eNHuGNPRSSMiJpVC8xJULC+1p4MqcbiqGuhs79KBVQ=;
        b=HQqBf5CNZ7PvNGV7u3ey5MX4tb/NMHzTaIpLUe2B8nsEOhZY/qQjtJhjnZJs4jDP9w
         wYw+sO0hFuqqrvh1j5xbb6ul6WLKWKie1YtJM5zDoBUgNm2BQkTH2ewv4fvNcYS5sI8Q
         xfJbgIf699/H8C2EEzCGPLMOGMjjGNMljwkidh+L7Uvf6aem5ZzcW3Y7Yw063e9Kevs/
         oLYYd4JAfAKAM+j0CCgHwY7hC38NVA2Y1FbdEp9paCArwkq6XM9ajA0u4pIbBJ8NGmnh
         p4xt4/ZcDvqWaAyF7Br6PMirbUb9kRyhvVBN9Xb+n/XN3qEObJNS1dGs81/844j5eF3y
         8EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937438; x=1795542238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/eNHuGNPRSSMiJpVC8xJULC+1p4MqcbiqGuhs79KBVQ=;
        b=ZAZu3cE6TF9LdwoG4fvsAwZA/AhmnzqIrrGNJuraviP2TZF38G+EMTSF7zAZa5Hru1
         vwghNDrIfsRmi9g/0SNQaYhID2RZfoIFG/BVu0BnYJz0vvKCAUei+ZF0VKYmhosO3TVh
         piXSdOIWklnnhA0x3sIVwcgHPB87cXWkcOuxVf+BILggdn0+3bywqRYLL1hfYn6pq9xH
         dv8qzuVmpJsVKaGs6uDnxKJKNLkXIqwNsYJCsoPA9eG4zxiObhsDOvUptRgg4lfvOx7t
         1hi09Mrrg8z92OTue8kgtD6aBdOVBEAzaxcaTmGm8A6+5hFCUW5XaGe3FykHio5M81hl
         mfwQ==
X-Forwarded-Encrypted: i=1; AL+hErGJnchbAMtsw5A5RWmzE70kaVEKBfXm+Sro6r8IYIqw+edlgBAoFNU0L06NzAB1G2OIobzkWGqGFiaG1ss=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SHeCPfDacYpsc/B8MbcfwMImm0wD+xH83+2hJnJWNkb0l2Ewu
	KNEDnoGh77QAKQ1K02eUkDG4U0ovbsCTx+79lPB5W6lHrGd9PFVwD97rPPoQTcvN9Sc=
X-Gm-Gg: AZFdTZfEoQY45IoQzTUafCfjLdjIA55kvFF7rkUFCD5ltTpGnNe2rXFCE6JpMJgOhld
	Wv/HEVEkwFnQ7JcOkHx6bSwWCdWLhKhXWmNDRoYND37gyD9YkQ2y/6Gczf+FIFzWSWZBYBiWqrs
	Z16STmZ5dUzmetHWrIrXv2kbmnO5WdC0en88RNRx7UBwx/aLDKqKpQnrSsb/Tu5P2jDLIPVla3j
	Rqnq7j9lZmQlTPMCrSa8CutI7spqBI+XjlWIKruAb8676O4FT/8JGO+1gwcipMBU6X9XE528okV
	CmQgtydKke1DNNNEBIsnRtf/e5+Jzbt5WowZYI4DV/AU4UaP5C9p7Xh6cBFedyVvivuhJKjZa/s
	jvMFx1kF4dLnsy4rSZD9lqaGMKH675rnDrhTxbSIShJCwbzsxJz3XAfJPiT1qnYoo93CoqUsbUk
	Tx6yznT8v9Pi/UiNUzZmRPxVmVmxJjiAeZXs/+iMnXXuxlksF+V9LU/plLqnMTE9qLn5ThGth4y
	pAeMI6gve4/YiPu6xme2saCu0thOQxDb+chRuFyViWI6NSl1Xp/9IsL8ahpLpeFDWr4qxbaZnfR
	0u682mtmrPtzuT0xOumYKogQ1paA8qnwV95Y4k0+ueNDKazul/oR3QI7TBzmcwm0CpaYhNEYHJ+
	y5/y1AtKkc6xeUD1EKxiaNG3EzJRQliQkGPDLSSNtyNpEt8ejlYWApBmGVbrNpHFS8beziBLrH1
	qfrnyG4el80vhpM7z2ug==
X-Received: by 2002:a05:690c:295:b0:8b0:a252:77c6 with SMTP id 00721157ae682-8b4fecfa355mr1877b3.19.1794937437826;
        Tue, 17 Nov 2026 09:43:57 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe057c1esm2157217b3.20.2026.11.17.09.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:43:57 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:53 -0500
Subject: [PATCH v2 2/8] powerpc/perf: mpc7450: Event 0x634 counts L2
 prefetches, not L1I
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
Message-Id: <20261117-ppc32-perf-v2-2-2072e9b90009@gmail.com>
References: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
In-Reply-To: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>, Tanushree Shah <tshah@linux.ibm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=l6MRbbKx2CqbfCj9gw3r5hMtF8fjZGAlB1GPrKQZrPo=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIrwfPO8fI97e7CIyVz9Vh3BNQeMNx3tXc+VHZyWe
 OlT0Wn7jo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkm/DLD/zSOC5+WCn
 u+OH/GSMktU87d4vdHByXfd6lHJI8WpjZLBjH8D50r8Jh9StvFAjOLIpaZNvxdcYGrlfhDfE7kK
 W1aNW0WFwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The cache event table maps L1-icache-prefetches to 0x634, PMC6 select
52.  The manual (MPC7450UM Rev. 5, Table 11-14) calls that event
"Prefetch engine request" and says it "counts new prefetches allocated
in the prefetch unit".  It is the first of six events about the L2
prefetch engine (selects 52-57), and the MPC7450 has no instruction
cache prefetch event.

On a 7448, a pointer chase over 64-byte nodes counts r634 at 0.00 per
load when the working set fits in the 1 MB L2, and at 1.00 per load,
one per L2 demand miss, at 4 MB.

The engine starts a prefetch only when an access misses in every cache,
fetches from the bus, and also fills the L3 if there is one (section
3.6.3.2), so it is a last-level prefetch with or without an L3.  Report
it as LL-prefetches, and L1-icache-prefetches as not supported.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 564f6dac3a00..5a882d934645 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -370,12 +370,12 @@ static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1I)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x129,		0x115	},
 		[C(OP_WRITE)] = {	-1,		-1	},
-		[C(OP_PREFETCH)] = {	0x634,		0	},
+		[C(OP_PREFETCH)] = {	0,		0	},
 	},
 	[C(LL)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0,		0	},
 		[C(OP_WRITE)] = {	0,		0	},
-		[C(OP_PREFETCH)] = {	0,		0	},
+		[C(OP_PREFETCH)] = {	0x634,		0	},
 	},
 	[C(DTLB)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0,		0x312	},

-- 
2.56.1

