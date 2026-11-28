Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858623;
	b=QFZScE/3YhSczEzF4iSDIktCw4apeh2/sdhN/GG+eKOmuEOdUMuvNztXMp8YQmsLN1DJ
	 0vpQ+2CUfG3JVcTl3hKnhTeRP9J0Gw6ZFPK50NlCfwX0W5AQA+NAOepTgvaqooCYOXw8i
	 ijZbHbbWyr7sU3RV1wENAkz9n8I3bOvI+o5Ri2IXOAr+qDMeCfzPjYBZNRK4V5N8WzPGz
	 ifru9iF+fp6Us/bwpnKowEL1EB9nBh7aXIKPty6RZLDUyPbIC7KvMGv/arRzjnRCEGZbC
	 0XAyglqIvMBwXn8vz5/y21RTHE1hig6MyxqjrZYpOGSQg+qLf2kbJwNjCn2rw87qsCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:
	 In-Reply-To:References:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=BWjnfF9XDNa3hMHhMzLFnECwIvuoYJmNEMNUTfzqFtk=;
	b=RSGcjm7ilIRbVgkVj1DunO32yPveIX1Oyif7tL4oNPLs8qt/nTdy2FeisuudRKiwZukT
	 bW+LxpVJ6bFFecW+vVf8EXAAVLTezc8z/u/vQ8gxgwUU2/ox/RYn8ZcXSMkDcHB/5M8Is
	 E/2NjTtbDBHBWrRwdMG+3HsQBMunbSN1sR200Tzo/ltt5gnW4tLK9P+04gcyq0ztiOGAp
	 3TFy/O75oyUMoaUepeoRrb7bitQsEUdlbz6BKZ3JtONGqIql8QeG4Asw2/D4tuh/gzqTB
	 +7aSmKFvQSI8rkY/tm/HiXS1hfVCz7dsPpf6L9+nLHOe1XwzeKp5vGQklfI5p+JddFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lQ+HWSjR;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6979606A32F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6979606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=lQ+HWSjR
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b4cd576f2aso63969667b3.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858622; x=1796463422; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWjnfF9XDNa3hMHhMzLFnECwIvuoYJmNEMNUTfzqFtk=;
        b=lQ+HWSjRxdkbtAQECNMEYgbMHkueRa1Naw6JIJKoxq5GlU32jKSsORVfi1LY6atJTF
         DLYMwW4/fV1M6uJey20W/J5VzCsniHP9b8n3ZPWrIBhBF1cAt+HFdnpGBOZH+xz1cGC7
         GweFPn0brFz4rfVpMQU5XZuaKYVTxILr0vibE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858622; x=1796463422;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWjnfF9XDNa3hMHhMzLFnECwIvuoYJmNEMNUTfzqFtk=;
        b=ESHNU/yWZKiVPzVgoCouNEL+5e1uqhwVB8e7phWwvg5evWIIGNQYmUv2mIoiZvyOvA
         hHG6ywiOaQFyJCxoSFewVnXJvhPO1bI7w6s4QWCtXajiadQlt6prU1KipaARbkGzbemC
         phIqL3MRz0oR/8ocOTR7VK6lnbhq8iS24unIOPLQRyWkMx434M/bgnYFSxgBXxZk8cn9
         yx3SG/0YLAVQm/5hHlLhziCNXyLTEzpVQl/IoWL9M0C+O2L611d10kVCKkjcZutiv2qa
         9gLI4vd/BtPGKYj5QbcMqkUQl6bMio2bMTpP664NCu0yunn0t5a/EBcxmfguh8rIz5yl
         a+iA==
X-Gm-Message-State: APuU4Z+rgyK9aHQXgAo60LL5Oo0az7TZOI+944YEbiSANFMYUnGUX7v/
	Twul8ph2+OhwP/Etkg3Wyfvnrjys8LSuxO55Fnbe5yA46Zu77a2Pz8xmenlX8iZO79E=
X-Gm-Gg: AZFdTZe2CeycVU0WCwLwU2L8bT9h81sigdRTQQ8Dro0w4u46YnUtvfqcig0l/XUi28B
	4Ma21k1UetPmXQMv0Xf1e+RfVAHfqZ57JB8bh9ot75nsF0FJyQMkWzgGZzDNxETKo+/kJ+1R2q5
	lhkVrV+1WSeWA8UXoa31nih8xwwDBAmX+loy95gY0tDQGPJWd/ER7SGC56v5hdKbQpq2tf50NME
	swXhl+OPsQwvk5aoJ2+MODnNETdvKZtc5gz2/lKm7gIAKkN9ATrcF8caioFYEHXUQMKLtyDtvQu
	YaJBjzim6j2Jj3JuQGpnimVOISHDIjyQPbnM8lMi1ykloNfS5T+Fewy4dQtXvI0s8XUQJrn/FV8
	JOdTxPhv/SHwBF/z+huNDemjRYeWVSehooDOwt+hrjEbZYLmCWFVrIdi5LW+Cc3P41nutGEHzQV
	T5Ugp9Qpq4UotSQzqWe6qUUPEydhKHF9a5VyAmJWSHcNoJBccwBT+TsFz5JIFyrOadvt3zrn2xC
	pqbXvNDSDsihuGTUnqgp5ZRaoon4Q2D4jND/6Z4xzQH5U5q3mU+McBEeOvDfEB9x3H1eK4Fq3Td
	WmESipoqhBEFaATlXaCPisaid8WdYVlniFTsECN+nVsdOTaSa0DlR8RWlwHhZqkui+5ikPgK8fV
	bWsAl6XzeRd0VUZ1UE7417Ty77b8LPR0MVwKX2IfaswYTKNwIiw7z8r4diK7jUjGupQgf8gNvNp
	Tg4Sc6/rI1e94+IqF9CaWeS/YDbcCJZtEF+3QDzjLrKBjzqJtAfKg1vzz8Ng81uBT80rB7Iutbe
	yO/ITLdZjWwxqv7f2Kx1JM=
X-Received: by 2002:a05:690c:6d8a:b0:8b4:dba5:f101 with SMTP id 00721157ae682-8b5204f720cmr118184247b3.52.1795858621859;
        Sat, 28 Nov 2026 01:37:01 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm107006967b3.31.2026.11.28.01.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:37:00 -0800 (PST)
Date: Sat, 28 Nov 2026 01:36:59 -0800
Message-ID: <f7d42197b65bd98166440c75fff0d42d366fc377.1795855037.git.chris@chrisdown.name>
In-Reply-To: <cover.1795855037.git.chris@chrisdown.name>
References: <cover.1795855037.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/2] timerfd: Support CLOCK_TAI
To: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>,
    Jan Kara <jack@suse.cz>,
    Anna-Maria Behnsen <anna-maria@linutronix.de>,
    Frederic Weisbecker <frederic@kernel.org>,
    Thomas Gleixner <tglx@kernel.org>,
    kernel-team@meta.com
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Despite hrtimer and POSIX timers both accepting CLOCK_TAI,
timerfd_create() rejects it. This usually corners userspace into one of
two bad options:

1. Convert TAI deadlines through CLOCK_REALTIME, which reintroduces the
   leap second exposure the application was trying to avoid in the first
   place.
2. Abandon timerfd entirely and use POSIX timers or busy wait approaches
   that do not compose well with epoll based event loops.

Avoid these bad outcomes by allowing timerfd to support CLOCK_TAI.
timerfd arms hrtimers directly and hrtimers already have a CLOCK_TAI
base, so nothing is needed to queue and expire the timers.

TFD_TIMER_CANCEL_ON_SET has to work for them as well. CLOCK_TAI moves
along when CLOCK_REALTIME is set, and it also moves when
adjtimex(ADJ_TAI) changes the TAI offset. timerfd_clock_was_set()
cancels a timer when the offset between CLOCK_MONOTONIC and
CLOCK_REALTIME differs from the one recorded for the timer. That is the
wrong offset for a CLOCK_TAI timer in two cases:

1. adjtimex(ADJ_TAI) moves CLOCK_TAI, but not CLOCK_REALTIME.
2. A leap second moves CLOCK_REALTIME, but not CLOCK_TAI.

Compare against the offset of the clock which the timer is on instead,
and put CLOCK_TAI timers on the cancel list. clock_was_set() already
notifies timerfd when the TAI offset changes, so the timekeeping side
needs no change.

With this, epoll based applications can arm TAI based file descriptor
timers natively, and can have them cancelled when CLOCK_TAI is set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 fs/timerfd.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/fs/timerfd.c b/fs/timerfd.c
index fe845af0b74e..26cf804d8d0f 100644
--- a/fs/timerfd.c
+++ b/fs/timerfd.c
@@ -55,6 +55,13 @@ static inline bool isalarm(struct timerfd_ctx *ctx)
 		ctx->clockid == CLOCK_BOOTTIME_ALARM;
 }
 
+static ktime_t timerfd_get_moffs(struct timerfd_ctx *ctx)
+{
+	if (ctx->clockid == CLOCK_TAI)
+		return ktime_mono_to_any(0, TK_OFFS_TAI);
+	return ktime_mono_to_real(0);
+}
+
 static void __timerfd_triggered(struct timerfd_ctx *ctx)
 {
 	lockdep_assert_held(&ctx->wqh.lock);
@@ -98,14 +105,17 @@ static void timerfd_alarmproc(struct alarm *alarm, ktime_t now)
  */
 void timerfd_clock_was_set(void)
 {
-	ktime_t moffs = ktime_mono_to_real(0);
+	ktime_t moffs_tai = ktime_mono_to_any(0, TK_OFFS_TAI);
+	ktime_t moffs_real = ktime_mono_to_real(0);
 	struct timerfd_ctx *ctx;
 	unsigned long flags;
+	ktime_t moffs;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(ctx, &cancel_list, clist) {
 		if (!ctx->might_cancel)
 			continue;
+		moffs = ctx->clockid == CLOCK_TAI ? moffs_tai : moffs_real;
 		spin_lock_irqsave(&ctx->wqh.lock, flags);
 		if (ctx->moffs != moffs) {
 			ctx->moffs = KTIME_MAX;
@@ -154,7 +164,7 @@ static bool timerfd_canceled(struct timerfd_ctx *ctx)
 {
 	if (!ctx->might_cancel || ctx->moffs != KTIME_MAX)
 		return false;
-	ctx->moffs = ktime_mono_to_real(0);
+	ctx->moffs = timerfd_get_moffs(ctx);
 	return true;
 }
 
@@ -162,7 +172,8 @@ static void timerfd_setup_cancel(struct timerfd_ctx *ctx, int flags)
 {
 	spin_lock(&ctx->cancel_lock);
 	if ((ctx->clockid == CLOCK_REALTIME ||
-	     ctx->clockid == CLOCK_REALTIME_ALARM) &&
+	     ctx->clockid == CLOCK_REALTIME_ALARM ||
+	     ctx->clockid == CLOCK_TAI) &&
 	    (flags & TFD_TIMER_ABSTIME) && (flags & TFD_TIMER_CANCEL_ON_SET)) {
 		if (!ctx->might_cancel) {
 			ctx->might_cancel = true;
@@ -434,6 +445,7 @@ SYSCALL_DEFINE2(timerfd_create, int, clockid, int, flags)
 	    (clockid != CLOCK_MONOTONIC &&
 	     clockid != CLOCK_REALTIME &&
 	     clockid != CLOCK_REALTIME_ALARM &&
+	     clockid != CLOCK_TAI &&
 	     clockid != CLOCK_BOOTTIME &&
 	     clockid != CLOCK_BOOTTIME_ALARM))
 		return -EINVAL;
@@ -459,7 +471,7 @@ SYSCALL_DEFINE2(timerfd_create, int, clockid, int, flags)
 	else
 		hrtimer_setup(&ctx->t.tmr, timerfd_tmrproc, clockid, HRTIMER_MODE_ABS);
 
-	ctx->moffs = ktime_mono_to_real(0);
+	ctx->moffs = timerfd_get_moffs(ctx);
 
 	ret = FD_ADD(flags & TFD_SHARED_FCNTL_FLAGS,
 		     anon_inode_getfile_fmode("[timerfd]", &timerfd_fops, ctx,
-- 
2.56.1

