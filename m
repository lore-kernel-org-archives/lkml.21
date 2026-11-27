Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767487;
	b=ADv1L3mKKXa5o+5BsfHADP5bHixWSmW8Ndztm/wqAu2GhYX4AYXqkWtVbAa2z1I96VZQ
	 lfIGo15uAY+Njy7qu/OhTQCRLnQs8UHQ7/QEjDMwlJuYcjHAauUVan9hQ4qRabTnAlvVs
	 mY5kBFUkhv2JoDsyibZXKkcIci/mgwtWLByT9fT9Ok3NZT0XR+Pksk5n3BfEP8X39+kIi
	 UjilfFdooy47+wbIO85ge5TCZlFex4JhMQiAsSLafWivaYPLA4i8jWkCtvSowN1h3GuKd
	 KacAVgDuv2ZQVhJtK5DZ/1VD1um1tLaY63jwm1G2HkdI8zEmjlUFZzSKKc45Zxo3ecw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767487;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=7QGeJWidz6c8FdxSEbDOXfVOMKv35Ol35h6d4CjOJEQ=;
	b=WWwD6hllxu61V4zpM9xdXiQFvFh4y/Um8waKtT8OIl4jmeS627mzvn8CmuPBRWNtVdK4
	 ru15SSX4cm7bO7M/HSmghGFZj23iLGEFND5fm9uvhY472N+oJ6YuDMkkhXRy6XemKkfsu
	 Vee1MdMcAeUX8SW9Uq5zbqlNbjxkd87e9GE9meEeaq8mlWfC/NuVWIsmtsEpAkijWeDlg
	 R8ZjunKRhdVc6kJ3kIpEGoIj/cmLTl/+TLxn76DtSbpOqGyZh8J+TPSul5QILDR9lF21a
	 j36LFFcW/yMYpJ67jaMHh7DWYYUYCAvzPz01wB3ZSRlPhpN7bjes61lYxgEbbzL7hiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cedO0Icf;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16E8606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D16E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cedO0Icf
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AA571758;
	Fri, 27 Nov 2026 00:18:03 -0800 (PST)
Received: from e127648.arm.com (unknown [10.57.70.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F8AB3F86C;
	Fri, 27 Nov 2026 00:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795767486; bh=w7s3+IlhcG15VASI78kwNc9Nt+mliWS8M9atS/fYjr4=;
	h=From:To:Cc:Subject:Date:From;
	b=cedO0IcfIB/WwJeY1VD1nS21j9MSFTPvt+dYKglcR4hiSwxGowyEEruTR7diGbBW1
	 r8F43H/TiPtEztrNt1KByRO0IhIwyYPvueFfWVrxcFkVfpxxTk2W+Ohn7/aikw0mMX
	 0t88NknxQ8o3PHsjs5rt1IUr3NpnrX3FboTtZXo8=
From: Christian Loehle <christian.loehle@arm.com>
To: mingo@kernel.org,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Cc: qyousef@layalina.io,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	jstultz@google.com,
	kayracizmeci@gmail.com,
	wvw@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] sched/uclamp: Fix dequeue accounting across static-key updates
Date: Fri, 27 Nov 2026 08:16:53 +0000
Message-Id: <20261127081655.3159258-1-christian.loehle@arm.com>
X-Mailer: git-send-email 2.34.1
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

Static-key updates can let enqueue account a task before dequeue observes
uclamp as enabled. Patch 1 checks the task's effective UCLAMP_MIN active
flag on dequeue, so accounted clamps are released regardless of static-key
update progress. The early check keeps the unused dequeue path short, and
enqueue retains its static key.

Patch 2 picks up Qais's idle-flag wrapper cleanup from v7 [1].

The measurements below are for patch 1 on v7.4-rc4, before adding patch 2
and rebasing. Each cell gives fix / always-on percentage changes versus
unfixed, with CONFIG_UCLAMP_TASK=y throughout. The unfixed and fixed
kernels keep the uclamp key disabled while always-on performs accounting.

Nine fresh boots per variant, 20 measured repetitions per boot. Changes
are geometric means of paired boot-median ratios.
Positive time/latency is slower, positive throughput is faster.

 Workload / metric              │ i7-13700K: fix / always-on │ Xeon: fix / always-on │ Orion: fix / always-on
────────────────────────────────┼────────────────────────────┼───────────────────────┼────────────────────────
 messaging-processes / seconds  │        (-0.06%) / (+0.09%) │   (-0.40%) / (-0.21%) │      -0.38% / (-0.31%)
 messaging-threads / seconds    │        (-0.19%) / (+0.05%) │       -0.86% / -1.77% │    (+0.10%) / (+0.11%)
 pipe-processes / usec_per_op   │          (+0.18%) / +1.56% │    (-0.002%) / +2.41% │        -1.17% / +1.19%
 pipe-threads / usec_per_op     │            -0.78% / +0.88% │     (+0.01%) / +2.91% │    (-1.61%) / (+0.53%)
 schbench-256k / rps            │       (+0.002%) / (-0.04%) │    (+0.004%) / -0.05% │    (-0.20%) / (+0.03%)
 schbench-256k / wakeup_p99_us  │        (+0.42%) / (+0.51%) │    (+2.33%) / +10.62% │    (-1.44%) / (-0.37%)
 schbench-4096k / rps           │        (+0.00%) / (+0.00%) │   (+0.00%) / (+0.00%) │    (+0.00%) / (+0.00%)
 schbench-4096k / wakeup_p99_us │        +32.68% / (+12.93%) │  (-10.66%) / (+2.71%) │      (+3.03%) / -6.99%
 tcp-stream-1024 / Mbps         │          (-0.24%) / -0.69% │       -0.61% / +1.07% │      +0.36% / (-0.52%)
 tcp-stream-16384 / Mbps        │          (-0.03%) / -0.29% │       -0.57% / +0.23% │    (+1.04%) / (-0.82%)
 tcp-stream-64 / Mbps           │         (+3.05%) / +18.60% │    (+0.12%) / +23.54% │        +2.50% / +2.09%
 tcp_rr / transactions_per_sec  │          (-0.57%) / -1.68% │       -0.66% / -1.33% │      (+0.10%) / -1.58%
 udp-stream-1024 / rx_Mbps      │        (+0.19%) / (+0.17%) │   (-0.41%) / (+0.32%) │      -1.58% / (-0.63%)
 udp-stream-128 / rx_Mbps       │        (-0.82%) / (-0.15%) │     (-0.38%) / +1.54% │        -1.31% / -0.69%
 udp-stream-16384 / rx_Mbps     │        (-0.31%) / (-0.49%) │       -0.35% / +0.30% │        -1.52% / +0.61%
 udp-stream-2048 / rx_Mbps      │        (+0.02%) / (+0.06%) │   (-0.24%) / (-0.09%) │      -1.18% / (-0.74%)
 udp-stream-256 / rx_Mbps       │        (+0.33%) / (+0.29%) │       -0.72% / +1.56% │        -1.76% / -0.86%
 udp-stream-3312 / rx_Mbps      │        (+0.38%) / (-0.07%) │   (-0.04%) / (+0.14%) │      -1.18% / (-0.54%)
 udp-stream-4096 / rx_Mbps      │        (-0.06%) / (+0.22%) │   (-0.24%) / (+0.08%) │      -1.31% / (-0.66%)
 udp-stream-64 / rx_Mbps        │        (-0.18%) / (-0.17%) │       -0.57% / +1.20% │        -1.51% / -1.45%
 udp-stream-64-pinned / rx_Mbps │        (-0.94%) / (+0.90%) │     (-0.28%) / +1.63% │      -1.21% / (-0.30%)
 udp-stream-8192 / rx_Mbps      │          (-0.25%) / -0.39% │       -1.54% / -1.01% │      -0.96% / (+0.15%)
 udp_rr / transactions_per_sec  │          (-0.72%) / -1.69% │       -0.94% / -1.55% │        +0.44% / -1.84%

Separately, paired log-ratio t-tests with Holm correction across the 69
fix-versus-unfixed comparisons retained only significant regression:
Xeon UDP_STREAM 8 KiB throughput −1.54%.

[1] https://lore.kernel.org/r/20261126012836.15205-3-qyousef@layalina.io

Christian Loehle (1):
  sched/uclamp: Always account active clamps on dequeue

Qais Yousef (1):
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE

 kernel/sched/core.c  | 27 +++++++++++++--------------
 kernel/sched/sched.h | 10 ++++++++++
 2 files changed, 23 insertions(+), 14 deletions(-)


base-commit: 029fd68a263364583b6f9b34d22761acf0a3940c
-- 
2.34.1
