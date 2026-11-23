Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441928;
	b=YjYpe61GEea3KcKGSuzQ3Fia+LiIbp4s4grFBNanqXr891o+n4gp8uSXq2m780GchzK5
	 sYnWCyAbZr5pjMJsYPHNVrr/3oUPhyvm5CHwQejs1aygAgAVtRd2K/3Tsjqk5PLDFlrdH
	 +kihiWgeDCzrXzRAnLrhESNpeC6zs8JkmzSA2RVbVn9EPz3ZjACXgkuGEWeVA646DTySU
	 rzzgeh35W5XYSPicsKwd0gm1CslQ7nzFrPgwra8/HdIB50y3yE5Ze0IBKz+L1r7FvpcbI
	 pgbRXXtF3mWXmsgPLarfxDgiawV0YLF20BgD00krqR6GodDBI+aNCp2ACayhnW7LYYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/IO4yScrqDKaKjG7SH6JwQjksWNKpCJcuGeohF7E2TU=;
	b=xNxyCCiO7Bi+zDuGQxNMCJ7u2NwEO9+2QuMtNJNB2OWs4v9+8PmR09ocI25ECZzK1u68
	 5g0ePncZSzMGoyf/Tw7mEG+NvwhtZ5LTlaOrapI/F1qHJR1NhS9TKUQmT4f8CTtE0jqOQ
	 wJFTcZqpwQsPza+wn9C1xbMxdXTXm9RumR3WyW0oNOwOlYTkRoew43+ZlSk8Dp4hsJ5CG
	 F+k7NXiXn4f9xIXUc+sW6iPeypHHwSHgP7eCEXpxA+NWnOzNjTn4FPzg2gi8zbkPYHxQB
	 9WnnmFjAzREfcxk+5/pbq9xH3zFu0SEwWlgrAykdm/rkzDkbWTBWgfV4n50ZJzaxMWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmjuPOEo;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072ED606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072ED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmjuPOEo
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so2650194a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441927; x=1796046727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/IO4yScrqDKaKjG7SH6JwQjksWNKpCJcuGeohF7E2TU=;
        b=mmjuPOEoZJ5Lj5paBNG2bNIC8QeOdMoId3XO7TRSc8EU/xpy1ZlYuDgyc92urIk9Hy
         hNW5llBuXjQ8x867iw4DTWoHd2jAcJk4pnsrNTqWjddj1EiXYK8GnhynUONmzDfQq9kg
         qeZ9TzjCCWgnMw78aJj/T2JF4N9vS979KxUuv/JlxYSa2PheyqvONnMGMqkxSnVo6sP+
         28gt5x0aNjqp5XQUmuHqEJ6Z7loGQRUD8Q5wXjkLK9grbm1LPLV96Kjj9ux9B9xUIhEC
         2h9faroZNqJRZBDGltjH2GAqOhU9IgXSeew+MJBY5LOAAvACE1QosRyjI+2fFOJ3Lglu
         lWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441927; x=1796046727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IO4yScrqDKaKjG7SH6JwQjksWNKpCJcuGeohF7E2TU=;
        b=BQmPLn3cCcNycQsHLql5ISmv7wvqmLXgOfVeeBzetOJCdgvwgfckFmk2493qxI6FkP
         DLBmJeRMqDyEeGeTr810ICnoZGeLsiHltVoe1cZz18sKibUOocJEmXbWEEvDNCEa00fO
         zKwq1FWSJHNzpm+YSuBMLioKsUbcHj7xY22RApfLSAm+U5n1vjWieQ0zMo1vFHYlyquz
         u1EZh92+exaywRiWKxw075BVkjr6Fk8zcZpm2pPYIE98xRMOBPJ47kgc3jx5Bt4vHR5e
         6UDgZ5GI3sb+TkL1/evH6we+FrvfVP5zdgIwQAMYROPWgNPxFakLN3fYJWpK78lv61Vq
         wfFA==
X-Forwarded-Encrypted: i=1; AL+hErH89QgXH8hDVOlQhMmCE1Lf6+K7md0nu0nwjADpZX0qW2gCP+mnBQXCJtpwQvndeTR433qx3BbFKKNU8mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7zey1FUvie2zBNIekF68uboKwEfwtSTCuqbxfkY7BFfldzVWW
	wUQp0hxpODqqariPahVLwO8VGfuv3yvQq54a2p4l7DiboZmXviYJsbVH
X-Gm-Gg: AZFdTZfHKoNR7uz/+629LTUkCrMWEkB5hBARo4GJVFwVQDL5Rik40rqNf6jpFtTPzIw
	HSheXuyubqV9Zx9p/34b30D4gxKArCIcplSt6W52SKqsSWB4It+WWmQvgVezFqD+JpIH1C0l8Rr
	iHtjlrOF/bGwu1OoM/N6oQVQH+SV4l3nMx4pom3wBafET8UXY8ZvGTwIS+Lz+6ZO7DasoJ+ZQLN
	bZyAFTusFaBoJUbYgM1pFDp8ilWQSRGwkxqLqATHKxsKolADrPnRNcOeN94h9X6wcl24fCGReX+
	u1I3y0ZFOlONti62bQBGlVtUmigiKNAhNPoUYtVz3Y2KCxGIi4I0hEVkDIQNsfd/9y7nZrOUItT
	nWl1kmXcVja7kD3sis0E0i/pldeF3Xta/UDtWoRyEbbYXgSJN2XvvR8/R4ig8v+er8qFRlVUpyh
	CgIvGqslEKHqQf6z4PFyf8+MAPkpH7Hv6IEydxr13wnANmKMbx58wWED4bmUX33FP1ik2xeOPX7
	LyYqHqbL+gtWMJp2VMkwziRKJBml9Zkk57tFdFt5N2gAsZHivFvQKg9pGUYOqGT6dj3JdBf8sYc
	S+5c4jgqdhlMsw4YMFA015ip2pT7Ph697w==
X-Received: by 2002:a17:90b:3810:b0:3b0:9a13:c5d5 with SMTP id 98e67ed59e1d1-3b41c8fed56mr11558586a91.16.1795441927261;
        Mon, 23 Nov 2026 05:52:07 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm20842512a91.14.2026.11.23.05.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:52:06 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv3 0/4] powerpc: Misc fixes for debug kernel splats
Date: Mon, 23 Nov 2026 19:21:49 +0530
Message-Id: <cover.1795441238.git.ritesh.list@gmail.com>
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

Enabling debug options like PROVE_LOCKING, DEBUG_PREEMPT and
DEBUG_ATOMIC_SLEEP on powerpc64 showed these warnings.

Main motivation for me to look into this was - many folks internally reported
that after generic entry/exit feature, they aren't able to use lockdep because
of the warning splat it generates during boot, after which lockdep gets
disabled.

Therefore this series is an attempt to fix the warnings which are generated
- when we enable these various debug config options.

v2 -> v3:
=========
1. Instead of calling lockdep_hardirq_exit() 5 times, consolidated that once
   for the entire duration of __replay_soft_interrupts(). - (Christophe)

v1 -> v2:
========
1. Patch-4 fixes a pre-exiting issue pointed out by Sashiko.
2. Patch-2 and patch-3 from previous revision is re-arranged.
3. Patch-2 change smp_processor_id() to raw_smp_processor_id() since preemption
   is already off - (From Shrikanth)


Ritesh Harjani (IBM) (4):
  powerpc/64: Leave lockdep hardirq context around replayed interrupts
  powerpc/watchdog: Disable preemption in arch_touch_nmi_watchdog()
  powerpc/kvm-hv-pmu: Don't allocate gsm/gsb GFP_KERNEL allocations under spinlock
  powerpc/kvm-hv-pmu: Free hostwide stats buffers if perf_pmu_register() fails

 arch/powerpc/kernel/irq_64.c   | 19 +++++++---
 arch/powerpc/kernel/watchdog.c |  8 +++-
 arch/powerpc/perf/kvm-hv-pmu.c | 69 ++++++++++++++++------------------
 3 files changed, 53 insertions(+), 43 deletions(-)

--
2.39.5

