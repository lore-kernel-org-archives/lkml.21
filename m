Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490215;
	b=ki60a8KgXefU2w7K7+R6gxD7Z/FD/w5BYmYGtf6ZbO9VVbqIymDurSuONIDkJlYbXp+R
	 LaUED2lspWAuRkM1bynrIySDUaJcEORbLW/uC3unlTRdx4uq5Ac2dxiiHuHGfWESW+QBl
	 17NjJ45YAO488WZ9tstvznjdTuGkjbA+vIdHKmWcjgy17ynHM9wjrBtQm23GJm7iAWdym
	 KbWpc4LHabv5j4OBsa9WLPaLWkaCxoHXSIFce/xQqEdBCDLRo4El77eAEwAN/bx1iHZWU
	 ypQX1swygYwCZYGm8Wlpv+KTuFrY+d2SZMlpTUWeSsaZadx74N3KcYvf4/d+p1QyS8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
	b=V39q/Trwh/vWmGcDkeK4HU8R6l64Ec3folBjMnhdgIy7QflErFdFuKdZojmo56nXOLZg
	 gLNIbgysmHEMkHhhIMYZJLwaub3tq1VOxzE5djfCiC6Cwf9ZmON7QPjxPz556SKNZQUb3
	 SHy/hFql1jriIQUWU97/1jYb0rTXI33ETgFapmkXizChMmOaY8Yj/06Ubf9zlM4EpY58f
	 XdUu5ESSfGcnqIhe9Y6lZZ4t6B9In3oB+5yNhpgzKUWi4p/RhnB5D8jqxGGNF2lS2JcO2
	 491HvzpOSYR6mQzsZz4MNiFKQBJwAbdfHB4pdnHIH83I3ru9WQzP8ib6SK2REvU7LmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFpGA4KB;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2490606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2490606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFpGA4KB
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so31538485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795490213; x=1796095013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
        b=WFpGA4KB996Tu7hKVOnRNmXinER0wbZZXQoxSH7+GXHZ8IoVoxqX7VnyceUOGOqCNs
         WkwohfjDJenHbBSN+VDFxM2jVYwJ8IsOMdUJ2yz+783MhZ1kpbN8C2aVQkAx5KJFz/6O
         VoHrdCqbgxoKlKyvZ+U9LVvXgz7LODsr+/gzoTyfTFZ2ObuAaHFNkRR3uThSRrIGEf6T
         kVDFjPQO3n6MC8I6N7LGXTU/ajuZq9bf060LgWVpNeeuXGSKK++WWXIx9uxb5q8duH+A
         qSAZeckM2cwFAL6//k1WNoopWbqqksKVmOE8m2sd0JcbqjW1nI6dj3XaA604/Jvf2A5C
         94+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490213; x=1796095013;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EKCwUBMZXEgwJsoK8+iw5jP9TfBZ6zy/Sv767cpvROI=;
        b=eKNNDSQSXPrPiKi9XpNE+fG69RiA2kIZBQ3KxOpFGXfjl3ARVyNT1dtRUBScis7Maa
         B5LVEzyd17M/Jyifq/yYlnOFYSe2/eI2D+ERu34Z2p6ZJP5fa0FsBw0gEWq/S8N8B1De
         I88OIsCIKyojF0xWxSRpUXj7H29u+4XD1kXYcPC4/RgACRhwF1ScQgdufS6jkc4G9keE
         AmMZhxyqqHDZpZ/udFB24G4TKe2CjgH/r6bef9nUKgPXoyR2pnY5xwnBfD9PO0lQbkAY
         +EqEQjgcnYfXbo0S1jHG5UzaZHpw9v12tx6Hzn9XxCE8M3pygNYz5zPfeRmkTbPh87oo
         wzfg==
X-Forwarded-Encrypted: i=1; AL+hErHHgUjTSiL3UbXKzU+4F7m2rKiaucsSRKuj4yeeU9htL+LHmU7HpSWGBXj20oXgPtErmcXhRW1+3QHVyBo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZFW71EEJSHjfb0uUQGa3OzR6KYne+iHZnIgcg4i31BUDxHbbT
	0N+SXdoHoBlVFiYeO+HI894QQZBcOx97kWUOA/r8vKw13xEc21kgY01r
X-Gm-Gg: AZFdTZd5Q+m+hjQfWANkeoNQII2MhJXtpMAux4BkUnyMfr1ky1Vf92/t1LB6ft2JTOe
	55vajj+l2nHrUoDkrEwgwGs0J3qKH/jY5Axw09XOaEXJzBfUNng0sYoUk6IVjheSDfMkAQZ6qXI
	j453P+6xOB7voKyrBon73ZnJM0tBwchbT5cFSjUb2vG9Vz3ASXNSJuzF1aA5Lg1Jo+ogZ/Dyz5o
	2Oq4Cojtc9ZHmMkhE+WEBnwqlaIwjIdWya/FiokhE0R0DOu9ok24OgOEWu7T/nr+lczEDkRZFla
	N/RXRyBauVCMOIuUmtwiGSmvotYWHmzIR5MTBaD15BYUp/QDF2Qc7sBftYLjTM5tjAjAvvVWHnO
	U7GQvpE9yjJ62m1r+8cZWl664nHkfQiCgINKM2HbmyuWoz5xbdwIAV/Se+yCNNbBEmAz4cVGTz/
	QgCtRSIdj/vY86lS8USmP/ZyEFlWLET0f4nPqrpHt6PtGZ95PG+YdmID/sUS1baYDLdbZ+RNKWu
	S9y44LFem+R797ppZbiDIvKiONWhTWkw4nzIAUQI4UxezE2nqxI0pQmkSHSz5o48wY6lDe0owtI
	eaI1VaYTYYFrM6yHgPkfDDP9PqgW/+mekpT+qF6ctdv5ch3/QEaOxW05KM+7JI4fvB1CR2YaIiJ
	cDcf0RKILiY6xTcxmwQ1LebuBLAPVva5tfB5Lc/q8eSwx3+lxz6xTCdnG7JFCte9mKcFxQtVCpM
	7INS98/Mm7B8gOjeSRtinaz86p5SXIFa8n
X-Received: by 2002:a05:600c:1389:b0:4bb:6519:477e with SMTP id 5b1f17b1804b1-4bb88813b35mr273527695e9.17.1795490212815;
        Mon, 23 Nov 2026 19:16:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-ad33-0d01-f099-1558-bc26-fd06.310.pool.telefonica.de. [2a02:3100:ad33:d01:f099:1558:bc26:fd06])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm473350865e9.6.2026.11.23.19.16.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 19:16:52 -0800 (PST)
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH bpf-next v2] cgroup/rstat: disable preemption in css_rstat_updated()
Date: Tue, 24 Nov 2026 04:16:42 +0100
Message-Id: <20261124031642.40616-1-kmehltretter@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BPF programs can call css_rstat_updated() with preemption enabled.
The kfunc calls __css_rstat_updated(), which requires preemption to
be disabled while it queues an rstat update. A cgroup iterator can
hit the lockdep assertion on both RT and non-RT kernels. The
cgroup_hierarchical_stats selftest can also hit it on PREEMPT_RT:
spin_lock_irqsave() on trace_cgroup_path_lock leaves preemption and
interrupts enabled there.

Disable preemption in the BPF wrapper after validating the CPU and
before calling __css_rstat_updated().

Fixes: 36df6e3dbd7e ("cgroup: make css_rstat_updated nmi safe")
Reported-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Closes: https://lore.kernel.org/r/20251119111402.153727-1-jiayuan.chen@linux.dev/
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

v2 places the preemption guard in the kfunc as Alexei requested:
https://lore.kernel.org/r/DN26CP5BB6O7.23ALW6CZUBYSD@gmail.com/
Since 8817005efbdf split out the BPF-only wrapper, v2 does not add
preemption operations to the in-kernel callers discussed when Jiayuan
proposed the earlier kernel-side version in November 2025:
https://lore.kernel.org/r/20251121040655.89584-1-jiayuan.chen@linux.dev/
v1: https://lore.kernel.org/r/20261121082843.44614-1-kmehltretter@gmail.com/

Tested in x86-64 KVM guests with lockdep on bpf-next 9867c61abbd4
(base and v2) and 2bf3351c5f89 (v2). Both tests passed on all 24 boots.

  Boots with an rstat warning               base     v2   rebased v2
  PREEMPT_RT, cgroup_hierarchical_stats      2/2    0/2          0/2
  PREEMPT_RT, iter/cgroup                    2/2    0/2          0/2
  PREEMPT (!RT), cgroup_hierarchical_stats   0/2    0/2          0/2
  PREEMPT (!RT), iter/cgroup                 2/2    0/2          0/2

 kernel/cgroup/rstat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/cgroup/rstat.c b/kernel/cgroup/rstat.c
index de816a43db9f..d72fe721cea0 100644
--- a/kernel/cgroup/rstat.c
+++ b/kernel/cgroup/rstat.c
@@ -131,6 +131,7 @@ __bpf_kfunc void css_rstat_updated(struct cgroup_subsys_state *css, int cpu)
 	if (unlikely(cpu < 0 || cpu >= nr_cpu_ids || !cpu_possible(cpu)))
 		return;
 
+	guard(preempt)();
 	__css_rstat_updated(css, cpu);
 }
 

base-commit: 2bf3351c5f894697e8443eeef5333d4c4ce90cab
