Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795249735;
	b=OfDR82HakAKcfaWsAT/j+i/skh4NB37PjGoQLqprK4gCWt0EIHwEV8pmUIAJ7gMhqzP1
	 19IeamLG4r1VcfI7iQ1CPE/G3cLGSvV35mu1ilhZD6+U2dkhjDUQF5lvg9Y0Ca7OgtGo3
	 L2woZlPFc10GrKdgIdkwpROL13xWx7ER/amSkeNirby7cqDIF//tNSWXODnS6QDq5LeQg
	 2V05DST4RojnQ6sm6WBsgLwCWfJ6UsIIYq+KYvtgH0MC9GnEX5EmOsqyy4cF/wtk2y8HA
	 81kr9EzB08uzroc6fd71rEbv163ObXSvuGvjLfwWPGgab/MXFAIt1hSLeC5BvkQoaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795249735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
	b=t5TKynsXjnpUnmpYlY4Xkv+Quu1opDX1Jegc09QIBEcVIfGK1iOZEbC+G8Hz6dWOCpsF
	 VdF735uVmdT3xBZzz0Pr7vGsIG/5BGK0oLkUFjzSm4jvkIDCv6NYVtDIlFOGUyQNZ7Blx
	 K+GQd49os1KK1HUy4JiddnJA6Z06I7Il7eevscGghA33YQZxZ2/B/PU3/a4g0w3chpmTR
	 OmKiVIyBzhKvO2SyOssxgTh22Z+gpcD1C6ao05sBUto3c/lv3XIkPhuC+grCVuU6NhKV8
	 8KFrSEMtjEh3+peXQWiA8djIk6RQeKLz2P/mWziIj0Qs+kfN2bj7NQbIPC/we8BnSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWTvHv2M;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8666A606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8666A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWTvHv2M
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1161247f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795249733; x=1795854533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
        b=JWTvHv2MoSyG38P2ut6CGuOo+RMs6DecQiq+J9y9TQm+XNetpG7gWzCduF+1Dq+EcA
         Y3FOLIeetVe7r6I7AkfF3FK/laIIZPksmjpIosdGBa3KNHqZUb+OZKE+yM+md43V29w2
         sovrWZbaKaw9XEZHUAgcsp3KxNw5lz/6bbZZEGeXpRPcTr8OJMWGps9G3UBVpq/fZnXf
         Els2ob3iY6686NjEuUwxO4w+d3OEy5z9s2KtJHmHa57HDi3rGQggnI0NaEjh365jLsnZ
         V1namk7Gmdj0DXYajWjOCesPRxk5t7JckHbva5Y3AzE/T0AJmDsb7dApwqBH9cY66ciZ
         rdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795249733; x=1795854533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vA0VgrN/AJbvlL7DFILZtRf61HlqOG1LXfr01uh4umc=;
        b=p7zBrvwYCJ9lzvLNz8cCs3/guPj+6yXVnHdj6eLFw8HEo03Zi3fw4lvRP9AjMo/pOW
         /hzm4NbsESHyr02mPXi+UDBXdQIjVTXen3qBCa6EFw5dHt+km9oq3bc/MrDGJf6byI9O
         nRtGnkGV/X9bCWVmUkL3ryO9JxsSk9A3JArR0rRoLXNp874wZcyL81uukGyHBnr7QSNG
         e6wzakRXqiX0LkuQqizPp4qozpTIQ6q8DrIx7cg7SctDU0czvEBAy1umpqbNdfIWneNU
         6Z/JvKOfea8oZfbLy7R8gng1F9KOsSnIkUw5Bam+Us2vff8x2uzWn181pF6nXlFlWnfB
         umhg==
X-Forwarded-Encrypted: i=1; AL+hErGIDgrksebeynenP9msQFk1MkkSvexzTcI6o6JOBupNCUllxxEmedVzcnesQeeU74UDYZ9jHSNPZ2JMnwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VfvuN6PeaeQNySVT1PsGoAKwMNycpfmtGogO136BLMoHeHIuk
	H21SjAazi+OmQQPHkgcDhZqhG2ooO75f6aX4zfd4pSsn2BLO5dKi3NO2
X-Gm-Gg: AZFdTZe9eUVrjUTSkYvRJk8tESMDBKHhn3NDEgdzIf5xPL0xOvH4LU/+3cpj6YBIBeW
	y6l0eyWyIzj+irItfkdYBT0xQjqNL1hFYQh+okU68OJ+DkvXof/Z7Ym+oA2qn2BJQUN0xSNtxUC
	pCLq91XJXj2nwGlxKPZLwVuFH0hMqD6Db287Q0tq5TfXyOTsOi+R5qACyk9tiGebWMxlu70aaKb
	QfeJ34/tJK1FVkUGgQwsVZpgLiojGq0FGdqX1G05agg6o1yXdvUqZUiYA8uVMEzvY0YKu+LgXGm
	S4z2k3Kg6zCN6eH9+4gt7S+54LaF0dlZNKNGz9nZBG/S5jFFHZDueULkakEFP28QVdnxsy1zVdA
	yA8AEZvk2XWNco6GkMUlK4J3zIPEG9tNj+rlfRc00rORlPbME7q2L/fPq4VHnpJmneEkrRSb1bE
	THPXRCdOGvitFTZgAv/1ZVxXpHiTQ9EEJEy5d6rbf2sYQ8NsfVnLZwD1qMb/vNALiPIABmhPpDZ
	IH6Jj7srJSePVm5JfvLrr1yMd+zwngF37q7DeajzjLi2b4cFfcpBcXMryn84HX9i97wxyT56cQd
	Bz+xy9lhu8V4+kuhC50zUConb5mwdVPC04+Zjlr9wcKDYJXBnFIpq/lVcegIKTgKKNbfRZN/aA/
	rIyQN+BQ22IaxrqwchMU7kH7b+QWt/kvcVF/oF9WW537FVORSu2SiJ/6NGLt38Gwm9gs53Qrofg
	DNZbgfzHDAH9I10WEh5FQX/X1/RkG0mgrv
X-Received: by 2002:a5d:59c9:0:b0:4ab:f5b0:a7fa with SMTP id ffacd0b85a97d-4abf5b0a975mr10806542f8f.33.1795249732684;
        Sat, 21 Nov 2026 00:28:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb0-6801-ad74-bca0-dc5f-7242.310.pool.telefonica.de. [2a02:3100:aeb0:6801:ad74:bca0:dc5f:7242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb4341sm10892378f8f.4.2026.11.21.00.28.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 00:28:52 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: bpf@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH bpf-next] selftests/bpf: Disable preemption around css_rstat_updated()
Date: Sat, 21 Nov 2026 09:28:43 +0100
Message-Id: <20261121082843.44614-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

cgroup_hierarchical_stats triggers a lockdep warning in
__css_rstat_updated() on PREEMPT_RT. The counter runs at the
cgroup_attach_task tracepoint under spin_lock_irqsave() on
trace_cgroup_path_lock. On PREEMPT_RT this leaves preemption and
interrupts enabled. On non-RT it masks interrupts, satisfying the
assertion.

Disable preemption around css_rstat_updated() so the updater can queue
the update without being preempted.

Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
Link: https://lore.kernel.org/r/fmey2ektwdk7l5aktjz3xb24x3pk3lxy3gfld7reazal6xa6u2@tmryedehqhql/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Ran test_progs -t cgroup_hierarchical_stats on bpf-next 9867c61abbd4 in
x86-64 KVM guests with lockdep. The test passed on all eight boots.

  Boots with an rstat warning   Before   After
  PREEMPT_RT                       2/2     0/2
  PREEMPT (!RT)                    0/2     0/2

 tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c b/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
index 8fc38592a..d4babda81 100644
--- a/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
+++ b/tools/testing/selftests/bpf/progs/cgroup_hierarchical_stats.c
@@ -6,6 +6,7 @@
 #include <bpf/bpf_helpers.h>
 #include <bpf/bpf_tracing.h>
 #include <bpf/bpf_core_read.h>
+#include "bpf_experimental.h"
 
 char _license[] SEC("license") = "GPL";
 
@@ -76,7 +77,9 @@ int BPF_PROG(counter, struct cgroup *dst_cgrp, const char *path,
 	else if (create_percpu_attach_counter(cg_id, 1))
 		return 0;
 
+	bpf_preempt_disable();
 	css_rstat_updated(&dst_cgrp->self, bpf_get_smp_processor_id());
+	bpf_preempt_enable();
 	return 0;
 }
 

base-commit: 9867c61abbd44f7053a871566b3d982f62c6d8dc
-- 
2.43.0

