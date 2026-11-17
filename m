Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937437;
	b=GlvD+iLotyaAuYlm2TwYu9ZlHS5EttJZRlgxABPA7MafOtP4yZvA9mfdx8RRHDQ6yIvM
	 ex4Eud4k7VS6hyb6UMRt9+KdVANU8zPuKdTrQpuefrYqJm/4zP+7WnOMp4J4oNh5T0nId
	 WFdDp7iCQJx8Oi+EGqh8Vw8Q1h/tpEaPX8REYLZzt1pEZcLz12cQQ0YUq00hFH4uh3M9u
	 1MSTYW9bbmmieBQYr7x+ouMuXPl06sXN49+NSq3ToYq9LTUJ16Ref3d/I8UNGDiu9bi2k
	 1SfN84VlW0svxbb+7EqpU/I5EGKRafMNVnG/um/EKYMYOik4C5MFT+wXOtRoWo65qQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4i2zokTFO59EM5OtymCggaFGZxyWZfmPQA4ZgdZWwkg=;
	b=RaDMwh/8pxT/h4ipePXgkmj3mQ7PNXihwEHpcuklwKRRYfLEwOE6A0QRJshFQhIWlLMQ
	 nZ/VWP7YmO+2L90iDnZPTu5uWlNMhoGsERbDydd2tjT9xqbv3/xP2VNJoXbc1bwc6yACT
	 +B74TSbd8W4RBXjgOW22JVeyOFbgNxgzfKYoDDR9Fu59kR3mQPr2ZqdWhj0/Cr8Mgpq6Y
	 g+Rwlx9arEYkJ8M19PT3k0M3l7adAanRMsifkWXQlQjPTzpqZkEjfVrGuIFatpXwViAsR
	 Ak3aXw78AxYt+SwIvd568z7W5TteA8NeYAmOtBecf3S4qFL3aVMAUpECn9Gu3MnCRmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ9lHt1s;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E50F606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E50F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJ9lHt1s
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4eab91bcaso13019817b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937436; x=1795542236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4i2zokTFO59EM5OtymCggaFGZxyWZfmPQA4ZgdZWwkg=;
        b=ZJ9lHt1sKEsDdlecfU83rmKFBwzcpbjhmf+8rUFRs/z/pL7brGBRVU7NmOSKxPcDyA
         65oN4Pi3uHns0RGGtT8cOd44sGIgte52tuS7L3pY4giYwOfOAdmL9La0eqgmJB1J7Hv2
         5FPoAzOL3zg+1dhMN7edyBOYc2KrJ4OBEDAPe0aaZ4OwPAMXtr4v3PXsmtmZztKANYXs
         wBT2Lrns/zzd9l9GfvFVWeKiIajJGEVTyHARjkAqWLrRX+MRbk4va7Apg3JxAZN00atL
         sPa01FZ3HD0+U+QySDDfYWXCOZV5f13d1HcWrFtq/VkP+FMdoeRJTL+jszxQvNHd0F5x
         0NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937436; x=1795542236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i2zokTFO59EM5OtymCggaFGZxyWZfmPQA4ZgdZWwkg=;
        b=ckFKSx+CFAr525n7FuipHecSDpqIk5ksqilxKLKWWfU8AsqkJFumhvjg8DSDVD1Xop
         8T00YaKGu5p0GbIPtEFDcGVgqheexxVV5s6aqfaNEFRlAt2xMeqbtpRzCFDkQdK1iGaX
         Sb3IkccOZ2QyDei+rypTTnkLMk5Zv6uuz5faiYRx4MblDIXraVNQEgsOjCCE7ZHinStQ
         BbyGMjIdeNV0j2a+tQkr1SbehhzwDw5I/REGUBtVatuz4xoHUpTEwz9JqzChyUQ1VMRg
         phairgQ0Thj2qTcwF0dprVFkQVACM68GGzZjzsm5S2fUzrChth+o+FwoJunMomzfFCbU
         hGig==
X-Forwarded-Encrypted: i=1; AL+hErFy7hGpHbypwdp7f+6Qc1l8F+gTo+26cOm/z0MxWuveW0ZUM99ehi1LR0+mAHxjTJZ/CEWbmDnCMmm5voU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+++S7P3Sxl991V7cbHPUXLDm1QzjT0VlAcRKjpc8ouiaEPZr4n
	EphBQZVar/uxMp1zwl0sc5aWpZ6deiztnosajrjmiic42mVwJo1bYnV5lthUEKNrRHs=
X-Gm-Gg: AZFdTZcwK50zrqXidLm/7gcpxOKhpyl+QYHxlU92iNd2LnxzGxQLtjzI36D/0SLhM2q
	orNKuqKd05LpUTNxbwhHzC2KS4tYIvE/RcDyLyD3btbPD6RQyjotfCABpuYLoWQqhg3b/Gy/wOP
	LV35Io9ShrNlQCqGAtCFcwWuAR1IvHC+nh/3cACQ2ZCb/lCEvGxfOQZnALqqX75RYV2qZ7NBKGo
	1PbfOv9BLaFM4um9swV/CTF50+24N+pC7jXHIWeCFIQhUICcmCi2trre5py0igBfLY8y/tlB7ZD
	n0Feng1wELsBb/NUn1Z53o9/QWHxbUlZJiOIbCEMTyPmiqFCovSu/b6hd/zqpL2XpCaFzb2jApc
	LezY1oioNBLlU8Y92QyBkucc//znXhvJiTWxta3k7o6fMOElTLIlggdsbDI8q3A+3BDjfFAZ3/7
	u0pEdbRAO4l+ht99z83lv9wJoN1oeBrxQv5BrMl1KUHSZ+gJ2vOK35Ro+N+L3ix7kR018I6r0gh
	4ex+zgcV2wIhPCywUn8QrVjJ73J0dzJiYgVWKWs/8mLMQIRyU/EhojTYddV9g0G4uVCk3gx7to6
	gqznwaahzCI+Rbu6b224hwM2s/4bffc89HR/OK2ABNlWXmc5wRd+bEqOjHDnjF8x5SVCiNy3y83
	46tUYk9BO7hctOV9Q7frtg2I+aBWNrNAbiSo4nEDupntUfNOONMc039gPijpHIRuc2M0LWgF0sM
	4SCS69c0CCPzD2vVOq6w==
X-Received: by 2002:a05:690c:d8c:b0:8b2:e86a:8f0f with SMTP id 00721157ae682-8b4aa2e4bc7mr87789057b3.28.1794937436463;
        Tue, 17 Nov 2026 09:43:56 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe115a43sm2013517b3.42.2026.11.17.09.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:43:55 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:52 -0500
Subject: [PATCH v2 1/8] powerpc/perf: mpc7450: Event 0x30d does not use the
 threshold
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
Message-Id: <20261117-ppc32-perf-v2-1-2072e9b90009@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=TtTDFi7v6z+KDY4gBi2LmgBe9ld12hzvxesJ8HRVaAk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIpY/6Km0tREfoa9Ke8ib6HbNoJRR6bnnG929nFSu
 6qbsSu84yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK65+pvhv1P/MZ4fEh
 7C/2etuG1ZmJh/dErzuociMj+N0uJrN9TtqGNkWH08Usn1h8nmgzvqGh6Ed354+09o9f4yva+5B
 cv6M8zecgMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

mpc7450_threshold_use() reports event 0x30d (PMC3 select 13, FPR issue
queue entries) as using MMCR0[THRESHOLD], and the comment above it marks
the event with a question mark.  The manual (MPC7450UM Rev. 5, Table
11-11) says the event counts the valid FPR issue queue entries each
cycle, with no threshold.  PMC3 select 12, the GPR rename buffer event
next to it, is the one that uses the threshold.

The only effect is that r30d cannot be counted together with a threshold
event that uses a different threshold.  Drop it from the list.

Fixes: 7325927e5a20 ("perf_counter: powerpc: Add processor back-end for MPC7450 family")
Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index db451b9aac35..564f6dac3a00 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -65,7 +65,6 @@ static int mpc7450_classify_event(u32 event)
  *	12b	Y	PM_LD_MISS_EXCEED_L1_CYC
  *	220	N	PM_CQ_EXCEED_CYC
  *	30c	N	PM_GPR_RB_EXCEED_CYC
- *	30d	?	PM_FPR_IQ_EXCEED_CYC ?
  *	311	Y	PM_ITLB_SEARCH_EXCEED
  *	410	N	PM_GPR_IQ_EXCEED_CYC
  */
@@ -92,7 +91,7 @@ static int mpc7450_threshold_use(u32 event)
 			return 1;
 		break;
 	case 3:
-		if (sel == 0xc || sel == 0xd)
+		if (sel == 0xc)
 			return 1;
 		if (sel == 0x11)
 			return 2;

-- 
2.56.1

