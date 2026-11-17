Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937445;
	b=NH0/Jhbr/oafUNTIHtolrKNo3rgyqO8jFh/bupEYZ2mmX7quMkUd52xaQnMBv/RFobti
	 Qd5kYqh4YcW1Md9+v4IxObQLGaB1tW5JO4GoQGy8l7SCyOgqA0Kda2gg4EWsD1Llt30jx
	 9G6+i23cg6FMh8E4rL0c8KSMSWBum/BFY8WSLF7fxMl5l1QcdFgxZnbaK/s3BAUfJxWYc
	 TuQEBSaycrE6E32GBUoek3PmpFU4csqEJthxTdRi2wcmpWpraddHzr5yODP+YtOID6Kfp
	 6ykWCWOTcEOZJNs9B5nVTPX0TwF/OaD4whtRQ7OmVCyv1E7mSv7L/6LOD3hvcG2JstQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cAmMaaOh4mmljO0k7/aal9UucWgDGFN6FfL/f489KJ0=;
	b=Vr2qg84PtG4LA3oULrSKZKAaOBRKg9tE2YjkkIhzVAfgpArWtaz3uzF5kONR/qwHGRxm
	 9wjTj946CIeXeOb5FG9YWOzfzMPCg+JQ4SIl0DEODhXZry4hfBHX1UqDbHS0K1RCV6hu7
	 wNX6dYavzTG6oCxIlY3YkSay2WXSQ/SO8N+inJ5uf6k4O5+hR9We3AJq7dLgo/Cb+F+aV
	 CrTz0anrukVzhOEiBJh+pn+JlpuubdCSof9MwUPtq4781lnTUPp749bmzBlICIBlQng4L
	 khJKrgkKoGWsNolnp3XaDeDGBBqGXm3j+OIk2cB2ArZDjO4fZkmCg5bijQSO66Fpr5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+o0Ypx;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0181A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0181A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RU+o0Ypx
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d6981c67so19031067b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937444; x=1795542244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAmMaaOh4mmljO0k7/aal9UucWgDGFN6FfL/f489KJ0=;
        b=RU+o0YpxEv8214Ss8JHHxDKbZE/Mag7cqcMzHvGkaqd/6zKJJN9Rc8H5VJgk72pE/1
         vWGMoXVD1Io+fuWp8IvE4ZUTDEYtgiwfAQecvLAn3pbYvWFgKEgzVIFnG9f7v/J5gydU
         fm1PlIZnexmDSN/ba3hs3MgZONWv9zGJtWSFGbzVu9LEQLSHKkVy18B4s3PVXXgMmfrw
         ngfJQFGcvnFGQbMW9A0iMLMm5ZZ8SD8mgX62KxOVEr1BRLamHitXlIrK51VBS6yKLTON
         2QUVaTkNtVQkljpBUXIr2mSJkBIIkpcmlmxWA4SqCykd0D5QuaAXQyQ8sLwSSCllXWXJ
         SQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937444; x=1795542244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAmMaaOh4mmljO0k7/aal9UucWgDGFN6FfL/f489KJ0=;
        b=pGAkCsSg3z8al5B1PBG8xXI47LvR73C4+2quO14WA1jppFaDYieyaNXr4uwuDvu0fM
         QzNbtAUAV626U8aWBbU9qvDgiH2vXwPaBAK/KRorW7Ud/ZySnxDaNemsPbnF/VpSR6Kd
         oR2YKLwVwL1MF2z+WDKYy+E+Cs+VUSTdbTm+6dGac3dqdnClBpbx4ueyRq9w7XShxuob
         2eO1Mc1BHWf7cB6XBm62/eL8eH6mL1J7R33ZM64FblduZgv17sz5XnxZr+2NGuOMI57t
         ClRw9u8H+RRgJrH5mtSeiXeEql8BBb5ZoGy5rdqhOMME8qt+cEhxpyZfAipsGYONGYDG
         8Cbw==
X-Forwarded-Encrypted: i=1; AL+hErGcMuu6j8vRnRtSWWs1oNV7iZ1bVqkXdPYL4nKnLp5+fgMryxkXDmyo+ZKeSAeBU+4nYLwARVoLMCpwxHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OdXvnfSX/C43dXueuEdoTuIuDQVw6VVi7xcMB/3m7UEm3CPHT
	FtXF3eFAl2NNBCxlgo5lXeletV4loF2bVXReBJu25OoDdTCtFn2YfGVBClV2uW6I/BY=
X-Gm-Gg: AZFdTZcZssEo8wuYF33N1McbLWY3REwfr3pJi1XiNbZOWXVLqYpu4GVCdUaBTDh52V6
	FuVwXHLASQjbfQmrjMoGiP0XRgJTXjoSvB+/t+iVd0XcJCCunc6mtrKwTgzEoZWbMgbFO0U4Bxj
	dmutlLQwwI/hbyDM4pFTpavVboK9jenCDptZg56YDPFQDWRQYyoZNJI1irQbZNWjn+Uhc71BTRi
	zeRPV9mKyM/qwMPkKTfVhVzqW7iTKoJy+FKUsgTxvZ1pVtPNMt59RdnbVtzJHMev1PxXkUYZO/p
	4g/T5/Tao9z8iC8eom+bIeNLYeU0FtSAi09+JXGhgn/oM4x5e4ohfQ3BalhM+dqg5zSH6MPaQIj
	/Pqn58gQz2pNm/n//umvJZfbkbU0hxWDEjnfQxPG1437TG/FtcF2Z77qh/PrHJ5JO178On13nUZ
	T9l6U+mp1lhTT4HILFqpE7WsB4bDYOcSdZHRCpcTbV2nQAaknXg+M+qZahFDmuZZSj5B+8Pv6gi
	OcSQ9tbC0+0D6YCHHrbSiEL9obEqGXXjb4tjvsZoHgTDma+nXlNzwNtxv8WHkfFq7j0MmW+l+F1
	FQpij8oGGtiGUfuMILwLu0cvz1l2prIcorr1Ig/egep9rntJAqRA+kbCMgrAgTjTVciCYEnijCa
	nVCHQU69LaRaHoCf9w1jwx6pyMGgEAhUqyFoKCVCSsLNH+AQSCkNmz5jK0EXtYjseNrYloPKUES
	Olu/b2aHGZZZfGPPOv+g==
X-Received: by 2002:a05:690c:931a:10b0:8b0:cc41:a124 with SMTP id 00721157ae682-8b4aa2c5d8bmr58717197b3.49.1794937444057;
        Tue, 17 Nov 2026 09:44:04 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fdd9f2fasm2666937b3.0.2026.11.17.09.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:44:03 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:56 -0500
Subject: [PATCH v2 5/8] powerpc/perf: mpc7450: Add the PMC6 L3 events to
 the alternatives table
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
Message-Id: <20261117-ppc32-perf-v2-5-2072e9b90009@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1942; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=4ehustDNUkGWLKyFDxeF6Q5SPo7UK1WNROW4Ki9ot+Y=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIqw+ylpkPTjxpsz8hfXOU80yYiel7xdxNf+19yqx
 rSNucXSHR9ZGMS4GGaKKbLErVdkmdW2Y6nPaelfMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 IZChYxQPkdNj0MgsLi5NLdJNKyhyyMsvSSzJzM8r1ssvSM0rSC/QS8tMK8nIyC8qTgUaoZeXWmL
 q6uhmZGhgYuloYeZk4Whq4uzsZOjk5ujo7OpkZGluYuBs6WjiamnOwMUpAHNNujgjw/ozgv8mP4
 2J3/Rs59sTfDerzEW54zf27vrKt2elgnq9/mZGhumFi6JllZiCV/vbmGs9LYp8t2h/t5vZ/vCYc
 3NjlPmzmQE=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PMC6 repeats five L3 events at a second select value that the
alternatives table doesn't list:

  0x61f  L3 hits, also 0x503 and 0x603
  0x620  L3 misses, also 0x514 and 0x61e
  0x621  L3 instruction misses, also 0x505 and 0x605
  0x622  L3 data misses, also 0x507 and 0x607
  0x625  L3 touch hits, also 0x50e and 0x60e

Each is the same event as the PMC5 code, so add them to its row.  The
scheduler can then move them to PMC5 when PMC6 is taken.

Not tested on hardware with an L3; the 7448 has none.

Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 27337a03ebde..b2fe977cea16 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -185,18 +185,18 @@ static int mpc7450_get_constraint(u64 event, unsigned long *maskp,
 static const unsigned int event_alternatives[][MAX_ALT] = {
 	{ 0x217, 0x317 },		/* PM_L1_DCACHE_MISS */
 	{ 0x502, 0x602 },		/* PM_L2_HIT */
-	{ 0x503, 0x603 },		/* PM_L3_HIT */
+	{ 0x503, 0x603, 0x61f },	/* PM_L3_HIT */
 	{ 0x504, 0x604 },		/* PM_L2_ICACHE_MISS */
-	{ 0x505, 0x605 },		/* PM_L3_ICACHE_MISS */
+	{ 0x505, 0x605, 0x621 },	/* PM_L3_ICACHE_MISS */
 	{ 0x506, 0x606 },		/* PM_L2_DCACHE_MISS */
-	{ 0x507, 0x607 },		/* PM_L3_DCACHE_MISS */
+	{ 0x507, 0x607, 0x622 },	/* PM_L3_DCACHE_MISS */
 	{ 0x50a, 0x623 },		/* PM_LD_HIT_L3 */
 	{ 0x50b, 0x624 },		/* PM_ST_HIT_L3 */
 	{ 0x50d, 0x60d },		/* PM_L2_TOUCH_HIT */
-	{ 0x50e, 0x60e },		/* PM_L3_TOUCH_HIT */
+	{ 0x50e, 0x60e, 0x625 },	/* PM_L3_TOUCH_HIT */
 	{ 0x512, 0x612 },		/* PM_INT_LOCAL */
 	{ 0x513, 0x61d },		/* PM_L2_MISS */
-	{ 0x514, 0x61e },		/* PM_L3_MISS */
+	{ 0x514, 0x61e, 0x620 },	/* PM_L3_MISS */
 };
 
 /*

-- 
2.56.1

