Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573682;
	b=L1WOXahXMel3W/d5q5nC36jj+IjB6LOJeiQ6j15Smpk7g7SaZ9Y2Xv1knxjGnx4DMPrp
	 AAPggBZu5aO+g53XRAvvAdMlFjf/AHZTSDzDBLJ1MkKp/W1TSh1Q8ONiW1icoWwQMFYU5
	 F+x8YH9vRc0EsYElqeMYitVMzyhbwVQOfE77EyRifDuIaASSr1KRtPuMvavKrTo9EmFaV
	 B5sX4jIyeZm2i75ZwJLfpvhypktrjEb4P3Jqu5YIs8wz9zPhHlIhtzZUFInhJlizxnIRu
	 4adS0F1OLZVEh9aLomO5bZWRJAtivOLtJBA3g+e7SC/fx4E4nisKWqOoAuLKOfgxC+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
	b=j/AjnxzgvUyn6/38Z5pEAbAyirm/RTj3ZQiA+CGWBTPhOrk/2WE7I6wh4eGrkjBd8zyL
	 VXTvyVzrfFR4Dl17T/PO8CZtln+GvfgUfTYo/0an6ESVnGLRkjSMHSo2cTXnJoqTkBmzT
	 BwOgd+oSf0isT6cdE59lfBykU5Cd3vHshTzjd43fJcJKSVyS9OAq/kA1q123QJXU/gyAP
	 sBQ6jDXK+rWFFVwhGdDaBpLJcU6k0jEfb9bQMOjB+LcpsWk72JKqGAhqWBt2L1K+dwkn0
	 W10AJ6JJUyMgM6oDOF5aX4C/g49MGZJotHlwZ4N2f8VLsleQDANQAP7nvxCnfUkUukw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyrnBWX0;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B51606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12B51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZyrnBWX0
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso2049724b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573681; x=1796178481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
        b=ZyrnBWX0ttgzqFgq0xyQTuGRtOjZfjiHXe7hGWHPPsV+Kxlj403bCAD+K6BtmeRdz0
         8nwOVbBI0bUqV8TTQj8GVoSEJZhq0rJlxVkbdavpA1pQTfIMgr+MoIsyRXh9721bGn2B
         p3/TaY9rLLqxym8n1Wv3nMfXOSxtjRy3O48e6LCg5at1b0dLYw08k3vDNX4ISE37ZgCa
         l7KhkJvcubBSG/XzOQa/3fEY2adfT0GGR4b+FPxYctlo+nV8SgvcJUQNhYhAEeY7I7j7
         2wf+tx1KWOLH6DEeOhCkj5m7iCvkecStfZhZByFG/d5H4LUufAMi/Lsgfdcxv9mm1kzc
         2SpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573681; x=1796178481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDxnzLaRy14zxoKiwsBabewsAmx6hWXhtiUNmVzNEZA=;
        b=keMnDS7qFJN2TIy1GDwWk5sz1Sq6zDRysCVWe7KMrRjBfPTHQNS4kgGAAYSo2mxAG1
         MMxiuTaMZvb5Tq8a9pdqc+XylqA+ect9YUXq9N7jdI5vGQe9Mbo05/ZvCHH5yTNZAzU4
         v3+S0p40ZMZAPBrohF7EXZCRHMkDyiVWbfBSfxV3Dq74cAYfaAvzSyzx5SErg9hZaHQF
         nHHJ4seHLkIO8FqoyfOyx502z/eIcIRBE6yH2e2EKT8iPkuf7pi8VcgM6uer7gfIM9oP
         hrKlESzYGyn4tOKptS0jeyo66lAS3RhzKOaPJJ9njGZuFu7A5Y07AffO3I1vI+9l1oMo
         M5Kw==
X-Forwarded-Encrypted: i=1; AL+hErEsn9w4QXAL3QRC5o2JSqY7RBx8OMXw1m3QyCHbu7DBuPxt2x3OmewMyxPFIe1ohIhdr4LcgjRQH16zzhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PBBLtvfFpUzQya51+G/1aE+VLuwaTwSi/sQuX3wiCRmQIh/11
	+QeDhxww4pYWkw5FkapsJ+mKAmd14DxHId65GyPpPYaEQQzT4yGEHzKZ
X-Gm-Gg: AZFdTZcF4JoxtfsAT3jvA5Nm9+bYetqwo/CNJaLMZWn2C3HuVavL0AGdgcxXqAnO+09
	PdA6l1ByiZyuln+ul8/E2qQCltHcQhw5PzQJELCUb5lRNr4BSyohC0C4tjs97/NtWaiEmmz1cNx
	aADT4uxJNyePCFQ1oHF8pwuVIPkiTxiQIEwSiKSQevcvVJTU4XBAnOTWUQg4nC0OjbeL3z1DYLp
	a1o3kMhfR3+ej1pjcsGGhChnFJ87ZE0YJfgiCwWvcOc+uX81YOegnp7fKEQxP4cW380Q4gAqAoW
	UEe7u2PToqMhtyjVYfKZwsv18U0s4Fhrd2SX259ucLuRFXAJ0D8LuKmCSnwwhAmMkA1H77GVCYD
	KY2ea25FuETxN6HRaWEVcdCvBBk0floPRgKQTeI9Z6FRXd8Onmqj/DpU5mcIOxxg7nN0G1JAmlp
	3QazZFPMTO9VJUG8RwBR4hYrXLXyHKE68JWlA//f+qJiqGOzP3tmkSyMvmMSDmR8gVpizYSbs1H
	IObUAHphC5hhJvxICnd8LeLeWR3Yy+jLO+8O/h7wCUOS0gbNiMLdpKCOq5xc5H4PjD4s9dEzEuW
	Q7ty8cV5lgqW0oKwDlWWMajJ0sGFDCuMvGaEW2LnCdjZiifUvi7pyDJ9EJjiG2GgZfZoSh5/pUg
	GpgS/9gPFHl4yEMxjgOA=
X-Received: by 2002:a05:6a00:6de7:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-8c87bdb52c0mr14274341b3a.10.1795573681357;
        Tue, 24 Nov 2026 18:28:01 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cdfd2d2fc4sm2475115b3a.49.2026.11.24.18.27.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 18:28:00 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: willemb@google.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	koen0607@gmail.com,
	chia-yu.chang@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net/sched: dualpi2: refresh head timestamps after trimming
Date: Wed, 25 Nov 2026 10:27:55 +0800
Message-ID: <d6273ba14831fb2e63413a0c532ccc716512de78.1795573222.git.zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
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

Reducing limit or memory_limit in dualpi2_change() removes packets with
qdisc_dequeue_internal(), bypassing the timestamp refresh performed by
dequeue_packet(). The cached c_head_ts and l_head_ts can therefore refer
to a packet that has already been removed. A drained queue keeps a
nonzero timestamp and reports an increasing delay; a partially trimmed
queue reports the delay of its old head. These stale delays are also
used by the PI2 controller.

Refresh both cached timestamps from the internal queue heads after the
trim loop, while still holding the qdisc tree lock. head_enqueue_time()
returns zero when the corresponding queue is empty.

I identified the issue and reviewed the fix. OpenAI Codex assisted with
root-cause analysis, the fix and changelog, and automated validation.
Local regression checks on arm64 net-tree kernels in QEMU pass three
controls and fail eight trimming checks before the fix; all 11 pass
with the fix. The tests use real AF_PACKET traffic in an isolated
network namespace with HFSC shaping, without fault injection.

Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
Changes in v2:
- Drop the 659-line selftest patch following review; retain the
  regression checks for local validation. The qdisc fix is unchanged.
- Add Chia-Yu Chang to CC and use Koen De Schepper's current primary
  IETF address; the Nokia Bell Labs address used in v1 bounced.
- Check the patch with --strict --max-line-length=80.

The local before/after tests cover C/L dequeue, complete and partial
trimming, mixed queues, and a configuration change without trimming.
The baseline passes three controls and fails eight trimming checks;
the fixed kernel passes all 11. These tests are not part of v2.

The two-line fix and its arm64 W=1 object-build results are unchanged
from v1. This revision does not claim a new full kernel build.

AI assistance: I used OpenAI Codex for root-cause analysis, drafting
the fix, initial tests and changelog, and automated validation. The
revision prompt asked to address the review of the DualPI2 patch.

V1: https://lore.kernel.org/netdev/20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com/
Review: https://lore.kernel.org/netdev/willemb.4158a0ba73d8@google.com/

 net/sched/sch_dualpi2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_dualpi2.c b/net/sched/sch_dualpi2.c
index 4947def7c4..79eba7209e 100644
--- a/net/sched/sch_dualpi2.c
+++ b/net/sched/sch_dualpi2.c
@@ -938,6 +938,8 @@ static int dualpi2_change(struct Qdisc *sch, struct nlattr *opt,
 			break;
 		}
 	}
+	WRITE_ONCE(q->c_head_ts, head_enqueue_time(sch));
+	WRITE_ONCE(q->l_head_ts, head_enqueue_time(q->l_queue));
 	qdisc_tree_reduce_backlog(sch, old_qlen - qdisc_qlen(sch),
 				  old_backlog - sch->qstats.backlog);
 
