Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795656523;
	b=GGSQJFDydRMLMmDYNzW9kLjKfTXb5O7w5o1LoQQHAeL64EIVZwhLWPPgz8etTfWmxelH
	 o3//JADslkeBmvgpYZm05nbVNvHm+i/Q80ww7UMaZHFNavlTNfQPZod4X/jg4FdrVLBMJ
	 Kl/zPol5QcieKejZEQG6JmiCm2yrCNLxa4kYpizs76s++dnj9xx60BsXBMONZa7hn6Cy9
	 AIAaqLI1jv+cAkI06dEjSU7hGKaJI2h88nPUEVEUmsCOKv8joH1+7fs3+lOsiCialwebW
	 +3xOqst48z/VxBHhlYqqmpKl0S5Get2IwpzD4oKCsRFEbtPXrZ51CeFNabNZmhhumvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795656523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0PO3/adJX6bp8Q2AMFvUS+e8STiW7j2WvzoNjHDIUqk=;
	b=t6ReVgUbhuDjMsUVghsMO/Jmymi26aETvND8r1wYtMRgu4HvUD01XMxZq3ORYmCevpE9
	 vSe3crLXgcTbM/X81ybK1BdnFU8Ur/vdB4kDNpPUQrHNyZSd4TAZ5nNGFtN+rsV13PwT3
	 iI8I4uQrc6TTGky8ZYjih9ZBouULfsFkXfyQFzsRR/dagwA9kCe8MT9joAEg51RC5Tz9j
	 6Tl8pW8opJY7odUtCig8RKxUgc0DhGPNAFRWuzrZ5iozcAAhJJm67rN4MpyLnBT6gsedx
	 FugToikNcHkcqSTCwT7cd43KKkdbwHgKb5j7jqrY/nusf+is26q3z49Fnc0VefcK41A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pe948pYX;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3826606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3826606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pe948pYX
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-497614c95f0so3656366f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795656521; x=1796261321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PO3/adJX6bp8Q2AMFvUS+e8STiW7j2WvzoNjHDIUqk=;
        b=Pe948pYXHxnEy/V9XImFzOOejOm1gKBRNAdVN7qd6ZNF2JZ3gKe4butQwWEuwazdwr
         SlaW+UeCknK+fcs+d7YvoUZ0BGrRhtp0bIfP2gDeUf3/gsXK5s+WNdiFzi+GJoU6KtOe
         IBTXJi7PM2a7Tp8cklnHVcN5wSWdHz/WXQBp0Zg22bVDp1+ZabA5Y+iJaDxfgq610b89
         Ak3IidHZHLmwmKiShv3iK8WRcw1S8OIaj9frQEW9IjjuBZRfWhDG9r/6S9qrFQvg+CvF
         uYV/Rzs43AoycZSej8DjcLN1IxCTAvBPGmobd5Q+13RolbR+VH1kbc8Wkra/ylGk6ePm
         phrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795656521; x=1796261321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PO3/adJX6bp8Q2AMFvUS+e8STiW7j2WvzoNjHDIUqk=;
        b=JUf/cm9mnbYk5or87rjcc0WN0slcYM4f4zauiCyzX9t1HYM/Uf7YCKjNTGwizeTSEh
         XPmJ3SR78sv4huY1GcGxeyQ0oIdUQ+tIxx4PXypI+eiQwQ1E/Iz7GFZ5sSwaiUQQk1ZN
         +oFdrjlv0RUhYTmnsYlwtZ8GID9ziW1QWDCMEka5hXbvetkfflKyZGC3XOz6jOwNTVok
         qrnuNnXvArtuB5UiRZrh13XBjmZryPF895KTBQOwnSFROj+y1J9ddBtKowz7fzjGDSBk
         Ox7SUhzlFdIf0dck2Su4Hcl0xpgJsYWuhN6Z4LClGcl14ZeV6vmRmZWUwVXMgeAT/mlt
         u5hw==
X-Forwarded-Encrypted: i=1; AL+hErE7YbKiHUFD8SbXJNr9sxlvjtUUUWlHO7mUXe9Q6EOB1aQR9F7W6E7N2PBfqOYOBro6nyN7jbHgO7xBcHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b25CR2oB36m4JW8wVzQSYRzrjTqgsnA+4IZD0SO7IeWCe997B
	nVQ8f4e0BFcW6kCCIc8IrEIBfoBHdQfrP0Py1QMEqk5Y+L3to2Je8chOJLT+tbyGps0=
X-Gm-Gg: AZFdTZfuuiEf7C3YVPMK4+z8lyadbpG7Pg7whOf+6+xWSPDZVHwWjRc5GAUiz9bW/Yi
	vFc9PQ7VgDbeoZNJlsw74sCHLpVSOX0R6zOS90yyBQ7z9xDoVGYJZTqyWKkDnWhV1sFHYBKZG2A
	j/ORq5bvcJcTpG/5WpN5tMPEmSU7QxOt0SwgubDYsU0xRmK4bB6PcoZoyCR1PdDGpFY/Eq8hktp
	NHOCnsPxaYMpO4geLrsMVvsTVJxePENHuA8HPDYp6aQNVF0RPPTQQ9oO2A9xoZU5ksQMmmTUeid
	fajKJ1KUuUAidW3DlyKWerYgtJFZKxbbWUIkinaF4d8kgDR3ahZ5M62RM2cWucRNVBqWeu0FiAz
	wUNLrSwd2Rzo7y4/L4NCZZiHOPqdXuxfoae8V/wpZy6zjJpzTd6CUMWb2Yn5Ce8o661isYyrKSB
	x3rw1IxAo8ZVVxqg82KA52B9fNWgW706GI9bBllc01NGJbTph/2u0ci52t9gnBfySQfPOWWXF27
	rjPshnh8eL3dQmegRZ40EvJOtO/8B1E4QdIb45btu+GFycVUoDqkm7G9jThGYSPY9tq8mCcxWqZ
	Isp9O8NVkOlsxaeRSWAw9pg3jYmVYGfJ8+YRd7upoKXDJ+gGG/1EqtTWv8AyUPCJQ18882HxkA9
	qdxmJa1Oq1Idws8B69UMUREEsRSYXzQ==
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr40642151f8f.57.1795656520569;
        Wed, 25 Nov 2026 17:28:40 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm30520335f8f.35.2026.11.25.17.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:28:39 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	linux-kernel@vger.kernel.org,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v7 0/3] Fix uclamp race against non atomic static key enable
Date: Thu, 26 Nov 2026 01:28:33 +0000
Message-ID: <20261126012836.15205-1-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
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

Hopefully the last version. There was a debate on whether to drop Fixes
tag or not. And Christian seems to be looking at alternative proposal.

Fixes tag for patch one for the maintainers if they chose to keep it but
NACK the LTS backport:

	Fixes: 46609ce227039 ("sched/uclamp: Protect uclamp fast path code with static key")

Changes since v6:
	- Use uclamp_rq_set() in init_uclamp_rq() to preserve
	  WRITE_ONCE() annotation

Changes since v5:
	- Drop patch 3 to partial revert subtracting rq->nr_running for
	  RT throttling.
	- Drop fixes tag from patch 1 as the series now is partially
	  fixed and not suitable for LTS.

Changes since v4:
	- Fix problems in fair/RT throttling logic that were exposed by
	  the original fix.

Changes since v3:
	- Fix Sashiko report about force_idle paths where
	  rq->nr_running is not 0 highlighted by Christian
	- Update patch 1 commit message to reflect jump_label call
	  sites on the same CPU might not be updated atomically too

Changes since v2:
	- Use uclamp_rq_is_idle() instead of scanning buckets to detect
	  imbalance
	- Do some cleanup on accessing the flag as an additional patch

Changes since v1:
	- Fix kernel test robot report due to missing static inline in dummy
	  definition of init_uclamp_rq()

Tested with the patch below to force imbalance via sched_feat. I could see the
warning appearing and frequencies spiking during imbalance. Correct behavior is
restored when sched_feat is disabled where the idle entry reset fixes things
up.

I had a mix of uclamp_max mainly used in the system via schedqosd.

	diff --git a/kernel/sched/core.c b/kernel/sched/core.c
	index a2035d66270b9..14f9f1e419e02 100644
	--- a/kernel/sched/core.c
	+++ b/kernel/sched/core.c
	@@ -1889,6 +1889,11 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
		for_each_clamp_id(clamp_id)
			uclamp_rq_inc_id(rq, p, clamp_id);

	+       if (sched_feat(UCLAMP_IMBALANCED)) {
	+               for_each_clamp_id(clamp_id)
	+                       uclamp_rq_inc_id(rq, p, clamp_id);
	+       }
	+
		/* Reset clamp idle holding when there is one RUNNABLE task */
		if (uclamp_rq_is_idle(rq))
			uclamp_rq_clear_idle(rq);
	diff --git a/kernel/sched/features.h b/kernel/sched/features.h
	index 8f0dee8fc4755..b59e532500fd9 100644
	--- a/kernel/sched/features.h
	+++ b/kernel/sched/features.h
	@@ -142,3 +142,5 @@ SCHED_FEAT(LATENCY_WARN, false)
	  */
	 SCHED_FEAT(NI_RANDOM, true)
	 SCHED_FEAT(NI_RATE, true)
	+
	+SCHED_FEAT(UCLAMP_IMBALANCED, false)
	diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
	index 84301fc49e699..dbc3f5e1a7e01 100644
	--- a/kernel/sched/idle.c
	+++ b/kernel/sched/idle.c
	@@ -519,7 +519,7 @@ static void set_next_task_idle(struct rq *rq, struct task_struct *next, enum snt
		 * are still queued.
		 */
		if (uclamp_is_used() &&
	-           !rq->nr_running && unlikely(!uclamp_rq_is_idle(rq)))
	+           !rq->nr_running && unlikely(WARN_ON(!uclamp_rq_is_idle(rq))))
			init_uclamp_rq(rq);
	 }

Qais Yousef (3):
  sched/uclamp: Fix race condition leading to imbalanced uclamp_rq
  sched/uclamp: Use wrappers instead of open coding UCLAMP_FLAG_IDLE
  sched/uclamp: Move uclamp_rq_{inc, dec}() from core.c

 kernel/sched/core.c    | 54 +++++++++++++++---------------------------
 kernel/sched/ext/ext.c |  6 ++---
 kernel/sched/fair.c    |  6 ++---
 kernel/sched/idle.c    | 19 +++++++++++++++
 kernel/sched/rt.c      | 10 ++++----
 kernel/sched/sched.h   | 21 ++++++++++++----
 6 files changed, 65 insertions(+), 51 deletions(-)

-- 
2.53.0

