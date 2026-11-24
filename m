Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491355;
	b=m1jH6eZBtDTirIPEUYgljKVuxE5Qn4PzCD4Vi7U5ULMTpe+BR2eK/g1zZILQ3K1DsDrG
	 +5oNh7QDpOAPXui7KgqmkjV5QAMoH3DojxpnJ8ds7bEmt1VMgiv+0TOcn+ZRAr/O/Oo93
	 72Xly/1PhXqHyVH0KgIv3dmXKtXHo8gAmNzKESc7TFIzwfI3Co+aho50ia2Hy11MB/70T
	 ohQtfJ/Zu2MUjGWrsGC78jCHAnuEJLrnnqNekS3/mdU8dgqveFo1TfPE1jLGEwLS57XXG
	 ze0rCAPutYRYrMjRSZyXNzBeRXheJJ+O3P7gXDP+GSrEvtr0NE8GQsGfJMvfnAbMh6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gz8mETMe7bzy47y43VlHpH3dB3FxR9QPUjmLcoANy4w=;
	b=W9VSMkGpIK1kj3X3r4Ypcjw5AdsZ42Lt1DGlGTV0funPViOSwYmL/hyQPXCglVgGqEOC
	 bNGi6/v2gi45aHRzfwyMfbDea2Pp+L9NYRbr4xFHe3mmyUgy4YKdX6lvfh1E2umZAgscd
	 AAJ1MxomoFOsO+A121MbQAa5sPndrxYDOljY6rB4JjlidCpALlfHpQfQmRUgXWBenO53b
	 PY5JFF5l37rwT61ysfw22GGVLL2G/nJZJ1lyn0wnmIwN84qFcmFFjvm/oR+Tn3mBKUSmU
	 iWhsOuC+CRHeekCvzVtT60YfF+g94OCmzoGvwY3feEGEjgTa/D+UfxTU8vx3ZsSDMFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE43Uzh7;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41E9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PE43Uzh7
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cddc597d062so2380265a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491354; x=1796096154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gz8mETMe7bzy47y43VlHpH3dB3FxR9QPUjmLcoANy4w=;
        b=PE43Uzh7k6AT+LlkkhBA0JuS+GfcHh7cjdJLi1eV9S/sBX4rDZmUksEJsDT5X2A5Mt
         vTDs9iIN4zLrYMaNALsbLErxH+UEfWcVf7NbdGLJ/Ktcc9icy4sT9Y0QXFduGesdL+Oi
         0LtZj89ZqckwxxdbZZKB5ednKVePeZJCW42Y7Za8jaooj5DdR7a2p3M5s2o1ytmQoKOt
         DwyVBFJ/Cf466eFUO7rRgm4wTzCcx1Jl0hB/319KECUGPmov4OqQ4LM7F+XbawIGo+Bx
         Y2ZuJh2xaDBmHqNrCdh2FU6s7AMnAtiptWRZf7TTAGI3EwgKdk5sWLn8c+bKaUTr3KAp
         9U0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491354; x=1796096154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gz8mETMe7bzy47y43VlHpH3dB3FxR9QPUjmLcoANy4w=;
        b=nPQeUD44IrhCXy3GVP2ylATKz8RvcbL8D9voyrFwI+aQqx7nxPI/aUQy33jYF8qDDz
         8YxH+9PlgagkiCY7jEBJASTtncTaE6p16FOrgwbN+KTSQONF99kPRXYz2MHju6Bq9BY3
         FLNSxWyyRntquBsJZx7OCdJbtQO1NbU/YF01zD3582Gp4nq55GLxOCvor7YVMGDmrFq8
         mcINgK429/UO5N3iTCwLoSBeNTMX/n9XQazE076vHuFCUTgYC3+5TI1hAyLEDqrCUfvN
         uVdSYju9c5txfPaVsKuz9YpZTysrx0uklv1kb0Qp1qEY49hxwYsrxiNB7jUo6N6WmsYQ
         +HfQ==
X-Forwarded-Encrypted: i=1; AL+hErHlpAwbTFjBioSw2JNkhHlNrIyB/Rzaeuhcm8FpjCglxApKkhknBWQkQjW/5ihXaSmD4LApN0JLti6mqbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZtsymOmAT45w7VkJTak2UZLh8VOX/OZLhHw2knYxsFsJhez6A
	iZyBua0uUwt6Q7TnR972bVAJ4P2ZX1a9d6GAH2YUP5EH3PAJL8mLbndw
X-Gm-Gg: AZFdTZeMj9KgUmnsrZcgk17+DIvLrR/7UBNJRFpor6YjTJPDmJI3Q1G2W85wRGK9Ifu
	DdY6Qa7ya6NGzfil2ilMJMOvt/2l2FoiUnGYyEK8pP0JyXte0shf+Zw/QYYLrYR4WMdcwouvTkR
	oeIbUFKDnyNUL4m9okjkvCpsvPnoboQ6PNZ5UG8lmGy9cP7xkmOV7KNFYSNGIQShGJqG4OFymjc
	QWKxk3hJvv7uOnMAClJgAe+LxXaybQ9OsFO1C9K5lnnVWgNPpmQZNEZFUd95Ljo9+CLEPcH1ZxN
	/VvPmrWr9/KuK3Ryn9BLJsUL8xM8y6Uf6Br364mxG4wSzE/Z8cVcoBXQV8vQe2h7IcEpuebOXUq
	+DujAc7XwkOFyjwb7WpOasx8nAT7LOoBt+QhZvIlX7vJtOjywwWx6uT37JOfGFll5N7wxsz5PRZ
	JzByxeCDHB8ATmyOCrbh8BPGCrAkBtF/27MggG0exp5ogQGWhnV5LPEIOJt4lT5ZzzMVdk30/2u
	mmwF+2rfOk7GR48Lp/Nj3SD6qFRJDHyVIby6DEsf32rDMSj3kIwaGp0lgOefgFofOUw/BYVh5tn
	l4bCWsz2yk9JomQNFMKpPRTQ6/AZM3wOWQD7TVJyzZEamw==
X-Received: by 2002:a17:90b:2c84:b0:3b4:1220:36fe with SMTP id 98e67ed59e1d1-3b41c7d0ddfmr11532752a91.9.1795491354119;
        Mon, 23 Nov 2026 19:35:54 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm23397939a91.16.2026.11.23.19.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:35:53 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tj@kernel.org
Cc: hannes@cmpxchg.org,
	mkoutny@suse.com,
	mhocko@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	kolyshkin@gmail.com,
	chris@chrisdown.name,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 0/2] cgroup: list processes whose leader has exited where their threads are
Date: Tue, 24 Nov 2026 11:35:45 +0800
Message-ID: <20261124033547.2373352-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

This implements Tejun's suggestion in [1].  Patch 1 makes PROCS walks
visit an exited leader left behind by a cgroup.procs migration at the
first live thread of its process.  Patch 2 makes the memcg OOM group
lookup do the same.

Unlike [1], the leader does not record the destination css_set at
migration time.  The walk looks up the css_set of the first live thread
instead, because a recorded css_set goes stale when the threads move
without a cgroup.procs write.  With a version that recorded it, writing
"+pids" to the parent's cgroup.subtree_control moved the threads to a
new css_set, and dst's cgroup.procs was empty again.

/proc/$PID/cgroup still shows the leader's cgroup, so for such a
process it now differs from the cgroup whose cgroup.procs lists it.
/proc/$PID/task/$TID/cgroup of a live thread shows the new cgroup, as
before.

Tested in a 2-CPU QEMU guest with KASAN and lockdep on for-7.4-fixes
acec9637e03c.  The process has an exited leader and two live threads,
and one thread ID is written to dst/cgroup.procs:

                                   base        1/2         1/2+2/2
  dst/cgroup.procs                 empty       pid         pid
  OOM in dst                       no kill     killed      killed
  OOM in src                       moved       not killed  not killed
                                   process
                                   killed
  OOM in dst with oom.group and    other       moved       both
  another process in dst           process     process     killed
                                   killed      killed
  test_kill, 5 runs                5 failures  pass        pass

test_core, test_freezer, test_pids and test_memcontrol give the same
results as base.  Patch 2 also applies to mm-hotfixes-unstable and
mm-new.

[1] https://lore.kernel.org/all/305c5803b904a57c188b505d6ed9e1e4@kernel.org/

Zhan Xusheng (2):
  cgroup: list a process whose leader has exited where its threads are
  mm: memcontrol: find the OOM group of a process where its threads are

 include/linux/cgroup.h                     | 18 ++++++
 include/linux/sched.h                      |  2 +
 kernel/cgroup/cgroup.c                     | 66 +++++++++++++++++++++-
 mm/memcontrol.c                            |  2 +-
 tools/testing/selftests/cgroup/test_kill.c | 16 ++++--
 5 files changed, 96 insertions(+), 8 deletions(-)


base-commit: acec9637e03ca54bd3c3a0c1a6ad5c6dfa07c0df
-- 
2.43.0

