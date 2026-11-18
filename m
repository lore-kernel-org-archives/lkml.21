Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983974;
	b=D/mYBixzMlh3E52YybQPcujlXw4YoMzaTXnuk1b7FTpvpew9a2mpytQ40vL/App65iuF
	 aEpyuZNnQAtdLWhKvt4CfBieQkmdLOm36wGchseVG2/Mri3TkBRilE2tV8QGeAhFn/pnm
	 zj+6mQRiW3IPH+NYsvYi8yJZivma4bXM22kCjFktnnTW2OkgJ+S6VAB+WMqKGV71C7aIC
	 K6WVsQtQl5lhFJiDMF+oEwIs4XwkgqVp1mQ2I4wZ5QQju6sOxrNnWIZEMOud7L/+deRTt
	 uMK8oS2M1jX9CzhLD/V9J2MBiIv/POyVjmkwHKZb2P1cn+UR4gELiWrzhdvhjDW/mzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
	b=aSd5/N6Q5OswrlTfDaCM4r/xMRWmdVgOfTwRrzD8Q9odS26qNm9+UkdtbdAaP8hfvkBq
	 SPWswkfRYpx0r+7iau5qj1/G5lrtE0sDZxzBK0Uqru4Qqw5hsPp2f03FptU+B88bH0qFG
	 a/92duy+gXh863MFtt+RtrCXOegEiVmzvW2SGKdnDHm9Zqp+YRNJIThfASCC+m2PIgm8J
	 x1LhdZurmQQsyM+REHy4NeAhd6cIUVTxXhlhJeE08Ff2g0H1DiDyP8NOEcHWwTpo53D53
	 u2p/LlDGwUdmfBEqvlKaBuU+Czl7srZMbSZ5SHVkLyAk5cAjAKi2dBiohRN0KIayWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714A6606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 714A6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fraUT9mF
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso287110a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983974; x=1795588774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=fraUT9mFHK9og4458A+ZbVxONdM9BrGJ9bX9Kp+OXfOb9NeYDjpjCoMbZ3cosjdsMn
         txiPE7W0rSaEf6Rdy/FOVk+s5d/sQgGj6gQk10guHUGKBpu48l79tsHDhP0JZSV3loy1
         o+U+vaM7FiIUxLHy8H203NdhjTNa/PwgWsZmYJsGI6EFuy5C3kevAHOPznWFUWQRiH2U
         51eUSNNAAZGU6Iv/R/NaaPS3WRRIkms3+8XzRq2W3VRPdRnJ1VKrsqVELlStAw4b7Qm4
         WS2QFQgW5GrAXtfKCa3TcnSRclBlAspk+NpBzi+1QhTcpWQ14Kg2VjF8Egcy/6bHgo2+
         HPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983974; x=1795588774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoczeufkw3DOf+e+V7z0I3M4e1H07M0CJBQzemDHKiA=;
        b=a95A7F1S92Ew3Id5qOQ7ta02l3cANBD4Vte7rdpkxtEMXQDSI3WVbjRa9PM4LVY7r/
         LeTm3xId2CbF3fBeiuxlh+dQS2X2BIRpI8RaiGQSB5q9CS/ZgQWyXajkMa4wnlFAGsh4
         A9iSNWZ1KCzLh11jO6og+c3wqMFcjWhWUrlYnQD5819XyMwpupYmD/c+nBJLAwwr26dc
         QMDJlbsKb4YH3KGCkri0+wP1H8xUvFprsPQVv3MjRjbb0I1+0P0gyV75PIE1zJkKcmSn
         t3v46aaqYTZTrOmFHozDdFGSyq3k+n91kG8caPz5XIMedDcdaVqy2wAsmRb1OAisa+Qb
         +UwA==
X-Forwarded-Encrypted: i=1; AL+hErHvEK5RBCwrrWBlngPIIyAYZtEl7HEYhFAlOtUsCx8CQLRUqM7jiAAZ+iv8h+np2ar608b3x7ITuA3CiWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FRYxnty/xGIqtCYuTH9teZoxb0bKim7bUd1DblwHFFCxVJ62k
	PacaGvwR7R+JuzL0qMUMlrx7Bj2nYIwR9crHumZ+sWLiQ9oZrYlTU8q5B8kSxKxy7us=
X-Gm-Gg: AZFdTZc+CnkPZ7CTvVdgDISBI4fTOj0a4baxX48q8MqV3sRHhHCDZicr+dFmGnxdIXn
	bO4qBxAn1vth8EW4X8HjDFcnihSGuJ7YV+t9b7+Jd8gbbzFucQqgjWIext0lY6/DeFOL6Ayo6r5
	ugHbrooJiSEs6uSSNX3uJKzgEcS1VQiSqJgzjfA8UcB7OkFapvJgrGseojguC+rBLZbfepd48zS
	9ZMjOTLehPCZPvqOF3N8eplDJtXO4iiJAATx58JvaoWBgCJgwPfWEH2O3FM8hHhIVA3nbBb2q27
	niGTV4H2gnUnTnAo+dAewwYdcwYF6tEQS7RuHYgnBtVcniJ69jgF75a5pNGxO0UdaaRzX773lAX
	Ow82lq/fu2hGE2yGd1jCnrQ/ZBifFNzF8TFLsqoN+V3PYak8sSsqi7pDGjJFiV51d+qOEL69WcI
	t/lujrPSHWp8/v8J+4wez9NIF9v0WO3U3xsuyrbzzVLVYuBMnJtL6Q1x+snemKxyJ0nLIchLiNg
	n0T+EBX8Hhn4nSOpoKPII1pCzHAEveeot4bV3fkWcCkn1YQGdXFyH31hkARLkmXotqYDMynBimi
	AqqnqMKys8c+ndTr4RKaRmRswIVVo+KOh58nEvvkLrkSjD0cL/bLvj63Rz2eoPaS7U2v6/nyF9O
	kbZuxYJR71fgVCIrGuWJksM46sSCn58aKPKF4LsI4RvR2DqYGHQ3V
X-Received: by 2002:a17:90a:d445:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3b3d06873d0mr1539328a91.2.1794983973868;
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:33 -0800 (PST)
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
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net/sched: dualpi2: refresh head timestamps after trimming
Date: Wed, 18 Nov 2026 14:39:21 +0800
Message-ID: <20261118143500.dualpi2.1.543a9a1be910-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
References: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
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
to a packet that has already been removed. If a queue is drained, its
timestamp remains nonzero.

get_queue_delays() continues reporting an increasing delay for the empty
queue, and calculate_probability() uses that delay as input to the PI2
controller. Partially trimmed queues also report the delay of the old
head instead of the retained head.

Refresh both cached timestamps from the internal queue heads after the
trim loop, while still holding the qdisc tree lock. head_enqueue_time()
returns zero when the corresponding queue is empty.

I identified this issue and reviewed the fix. I used OpenAI Codex for
root-cause analysis, drafting the fix and this changelog, and assistance
with regression-test development. Codex also performed automated
validation; the archived results are described below.

I reproduced the issue using Codex-assisted automated tests on an
unmodified arm64 net-tree kernel in QEMU, with real AF_PACKET traffic
in an isolated network namespace and HFSC ls/ul shaping to retain
packets. No source changes or fault injection were
used to trigger the bug. The companion kernel selftest covers C/L
dequeue, full and partial trimming, mixed queues and no-trim changes:
the baseline passes three controls and fails eight trimming checks;
the fixed kernel passes all 11. Runtime coverage is this DualPI2 selftest
on arm64. I also used Codex to build arm64 Images and compile the modified
object with W=1; additional build coverage is in the cover letter.

Fixes: 8f9516daedd6 ("sched: Add enqueue/dequeue of dualpi2 qdisc")
Cc: stable@vger.kernel.org
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
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
 

base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

