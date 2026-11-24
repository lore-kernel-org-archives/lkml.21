Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=1.95.21.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507931;
	b=eJtlFJ2Hcj7/gD8hOo0/PiPLT5mrPwlxrC/7LLLzXImBBoSl625s017ZYc6aB2Ex3NJm
	 mvf9MwkEuyPQB09sN6SVwcP8fsIlLkqMIiSXiTnW3Q9LE0Bfwbl0QV+YI8Ex7z4so6RR/
	 RKfWJhVi1qxE6QRfQX2bZ2wEo0fg5uQVDZ/Fst7Jy0kWYJCdMe7APVhP7WIlsneWZF6Ra
	 GoT+KdSI50/ZyndzqxMi25V/E9cRzPDxTPVtY+YKGh73oXy1CjFGJKF7gupLGBxTYRFHa
	 dmys4CAHs5hAW8tEXJoLqSItlDdVhxmrK6Z2rcjLxAzztb4fgI010EM2FDG9U0GDgEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507931;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=l9ro9U0YIIC8u0lGR4lt8aSW8AeGVI//XxJdwRHEOU8=;
	b=ndrCkmEi2k6wSY9zEcqcXgvbB9omnbMp7ZD8NhL4LdcxiZwmgQYlDHXQojGKT9AmFCvY
	 CGnLsbDMUknljUXfoSrKf9RR7CKL+GgctdYD6p5Hc6Y4dgIaJPBHWLjebiQA/RNEVMrn9
	 ejgmQ039t9CqtG/06D2sAkm/ShWC6S5QCzsTBaTAcBgvCRK5N+TBDX+ZdVP2ZDw+Lx15P
	 NOHDbG5LU61WdjtrVDeTDzRlnTr5echa58VesxIWPS/qWUEa0Lwf+Ohw51P3BrVZBjp8W
	 YJqk4jLTZzJXAlxu4xkGlygMmTTYrcHaqq1+kakUaBfrlc8H7FkJTnJb1GBQIwUUk1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yeah.net;
	spf=pass smtp.mailfrom=yeah.net;
	dkim=pass header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=KT3vGEDY;
	arc=none smtp.remote-ip=1.95.21.17
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81330606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81330606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.a=rsa-sha256 header.s=s110527 header.b=KT3vGEDY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=l9
	ro9U0YIIC8u0lGR4lt8aSW8AeGVI//XxJdwRHEOU8=; b=KT3vGEDYXwiD/JXp2q
	vRxxH7ZbKBvDIcGxRhVa+lwlIOS0RXqO7JOSLSBqWKLo4EgHss+hhwa6cJlw72+R
	L+4T4TYYasfVHm8noBkV55Asdqkcqa/x3FsMbEStcRwWo9JIfR3yzYamD1mflkjO
	gWcJhbgkJSOdcG0Py35vhCIoA=
Received: from deepin (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPA id Mc8vCgBHhkiORgVrTsqIBw--.14677S2;
	Tue, 24 Nov 2026 16:10:55 +0800 (CST)
From: Ziran Zhang <zhangcoder@yeah.net>
To: Oleg Nesterov <oleg@redhat.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org,
	Ziran Zhang <zhangcoder@yeah.net>
Subject: [PATCH v3] sched: clarify ptrace's effect on task_struct->parent
Date: Tue, 24 Nov 2026 16:10:01 +0800
Message-ID: <20261124081001.14422-1-zhangcoder@yeah.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260910133027.8453-1-zhangcoder@yeah.net>
References: <20260910133027.8453-1-zhangcoder@yeah.net>
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
X-CM-TRANSID:Mc8vCgBHhkiORgVrTsqIBw--.14677S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWDCF47urW7urWDWrWktFb_yoWfKwbEva
	yxJw48C3W8GFs7XF17CF42yFWvgw4UJF1xZFW8KFZIgayDXFs5Gwn7Gr1xt34fGFZxuF13
	WFyvgas5JwnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: x2kd0wpfrgv2o61htxgoqh3/1tbiNg-QkWsFRo-2AAAA3p

The current comment for the parent field does not explain that it can be
temporarily replaced by the tracer when the task is being ptraced.

This can lead to confusion, so clarify the comment to document this
important behavior.

No functional change.

Acked-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
---
Changes in v3:
- Remove Suggested-by tag as requested by Oleg and add his Acked-by.

 include/linux/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 705970d07..8aad8a8ef 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1093,7 +1093,7 @@ struct task_struct {
 	/* Real parent process: */
 	struct task_struct __rcu	*real_parent;
 
-	/* Recipient of SIGCHLD, wait4() reports: */
+	/* Recipient of SIGCHLD, wait4() reports: ->real_parent or ptracer */
 	struct task_struct __rcu	*parent;
 
 	/*
-- 
2.51.0

