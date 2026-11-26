Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707673;
	b=BI27eB0vvuxTHIiv/gWIDDelxvPVeeYCauWoe9shtLRDD2xm+3j9NBlkodrhvT/0TYPA
	 4ESZqzEmCbBuM8B/vzmX4UQNWIRrWgYQqBobNZtAQkz1dRik6fDbSJQuW2O/RtT8+AHjJ
	 hpthEiYL9z4yUk0oAUIGYgXvWHyQJcEBnmvy3xiRrPer6O7JGZrzeNDlwdscVwKuq9CQe
	 C/U0cGXxkVyzo04c3KbPF7DCDygJPPxMQAW0z7CROeWBmFscIBAYvhbSQSOI9lyU6dAwj
	 v4VfitGj/aCTR6uH1gN1SYAvcg0Mzi5dZ24lw9BnjXuW44JAUWg+VlR0KT6Nj4yHYag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707673;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=ezyIEtEATLd5HBJHNYsGaPfbRpIbzT7FgkG1MtB7U+o=;
	b=afyW6BBrBamTp8MrtERk2FM7cKLki+nMhzNou5akeveVG0S819DGH+ptV/GY0hp/QP/K
	 pdca8D1h9ScZKRUkV0V7d2450X5tbcG1d+6+QDIFxjc5kgNtMpYD38dFORWjiQVrxMjZq
	 T9NnCzlaGt1vvofghu8D+NSrjyp9/WqKL6D/qIlFKNf5+XOT6TQv48D/8yRCVsN5hY22k
	 sdea19yTz8PLiR3J3IaZYkBzZFnzKjg+llCL9G5JQD6EeVTLGa1dw0NZ1lJLvygZC3wW+
	 +g05Fxxw/jFjBppu0yfn5zSmeHjkqlyMlAX+P+Rhz+yCgYzdiIp/PNLDErevOnBv8rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TRFJWXrR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SwW+fWc8;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5821606A31E;
	Thu, 26 Nov 2026 15:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5821606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TRFJWXrR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SwW+fWc8
Date: Thu, 26 Nov 2026 15:41:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795707670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezyIEtEATLd5HBJHNYsGaPfbRpIbzT7FgkG1MtB7U+o=;
	b=TRFJWXrR8ho4Lrvd4XnoIluVTW+Ra8zsLbsCsox70GFdVYOPBD0Ko9U81CF5k2SBMKIA7M
	WGN3DxWUIMK8alVyElvPM00DkR3vzeo1LtraJscyEkKyHhxs7mMQMS+xZbMkZDa88ZikWM
	BotDJHD3woRPcl+JY7WCpiG+XhseBcxYM189LksmgDPkKko2RduJefGB8+PTOlUikS5poZ
	EbV9LCwc7D0TVMzmVD4Au53EdymlKrAHnAPhCvUBcyK2ukiCrGGHW2JhO70yCpHwQEcJE7
	OObrzo1vRORxa1LQIwYoej4eiigvS6bZUjGc+4gx7yFP+IyCeLVw5JLvydDVnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795707670;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezyIEtEATLd5HBJHNYsGaPfbRpIbzT7FgkG1MtB7U+o=;
	b=SwW+fWc8Z/qvkxMHh1+AoKqDGLp4Sq4oz2YLNYAP891xgWH4mYXBK4XU++99vOBG1fYZfM
	do3gAJB7IViCTuDw==
From: "tip-bot2 for Breno Leitao" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/topology: Don't claim sched_domain_shared
 twice on the same domain
Cc: Breno Leitao <leitao@debian.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, andre.draszik@linaro.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260810-b4-sched_shared_leak-v1-1-3eacd249d0a3@debian.org>
References: <20260810-b4-sched_shared_leak-v1-1-3eacd249d0a3@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179570766806.92412.520239026073811401.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     40fddc398878c2cf661b7f16d783bfc5b0000642
Gitweb:        https://git.kernel.org/tip/40fddc398878c2cf661b7f16d783bfc5b00=
00642
Author:        Breno Leitao <leitao@debian.org>
AuthorDate:    Mon, 10 Aug 2026 04:46:45 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 26 Nov 2026 16:37:18 +01:00

sched/topology: Don't claim sched_domain_shared twice on the same domain

build_sched_domains() lets the asymmetric capacity path claim a
sched_domain_shared object on the lowest SD_ASYM_CPUCAPACITY_FULL
ancestor, and then unconditionally claims one for the topmost
SD_SHARE_LLC domain. When those are the same sched_domain - a system
whose single LLC spans CPUs of differing capacity, for example an arm64
machine with one MC domain covering every CPU - init_sched_domain_shared()
runs twice on that domain. The second call overwrites sd->shared without
dropping the reference the first call took, so the asym blob ends up with
a refcount equal to the CPU count and nothing pointing at it.
claim_allocations() sees the non-zero refcount and clears the per-CPU
slot, so __sds_free() does not reclaim it either, and the object leaks.

kmemleak reports one 32-byte object per build_sched_domains() call:

  unreferenced object 0xffff0000c02432a0 (size 32):
    comm "swapper/0", pid 1, jiffies 4294667436
    hex dump (first 32 bytes):
      08 00 00 00 08 00 00 00 00 00 00 00 20 00 00 00  ............ ...
      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    backtrace (crc f4478cb7):
      kmemleak_alloc+0x44/0xd8
      __kmalloc_cache_node_noprof+0x344/0x5d0
      build_sched_domains+0x2f8/0x2110
      sched_init_domains+0xec/0x160
      sched_init_smp+0x48/0x108
      kernel_init_freeable+0x1cc/0x2b8

ref and nr_busy_cpus are both the online CPU count and alloc_flags is
0x20, SD_ASYM_CPUCAPACITY, identifying it as the blob the asym path
claimed.

Only claim a shared object for the LLC domain when the domain does not
already have one. sd_init() zero initialises sd->shared for every domain
it builds, so a non-NULL sd->shared here means the asym path already
claimed this very domain. Cache aware scheduling still finds a shared
object on sd_llc, the same one, covering the same span.

Reproduced under QEMU/virtme-ng on arm64 with two capacity tiers
(capacity-dmips-mhz 0x400 on cpu0-3 and 0x200 on cpu4-7), where the MC
domain spans all CPUs and carries both SD_SHARE_LLC and
SD_ASYM_CPUCAPACITY_FULL. Leaked sched_domain_shared objects reported by
kmemleak, with a kmemleak-test module loaded as a positive control:

                                        before   after
    after boot                               1       0
    after 12 rebuilds via CPU hotplug       13       0

That is exactly one leak per build_sched_domains(), and none once the
domain is only claimed once.

Fixes: 9e005ed21152 ("sched/topology: Allow multiple domains to claim sched_d=
omain_shared")
Signed-off-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
Link: https://patch.msgid.link/20260810-b4-sched_shared_leak-v1-1-3eacd249d0a=
3@debian.org
---
 kernel/sched/topology.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9d3a1b8..2e355a6 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -3187,7 +3187,13 @@ build_sched_domains(const struct cpumask *cpu_map, str=
uct sched_domain_attr *att
 			sd =3D sd->parent;
=20
 		if (sd->flags & SD_SHARE_LLC) {
-			init_sched_domain_shared(&d, sd, SD_SHARE_LLC);
+			/*
+			 * The asym path above may have claimed a shared object
+			 * on this very domain; claiming it again overwrites
+			 * sd->shared and leaks the first reference.
+			 */
+			if (!sd->shared)
+				init_sched_domain_shared(&d, sd, SD_SHARE_LLC);
=20
 			/*
 			 * In presence of higher domains, adjust the
