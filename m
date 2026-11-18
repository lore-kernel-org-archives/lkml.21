Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983971;
	b=TGqRWaA81lx3Jk43vKO2tV6uHzquvSmYzPrV5qlDnXW645kynDApbD6GOxjFmdggTmPu
	 QVkN4KgtlR3YQpBnNvDqaWwA91vWGOWKCeJpiKmvuE+QHOg45Dp8bRF5elfQRS04Js6OJ
	 AZ7Vm1DSvjSr1kB7TqHHQyUKT9K1BquVQsNvRjL6omZiVAUi3tpl//M82MBpez2yV8jVY
	 Tf1G2KrCItezc2XacXd3jqFsZc12qx526BlfOo2AIFH21Rgdb9s/BNSgCYz8ub+co26mR
	 5MsPxIzKbDhsYcefX5dCY3kQdRl0t0Q95gJ2S9c/aK1sFDFNzYbDSPEMxAi7J73QyCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
	b=zvMRgJgV54M6VcL4FamIC9IJoREwm+50tA6y9IMU3N3ZvhnurLvC0A0+NxcRN2NoBmij
	 djlsQqEBrAdMykfxUL5ip266igpULme7WLHaKDnJ2UMGrDZ38qbcILCBguCLOtwUzxCgI
	 CUhfq/ZdKatg4bKnwfkMQOqbO36+HEGfHe9Gm1etPsbx0ArGffl93vDqS853qAdULc6Kr
	 ysXdu88L9ql2g9/hPCDDXl3bZ1se3OSdBLgQWZHBtENanSIkp0OTUD1e09P61BQ5Hn3EN
	 SXRj98iW7pHejpZnSnaxLbbl731A8R3Fg3syFzsFFeWVz/jqc1FSSEmM27SFpOS3/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384AF606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 384AF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde1479f76fso521079a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983970; x=1795588770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=EbxSF1Cpupu10/hGoiSCTVs35XFe/p0DNId9GVw+zqqQ1g2CFmVNipzSdS7btmYBz/
         gBDabXO+4Ro+d5+s/eIQZwxKGDgkQpAZ2sToN0Jl4Qwuh2om3GfROG8c1Sxxbxn+XccU
         rv9l9ck4IFGRqR2qlPcSoQl8v31CO/DPtVvoKTudcOAyXRptzxM/0MOgIaqVRZdSWa7F
         m8GjYrHL14fZJI2Z/K1U3dbNiEAJgKSKj75TybxsTQ5Q8uMJY05dwBLy8JwoGBDs9gTA
         kMWSRwKQfvwxw4L0sjqIQioA9mqXlw7pbFmOJD7xFLBZu0c8IK9q7+2SbigCYXgGV0qK
         G1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983970; x=1795588770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=lRk8qLq7+AmSUz0wsBmONCoBieEKR6QsgiPRuFb2BJukdfjYAhp87rZYPHYdciQLCw
         EJJSKux3Do/a0Xr/rC+UTwN8D0ww8ctQOz033izeFUXgUMke/r9Hztu8bv7cqD6G2ubw
         LPJFD/fNDcH4DzQevi/lbt/A79WEx3+0LMZrChmfIIU6Rcz7MPpBhHwCqMjwpV+IiixW
         551yPAwbM31Sg9zeVx4AwC7onlOa+5pDIEPp9qlOFb2iJnlaQTt4RVwfkPdREnrlthMp
         dMp1cAUPFq3ZlGQIhfwMFLzDcggjZxZ8+Vwn7eHAtAgeB154HzWxRiNWikC0vU1s2A7M
         ueqA==
X-Forwarded-Encrypted: i=1; AL+hErH+VQFfJmFMwsn2Eeae+Apo4wAsrcLIdc3mt9vhhFLubxHDRPbUNN9NpzIWtdxLTDC7plJsMLz/N13h6Z0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nuhZEMRaoGnCq8oyOWCQcGs3MjgqAI6EZmdkinq9wqA56BaMN
	phwmo7roLRWsTmSHp9tVsxxSiYzUloHZWwzowaDP1/iRomxYl4xQMY3L
X-Gm-Gg: AZFdTZfYM5dLg97ZCPjSFMNDaYUCJconkntaxEv3NxSkrl18IlaAwoaSJuvOGHTDbIe
	K8qp6f6vAvoiE+f626eNV8+EPPhzpI0Fd6/sINDYlgic8cw6DM4J264fGXbOsPUnsEn9wThqLa2
	7K4WHO56zyApRGS1CYXt3I1Kp6IsAhC36rjzwrtm562dpxkz2XIRB4uUi/DYaM5h3ZgpCLS6IRr
	R7Bh2mmILoX2vJBPbT1yepG6mrEN/zP6GzqDC0ohmYnk4C7TzvyYDlfiahJbLo2ZxoUFYSmgRzK
	Cp46hGbNiY/+fwZix6GhEiigI5F6Jw+KlXgokRb6ziTaTpyeh0FnNrTnh4GrLjfFkqr3DGARPg0
	0+xqSxxnUvrzjiumrcF3EBxHnDghV0xR3//HUYwwOz5Am90PVCnvQSNwYuCdiNcDUJaDHAU13dO
	rD+J5MXGHVy+ANCGUL07OP5z07AVpJ1SsyEr7vJi1B3OSQ18yTlAqtGzNhJeXBEEsRz5NtUbi0R
	jkRWatenEcYVxKKabpd3rYF50QSnHLkOxJkEhIq76zA6ItKbApvDDT9KCZAigrmsiYsWXKB/wzE
	C9XPVqolpQzMqWJqIb/uOGXf2f35QgdHZpZMvQmZJ9/eOvKMSg6kvFO/x6I5z42LymI0edKT7qn
	ENQ1JZrd42HPbElhVUFHq0B2vNP+Rc+g=
X-Received: by 2002:a17:90b:1cd0:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3b3d07d2ab7mr1602445a91.65.1794983969538;
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/2] dualpi2: fix queue delays after trimming
Date: Wed, 18 Nov 2026 14:39:20 +0800
Message-ID: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Changing DualPI2's queue limits can remove the cached head packet without
refreshing its enqueue timestamp. This leaves an increasing delay on an
empty queue, or the removed head's delay on a partially trimmed queue.
The first patch refreshes both cached timestamps after trimming. The
second adds regression tests through the net selftest framework.

I identified the issue, reviewed the fix, and developed and tested the
regression checks with AI assistance. I used OpenAI Codex for root-cause
analysis, drafting the fix and initial test code, automated validation,
and preparation of the commit messages and this cover letter. I asked
Codex to analyze kernel code, implement and test a fix, check public
reports for duplicates, and follow the kernel contribution process.
The archived results below are from Codex-assisted automated validation.
I found no matching public report or patch in the upstream histories,
Patchwork, lore and GitHub searches performed with Codex as of 2026-11-18.

I used Codex-assisted automated runs of the 11 companion DualPI2
selftests to validate unmodified and fixed arm64 net/main kernels in
QEMU, at the base commit below. Real AF_PACKET traffic was retained with
HFSC ls/ul shaping on a dummy interface in an isolated network namespace.
No source changes or fault injection were used to trigger the bug.
The baseline passed three controls and failed eight trimming cases;
the fixed kernel passed all 11. KASAN, UBSAN and PROVE_LOCKING were
enabled, and the completed runs showed no corresponding diagnostics.
An earlier eight-case standalone reproducer verified the fix on mainline.

I used Codex to build before/after arm64 kernel Images on mainline and
net, compile the modified object with W=1 under debug, allmodconfig and
allyesconfig without new warnings, and build the selftest helper through
its Makefile target with -Wall -Wextra -Werror. Both patches pass
checkpatch --strict, and applying the series to the base
commit reproduces the committed tree exactly.

I also used Codex to complete full arm64 allmodconfig and allyesconfig
builds on mainline at 7ccb044c27720d48175577080b851f047ddcfd1c with the
same fix, using W=1 and CONFIG_WERROR= to allow baseline warnings. Default
strict attempts hit the existing arch/arm64/kernel/sys.c override-init
warning promoted to an error; the same failure was reproduced on the
unmodified net tree.
After the full builds, I used Codex to rebuild the modified object under
both configs with default CONFIG_WERROR and W=1, without warnings.

Zhiqi Zhang (2):
  net/sched: dualpi2: refresh head timestamps after trimming
  selftests: net: check DualPI2 head timestamps after trimming

 MAINTAINERS                                 |   1 +
 net/sched/sch_dualpi2.c                     |   2 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/config          |   2 +
 tools/testing/selftests/net/dualpi2_head.c  | 304 +++++++++++++++++
 tools/testing/selftests/net/dualpi2_head.sh | 350 ++++++++++++++++++++
 6 files changed, 661 insertions(+)
 create mode 100644 tools/testing/selftests/net/dualpi2_head.c
 create mode 100755 tools/testing/selftests/net/dualpi2_head.sh


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

