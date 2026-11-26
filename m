Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670097;
	b=kyIrzCr3UvotsQ9HWkZGUgDq7BS4tunNZAOCr56zf98/gzXwUPmpcJWgT45JYEoM74cV
	 8c4XuN8vP3saF+8rBAUjelLrkRlJLVlGlELsOGuB2Cmrr8XhX7cc19WonmiWQf6hgrEqn
	 Ya2zJgbQxDyeUtd5xyFPoCi+0ZZVXiOYapLR2OmaxoPCexiZv8kw7OlAl2CCPtxMp/pqC
	 CsIfnAirrC8metMt/xPQjNgruV8Jj4nGaEe8L+gC9/L3HaCofCNmuyVQX1T2DxhmJmqV3
	 kn0cx6PaKrejwMl6yaKfn8qKfbpprSwYMNQelbp+al9bquOR7PlbABck/ia6kiFpAeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=806Dwl8gBAMoS8dKxNUgqLNn/eQl7eh/qRw68LiXr1Q=;
	b=ndVCuf1CKgYHtTYqrm0bR3ZjAObNejtjsZV5BAVh2v9OvN0UN7+S71XDmdLf3N3YTUpQ
	 aBYlW/iiKabp9aC3uGlyPKAHvFNtloM1cwgRyViZhdtjxNcHZH/PmoUDpwpRLDD1iRdos
	 8tlXl/nxCzyMnFkebc2fuPQTKdr3GwtP0Zh0q3U+pIc0vV1tjP8QFV1DRlnFray/m9PdI
	 QEfrTqHU3KFQdf4EZl8cIDmqxW+eu6PALQNufiZtg+0OaymR/2NRjfySLR9SmVCb1fBKL
	 In3p1kOqBm7ByGYq6vMLY5g9ST0p2lUostj4zCfa7yUizuuYTn3QqDeG/IxcnRs7tRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="liMxWW/c";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78929606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78929606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=liMxWW/c
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso80897035e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1795670096; x=1796274896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=806Dwl8gBAMoS8dKxNUgqLNn/eQl7eh/qRw68LiXr1Q=;
        b=liMxWW/cPPGVI8Yl9gxll7U+jT0oD6+yxnM53PSO+Tvg2gXM2MMG//X2aDnloEzskV
         Cj/tlTehiUenFMp7C/AYWzSYGT6kSed5kl+ORnmF9Qn8/Px4GwKfCbqXcyEMh0jsgGEK
         I2WzCJ4z8CmF+jbGaxSLEINrcpePDsU8pUnaKfhmu8dTv6xTIvR7L4/wIOrqLIh1EnRl
         j6NrNHDLcF3ktFajeaXVBh7zCkNx2VuE5AC26HSAzIyUl/3BuOYUzIbYBKr0Tob9X6vB
         jsbkV6UxROejqd+35zKSW+I1BIM/pH4BwZG8nS9reiFAu8VLhd/KxJxnCWL5xqowDU6H
         fncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670096; x=1796274896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=806Dwl8gBAMoS8dKxNUgqLNn/eQl7eh/qRw68LiXr1Q=;
        b=BgRJqwIJHHl0j6Q7h7I0JCGojqV3xJcwTeZD+VkqLsoSeaur4+O35PLF55QHPlgz7E
         hcMJUefkete3QDbYPGDPAnKWeyre1S/76YPepG/gvLntbPnQUuwjE4jQp0iOyhikASfl
         x4R6RWLNyEyFXhZ2w8bRSJ3Ym+nkKERSGNgd799T++XfNIJVIePLfgPc04W05jrcFpiB
         0sFH7v0mUBboTCUkNfdkhUXk7b7CKwrGdJmC4+p4jCnsBg2RlMg+Exgajf8B7Y8PTQAg
         UHqJiM1xDWRkNbUdQv2ilndxvdu03fBeOV55QpRugrVgQIpflsaoMy/u2VdhR9Y1wwPu
         Q/VA==
X-Forwarded-Encrypted: i=1; AL+hErGyhf9LfKsps2XgCUuKjUi2FBL/8H51V5M01DJDPSVBKPps6B/RSX6C3gB8q79+4YJNFNjCMdqktdPz3lY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r5xvBiffVgADSW7+g8L9x2/dIVk2nKrw3zKdtYNZz654Q4w0G
	I7FeONf65pVIEd1pkoLlOWvyOgEF9Ezp4OYeG4la9FviktgxkrroD2UlxxqgTdsQYBA=
X-Gm-Gg: AZFdTZeNJFMM/9QsaN1gqCl7xspEIKI/jRirEJq51rK4C3Mpk7mt1i3mdhukOvDtkLc
	t5ta+OeIHHtaT1rR4T9t8O2YYMq7UZiAFz2Vpuyc7FZt3t0p0/FzYnUIHqBWtSSWR+5hzg7QO69
	C53adT35bwAoVV/oMY8mf/lKm9uHGWj4QU7VbM53UVaNqLX4JLHxev95cAiNdzJe6HlJCI7iWtW
	21Ro8UKtA+nVvjvPdT94UR14JdF0BBublHPRnsZOC2ZCs3u7/vWTbfg9ToJPrfWaSh4gycis5DO
	61HEnaWJbPzW76PSSA0fUyJbOr6b7aMMvPfxBZdkior4R6X1cfKi+9Of1iTim92PvgAnLafQes7
	2ioPMaZpVWCmtB4qCO9mOQ/AxOxmfnYN3Jye10R36BDa9iEBuZEwQYflJ0z83XpH/euU7eO+t3P
	wYoWxDp4BPuPvZTxTXVtP0wMtjK6C8c5XWyqm0bWwC5TscbHY1Kd4ycrxE/kRc1tFFr11iLCLv/
	vguW00XzxOWYrrlxXsQJ50vnL+UJ5m57IghKpbt0w0MIuYbdOKu9UDQuJf65aHKwrCyV5yOnuGl
	DPNGkRW+TgDJooHWp7STb8DCxYQYxGGSD6fV2aBxw5s501wek53qeJVbUrWgVCqBx3pkukTiWwv
	QqtA0/swz
X-Received: by 2002:a05:600c:4584:b0:4bb:5de1:e90f with SMTP id 5b1f17b1804b1-4bb88819bcdmr395285965e9.31.1795670095606;
        Wed, 25 Nov 2026 21:14:55 -0800 (PST)
Received: from aerith (host109-153-232-219.range109-153.btcentralplus.com. [109.153.232.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm39548128f8f.33.2026.11.25.21.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:55 -0800 (PST)
From: Qais Yousef <qyousef@layalina.io>
To: Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	Qais Yousef <qyousef@layalina.io>
Subject: [PATCH v3 09/10] sched/fair: Disable util_est when rampup_multiplier is 0
Date: Thu, 26 Nov 2026 05:14:28 +0000
Message-ID: <20261126051429.14091-10-qyousef@layalina.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126051429.14091-1-qyousef@layalina.io>
References: <20261126051429.14091-1-qyousef@layalina.io>
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

util_est is a great feature to enable busy tasks with long sleep time to
maintain their perf level. But it can also be expensive in terms of
power for tasks that have no such perf requirements and just happened to
be busy in the last activation.

If a task sets its rampup_multiplier to 0, then it indicates that it is
happy to glide along with system default response and doesn't require
responsiveness. We can use that to further imply that the task is happy
to decay its util for long sleep too and disable util_est.

The behavior can be controlled via UTIL_EST_RAMPUP_ZERO sched_feat that
is enabled by default.

Signed-off-by: Qais Yousef <qyousef@layalina.io>
---
 kernel/sched/fair.c     | 8 ++++++++
 kernel/sched/features.h | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8af44a20fb423..88072e346aecf 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -5994,6 +5994,14 @@ static inline void util_est_update(struct sched_entity *se, bool running)
 	if (!sched_feat(UTIL_EST))
 		return;
 
+	/*
+	 * rampup_multiplier = 0 indicates util_est is disabled.
+	 */
+	if (sched_feat(UTIL_EST_RAMPUP_ZERO) && !rampup_multiplier) {
+		ewma = 0;
+		goto done;
+	}
+
 	/* Get current estimate of utilization */
 	ewma = READ_ONCE(se->avg.util_est);
 
diff --git a/kernel/sched/features.h b/kernel/sched/features.h
index 500ece3e341fe..75d9d4595c4de 100644
--- a/kernel/sched/features.h
+++ b/kernel/sched/features.h
@@ -135,6 +135,11 @@ SCHED_FEAT(WA_BIAS, true)
  */
 SCHED_FEAT(UTIL_EST, true)
 
+/*
+ * Disable util_est when rampup_multiplier is 0.
+ */
+SCHED_FEAT(UTIL_EST_RAMPUP_ZERO, true)
+
 SCHED_FEAT(LATENCY_WARN, false)
 
 /*
-- 
2.53.0

