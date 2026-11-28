Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858626;
	b=DyhQq6SDIdLiVtvlaNPUdwp7M57pztI5LRI/ZOjRt1XRqxX2ln+CcR2xb4xKj/iM1tH2
	 6QfEI1RPVIX8KOc6NrzWmQCKPIufVYfN7X8Wsm9fBTDhEFRb2PJjeSFGep0cE5F60RSkn
	 Ia06uZGsvVZH+qfue8RvKxvXjk3c6osj/G3vU8JKX9O5gBs/z7sZnqu3fQsjmOY6Kycev
	 hE2xGloQ4/jsuTqRbw8hSqvsawAZmWPiixwDZ5VFHi4NPqrEDRq03zPsDljpgC500wIOX
	 z+4c3TGbdEec+Ni4PBGoY6DqEvUIa7zGC7aHTgtELiFVkfym/InbDEwXOz48smZVkIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:Message-ID:
	 In-Reply-To:References:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=sEbzT/UxRBEXtg0cQY6CwwKz04kR+adLcDsN0sVZSjQ=;
	b=vvm0TCp3s+wtj/aezDmncO35lxMdQRmVr3tnlV/Nhgzp5Z7A9TEJfDqsYx2lT81uskOv
	 hwJRs0fTEdqDmQf4GW/WVY8gTbTIDxYf4yWo38TazP3Z8852msnNPgIsNt2KqV1ywtp9i
	 y7s/XUSVlya47M56e8D3Gy23UPVOO5nATL5+fWIZe6+PYAYbSA/kolVL22u+ANcHsg27w
	 +gsTYUMXuPvvW8YccligxOFDZPXBny8U0VqXpTD8U6VJimGazV5XSyCB2zpMvVR0mfZuU
	 uEr6gZeTvzrQjDmfdZ5EQC1MQ76jP7gMfEjSu3D+COKV5Uti8tLZaaaW5dv8s3mIPog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YMKnSHxX;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40B5606A327
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40B5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=YMKnSHxX
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b51389f58cso95575057b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858625; x=1796463425; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sEbzT/UxRBEXtg0cQY6CwwKz04kR+adLcDsN0sVZSjQ=;
        b=YMKnSHxXgL4Hqka7wy884jSomiegrWwk8P1eGjJjgkursYLGFFGhIbenbj1WTQx1PZ
         SgiWfAA0PUVTZqjlFBd0mt5D/rUSWsZloumjNO3KNwJERbKnhJipwUWtFzmuXptguAEu
         VZJs+0CKQaZ8oqc4dcjw/qA0jtpHYKTGngln8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858625; x=1796463425;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEbzT/UxRBEXtg0cQY6CwwKz04kR+adLcDsN0sVZSjQ=;
        b=ZyNwY2sI+xEmN7BmpiYA3SkIXxoUQnZapvtONHmBIM0c0CZ1DNFOxE7Olv7bWYCkKJ
         5vlT3XOTbIj4sl+Jzll7GXMGaYrZHDhqdeMmrW3iKwcpcu+S4j/VjATaYNss18/Au8qA
         /S2VM0rDCeXQ5JXZRIkJgjb0HW1A+vv7P5633zzzH/tU8CbeSQCTKPOGPYKmrzufmmZu
         17+s43ASCQ5l9JdoqHuuUcoBoGthykUwWpgU1hlonhgNL7fJ0jord4gpnbW+fvydj89R
         SyJMsAIhbuApRjr5ZSTizkcHipgwmNgCIJfBLlhrDAxtOzSHoK5CP9v21VOOyu+C4bS5
         9LiQ==
X-Gm-Message-State: APuU4Z80vj/F9BSjUKvxjNfMSOHw/IxYmUFNyzP8XMCBq7HmXIzkjDMc
	9ti7BmJCKkFxt5kcXBin+bnAdZWYXnkG1SeRASid6PUDWwYbwkYpFYfxucQzNMVZhI8=
X-Gm-Gg: AZFdTZeSEGXc7O7fOFVSD2CmXXWzxfVDzAp1Ll8vXXokxYqp3Qc6K+HfJSoWHGV8+BF
	GRi7omU5yI3UM0lUuXxmXZA1Tdv2fNuaaskjfDjTeq/awd17veOYMpg7ZpXAdYLmjNKetII1TVX
	4Xo0ClKCfbSman3/ewR0Z/yWFJ9Y8Mu84RYdF4Q45YllDMpUEsgawZSCbJDUpWKZCt16WMRaCMH
	+q6zlrMX21SP4BgWv9mVTOk1stq8d/KBQ2UnF9Sy5JkQFfhuFE5u+b9GjtlD8nOF9Kuhu0czWDr
	0tXwHGC39lKkscrA+VQfjoarHpuMv1l06m6s/6BtkCfl5r0OLrxeS/k3DBDC2INQzoX6DukkzYl
	er+ex+mQtze2z2goTH0I+d8hP6s94dTuRbJoO79qDzqsFDxhv2gfPYI1LsVBasB2Zsoctjt6RiQ
	LUj8xBahR2pyBLpLxEUDZ32TKo4TqpNOUUwa/GgzbzFjZ8t8to0DeBfJRL/oBfrg/a2uA4XymEh
	NS3Eayba1Xxlgj1lsegOJfCy0+7z8zSiw/662RVeZCIC3FVrcFMdB7OKdJOj9KhwrvUJHKRkcVA
	UzGg9lXJGKqItRI2xLuJ27wd7Tc3POVm5WGJQ2+jW9sgd7SfKQfqsgVez9qIpv9qluMZy/6jk+j
	axoWK2jtiy86DKYeD4IY8y8GS+DDNAiBjXZ2Q7VPa43qwGxENaXWigGrp6Jd6rpcFniDFUPXFDm
	QiD5Mbnyb9kEBleEXUUGmKe2lihU/HG4w1+S3xwsISRyVLtQyLapdlu8k3xHNkeWQMKau+kDXiT
	QUI5tsa0Rs31yoLLtdRLZc88DTX9Id13W3ZVVDc2a9N
X-Received: by 2002:a05:690c:4b8b:b0:8b5:6873:52d0 with SMTP id 00721157ae682-8b5687359bbmr51538537b3.78.1795858624817;
        Sat, 28 Nov 2026 01:37:04 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b520354770sm106365047b3.42.2026.11.28.01.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:37:03 -0800 (PST)
Date: Sat, 28 Nov 2026 01:37:02 -0800
Message-ID: <bf93ffe454e1992c583e0c5823688f7ed0f80304.1795855037.git.chris@chrisdown.name>
In-Reply-To: <cover.1795855037.git.chris@chrisdown.name>
References: <cover.1795855037.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 2/2] selftests: timers: Add a test for CLOCK_TAI timerfds
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

Add timerfd-tai. It checks that an absolute CLOCK_TAI timer expires once
CLOCK_TAI reaches its expiry time, and what setting the clock does to
timers which were armed with TFD_TIMER_CANCEL_ON_SET:

- A step of CLOCK_REALTIME has to cancel CLOCK_REALTIME and CLOCK_TAI
  timers.
- A change of the TAI offset has to cancel CLOCK_TAI timers only.
- Injecting an offset of zero has to cancel neither.

The test steps CLOCK_REALTIME by a second and changes the TAI offset by
one. It puts both back afterwards, but that still makes it a destructive
test. It is skipped where timerfd_create() rejects CLOCK_TAI.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/timers/.gitignore    |   1 +
 tools/testing/selftests/timers/Makefile      |   2 +-
 tools/testing/selftests/timers/timerfd-tai.c | 183 +++++++++++++++++++
 3 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/timers/timerfd-tai.c

diff --git a/tools/testing/selftests/timers/.gitignore b/tools/testing/selftests/timers/.gitignore
index bb5326ff900b..ef56c8bbcc35 100644
--- a/tools/testing/selftests/timers/.gitignore
+++ b/tools/testing/selftests/timers/.gitignore
@@ -20,3 +20,4 @@ valid-adjtimex
 adjtick
 set-tz
 freq-step
+timerfd-tai
diff --git a/tools/testing/selftests/timers/Makefile b/tools/testing/selftests/timers/Makefile
index 0e73a16874c4..7a978064e3fb 100644
--- a/tools/testing/selftests/timers/Makefile
+++ b/tools/testing/selftests/timers/Makefile
@@ -9,7 +9,7 @@ TEST_GEN_PROGS = posix_timers nanosleep nsleep-lat set-timer-lat mqueue-lat \
 
 DESTRUCTIVE_TESTS = alarmtimer-suspend valid-adjtimex adjtick change_skew \
 		      skew_consistency clocksource-switch freq-step leap-a-day \
-		      leapcrash set-tai set-2038 set-tz
+		      leapcrash set-tai set-2038 set-tz timerfd-tai
 
 TEST_GEN_PROGS_EXTENDED = $(DESTRUCTIVE_TESTS)
 
diff --git a/tools/testing/selftests/timers/timerfd-tai.c b/tools/testing/selftests/timers/timerfd-tai.c
new file mode 100644
index 000000000000..803937d9e354
--- /dev/null
+++ b/tools/testing/selftests/timers/timerfd-tai.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Tests for timerfd timers on CLOCK_TAI.
+ *
+ * The TFD_TIMER_CANCEL_ON_SET tests run on CLOCK_REALTIME too, because a
+ * change of the TAI offset has to cancel the timers on one clock but not on
+ * the other. They step CLOCK_REALTIME and change the TAI offset, and put both
+ * back afterwards.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <poll.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/timerfd.h>
+#include <sys/timex.h>
+
+#include "clock-helpers.h"
+#include "kselftest.h"
+
+static int tai_offset;
+
+static void set_tai_offset(int offset)
+{
+	struct timex tx = { .modes = ADJ_TAI, .constant = offset };
+
+	if (adjtimex(&tx) < 0)
+		ksft_exit_fail_perror("adjtimex(ADJ_TAI)");
+}
+
+static void step_realtime(int sec)
+{
+	struct timex tx = { .modes = ADJ_SETOFFSET, .time.tv_sec = sec };
+
+	if (adjtimex(&tx) < 0)
+		ksft_exit_fail_perror("adjtimex(ADJ_SETOFFSET)");
+}
+
+static long long timespec_to_ns(const struct timespec *ts)
+{
+	return ts->tv_sec * NSEC_PER_SEC + ts->tv_nsec;
+}
+
+static void check_expiry(void)
+{
+	struct pollfd pfd = { .events = POLLIN };
+	struct itimerspec its = {};
+	struct timespec now;
+	uint64_t ticks;
+	bool pass;
+
+	pfd.fd = timerfd_create(CLOCK_TAI, 0);
+	if (pfd.fd < 0)
+		ksft_exit_fail_perror("timerfd_create()");
+
+	if (clock_gettime(CLOCK_TAI, &its.it_value))
+		ksft_exit_fail_perror("clock_gettime()");
+	its.it_value.tv_sec++;
+
+	if (timerfd_settime(pfd.fd, TFD_TIMER_ABSTIME, &its, NULL))
+		ksft_exit_fail_perror("timerfd_settime()");
+
+	pass = poll(&pfd, 1, 5 * MSEC_PER_SEC) == 1 &&
+	       read(pfd.fd, &ticks, sizeof(ticks)) == sizeof(ticks) && ticks == 1;
+
+	if (clock_gettime(CLOCK_TAI, &now))
+		ksft_exit_fail_perror("clock_gettime()");
+	pass &= timespec_to_ns(&now) >= timespec_to_ns(&its.it_value);
+
+	close(pfd.fd);
+	ksft_test_result(pass, "%s %s\n", __func__, clock_name(CLOCK_TAI));
+}
+
+/* Arm a timer which is too far away to expire while the test runs */
+static int arm_timer(clockid_t clockid)
+{
+	struct itimerspec its = {};
+	int fd;
+
+	fd = timerfd_create(clockid, TFD_NONBLOCK);
+	if (fd < 0)
+		ksft_exit_fail_perror("timerfd_create()");
+
+	if (clock_gettime(clockid, &its.it_value))
+		ksft_exit_fail_perror("clock_gettime()");
+	its.it_value.tv_sec += 3600;
+
+	if (timerfd_settime(fd, TFD_TIMER_ABSTIME | TFD_TIMER_CANCEL_ON_SET, &its, NULL))
+		ksft_exit_fail_perror("timerfd_settime()");
+
+	return fd;
+}
+
+/*
+ * A cancelled timer is readable and the read fails with ECANCELED. One which
+ * was left alone is not readable.
+ */
+static bool check_timer(int fd, bool cancelled)
+{
+	struct pollfd pfd = { .fd = fd, .events = POLLIN };
+	bool readable = poll(&pfd, 1, 0) == 1;
+	uint64_t ticks;
+
+	if (readable != cancelled)
+		return false;
+
+	if (read(fd, &ticks, sizeof(ticks)) >= 0)
+		return false;
+
+	return errno == (cancelled ? ECANCELED : EAGAIN);
+}
+
+static void check_clock_step(clockid_t clockid)
+{
+	int fd = arm_timer(clockid);
+	bool pass;
+
+	/* CLOCK_TAI is stepped along with CLOCK_REALTIME */
+	step_realtime(1);
+	pass = check_timer(fd, true);
+	step_realtime(-1);
+	pass &= check_timer(fd, true);
+
+	/* Injecting no offset counts as setting the clock, but it moves nothing */
+	step_realtime(0);
+	pass &= check_timer(fd, false);
+
+	close(fd);
+	ksft_test_result(pass, "%s %s\n", __func__, clock_name(clockid));
+}
+
+static void check_tai_offset(clockid_t clockid)
+{
+	/* The TAI offset only moves CLOCK_TAI */
+	bool cancelled = clockid == CLOCK_TAI;
+	int fd = arm_timer(clockid);
+	bool pass;
+
+	set_tai_offset(tai_offset + 1);
+	pass = check_timer(fd, cancelled);
+	set_tai_offset(tai_offset);
+	pass &= check_timer(fd, cancelled);
+
+	close(fd);
+	ksft_test_result(pass, "%s %s\n", __func__, clock_name(clockid));
+}
+
+int main(void)
+{
+	struct timex tx = {};
+	int fd;
+
+	ksft_print_header();
+
+	fd = timerfd_create(CLOCK_TAI, 0);
+	if (fd < 0 && errno == EINVAL)
+		ksft_exit_skip("timerfd does not support CLOCK_TAI\n");
+	if (fd < 0)
+		ksft_exit_fail_perror("timerfd_create()");
+	close(fd);
+
+	if (adjtimex(&tx) < 0)
+		ksft_exit_fail_perror("adjtimex()");
+	tai_offset = tx.tai;
+
+	/* Setting the TAI offset to what it already is only checks permissions */
+	tx.modes = ADJ_TAI;
+	tx.constant = tai_offset;
+	if (adjtimex(&tx) < 0 && errno == EPERM)
+		ksft_exit_skip("Changing the clocks needs CAP_SYS_TIME\n");
+
+	ksft_set_plan(5);
+
+	check_expiry();
+	check_clock_step(CLOCK_REALTIME);
+	check_clock_step(CLOCK_TAI);
+	check_tai_offset(CLOCK_REALTIME);
+	check_tai_offset(CLOCK_TAI);
+
+	ksft_finished();
+}
-- 
2.56.1

