Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937436;
	b=MAghmg2ICi7XSdCLVmmwJO2EdtX4ZRzCITAco5i7sfF0pNw+KHCSZeb1/ebFFhs5v5eM
	 B/GMd1EqckcGfu22phyH+b4j3ZNhMRdTEkjmZewFbV53sEBmDEb7q2VSzuUxTyAae/kbR
	 wHXCbu9c4lC5Ckp+ofyw/cg4h7dGR8Y9AwgiIG5Sop/OwaOat4K7NF01zrPVcNrnsneKn
	 76je5Zpgj+e9vYtjR45s4yZR4780deKmzEwKrx4LpTGpmvNZPE9xiEdUdNAVo/RbnUcTH
	 KtOtmW/oAVaZJFYyLWBcwodbpmwoHgB2+JWZychh9zTw/6SyzZyujpHTsTatELvzCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZM3n+wUd1iTorLkN+/w9/MJC1KrDVHt16lgqYCBSzqI=;
	b=wkT8uI9Yc548375OJL3AsmJC+xOhwvR7xVevibIX8UtiaonglxntuOFD64Pg1Yao1VSI
	 6a0iHLBQOmrl75eA2rsPRWHYOwMGX2Lt8xq2OV8rk5NaE/+EGWP3bRaqK1lvfnniZCkUo
	 Zjuqf1jWXetWGocjOWNz4wlu+Gq1s2BgMIWQU7xt7rF6oipBHv39ToHdv6+ndZkMk5ySn
	 J+1eirOH4q8Y2u0b1m+Fxye3NlQmkkat72guCr+uGGwN9Ux26au/LOYJbuMWmvM9Cj1MH
	 WJkWDZuocHxfOMGbQoEWR0o45WlPkMPfUWiRLCltYHJpmVS5hdfnw9wzlZYHICWMkmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCYezaGs;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0B0B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LCYezaGs
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b3402105b9so38609977b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794937435; x=1795542235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZM3n+wUd1iTorLkN+/w9/MJC1KrDVHt16lgqYCBSzqI=;
        b=LCYezaGsIpxHbt5Een9N1VPvRIa0NRI1V8tAP9VA5+iaWx9woVWdLT4NL00a0CJqJq
         gmLmsqixXzJikwzm/DoEJeEPXn8XwsvYHOEX37jM2r0XxB0i6+pngPcK38urYA6ZyONl
         iJYHwkzcpUYsM9iEdgqzHn1+CEi2fgLXweD5J+dYZkA7OAbSEVCVv9bYRVmS0z6MX4uA
         IwlOpjqFwSM7NbVpD4YYnB2o28R5VMnvpJE1uGzg7nBvDopYOu1eY9QPk6fNN2tZ8GRO
         xY9jw2UDZnwcI3kkigBk9jbCyf/muPigRA9KkkDIaBX2Gh2REQE5P4bijfhT0rd5Bsc/
         4eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794937435; x=1795542235;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZM3n+wUd1iTorLkN+/w9/MJC1KrDVHt16lgqYCBSzqI=;
        b=gwdha/XHjIbzamH1vwqcDS3QPQayNXOfe5IIYBnLgGItxgaX2mbfxP/kGdN4Sbzk/z
         DM3O/SzvEmxpgyxpTDSRN3Rgk76tmPXoCsYNg7OqcAB05aACngHphdmaZ6JPuCcpL4TP
         hprdYcRqQH8rM/Vf4cYgFmQe75afsxTTVjy5RAAWALqC2QXmXyizWN0AIuH0yTc/wFN/
         A5srBiaei2kaNCsvsj7RTdkb4m/omeXmJfm9mLfFLiA3885PGVzmDN4woYPx/92qkgzI
         eR8DUN3eIdJlG3mlgUD6FJzbnIu9+/Q9RMXXT1GsusdC9crDcQqcKdB/9KlPcwgeCpsC
         wGaA==
X-Forwarded-Encrypted: i=1; AL+hErELzEXiXDjqmN7ZoQnYL6L+hD4wQK9AtqcaB7SHS8i60Txg4fKWmB7JtRcPlSnM2XqLa1I1ZSIpbpR9WO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DP76OJKDsNhtkbgD2MjLHbdOMB5t0oNYHhdRLvHLJ9OfCmNu4
	Gf8bOplztnp26+2erD2IbMXtgyjeXnfe6qMMPt7zD7e3jpfOFYVezDZ9jxM8e21KhyQ=
X-Gm-Gg: AZFdTZeO8YhnqEf9bAxV7njXtPCVeEW/6Byg4Mkq7TEdy8AqeePhWdyBzIeMCLdZLnp
	WdbcYtGFHKEpnlQSCPFPlfgWi11rsC5/BR6Z1S67WKt0oDVOxUXRATwFCjtb2DL7s7khWu/Amp9
	aEmL4T9IznBGj5k/C3dNEj5QSFtSUF1tWdZbbrdRuoAXyvEcZ2IIYFOsbI4usswxsgmKa+5FBjg
	EeRnE90qghr/buq/5lMwM7X6IbtvVsoH16Zwk0+CdXBcGg16E8GMwSQt6u9NHkMXmRzPk+sffkY
	Da0zqbM8JAB4sAo183Somzry4ZG/stkRF5N5x6AujH64XmAKdBJYN9bOgpE2c5m4UZ7kDpmxQmI
	kKzoneZbAh2WDMOWl2nBuuW0C0wce0SANj3VQ3Zs86jacKG7SLjYKMEM56VTeKVJTjS4rRfDlvx
	pXa4/IyGZj59awmwpdPQa2aOCSlUENdt1l/aMHEN8pUxw2p6CSt06P/wjcZrT0RasTNdAEQBhyE
	0VY9Vw/0UeAHrpNMm321WxyezYI3JkUZ2lB3Z5Nh/0i9usdHslxea875k3UzJ10Hgq9WOn63qG/
	wC0mR8Eaa868JV6izSkbCxAktxbm4v1ldgYh7QWkkAOma1W7J0Eu1byXXRav849ebQfStkK8zEV
	hKPULkGJW0PSEQLmH/+LPN/UaqZVZdjrjJn8jpSXttEdPT9jOWIDRlyMC/wA0uQp+/xbi8y/iWQ
	7mbqX5qRb/mZr9iMwrHg==
X-Received: by 2002:a05:690c:f85:b0:8b3:45b:a4f3 with SMTP id 00721157ae682-8b4aa350595mr75502137b3.83.1794937434610;
        Tue, 17 Nov 2026 09:43:54 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fe030a65sm2194157b3.15.2026.11.17.09.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:43:53 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/8] powerpc/perf: mpc7450: Event fixes, SIAR sampling
 and sysfs event names
Date: Tue, 17 Nov 2026 12:43:51 -0500
Message-Id: <20261117-ppc32-perf-v2-0-2072e9b90009@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQrDIBCF4auEWdeiJpG0q96jZKFmTAaaKFqkJ
 Xj32kChy//B+3ZIGAkTXJsdImZK5Lca8tSAXfQ2I6OpNkgulRBcsRBsK1nA6JhxWrRSi05OBuo
 hRHT0OrD7WHuh9PTxfdhZfNcfc/lnsmCcaYWD7nvTmm64zaumx9n6FcZSygcqb/fepAAAAA==
X-Change-ID: 20261106-ppc32-perf-bfa132a142db
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>, Tanushree Shah <tshah@linux.ibm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=+wsNCo/yl0EPm7ERyMT6IkB2BuBys15yaHR/GHDCMrE=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+TIp4lqli+f371tAnv8/JdrkbbFDhqpxw46fMZuGta
 +9Wad992PGRhUGMi2GmmCJL3HpFllltO5b6nJb+BTOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GQIZOkbxEDk9Bo3M4uLS1CLdtIIih7z8ksSSzPy8Yr38gtS8gvQCvbTMtJKMjPyi4lSgEXp5qSW
 mro5uRoYGJpaOFmZOFo6mJs7OToZObo6Ozq5ORpbmJgbOlo4mrpbmDFycAjDXLOVl+B/Tx8LR/c
 25riDj5YLP/Nzff3Fyli3ZK+jLVajakrHb9TEjwytO/5f91099jE40faTBEVKzqMzubOvkwu13H
 k9ZJcbFxg4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Patches 1-3 fix the MPC7450 perf driver's event tables against the
manual (MPC7450UM Rev. 5, chapter 11). The worst is patch 3: an
alternatives row joins three different events, so perf can report the
count of a different event. In one test it was 374 times the real
count.

Patch 4 fills in the L1 data cache events, patch 5 adds the PMC6 copies
of five L3 events to the alternatives table, and patch 6 adds a format/
directory.

Patch 7 takes sample addresses from SIAR on 32-bit. When a counter
overflows with interrupts disabled, the interrupted PC is where they
are re-enabled; SIAR is not. It falls back to the interrupted PC when
SIAR is on the other side of a user/kernel transition.

Patch 8 names the events in sysfs.

Tested on an iMac G4 (MPC7448). The 7448 has no L3, so patch 5 and the
L3 half of patch 8 are untested.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- Patch 7: Use SIAR only when it is in the same mode (user or kernel) as
  the interrupted context, and take the user/kernel flags from regs
  again. This keeps the callchain consistent with its first entry.
- Collected Reviewed-by tags.
- Link to v1: https://patch.msgid.link/20261109-ppc32-perf-v1-0-a6e8a55b3b48@gmail.com

---
Matt Turner (8):
      powerpc/perf: mpc7450: Event 0x30d does not use the threshold
      powerpc/perf: mpc7450: Event 0x634 counts L2 prefetches, not L1I
      powerpc/perf: mpc7450: Remove the snoop retry alternatives
      powerpc/perf: mpc7450: Fill in the L1 data cache events
      powerpc/perf: mpc7450: Add the PMC6 L3 events to the alternatives table
      powerpc/perf: mpc7450: Export the event format in sysfs
      powerpc/perf: Use SIAR for sample addresses on 32-bit
      powerpc/perf: mpc7450: Export event names in sysfs

 arch/powerpc/perf/core-book3s.c         |  18 ++-
 arch/powerpc/perf/mpc7450-events-list.h | 250 ++++++++++++++++++++++++++++++++
 arch/powerpc/perf/mpc7450-pmu.c         | 118 +++++++++++++--
 3 files changed, 369 insertions(+), 17 deletions(-)
---
base-commit: d68ce4e71248e1ff5af9654b407541d9260b3ba5
change-id: 20261106-ppc32-perf-bfa132a142db

Best regards,
--  
Matt Turner <mattst88@gmail.com>

