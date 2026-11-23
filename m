Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448082;
	b=mpcsYHCuD+HhAWOl/2xSJ4XnFrULi0n2Qa9vm/BQ3zpedxAzmfNpdV+Vk1aDlBcoeWsU
	 INRRQTh3Aq0ZyE5wumKUi0WSytxnlftDzokuvMgyS/+0g2szjQX9t3Iy36geAzJatl8dp
	 aP/58z9Zrs/9gLNVv0/1iK66ltJxSeh9PdqblN8Dh/ij+D5wSDmUsXUQsc9RmrZRMnTR0
	 hE6zNL7gVyebjUjojAioiw37Y5YTw3Se9PbJ1fYVWDtAI5dOq6bv3fBCMt3j26TPPaLV5
	 t+4wHC7BzF+72kzs67oBC+PZJF4vbfUMlcdSaKBhC2UEFwVOz2FN78IPqVoFl8ilF1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=R2Rh2yIbdTeaHuI1xztP993wm7ZrZNAfJr4c+tXkXFQ=;
	b=qOjBGhK2etL5JatebhUO2E/AGcYhtUm6ihvtJytEg9kRqgy0zo9R11KUTrMXI9BfzpJH
	 6Y70lnNkjAVk+v1OECTIOu9kAepEoHl7mJSVMw16Ws4ygqpGyP1TOaGmjCnA/3VIS0cLo
	 GbM0S2Z1impIwXoC/z6GQqhs+GIDKfU2FwiizFol0YYhJsGkkYh+hqwTJ6AOWw/umSsPE
	 1jzeMOxQrUzeCm4kKX6h2JAugYgaybYKTeGlW89a2szs3FfU3wFaii/0JzsxZljJS3azx
	 Qkd5PwKdb9dDY9tcfqwafX5JsfBkwnXpKW//FH6yRCfVVCqMg9K5R4oG1rLmcNYaVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z63ObqCR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D4606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B1D4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z63ObqCR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so32476775e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795448080; x=1796052880; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R2Rh2yIbdTeaHuI1xztP993wm7ZrZNAfJr4c+tXkXFQ=;
        b=Z63ObqCR/9NvjwLJ3EtP1HgFONQ/gN8IkB6HSzLhwKctqWX8Bq1fyNR7AODqxdLcIR
         CTTABF4LSN+K2IK1U/KOC3ryVVGvC01Lm+jEhVEOZu9p1yTRXO4PxhrsFXq5GoCRTNSS
         aPjsX8achvUJG30kTVMjSX5fAoPv0sDooHIODwDk7lQlZTn2Ed4HR2wR36/NUtwtdJjr
         wQdFEOhQtQ0RX1HZyqlZUe9R+ZnDYO9kVSHgaNAkCXBhTvwLBjvw688XqNK+GvYyFVkI
         yyduB384pb7+t5ZGawVrEHVPfUjIqqwBOFaBiQEToRh9tTKtFKBnj3KlDmHKrLvKvRNN
         aVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448080; x=1796052880;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R2Rh2yIbdTeaHuI1xztP993wm7ZrZNAfJr4c+tXkXFQ=;
        b=TF45AKjUPOgcB7pQMJxRhhvj1nd1n+RtsnOspT8/KFmS2BwrsH+TUOghshn4Y7hVB0
         pTPjuI9CAmDAPvihOj9JJH2iZKZOH20gKsetwfOSMIZF9UdILjji2XBKhzHyXk4Yd7Vs
         ccUOyEqg39udjk+RAGkUXlxr8UNZVofpZY0V8rxA1HsyUEiassI5zVSckCe3BpvbN8LA
         17MHhhI92FFxNZOMEUgXAoRU1luVD+4oMogwvo+qINsY6bTT+/t0uX0HefoR6fLhlCsN
         ZLhaGX0su8+hCoSfjz5NOUzX1HCx862meELc3Z9xONKyiXiebHoci4P4SA2nfV3t6kW8
         av+w==
X-Forwarded-Encrypted: i=1; AL+hErFhA0nWtnksZ/lcEp6IBUYCXmw6oHbDt1leQEPapa/1BK+yDFhgCG0eQWwzWcIoZpL3a4XqgGyZF7hTrI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+ZfLRWw64IrwVLZuYeGLGLEVL207Ov+ryg+YWIhCYkngVCKy9
	gDKT+Jqvd/qvt25TVtyYYkvdkymHsvGUKbBXLNYhJZuPalg5/mW0NTaxs+wXtXCq3NM=
X-Gm-Gg: AZFdTZe7vyKnqhAO35nOAvypCuaVFsCMX4rX+GwpniiB1kXKvOiuIiCzi6TG46Ahl0h
	4e8yKFacHrMT0jOlYbVroiuNX5RjNcHWH2lwAIWBFATgbMI/hH9RRTK97Gfied4PXJVepLloBDi
	bUMVUv9Ou87ZDRS6Wuw+oNUpPzXGXwKFJIC9ViSyxpRYtB6s2e9bTx/XetZ0svd79PoXkPL9FOf
	d2lfsm14Y04SlggIeBo+p9v5R5Izvd7Rw7xKzb+apDzY4JndnJ8iLQdueWpP26xCJPIS9An7XTv
	979z7LwX7j60s49G6iQnSPIfvuJvKIWpI4BQjxpsItlExzHgFp8Hb/QntJVx16WAzFnpKsFn83s
	JzVNx8TTrmLuSo5Bjvk9NCz64gwOD29e2onGEgj5Jawjq6LYzKdvpylxtpJTcofa3F1iFGE9y0M
	6784Hgl6VpIqERnEF84DGHh1DSA3Wj+XGEcCVVVaP+S87xGYOSDALUM36js0T3lkWvXseHOY+Iy
	P88JleSpLjbakS1/k6X92I2OPFcB1m1O/WnIt6/Y90SajKRFI6EiRpVkonglVb6O6g1FZau9JDf
	+3tfBBKYfiUWG52f+hXe5Vo/KZK/EEnp
X-Received: by 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr228098905e9.19.1795448080631;
        Mon, 23 Nov 2026 07:34:40 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm319681185e9.9.2026.11.23.07.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:34:40 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 23 Nov 2026 15:34:29 +0000
Subject: [PATCH] perf test: Fix race in "Event re-armed with
 PERF_EVENT_IOC_REFRESH"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-james-perf-event_refresh-v1-1-571efa5395ab@linaro.org>
X-B4-Tracking: v=1; b=H4sIAARdBGsC/yXMUQrCQAyE4auUPBtwV1zEq4hIm87aFFxLUotQe
 ndXffwY5l/JYQqnc7OSYVHXZ6kIu4ZkaMsdrH01xX1MIcQDj+0DzhMsMxaU+WbIBh9YBMecuj7
 lk1C9T3XQ9y99uf7tr26EzN8ebdsHHnI8kXwAAAA=
X-Change-ID: 20261123-james-perf-event_refresh-cce5f6bd6f8c
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Francesco Nigro <nigro.fra@gmail.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

trigger() is invoked without blocking, but the test expects N events to
always be received for N triggers. After each trigger, the event is
disabled and only re-enabled by the signal handler. If the next trigger
happens before the event is re-enabled, then an event count will be
dropped. This is possible because signals are delivered asynchronously.
Fix it by blocking signals then unblocking while waiting for the event
after each call to trigger().

Blocking results in a 1:1 relation between trigger and signal counts,
even when there are extra page faults, so remove the comment and change
>= to == on the final test assert.

Timeout after 2 seconds because we already know there are broken kernels
for the tracepoint test, and the default 120s timeout would be annoying.

This fixes the following failure seen on Arm64:

  $ perf test -vv -r 30000 -S "Event re-armed"
  ...

  ---- start ----
  test child forked, pid 1087
  1000 events, count 999, 999 overflows (999 POLL_HUP), re-arm errno 0
  ---- end(-1) ----
   20.1: Software event                   : FAILED!

Fixes: 3dabc8ad8ae0 ("perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH")
Signed-off-by: James Clark <james.clark@linaro.org>
---
Assisted by Claude Opus-5.5
---
 tools/perf/tests/event_refresh.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/event_refresh.c b/tools/perf/tests/event_refresh.c
index 726e5de4c795..0750cbb63866 100644
--- a/tools/perf/tests/event_refresh.c
+++ b/tools/perf/tests/event_refresh.c
@@ -6,6 +6,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
+#include <poll.h>
 #include <signal.h>
 #include <string.h>
 #include <unistd.h>
@@ -44,6 +45,7 @@ static void sig_handler(int signum __maybe_unused, siginfo_t *info,
 static int count_overflows(struct perf_event_attr *attr, void (*trigger)(int i))
 {
 	struct sigaction sa, old_sa;
+	sigset_t mask, old_mask, wait_mask;
 	uint64_t count = 0;
 	int fd, i, err = TEST_FAIL;
 
@@ -68,6 +70,13 @@ static int count_overflows(struct perf_event_attr *attr, void (*trigger)(int i))
 		return TEST_FAIL;
 	}
 
+	/* Block signals so we only receive while waiting after each trigger() */
+	sigemptyset(&mask);
+	sigaddset(&mask, REFRESH_SIGNAL);
+	sigprocmask(SIG_BLOCK, &mask, &old_mask);
+	wait_mask = old_mask;
+	sigdelset(&wait_mask, REFRESH_SIGNAL);
+
 	if (fcntl(fd, F_SETFL, O_RDWR | O_NONBLOCK | O_ASYNC) < 0 ||
 	    fcntl(fd, F_SETSIG, REFRESH_SIGNAL) < 0 ||
 	    fcntl(fd, F_SETOWN, getpid()) < 0) {
@@ -82,20 +91,35 @@ static int count_overflows(struct perf_event_attr *attr, void (*trigger)(int i))
 		pr_debug("PERF_EVENT_IOC_REFRESH failed: %s\n", strerror(errno));
 		goto out;
 	}
-	for (i = 0; i < NR_EVENTS; i++)
+	for (i = 0; i < NR_EVENTS; i++) {
+		struct timespec timeout = { .tv_sec = 2 };
+		int before = overflows;
+
 		trigger(i);
+
+		/* Unblock signal to count and refresh event before triggering again */
+		while (overflows == before) {
+			if (ppoll(NULL, 0, &timeout, &wait_mask) == 0)
+				break;
+		}
+		if (overflows == before) {
+			pr_debug("no overflow signal for trigger %d\n", i);
+			break;
+		}
+	}
 	ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
 
 	if (read(fd, &count, sizeof(count)) != sizeof(count))
 		pr_debug("failed to read the event count\n");
 	pr_debug("%d events, count %" PRIu64 ", %d overflows (%d POLL_HUP), re-arm errno %d\n",
 		 NR_EVENTS, count, overflows, hups, refresh_errno);
-	/* Unrelated page faults can only add overflows, never hide one. */
-	if (overflows >= NR_EVENTS)
+
+	if (overflows == NR_EVENTS)
 		err = TEST_OK;
 out:
 	/* Close first: a late signal must still find our handler. */
 	close(fd);
+	sigprocmask(SIG_SETMASK, &old_mask, NULL);
 	sigaction(REFRESH_SIGNAL, &old_sa, NULL);
 	return err;
 }

---
base-commit: eb79d2fbc230d41b009e49f20671303c6efbd946
change-id: 20261123-james-perf-event_refresh-cce5f6bd6f8c

Best regards,
--  
James Clark <james.clark@linaro.org>

