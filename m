Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427074;
	b=lI3gNX0agBdBrJz9YQrc+YLOoWqTl8ZQnmkaVkh9Nn69tN6DTMeI5HhQ6r1DuCPNRHKx
	 Ks9g18/9CQClGSWxQbH2LqUVjj12C0yoBRMweh0dEocekwbfWlJsnSHgNF5AKiR+hCUVV
	 D8k6PyWxspemrDokwy5I3YvVG+pr4ZEMbxOtrd5+J8VZkGjxucgR5PSpYqBPmzp4eTUwZ
	 kpMMgpHtDq8UQ9dTgrLitvTSybS+0xEu5lQyAUT4puZ1stiBP4nxSWfEFkf14O+2gqzcX
	 D46ZsyS97e8tlhujVyQGYMAVrdAxXRtQyyD6b0EANOkco4Ncn0x8883tEJEA8MHWw6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427074;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=Ce/5vm4EcbLAHKVH9zwAtSq8omJGCQtGH7wm6hcadQc=;
	b=4KXhF0Mvh/oiztmvuWIcodV0NvcQzsKG6h8GbR3CRxB0mm5T5AV6ybpgHAr1r6lix7IR
	 /eVJWjX/IbfWeUhG+YJxpMHpdnldqoO3zvb8OD/9kU5MnRgcA4m8/j6SygxAr20C6KZ/W
	 OvjAyPdJwLUEY/sfc5FhYIJQUIlzz1VnaLbB/4XU5+6Z6XolVSIcUoFCWiPu6zjiCWDAL
	 rWBQnzPKwg7VSTOMvq9TptbGDoXsDZnWqMnJ4OGX+nsYbQY4MUP/PhZPzDzYxN/bIpdrG
	 JfgRwXI2bUAoh2pRr6dC/MqQKeCrLBUDpNRh9Ihwg27+ipQ2SunbX1i0O2w5kKzDbSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NPMBuaXi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="/UlD3WsH";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD17606A334;
	Mon, 23 Nov 2026 09:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD17606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=NPMBuaXi;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/UlD3WsH
Date: Mon, 23 Nov 2026 09:44:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427070;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ce/5vm4EcbLAHKVH9zwAtSq8omJGCQtGH7wm6hcadQc=;
	b=NPMBuaXiR+lin3YhjJInzP1XbdQephjqdDdY5sDKZ5F3DC4S68pieReoWWAQmAKr3vKvg0
	sQOK38+WjUEsuaw7NoTq5jgAui5aebfLWHu1iWjLj39huHxP6Opw1NLvbavzVM3x8X6bFb
	wnacHDxLBvYIpRO87FCKGRjRu5cO3KRsNSkr76DCTQbfIA5YEKJwwVWIm1v//8ur8rDRBN
	zdcllzBMbZNW3i58cqX5CEFYBjlEICm9HOJ8zkneTepLksE5ZszFIX44gkmsRHwSWiRllj
	C/YLXd7BZuW4QVZBbZVFpMnjZCcIEMCbDyQ2Ph8NqfUcmsRDntlaY8mVjQizoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427070;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ce/5vm4EcbLAHKVH9zwAtSq8omJGCQtGH7wm6hcadQc=;
	b=/UlD3WsH1evfRmNYdYVQWHVfXOzvkrXnRSOH2V2BpR5xSSKRp44gz0gPdTqnntyjrqn0qg
	A+fEi59bzQV0R8Ag==
From: "tip-bot2 for Fernand Sieber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] selftests/sched: Add a core-sched forced-idle DL
 server test
Cc: Fernand Sieber <sieberf@amazon.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112161548.78189-6-sieberf@amazon.com>
References: <20261112161548.78189-6-sieberf@amazon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542706791.92412.6563925878089936362.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     6d6fca38f51f414b75201d07b9ad4003f714551e
Gitweb:        https://git.kernel.org/tip/6d6fca38f51f414b75201d07b9ad4003f71=
4551e
Author:        Fernand Sieber <sieberf@amazon.com>
AuthorDate:    Thu, 12 Nov 2026 18:15:48 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:38:26 +01:00

selftests/sched: Add a core-sched forced-idle DL server test

Nothing in selftests notices a deferred DL server that is charged for
core-sched forced idle and so never activates: the fair server keeps its
reservation in debugfs while the CFS tasks it reserves for get a few
hundredths of a percent of a CPU.

Add cs_dl_server_test. It pins a SCHED_FIFO 50 spinner with its own core
cookie to one SMT sibling and an uncookied CFS spinner to the other, so
the second sibling is forced idle whenever the FIFO task runs, then
checks the CFS task's share of that CPU over five seconds against the
fair server's reservation under /sys/kernel/debug/sched/. The floor is
half the reservation, 2.5% by default, since every slice the server gets
costs a forced-idle hand-over. It skips without SMT, without core
scheduling, or without the debugfs reservation.

At 2 cores x 2 threads the share measures 4.0-5.2% once both this idle
charge and the core-wide DL server pick are fixed, and 0.0% with either
missing, so it passes only with both.

Signed-off-by: Fernand Sieber <sieberf@amazon.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261112161548.78189-6-sieberf@amazon.com
---
 tools/testing/selftests/sched/.gitignore          |   1 +-
 tools/testing/selftests/sched/Makefile            |   4 +-
 tools/testing/selftests/sched/config              |   4 +-
 tools/testing/selftests/sched/cs_dl_server_test.c | 402 +++++++++++++-
 4 files changed, 408 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/sched/cs_dl_server_test.c

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftes=
ts/sched/.gitignore
index 6996d46..4e3a025 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1 +1,2 @@
 cs_prctl_test
+cs_dl_server_test
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests=
/sched/Makefile
index 099ee92..fa50d13 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -8,7 +8,7 @@ CFLAGS +=3D -O2 -Wall -g -I./ $(KHDR_INCLUDES) -Wl,-rpath=3D.=
/ \
 	  $(CLANG_FLAGS)
 LDLIBS +=3D -lpthread
=20
-TEST_GEN_FILES :=3D cs_prctl_test
-TEST_PROGS :=3D cs_prctl_test
+TEST_GEN_FILES :=3D cs_prctl_test cs_dl_server_test
+TEST_PROGS :=3D cs_prctl_test cs_dl_server_test
=20
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/config b/tools/testing/selftests/s=
ched/config
index 1bb8bf6..57b2439 100644
--- a/tools/testing/selftests/sched/config
+++ b/tools/testing/selftests/sched/config
@@ -1 +1,3 @@
-# empty
+CONFIG_SCHED_CORE=3Dy
+CONFIG_SCHED_SMT=3Dy
+CONFIG_DEBUG_FS=3Dy
diff --git a/tools/testing/selftests/sched/cs_dl_server_test.c b/tools/testin=
g/selftests/sched/cs_dl_server_test.c
new file mode 100644
index 0000000..38aa005
--- /dev/null
+++ b/tools/testing/selftests/sched/cs_dl_server_test.c
@@ -0,0 +1,402 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that core-scheduling forced idle does not starve the fair deadline
+ * server.
+ *
+ * A CPU is forced idle when it has runnable tasks of its own but its SMT
+ * sibling runs a task with an incompatible core-sched cookie. If that time =
is
+ * charged to the rq's deferred DL servers, the fair server's runtime drains
+ * while it is throttled, its activation is pushed out every period, and the
+ * CFS tasks it reserves bandwidth for get next to nothing.
+ *
+ * The test pins a cookied SCHED_FIFO spinner to one SMT sibling and an
+ * uncookied CFS spinner to the other, so the second sibling is forced idle
+ * whenever the FIFO task runs, and checks that the CFS task still gets a
+ * sensible fraction of the fair server's reservation.
+ *
+ * Copyright (c) 2026 Amazon.com, Inc. or its affiliates.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef PR_SCHED_CORE
+#define PR_SCHED_CORE			62
+#define PR_SCHED_CORE_GET		0
+#define PR_SCHED_CORE_CREATE		1 /* create unique core_sched cookie */
+#define PR_SCHED_CORE_SHARE_TO		2 /* push core_sched cookie to pid */
+#define PR_SCHED_CORE_SHARE_FROM	3 /* pull core_sched cookie to pid */
+#define PR_SCHED_CORE_MAX		4
+#endif
+
+enum pid_type {PIDTYPE_PID =3D 0, PIDTYPE_TGID, PIDTYPE_PGID};
+
+#define SIBLINGS_LIST	"/sys/devices/system/cpu/cpu0/topology/thread_siblings=
_list"
+#define FAIR_SERVER	"/sys/kernel/debug/sched/fair_server"
+
+#define RUN_TIME	5	/* measurement window, in seconds */
+#define FIFO_PRIO	50
+
+/*
+ * The reservation is only approached, not reached: every slice the fair ser=
ver
+ * gets costs the sibling a forced-idle hand-over, and the core-wide pick ru=
ns
+ * at tick granularity. Ask for half of it, which is far above the few hundr=
edths
+ * of a percent a starved server leaves.
+ */
+#define MIN_SHARE_OF_RESERVATION	0.5
+
+/* Status a spinner child reports to the parent over its readiness pipe. */
+#define CHILD_READY	'R'
+#define CHILD_EPERM	'P'
+#define CHILD_ERROR	'E'
+
+/* Tell the parent how setup went; it decides whether to run or to skip. */
+static void signal_status(int fd, char status)
+{
+	if (write(fd, &status, 1) !=3D 1) {
+		ksft_perror("write to readiness pipe");
+		exit(1);
+	}
+	if (status !=3D CHILD_READY)
+		exit(1);
+}
+
+/*
+ * Burn CPU until killed. A constant controlling expression keeps the compil=
er
+ * from removing the loop, so no volatile is needed to hold it in place.
+ */
+static void spin_forever(void)
+{
+	while (1)
+		;
+}
+
+static int set_affinity(int cpu)
+{
+	cpu_set_t mask;
+
+	CPU_ZERO(&mask);
+	CPU_SET(cpu, &mask);
+
+	return sched_setaffinity(0, sizeof(mask), &mask);
+}
+
+/*
+ * Read the first two distinct CPU ids out of a cpu list such as "0-1", "0,4"
+ * or "0,4-5". Returns 0 on success, -1 if the list holds fewer than two ids.
+ */
+static int parse_sibling_pair(const char *list, int *sib0, int *sib1)
+{
+	int found =3D 0, sib[2] =3D { -1, -1 };
+	const char *p =3D list;
+
+	while (*p && found < 2) {
+		int first, last, n =3D 0;
+
+		if (sscanf(p, "%d-%d%n", &first, &last, &n) !=3D 2) {
+			if (sscanf(p, "%d%n", &first, &n) !=3D 1)
+				return -1;
+			last =3D first;
+		}
+		for (; first <=3D last && found < 2; first++)
+			sib[found++] =3D first;
+		p +=3D n;
+		if (*p !=3D ',')
+			break;
+		p++;
+	}
+
+	if (found < 2)
+		return -1;
+
+	*sib0 =3D sib[0];
+	*sib1 =3D sib[1];
+
+	return 0;
+}
+
+static int read_sibling_pair(int *sib0, int *sib1)
+{
+	char list[256];
+	FILE *f;
+	char *s;
+
+	f =3D fopen(SIBLINGS_LIST, "r");
+	if (!f)
+		return -1;
+	s =3D fgets(list, sizeof(list), f);
+	fclose(f);
+	if (!s)
+		return -1;
+
+	return parse_sibling_pair(list, sib0, sib1);
+}
+
+static int read_u64_file(const char *path, unsigned long long *val)
+{
+	FILE *f;
+	int ret;
+
+	f =3D fopen(path, "r");
+	if (!f)
+		return -1;
+	ret =3D fscanf(f, "%llu", val);
+	fclose(f);
+
+	return ret =3D=3D 1 ? 0 : -1;
+}
+
+/* Read the fair server reservation of @cpu, in nanoseconds. */
+static int read_fair_server(int cpu, unsigned long long *runtime,
+			    unsigned long long *period)
+{
+	char path[PATH_MAX];
+
+	snprintf(path, sizeof(path), FAIR_SERVER "/cpu%d/runtime", cpu);
+	if (read_u64_file(path, runtime))
+		return -1;
+
+	snprintf(path, sizeof(path), FAIR_SERVER "/cpu%d/period", cpu);
+	if (read_u64_file(path, period))
+		return -1;
+
+	return 0;
+}
+
+/* CPU time consumed by @pid so far, in seconds, from /proc/<pid>/stat. */
+static double process_runtime(pid_t pid)
+{
+	char path[PATH_MAX];
+	unsigned long utime, stime;
+	FILE *f;
+	int fields;
+
+	snprintf(path, sizeof(path), "/proc/%d/stat", pid);
+	f =3D fopen(path, "r");
+	if (!f)
+		return -1;
+
+	/* Skip the first 13 fields and read the 14th and 15th. */
+	fields =3D fscanf(f, "%*d %*s %*c %*d %*d %*d %*d %*d %*u %*u %*u %*u %*u %=
lu %lu",
+			&utime, &stime);
+	fclose(f);
+	if (fields !=3D 2)
+		return -1;
+
+	return (double)(utime + stime) / sysconf(_SC_CLK_TCK);
+}
+
+static double monotonic_now(void)
+{
+	struct timespec ts;
+
+	if (clock_gettime(CLOCK_MONOTONIC, &ts))
+		return -1;
+
+	return ts.tv_sec + ts.tv_nsec / 1000000000.0;
+}
+
+/*
+ * Diagnostic only: how long the FIFO task's CPU was forced idle. Needs
+ * CONFIG_SCHEDSTATS and schedstats enabled, so it must not gate the result.
+ */
+static void print_forced_idle(pid_t pid)
+{
+	char path[PATH_MAX], line[256];
+	FILE *f;
+
+	snprintf(path, sizeof(path), "/proc/%d/sched", pid);
+	f =3D fopen(path, "r");
+	if (!f)
+		return;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (strstr(line, "core_forceidle_sum")) {
+			line[strcspn(line, "\n")] =3D '\0';
+			ksft_print_msg("FIFO task %s\n", line);
+			break;
+		}
+	}
+	fclose(f);
+}
+
+/* Cookied SCHED_FIFO spinner. Only this task gets a cookie. */
+static void fifo_child(int cpu, int ready_fd)
+{
+	struct sched_param param =3D { .sched_priority =3D FIFO_PRIO };
+
+	if (set_affinity(cpu)) {
+		ksft_perror("FIFO child sched_setaffinity");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PID, 0)) {
+		ksft_perror("FIFO child PR_SCHED_CORE_CREATE");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	if (sched_setscheduler(0, SCHED_FIFO, &param)) {
+		if (errno =3D=3D EPERM)
+			signal_status(ready_fd, CHILD_EPERM);
+		ksft_perror("FIFO child sched_setscheduler");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	signal_status(ready_fd, CHILD_READY);
+	spin_forever();
+}
+
+/* Uncookied CFS spinner on the FIFO task's SMT sibling. */
+static void cfs_child(int cpu, int ready_fd)
+{
+	if (set_affinity(cpu)) {
+		ksft_perror("CFS child sched_setaffinity");
+		signal_status(ready_fd, CHILD_ERROR);
+	}
+	signal_status(ready_fd, CHILD_READY);
+	spin_forever();
+}
+
+static char wait_ready(int fd)
+{
+	char status;
+
+	if (read(fd, &status, 1) !=3D 1) {
+		ksft_perror("read from readiness pipe");
+		return CHILD_ERROR;
+	}
+
+	return status;
+}
+
+static void kill_child(pid_t *pid)
+{
+	if (*pid <=3D 0)
+		return;
+	kill(*pid, SIGKILL);
+	waitpid(*pid, NULL, 0);
+	*pid =3D -1;
+}
+
+int main(void)
+{
+	double fifo_runtime, cfs_start, cfs_end, t_start, t_end, share, want;
+	unsigned long long runtime, period;
+	pid_t fifo_pid =3D -1, cfs_pid =3D -1;
+	int fifo_ready[2], cfs_ready[2];
+	unsigned long long cookie;
+	int sib0, sib1;
+	char status;
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (read_sibling_pair(&sib0, &sib1)) {
+		ksft_test_result_skip("CPU0 has no SMT sibling\n");
+		ksft_finished();
+	}
+	ksft_print_msg("SMT siblings: CPU%d (FIFO) and CPU%d (CFS)\n", sib0, sib1);
+
+	if (prctl(PR_SCHED_CORE, PR_SCHED_CORE_GET, 0, PIDTYPE_PID,
+		  (unsigned long)&cookie)) {
+		ksft_test_result_skip("core scheduling unavailable: %s\n",
+				      strerror(errno));
+		ksft_finished();
+	}
+
+	if (read_fair_server(sib1, &runtime, &period)) {
+		ksft_test_result_skip("cannot read " FAIR_SERVER "/cpu%d, debugfs not moun=
ted?\n",
+				      sib1);
+		ksft_finished();
+	}
+	if (!runtime || !period) {
+		ksft_test_result_skip("fair server on CPU%d is disabled (%llu/%llu)\n",
+				      sib1, runtime, period);
+		ksft_finished();
+	}
+	ksft_print_msg("CPU%d fair server reservation: %llu/%llu ns =3D %.3f%%\n",
+		       sib1, runtime, period, 100.0 * runtime / period);
+
+	if (pipe(fifo_ready) || pipe(cfs_ready))
+		ksft_exit_fail_perror("pipe");
+
+	fifo_pid =3D fork();
+	if (!fifo_pid) {
+		close(fifo_ready[0]);
+		close(cfs_ready[0]);
+		close(cfs_ready[1]);
+		fifo_child(sib0, fifo_ready[1]);
+	} else if (fifo_pid < 0) {
+		ksft_exit_fail_perror("fork FIFO child");
+	}
+	close(fifo_ready[1]);
+
+	status =3D wait_ready(fifo_ready[0]);
+	close(fifo_ready[0]);
+	if (status !=3D CHILD_READY) {
+		kill_child(&fifo_pid);
+		close(cfs_ready[0]);
+		close(cfs_ready[1]);
+		if (status =3D=3D CHILD_EPERM) {
+			ksft_test_result_skip("need privileges for SCHED_FIFO\n");
+			ksft_finished();
+		}
+		ksft_exit_fail_msg("FIFO child setup failed\n");
+	}
+
+	cfs_pid =3D fork();
+	if (!cfs_pid) {
+		close(cfs_ready[0]);
+		cfs_child(sib1, cfs_ready[1]);
+	} else if (cfs_pid < 0) {
+		kill_child(&fifo_pid);
+		ksft_exit_fail_perror("fork CFS child");
+	}
+	close(cfs_ready[1]);
+
+	status =3D wait_ready(cfs_ready[0]);
+	close(cfs_ready[0]);
+	if (status !=3D CHILD_READY) {
+		kill_child(&cfs_pid);
+		kill_child(&fifo_pid);
+		ksft_exit_fail_msg("CFS child setup failed\n");
+	}
+
+	cfs_start =3D process_runtime(cfs_pid);
+	t_start =3D monotonic_now();
+	sleep(RUN_TIME);
+	t_end =3D monotonic_now();
+	cfs_end =3D process_runtime(cfs_pid);
+	fifo_runtime =3D process_runtime(fifo_pid);
+
+	print_forced_idle(fifo_pid);
+	kill_child(&cfs_pid);
+	kill_child(&fifo_pid);
+
+	if (cfs_start < 0 || cfs_end < 0 || fifo_runtime < 0)
+		ksft_exit_fail_msg("cannot read /proc/<pid>/stat\n");
+	if (t_start < 0 || t_end <=3D t_start)
+		ksft_exit_fail_msg("cannot read CLOCK_MONOTONIC\n");
+
+	share =3D (cfs_end - cfs_start) / (t_end - t_start);
+	want =3D MIN_SHARE_OF_RESERVATION * runtime / period;
+
+	ksft_print_msg("FIFO task ran %.3fs, CFS task ran %.3fs over %.3fs\n",
+		       fifo_runtime, cfs_end - cfs_start, t_end - t_start);
+	ksft_print_msg("CFS share of CPU%d: %.3f%%, need %.3f%%\n",
+		       sib1, share * 100, want * 100);
+
+	ksft_test_result(share >=3D want,
+			 "CFS task gets the fair server reservation while forced idle\n");
+
+	ksft_finished();
+}
