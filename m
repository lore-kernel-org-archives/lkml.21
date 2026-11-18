Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009506;
	b=zYt4tvOb37gNfgO89uYQOK/Zngd0CmQOtKfubhlnyDjegtKBM52i7UlG+QDMx+Dh17NP
	 kOZwrtTG9bPph/yLPHxbVCiYYlCVhZrkEW9ouCsYp0Z38Pi8vSNq1Ot3Re3fn0IA1L30n
	 ckDzaoWHy81g6wbNvQxdDaYuId5QVuKjEMyGV+ParB9hQ3XfrDV7GbdKvC9M+kkicB6eZ
	 a7YUxksjV8IFDJRIUMJwcAnWCb7F5dQX0OA/LyfazHMoUkP0kBy2rs4oWjGPP68OliX28
	 vCNBgDLRmBJXsodh1iLqx4ZTm1PHx+Y7ib5c1jrXXRcgiyO5yD6HJj/wjj+pVZOZTOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009506;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=trp0hOaG0xVF3cJzgF5NrPTjEtVb3/EngWUbAShqdr8=;
	b=TWNQe75w3gKY/eyR4WRet7MnDWK1d3EduoWxOT70fbzd54sQo0v10a7aU7KXxMgVI1mO
	 OgD0rS3m/NPwjFdPMzU58OBa1mik6U9imW72wPfeAmgfkAob7xibmvwshOjug6LJwYFml
	 lhWCs/Q9BPIDFAcQ/3tH4pmIWo3dI7fircipwBTP8vfTIc6NGskG/hIVIEPQsw1fSTURj
	 fTSPvFW18vD/6G4hMwu0BRzV8dFXgdnvarPYh9zXUCxPm9WH+6E3Pe3vvdvTjzqjd0fZs
	 IiRwPi3ZTlqXg5O4VtfD2PeoPftKJunKcGo8WID0U/DJaCIsLIc0Bi/djDcnHVegzcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Uqj3CvlJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IJiyFneZ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040960A260C;
	Wed, 18 Nov 2026 13:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9040960A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Uqj3CvlJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IJiyFneZ
Date: Wed, 18 Nov 2026 13:45:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795009503;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trp0hOaG0xVF3cJzgF5NrPTjEtVb3/EngWUbAShqdr8=;
	b=Uqj3CvlJzLStWVycjrcTLSGYGgyk4U+9CRovtxXGrdOarkBmiDUdohab+P15Rqi2VmKrkR
	nMZAcmmc5OMOOttuGHvSIXJFmWC6GEXSsITOr2uXbwXo56eOvqo0ltSMTOu0v0QeYBc2Sb
	k/hm3RPD/aVywNCrULV2ywrBJm8ABUJtrDD2hNaXBzQDHFSEf0OtEci/HcyIld69VZH73i
	wv2c/9BZnaSp5bUS4WOo3MzChyFgN9yS6kDd6XxdXXDAug0ClI9LeYXlcKvALT/Ai/lAbK
	aB8lqsFaByybQihb1CMLuFVM+4XXRTz6pkO0TkG4LiFP/0IrM113+6Uq5bB0ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795009503;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=trp0hOaG0xVF3cJzgF5NrPTjEtVb3/EngWUbAShqdr8=;
	b=IJiyFneZ+mSrusw1f+acqOMmFJT35POKtkT1jpD21MsqQeOKxKpnZtnQ4Byrgqk0lcaI9e
	ir+pJmyOYVRqGtCg==
From: "tip-bot2 for Shrikanth Hegde" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] cpu/hotplug: Use cpumask_intersects where applicable
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261111075945.3930230-3-sshegde@linux.ibm.com>
References: <20261111075945.3930230-3-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179500950131.3191731.13175064869420684309.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     69465ca8f6b5d332e7996643664442a93be254b6
Gitweb:        https://git.kernel.org/tip/69465ca8f6b5d332e7996643664442a93be=
254b6
Author:        Shrikanth Hegde <sshegde@linux.ibm.com>
AuthorDate:    Wed, 11 Nov 2026 13:29:42 +05:30
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 18 Nov 2026 14:32:20 +01:00

cpu/hotplug: Use cpumask_intersects where applicable

cpumask_any_and returns, usually the first cpu in the intersection
of the two cpumasks. However, if the returned value is not used or
only to check it against nr_cpu_ids, that implies whether the two
cpumask have a bit in common. i.e cpumask_intersects.

cpumask_any_and uses ffs on (addr1[idx] & addr2[idx]) whereas
cpumask_intersects checks only (addr1[idx] & addr2[idx]).

So replace such occurrences.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20261111075945.3930230-3-sshegde@linux.ibm.com
---
 kernel/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 376d297..e39245d 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1418,8 +1418,7 @@ static int __ref _cpu_down(unsigned int cpu, int tasks_=
frozen,
 	 * Keep at least one housekeeping cpu onlined to avoid generating
 	 * an empty sched_domain span.
 	 */
-	if (cpumask_any_and(cpu_online_mask,
-			    housekeeping_cpumask(HK_TYPE_DOMAIN)) >=3D nr_cpu_ids) {
+	if (!cpumask_intersects(cpu_online_mask, housekeeping_cpumask(HK_TYPE_DOMAI=
N))) {
 		ret =3D -EBUSY;
 		goto out;
 	}
