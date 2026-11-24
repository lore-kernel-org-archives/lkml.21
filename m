Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795547636;
	b=Vi8PMMtYbZgpg+rwRE2U4QhkQgFLc7qj6nx2bWr1HKS/Br+6YiSSIV7ENC3hgtFuevkZ
	 gs6ibCZCk2wvf1atnj9pefU64xOR5wk+FcN5vQYhVDGh7+A3z8PwpBseX3uLep4Nd1hQk
	 woPp9Kd5ypwvO8Egg5tthxnab93d0xDQjxPn4KYLwxP13NSxyALE4+nI5IUDfjyiwxatL
	 YQt82P3auDWNK/JQKA32IJ5XH0TTzPFVRQgzZhkusAAoj1wJoHCFJzn0QEXt0qKpBkTqZ
	 UwFY+Gyj6xvXtLFt8gKhU1HX5xpsMbC19BMKRE/AWB8Uyhs1VcVMpjP0PITd3lUfueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795547636;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=fFUWUmaqeHqtv4TVB3l69JhY/vB0OOHBwv/qq80AEb4=;
	b=1oEESqzEhTdYifDdk2SZ9BGiQMXt40+GytAp3V4hsSy4wWX7pBvLFTxlnwt51cm4VPbn
	 879CnBR2q6zGYcoTaDWAKf6rPIlh032EME9bqkl4AfCa60ZdGF7lZb1cMC7t1o2GYS4h0
	 6X+U1biqaO+QWtG6aQ0ejMCgDpf7guPa1meAWoCPF5D3GnVweaqNtHW57m0dJ/baOQLoY
	 ZdD3iDAWT5x26XHFepURQyE8gCDaQGlmuyHGSsl7BZdG5fuObLLEoPDeGTfQPtDIuESsY
	 9LkAvXNem6O9tkU2wGOdVUIia1YPdnSdBwe0GtBiUiWpy7faQWKki6FcJKcFmYjBDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jauu.net;
	spf=pass smtp.mailfrom=jauu.net;
	dkim=pass header.d=jauu.net header.i=@jauu.net header.a=rsa-sha256 header.s=MBO0001 header.b=TIZDN6p0;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A19606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A19606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jauu.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jauu.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jauu.net header.i=@jauu.net header.a=rsa-sha256 header.s=MBO0001 header.b=TIZDN6p0
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jYst175T2zMm1j;
	Tue, 24 Nov 2026 20:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jauu.net; s=MBO0001;
	t=1795547626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFUWUmaqeHqtv4TVB3l69JhY/vB0OOHBwv/qq80AEb4=;
	b=TIZDN6p0pTUatMbgyZQhc/3tZE58LTZWk0D9NGMqVZwVPnsZTxCVzAPWUs5W7tXONJwu0L
	dKlxPsDaDa17zfN6d7v2DaVod1+11Bkd6U8SPPeSLk7U4mJZaeoPR03bEnJZ0qlvzwq84G
	frSZtirjY14zrcIitM7AH+5wZREpXr8Y/gGsCLxUaUDayDfCn/spuAC8CPfBcGUOQdcvre
	dJqpgI4DZNn3Gha33aRryDcgnWgRGbAUJtRiCq0gYVbQsK90/zKXo/EayDybrxPQtQC05i
	H19RVV1e4CEvnNGxi0QxBYqjjBJofqHK48e1WlvpNFrgr3uKBeML55y9ncxzsg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hagen@jauu.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=hagen@jauu.net
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: tglx@kernel.org,
	jstultz@google.com
Cc: linux-rt-devel@lists.linux.dev,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	Hagen Paul Pfeifer <hagen@jauu.net>
Subject: [PATCH] timekeeping: Skip unchanged leap state publication in adjtimex()
Date: Tue, 24 Nov 2026 20:13:26 +0100
Message-ID: <20261124191327.943964-1-hagen@jauu.net>
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
X-Rspamd-Queue-Id: 4jYst175T2zMm1j

Every adjtimex() call that does not set the clock ends in
tk_update_leap_state_all(), plain read-only queries included. The
function always opens the timekeeper sequence count, so tasks that read
the time at that moment have to retry, although the published leap
state stays the same. Without a pending leap second next_leap_ktime is
KTIME_MAX before and after the call, and with a leap second pending,
repeated queries leave it unchanged as well.

Compute the new value in the shadow timekeeper first and open the
sequence count only if it differs from the published value. Both values
are protected by tkd->lock, which __do_adjtimex() holds;
lockdep_assert_held() documents this. Comparing the computed value
instead of the adjtimex mode bits keeps real changes, such as cancelling
a pending leap second.

The leap state changes only when a leap second is set, cancelled or has
passed, which is rare. So the extra comparison is cheap and saves the
write section on almost every call.

Noticed while tracing the stress-ng clock stressor on PREEMPT_RT, which
calls adjtimex() at a high rate.

Tested on x86_64 under KVM on top of tip timers/core: 10,000
read-only queries went from 10,000 publications to none, also with a
leap second pending. Setting, cancelling or switching a pending leap
second still publishes exactly once, and the leap second still takes
effect. A 60 second stress run with concurrent clock readers and
adjtimex() callers saw no clock going backwards. The timer selftests
valid-adjtimex, set-tai, nanosleep, posix_timers and leap-a-day pass,
with and without PREEMPT_RT.

Signed-off-by: Hagen Paul Pfeifer <hagen@jauu.net>
---

Notes:
    Also run on auxiliary clocks (CONFIG_POSIX_AUX_CLOCKS): same behaviour
    with and without the patch, read-only clock_adjtime() calls no longer
    publish. No measurable change in adjtimex() throughput. 32-bit x86 is
    compile-tested only (i386_defconfig, W=1).

 kernel/time/timekeeping.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 3668bd24fa4f..22b146822049 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -738,9 +738,16 @@ static inline void tk_update_leap_state(struct timekeeper *tk)
  */
 static void tk_update_leap_state_all(struct tk_data *tkd)
 {
+	struct timekeeper *tks = &tkd->shadow_timekeeper;
+
+	lockdep_assert_held(&tkd->lock);
+
+	tk_update_leap_state(tks);
+	if (tkd->timekeeper.next_leap_ktime == tks->next_leap_ktime)
+		return;
+
 	write_seqcount_begin(&tkd->seq);
-	tk_update_leap_state(&tkd->shadow_timekeeper);
-	tkd->timekeeper.next_leap_ktime = tkd->shadow_timekeeper.next_leap_ktime;
+	tkd->timekeeper.next_leap_ktime = tks->next_leap_ktime;
 	write_seqcount_end(&tkd->seq);
 }
 

base-commit: 0359ecff58853a491dd0f09792fea8e87235ae06
-- 
2.53.0

