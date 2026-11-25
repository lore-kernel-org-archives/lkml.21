Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630720;
	b=5TBFO++ZjrmH4jk8yo8uUQ4vfNgh9RqGLsimxACPQRIiCN13vOFP7czYM5s/lc7yCA+u
	 qC+2uExubwNLRjHwdavhD6tBr/Ij4hDL+ra8GmSzzFrVhcquB6RanM1rFS054SupFWo1b
	 6vstTLdKih+FBuIgJdLBztjX8vvkn4lCmJBbfJDBa54nm0CB2TU3rpzO5OkC8RZ4GYn2c
	 m/DXAVznlEEfoinhuTS7vm1Jr/QPogl7vihEDAy4ZC+LfTntHZSgQ91Fs/hrf78b8hcUP
	 SX/AYFSVZsZqGKK1I/e4EXHUM/6QWIz/75GEAFbCU9/aZIK+al3U4E7OBkWYDdPdE6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630720;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=w5+5Ek14eh/ok26w6TZeIupsCkZMl9d7/wNNeptttYk=;
	b=bPogiXotbtxsehwCNU9DM6YBIBNmVf2/MrP3032e2i9LodlUVez3a3wy0MPqCkME03EQ
	 jaFnguR+4rY/G6NzweXgEddKFxYUQTcLUmgnBMhXJcdxPAKBq/sjuJZQKgn3fw6dLp7kc
	 iak1kGzoPtFI6FBL0qYc1a7JT5TNDG8SzNXnCGuSQVeRN76O925QKKRglkRPLcseFyRm5
	 AlBM6mnC5P2m+GarYgdutJ92CCfDZ2kNoN+7o8PAIiJf1IP84UEJw+pV1NiifkgR7o80I
	 eTLkwCbeq/w6gMVZ1XSzcHlsa1IHCO0xaPVXfN5sbQMbe4Gxs/R/eroyEy5SPrJZ/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oQjopnfL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fztfkvjz;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68522606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68522606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oQjopnfL;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fztfkvjz
Date: Wed, 25 Nov 2026 18:18:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795630715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5+5Ek14eh/ok26w6TZeIupsCkZMl9d7/wNNeptttYk=;
	b=oQjopnfLQRQwxmAVboKCRtnXRbe+OARUnEYiElCav4NxVVsi/P1xp+v11vWogUM1gKRXHB
	RPbCMXjlK/4Rc8YuXQXCBALwJlxodMTfTfGx/JqFH4dHgcWfL2A8MHQvdxD4doQ88x2PmA
	TixwDieORuwiyzKb65znOONMn1Vqfj8lKLHSglUfmWEUCKhzKR8UcipMoPN/CA66ddJHcT
	JdD38Wvq9qG+uy929nj9oyG6TyxcJtfU1K0U96/iiAWLk0j5ykxFYzSNzLzr/Z4bFO6KF+
	3Yto5ZdVC7uG/aYZz5X1L5uAnVq+wdNTISeFUUgLqtXq+mh0alV3mvAV/pjYIg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795630715;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w5+5Ek14eh/ok26w6TZeIupsCkZMl9d7/wNNeptttYk=;
	b=fztfkvjzxiFgs+KqOvp6KhuvvkQlBy/KBQDynaDTF4hz5mSlwxeUQaqHbAs0akD1WiNII0
	5rU+JklK96j3n/AQ==
From: "clocksource-bot for Juhee Kang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-kernel@vger.kernel.org
Subject: [clocksource: timers/drivers/next] clocksource/drivers/nxp-stm:
 Register sched_clock once
Cc: Dustin Black <dblack@redhat.com>, Juhee Kang <juhee.kang@redhat.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20261015113738.435986-1-juhee.kang@redhat.com>
References: <20261015113738.435986-1-juhee.kang@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179563071353.92412.1445511540297479838.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/drivers/next branch of c=
locksource:

Commit-ID:     beb664be74abb8fb6753800d9f79d5a492cd3f86
Gitweb:        https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano=
/linux.git//beb664be74abb8fb6753800d9f79d5a492cd3f86
Author:        Juhee Kang <juhee.kang@redhat.com>
AuthorDate:    Thu, 15 Oct 2026 20:37:38 +09:00
Committer:     Daniel Lezcano <daniel.lezcano@kernel.org>
CommitterDate: Wed, 25 Nov 2026 18:28:20 +01:00

clocksource/drivers/nxp-stm: Register sched_clock once

Each probe updates stm_sched_clock before calling sched_clock_register()
again. The call then subtracts the counter value saved during the
previous registration from the new STM's counter. If the new counter is
smaller, the subtraction wraps and the timestamp jumps forward.
(e.g. from 0.4 to 32.9 seconds below)

  [    0.403653] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every =
16243448316ns
  [    0.404056] clocksource: timer@40120000: mask: 0xffffffff max_cycles: 0x=
ffffffff, max_idle_ns: 14456668980 ns
  [   32.890509] sched_clock: 32 bits at 132MHz, resolution 7ns, wraps every =
16243448316ns
  [   32.890882] clocksource: timer@40124000: mask: 0xffffffff max_cycles: 0x=
ffffffff, max_idle_ns: 14456668980 ns

To fix this, register sched_clock once at the end of the first
successful probe. Clocksource and per-CPU clockevent registration
remain unchanged.

Fixes: cec32ac75827 ("clocksource/drivers/nxp-timer: Add the System Timer Mod=
ule for the s32gx platforms")
Reported-by: Dustin Black <dblack@redhat.com>
Signed-off-by: Juhee Kang <juhee.kang@redhat.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@kernel.org>
Reviewed-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Tested-by: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Link: https://patch.msgid.link/20261015113738.435986-1-juhee.kang@redhat.com
---
 drivers/clocksource/timer-nxp-stm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-nxp-stm.c b/drivers/clocksource/timer-=
nxp-stm.c
index ca6c0df..dcf2bc8 100644
--- a/drivers/clocksource/timer-nxp-stm.c
+++ b/drivers/clocksource/timer-nxp-stm.c
@@ -211,10 +211,6 @@ static int nxp_stm_clocksource_init(struct device *dev, =
struct stm_timer *stm_ti
 	if (ret)
 		return ret;
=20
-	stm_sched_clock =3D stm_timer;
-
-	sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
-
 	dev_dbg(dev, "Registered clocksource %s\n", name);
=20
 	return 0;
@@ -473,6 +469,15 @@ static int nxp_stm_timer_probe(struct platform_device *p=
dev)
 			return ret;
 	}
=20
+	/*
+	 * STM counters run independently at the same rate. Use the first
+	 * probed instance for sched_clock to avoid timestamp jumps.
+	 */
+	if (!stm_sched_clock) {
+		stm_sched_clock =3D stm_timer;
+		sched_clock_register(nxp_stm_read_sched_clock, 32, stm_timer->rate);
+	}
+
 	return 0;
 }
=20
