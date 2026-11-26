Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716939;
	b=EUuvAsz0lGIk/N+gXrLweiQCvgvvwUerf9gWAunY67K+Jpj0vPoJ85ueG4IGIyBl9KF7
	 PDGEusYx+qnGCkzixe2GI67K6xGr115WOQiTcEuoOPkGtHr3Tf6j7YjNozopaDBYDG6Ul
	 tJp+cnST3SwfJ7cmUZa25mDMGWqpUls4FdQDtIciR07Qs8NtQObiWJGH3d7f6Ng9eJUbg
	 VLRAljRgh6R1xAei7uMOML5pDnyCZHAU17beE1X2fsEaCBuqxEEFAwvXlg/TgL0Z9LN3t
	 6Rs9uGKfGpKpwFZjJByLtQsSJ5AnsDqwyAuYvku6zOpvPtJ2h76LJCe918eZxDsgaxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716939;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=vS0T6LOgmA5j7vEP4sxXio7lddkP9ouWY5JhPtp9hdQ=;
	b=RP+wfG7NRtLe1Bgj5bARpVhGSzVM56L/KtU/tcq+bHk9CndTkZgAbLNjjlM+oWfCrKBx
	 EfrmEssSb5KgbLJkr+5OU+ZsRAHqki5qVuy8/2dYKTobfc7u1CvGSs2TcEj+qnDRzxn1L
	 zZ5Se9MIgz5Dr+OZQ7QphYO1x66B0tPf+c6dSj/zFG0xH60Ob6bhqTeZ3EkfJhkvppmtp
	 3BSzsy93nyTZLPcICdv+dfmdnXxR6158R80ghERyHJBE5K4wzau6ohbO7XFk0AYcgMF8+
	 aktOs+xillTD309Cl4eeifLp406GDulIDUC6STg9TzmhHEojjhfZuQg+PfnGo3/HDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BhfLF2wP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v2gZ2SIf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2988606A31C;
	Thu, 26 Nov 2026 18:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2988606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BhfLF2wP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v2gZ2SIf
Date: Thu, 26 Nov 2026 18:15:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795716934;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS0T6LOgmA5j7vEP4sxXio7lddkP9ouWY5JhPtp9hdQ=;
	b=BhfLF2wPggwpP9+TIsRnMjtE9hPV0qPwQzNhhsGQOddkFdiMyLmTzWrX5rQZM5CywKXU0T
	uSf4k3ciSoG7EmofxXxhkwThx5f5yhQmGf88CJtlYNyKwIM9bd9k21I79rdEuMoWpDoC36
	9Nd0Bb5zuqluvZkyOy2dHBK1q2NfYSepx/sPu9a8vpPeXVK9tevrZLabxoG2fABrPwgzrf
	PQAAEig1Ic3LENeytmHnphMjbrYOC+QKxfnfu8Jv2Uxt7N29+iaYciGffcqRBLUmhnA3Dl
	2zWIL6Clp2n6dripDYnhlpLAbkpujHHzc1oiL19o+jWKNXkCGVLfSVAgO1c48A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795716934;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vS0T6LOgmA5j7vEP4sxXio7lddkP9ouWY5JhPtp9hdQ=;
	b=v2gZ2SIf99WIxfTVb7dNLwtiKX9ME5fMZvQ/4L/3kINbhnfMYoDO3I7D9udtX32xTF/59T
	RIqIhqch+51+/2CQ==
From: "tip-bot2 for Lad Prabhakar" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/urgent] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Chen Yu <yu.c.chen@intel.com>,
 Christian Loehle <christian.loehle@arm.com>,
 Alexey Charkov <alchark@flipper.net>, Vlad Poenaru <vlad.wing@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179571693246.92412.12803204239970804763.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     029fd68a263364583b6f9b34d22761acf0a3940c
Gitweb:        https://git.kernel.org/tip/029fd68a263364583b6f9b34d22761acf0a=
3940c
Author:        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
AuthorDate:    Mon, 23 Nov 2026 00:12:13=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 26 Nov 2026 19:12:10 +01:00

sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()

Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
for delayed tasks") changed the h_nr_runnable logic in
dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
delayed", but left the initialiser at 0:

	int h_nr_runnable =3D 0;
	...
	if (se->sched_delayed)
		h_nr_runnable =3D 0;

h_nr_runnable is therefore always 0, so dequeuing a task that is not
delayed no longer decrements cfs_rq->h_nr_runnable. The count only
grows, which inflates se->runnable_weight and skews PELT runnable_avg
and load balancing.

Initialise h_nr_runnable to 1 so that only delayed tasks, which
set_delayed() has already accounted for, skip the decrement.

Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delay=
ed tasks")
Closes: https://lore.kernel.org/oe-lkp/202611230853.e2e6401-lkp@intel.com
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Christian Loehle <christian.loehle@arm.com>
Tested-by: Alexey Charkov <alchark@flipper.net>
Tested-by: Vlad Poenaru <vlad.wing@gmail.com>
Link: https://patch.msgid.link/20261123001213.7609-1-prabhakar.mahadev-lad.rj=
@bp.renesas.com
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e1..8a55571 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8242,7 +8242,7 @@ static void dequeue_hierarchy(struct task_struct *p, in=
t flags)
 {
 	struct sched_entity *se =3D &p->se;
 	bool task_throttled =3D flags & DEQUEUE_THROTTLE;
-	int h_nr_runnable =3D 0;
+	int h_nr_runnable =3D 1;
 	int h_nr_idle =3D task_has_idle_policy(p);
 	bool dequeue =3D true;
=20
