Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937444;
	b=4+OeeZjT8ihK7SSVYkL3wM+DXAwfNJCHjzAQrvPF0DRtz2YTGJTSIPJBQ/MVBzHlfCmZ
	 Lv+pisV0zoQb5hftu37CvuK+wLAm9zl8NYDPLYq31WAO4fhVbkEoiv2SYo61fzCSXGp4k
	 W/hLIbJ4g8G+9Suo5qEUqN0T3P3vAjNn67vlV/i2pwZcZsZZK1mWYwZQT9KgeCkldJWca
	 7usxxJcKMeGEbNIlWvCW8j2bNKb+yXmahS2aKZ+nonvLTagJ3H+bf+JcmY3FOqtFUlfvw
	 Zna/p0Z1jjnWu8Bqog76wlHdgIaVm9gQevtjbmhZfEcF7gECk46CFRDhnJNchUXjMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dXq+KxKE6avnI0gNIGnGOuZ6eBs1eeAKd8k4EoiQ16w=;
	b=b4Gpr6W0yAzgoTSbE58S/JZtRgojRp8M2iTkd2m6qfavpWq/GfmkrqrZSDSu0zf97N18
	 tHtdtuBtgeUMZMJV9prf/AAQAX4w+ckQKtMISp02/QtN7W1d3wCWzc7lENIWNZji1Wt81
	 5dIKcw+yvT7L4qLv9qg9oyvDsp8TDtlAtww9niKH9F2mNnv80vEbU3EyQmZUZGdLi5k4P
	 lGZJXgW1V2s88XrYYu1LWC97+Z9idC8tpSRT2SZrCkPjQ0ni9AnLaWRZSyTnnVSFPwQHS
	 +STWlCjwtqcy8H8M+2erfg0W7jicY/H2G04rywRSFfMdLgBVLZiZNf76zWLWTE9A7+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNYjUVGH;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C59606A337
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C59606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNYjUVGH
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-675617e81f9so5340934d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937443; x=1795542243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXq+KxKE6avnI0gNIGnGOuZ6eBs1eeAKd8k4EoiQ16w=;
        b=yNYjUVGHi/J9TI+DLu3pjigmqpTpqn6BFTDn+vUKSZggLDX/C6e8YaIaW7IJ9Tysw1
         HXqy2q6a+ZCQoaonD3JdzF5VjDWvGJb389y2949uNjopUVQIKrOYrSN5vaZLwQEN4l6r
         DmlSWGmEbbQsgfsGS6VkEEZNqgDUTCs9w0GLZiAToeTl6GngC6sTlO9TwH3DmMuirIGN
         5A12rakHtIMRzNU5nX7+kQMvsRW8ovwhO/DnSW4y4sRf7Uv6iK3uavYyacj+40w4Un2t
         Zlq07mpoUiD5DlLyL5PVBaF+pL0CL4/3MjeJmwU/m1DbJcLK5kpX8LVRhXi5ZrOgPHq9
         iG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937443; x=1795542243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXq+KxKE6avnI0gNIGnGOuZ6eBs1eeAKd8k4EoiQ16w=;
        b=hwpMNKCiGdSWkknZZTA1Vf2GqSK/b/5moYarU6tZJqPOS5595eSziMppFizyaHs9/7
         BTpU+f9IDOv/tdiQGVylM0tHncKoULCswXZDtSIOR/iiOEkHyrbAGpJJIId2knTk4bVY
         /H6lReLnikxwKJVKupZF9TJ3p155PUDd4oPxER9C/A7NG4QLzxBrgvilnKNAF1TAuIgb
         BvB8Tjaqaru9TLS6CbjSeGjsRdKoURAarbL3Eq2LSIG/fwtZrDb2oz8O2mvXs+W1dQCe
         Z66/eAmT1aSNKahkPlb74Rii4U1AeDDmVqf1FemgUHD/5KiCjhG9vYV+SH6ez8Xgw+yB
         MZtA==
X-Forwarded-Encrypted: i=1; AL+hErEZyQV6typex98oRVpMyFe/yUocRjcMikdLWbhRFu/3kIeYfhsbazOrjF7C8s8sCr10W2w9RTltN79j9ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z90HJk9ZC2HUbg9QaujpTOCEGT0gtBFRb95BSmxCCvUhKjU143g
	KaKxMn2byzM2sohsZJ1icU5ww6ZaP8SPOQvNgallif/RX55Ty4gVtHl0heD8QwTSYJM=
X-Gm-Gg: AZFdTZe63qHMGEHA4dHFM+T7MYla+8bxisSxXmyC92SUiiSrIuiyvKrP3+VnOOMiUn+
	agsG4C0v7ukpj31DXbWWLpXOcS/qqyFL4e6GrotSfgqutP7XYBVoT/w22N+PLSt5sMoXbQHni2I
	hZna16jcx65anXPSIMdNnXnzpqTsHdDgosHy2EllOwOgfy2V+oCMSfcAhF9TN8VkMADnR/nANsh
	bHpDMd2TC1da5TWhyf2Su44xsapZfayHGqFIvyPTxCylnQfrFc9rhcjUN6FNH2AfxuA5mbG3jIN
	smdP3qbUI8t65lZNrzYu+fn9TdbTeliYgT+FpwcpQ8cj0zzKLG3Pfb84tZn68uWXi9Vbb6B/nRX
	ct3hJJAGKjscZWqpKa5kGg6pdNJs+NDzEiLMR4j8acoVIbrsqbaXRUR3X8OR/6oHs45o7SHnhJd
	2jl0HT+B68+Lsinw0Ls+DrJcMT2SZl8EOc9vWV44xiTMq6wpoCdC0kWbr/y/XYwoXQo/E0LIv5E
	sz44b0ms8DDgrCZmnd5aryGa9VDkiBFzVWGRUvEgXcqNeOMbAb09z2Qx/IueN7Xdq9F1NIdiPhv
	C+K6bqRLFRcSelZBUihUCUlcJHHM8B6f36LFC70lkP+GdWMq1PYR5HevVx4llsHvRxlpyjAvtez
	J7GE6Ibem32zVHEbuhuwtPKb9r/zIfKeV8vcDM+aHHJYpKHATcVg+28BGF74gKEKpz8Ato1bXIW
	2nkstFG0RjKUOzmlZPTQ==
X-Received: by 2002:a05:690e:4399:b0:67b:e531:90b3 with SMTP id 956f58d0204a3-67dd3fa46d6mr79067d50.33.1794937442644;
        Tue, 17 Nov 2026 09:44:02 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fdf1d0desm2366887b3.1.2026.11.17.09.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:44:00 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 17 Nov 2026 12:43:55 -0500
Subject: [PATCH v2 4/8] powerpc/perf: mpc7450: Fill in the L1 data cache
 events
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
Message-Id: <20261117-ppc32-perf-v2-4-2072e9b90009@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1775; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+x3dIo87AbGKQ1Th29uJ8/+OYXWAn+kLXmjzlUcDcrc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIqY+J83YuOq/SnP1dNEd05hzo7r76/Ky5JOz8gqC
 jbYdHlSx0cWBjEuhpliiixx6xVZZrXtWOpzWvoXzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 CGToGMVD5PQYNDKLi0tTi3TTCooc8vJLEksy8/OK9fILUvMK0gv00jLTSjIy8ouKU4FG6OWllpi
 6OroZGRqYWDpamDlZOJqaODs7GTq5OTo6uzoZWZqbGDhbOpq4WpozcHEKwFxzQJWRYYKljGTKlA
 L1DK+Y5punrnxYKPrx8mwP/ydRf7ccPClU94bhf5S86rLrnloLDPje/Jts/mHruiTTAjGNyW4/L
 Ce0Sh8MZQMA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The L1D row of the cache event table has load and store misses but no
accesses, and nothing for prefetches, so L1-dcache-loads,
L1-dcache-stores and L1-dcache-prefetch-misses are not supported.

The MPC7450 has no L1 data cache access event, so approximate the
accesses with PMC2 select 26 (load instructions completed) and select
20 (store instructions completed, PMC1 or PMC2).  These also count
cache-inhibited accesses.  PMC2 select 38 counts dcbt, dcbtst and dst
line fetches that miss in the L1 data cache.

On a 7448, a loop with one store in every 32 instructions counted
645840841 instructions and 19773839 L1-dcache-stores, about one store
per 33 instructions.

Loads and load misses are both PMC2-only events, so perf multiplexes
L1-dcache-loads and L1-dcache-load-misses when both are requested, and
refuses them in one group.

Reviewed-by: Tanushree Shah <tshah@linux.ibm.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/powerpc/perf/mpc7450-pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
index 9890c87c58ef..27337a03ebde 100644
--- a/arch/powerpc/perf/mpc7450-pmu.c
+++ b/arch/powerpc/perf/mpc7450-pmu.c
@@ -362,9 +362,9 @@ static int mpc7450_generic_events[] = {
  */
 static u64 mpc7450_cache_events[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
 	[C(L1D)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
-		[C(OP_READ)] = {	0,		0x225	},
-		[C(OP_WRITE)] = {	0,		0x227	},
-		[C(OP_PREFETCH)] = {	0,		0	},
+		[C(OP_READ)] = {	0x21a,		0x225	},
+		[C(OP_WRITE)] = {	0x014,		0x227	},
+		[C(OP_PREFETCH)] = {	0,		0x226	},
 	},
 	[C(L1I)] = {		/* 	RESULT_ACCESS	RESULT_MISS */
 		[C(OP_READ)] = {	0x129,		0x115	},

-- 
2.56.1

