Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454285;
	b=D1RW6idwPEzc8OaMxiJqUceZikOFLIyd5zzdPNh2FkWMjIbVcn44Hb4UO0L1uUSWU5Oa
	 Ku+cA44vO84saXzRhFRSPqUGWFmI5u1ti7q5Vz0Ck3P3jN879DBLo9WB9crGis1CrMVyR
	 8fEQcO9hIFBhIuywsanMjKpIPNjmN6wZr66QUzk5qMcbNBDMLP6D7M72MZzyzRpL///Lt
	 WZ3CIDTuOU3+XVN7Tzk8a4GihU9vqD8hh4ZWc8RsCBvXmTNOpZWqHF719KY+yqkmNQoCu
	 kHxzPiC6Ybnbil3RPn8nD/uNl5OwU9zo/JSRJhLPFgxyOb6GxqGSF6RIS4f9a0np86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=SjPU9PszbvbGis4LQNlKF5kEGLQKetvEHjZ+pbNntGc=;
	b=3AM4zr5rjv3IlYFDHAq07nXhyysI7Vh4YNO4MAUqV5ix8d0xi8hEDSWlHmKx85E2kDnF
	 ZkzTgW9Dxy0uWGK76UTym9CbRa+6GCh3mqjFdJ5GFC369ZfX9yzDSzelfHp2DhcM8jcS0
	 /9saNEX05lHgPiQRDyhMWJsSaiZmSE1/gIAbnbMWvjT5AQxPTUQ0OprZuzr/KQ4Xx2IkM
	 pliwpNgJiSX+jKjf1gxqiQljMs+fIR7x2SOZjxa5MWxVLWUVJXIx15xXiMm+fHFKGG6V7
	 f6rqCwQDfWaZMSHdI8wQ5hMN7ttS2MOd3wWjjbAapEgKNOhTh3oS48QjOI0b5D/CcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dkSwTm8A;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7315C606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7315C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dkSwTm8A
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b0a307487aso17765295e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795454284; x=1796059084; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SjPU9PszbvbGis4LQNlKF5kEGLQKetvEHjZ+pbNntGc=;
        b=dkSwTm8A56a1mBoi4g4Lq8VaVRF1MJFmDWxmDN6cWM30sfS1Fq1r2wPDyY/6UPBGXA
         YDXBt6xReJaiq9ePYO+zr4NaXj/psCDSV5BgLI4WWkpOgPX9ocjlHyS6vwbyNqZJl4pN
         DDGGnEsU39dta1J6iG1UaAJlCiWAWcNFjJ03ei70YPcLdxVNVKY3gLgwPgXKU+Bzw/oa
         oD0G94MIXzhmh5iBGOx/6rPuy2MTY8W0ZWSnxDJXwuS97GUj3LbBwdo+UOkxyTpmqgJ4
         GQPuQOHqKOiHJzlrnMFuKrIeswnaTt2rGzLKGM4xtPBdy5sJaHYtrsQxEDPB9De+9Qrd
         9INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454284; x=1796059084;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjPU9PszbvbGis4LQNlKF5kEGLQKetvEHjZ+pbNntGc=;
        b=eWnjpc/IS0XGGyg3pEpH5g/TX7RCcx5lEC/KX3jtZQHDutUFR8a2TUNlH/TJ6ZJMHW
         UPBCU51Cd2/L/i5dJ+7jq+Pn39QgYFuwAe/b0UhVE3xPaNwMb51UEimEwvUyfFx1z2Iy
         GRzzJWM1WWGV4EZNTIUlrxqT5JFOnWTHhUZsSno1LYRvxhYfIUc9kP/8moIulEwKXVNv
         P5Wvgs7tUwG3Nwpn2W3fyRVjpkLJGbIIxTQKPM6FoWuOvq5LAVCSWdlwRTH1GdvfJYO6
         lzABJyVPh4BStPwskfOLPjwyF4+opaW25Kslwooo12WlPcH3p0WLqm86jHmkcO/RcUdp
         /y+A==
X-Forwarded-Encrypted: i=1; AL+hErF4Za4EsfcpM5lkWLp+2TKlxfS19mB/ZS9MJfgy9oLnNc7kUbrNHSYFD0CcjQfFypqrncz/WJVTU03fgdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lEw570Z0Axs9H5QUv8OcuHlNdiZy7318JpX3tC/bt1oPd/Ykg
	16Yz3OoNiGUww2/hdF+iXzIbJUZ6EiXuzM8fdmYo/gCvXDmwRE4flabHNTclPB04GkpBFk3bNO+
	ehWXUwjEEQbJf0Q==
X-Received: from wmbgx21.prod.google.com ([2002:a05:600c:8595:b0:4a1:f1e1:c6d6])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecd:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb8881e81cmr262843005e9.29.1795454283534;
 Mon, 23 Nov 2026 09:18:03 -0800 (PST)
Date: Mon, 23 Nov 2026 17:18:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123171637.3859594-1-jpiecuch@google.com>
Subject: [PATCH RESEND v2 0/2] sched: Fix SCX_ENQ_CPU_SELECTED for queued wakeups
From: Kuba Piecuch <jpiecuch@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: Kuba Piecuch <jpiecuch@google.com>, David Vernet <void@manifault.com>, 
	Andrea Righi <arighi@nvidia.com>, Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

SCX_ENQ_CPU_SELECTED is meant to tell ops.enqueue() whether
ops.select_cpu() ran for a wakeup. However, wakeups delivered through
the ttwu wakelist never have the flag set, because sched_ttwu_pending()
drops WF_RQ_SELECTED. Schedulers that set SCX_OPS_ALLOW_QUEUED_WAKEUP
therefore cannot tell whether ops.select_cpu() was skipped, and
SCX_EV_SELECT_CPU_FALLBACK is undercounted.

Patch 1 carries WF_RQ_SELECTED across the wakelist the same way
WF_MIGRATED already is. Patch 2 adds a selftest. In a 4-vCPU VM, without
patch 1 the test reports that all of the roughly 100k queued wakeups in
a 2s run had ops.select_cpu() called but SCX_ENQ_CPU_SELECTED clear.
With patch 1 there are none.

Patch 1 changes kernel/sched/core.c and include/linux/sched.h, and Tejun
has acked it, so this resend is rebased onto tip/sched/urgent.

The bug was found, and the series was drafted, with the help of an AI
coding agent.

Resend of v2:
- Rebase onto tip/sched/urgent (f4eb2ace3efd); no code or commit-message
  changes.

Changes in v2:
- Patch 1: Reword the description to distinguish the wakelist path
  before ->select_task_rq() from the one after it, and fix the
  ttwu_do_activate() name (Andrea). Add Acked-by from Tejun and
  Reviewed-by from Andrea.
- Patch 2: Give each ping-pong task its own two CPUs and dispatch to
  SCX_DSQ_LOCAL. The waker and the wakee then always run on different
  CPUs, so the test no longer depends on tasks spreading out on their
  own (Sashiko). Skip on systems with fewer than four CPUs.

v2: https://lore.kernel.org/all/20261026114429.209588-1-jpiecuch@google.com/
v1: https://lore.kernel.org/r/20261023144811.2230393-1-jpiecuch@google.com

Kuba Piecuch (2):
  sched/core: Preserve WF_RQ_SELECTED across queued wakeups
  selftests/sched_ext: Test SCX_ENQ_CPU_SELECTED with queued wakeups

 include/linux/sched.h                         |   6 +-
 kernel/sched/core.c                           |  10 +-
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../sched_ext/enq_cpu_selected.bpf.c          | 111 ++++++++++
 .../selftests/sched_ext/enq_cpu_selected.c    | 194 ++++++++++++++++++
 5 files changed, 319 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/enq_cpu_selected.c


base-commit: f4eb2ace3efdd8b6e3b0946bbd316166edb1a51e
-- 
2.56.1.750.gf70dc682cf-goog

