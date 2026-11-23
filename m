Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427740;
	b=IIa+3DsaDzepG3OznLCuv/S/GoS91PkHcfeF1+DTTpBN4UGio0VXv4UbVuMVYOBbY2m4
	 iwOdBy0GFIP7ZxNspZMbUMLuWcS927BPWlOT0s22wRLq0QUS/XcYmzyG8FutXqQNduWlL
	 3MHEGvx7W/o9yKzF0cNsJ6tfyqeftc/SfOI4Y7qCi+kHvsfUQoZNDydYrDnAFw4uIVs1C
	 o2h+2ystHQgdh2lNZCS5ubHmm/2mVys1zzD3rwPYEdaZ3/6pw8wDJIcSDc758OOQFeeap
	 4DQJWz8S8eEpJ5WlBw6X0me4wEDQHBiFnd19Bw4mYEbpMmi0XURReNcptX80FRRrLZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427740;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=TKYDhv3lDU03DMsWA1GglyrygDSGzWOh/g5np7veJ0E=;
	b=pLKY3+VQHWVy9CZI+nN2UbQZiYJi5buSkgNS32cckzNCWEmjtDsVd2kvIQGWroGTUu8O
	 sBHS2GUssQZ98vuruNtD1kj8T0taQ/dD4HSUoR8TO02eD6s1pr0GRZYk36ObiVpnaSBnL
	 xq33WsAPNIaQmdBITQTm4l46+fn4Nw/+EJdfJbkIQCLntbv/MBQkshsT5ovHjuHh/BkCA
	 Kd/vaT0cFT9wAdPiAxhG4XSmUztd/MZJJ8+evbcoAObMpMcucWlIe1ya8qYPsD40m3jky
	 GApbB/INZW3odZsJclnxJRtOGIGSHgK0Q3ibqdsqBzQqA5q1nH+n89/g1bE1B2KzxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Hy+Zpucq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=czpytC4A;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5B1606A31E;
	Mon, 23 Nov 2026 09:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A5B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Hy+Zpucq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=czpytC4A
Date: Mon, 23 Nov 2026 09:55:35 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795427737;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKYDhv3lDU03DMsWA1GglyrygDSGzWOh/g5np7veJ0E=;
	b=Hy+ZpucqTmWCZ7NF+umyOmttXBX60EUuw7SZTP+m0gmh9UG0cjDiJRo07re/kBZYe2wc9B
	Ps4W+0JFu6FJ0amKIX7hlccsEYE3+ld5A/2csO/IIgif8Mgyk/PiqmGwEFUfbSbBWU4o7R
	Is/GseefK0l7tspdOuoHrRIjGj6q3chnAL+5O+jv4ZjvHTjlTDCFGzhYat/xIO9rJJN590
	0uI0CqhpGHH4WX+lppY6IuXZU+PF6NvlOErtBlSy8Pa4LT1srerwOheAACPca5hwMSMGRe
	nrOEud3o55a9E48DcWNL6hZJl656v91TimKPO9FRJKK1w3SA8ubsnX7IFum1IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795427737;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKYDhv3lDU03DMsWA1GglyrygDSGzWOh/g5np7veJ0E=;
	b=czpytC4A2tyfq0f/QFM4vvH+nYTcKadbXTpQbsNjzo0InbNHwQRrfk/u+1Isd3795fwaql
	uJ3/Dens9ulMvWBQ==
From: "tip-bot2 for Ibrahim Elshahed" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] selftests/sched: Add a test for stuck forced idle
 under core scheduling
Cc: Ibrahim Elshahed <lshahed@amazon.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261120105822.7770-4-lshahed@amazon.de>
References: <20261120105822.7770-4-lshahed@amazon.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179542773559.92412.12982399186905365467.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     c47af85667065c6dd5b79564203c2d29948ef60e
Gitweb:        https://git.kernel.org/tip/c47af85667065c6dd5b79564203c2d29948=
ef60e
Author:        Ibrahim Elshahed <lshahed@amazon.de>
AuthorDate:    Fri, 20 Nov 2026 10:58:22=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 23 Nov 2026 10:45:55 +01:00

selftests/sched: Add a test for stuck forced idle under core scheduling

Add cs_forceidle_test, which checks that a core does not stay forced
idle after the task that a core-wide selection picked for an idle SMT
sibling is migrated away before the sibling schedules, and that the
pick left behind is not used once that task is freed.

On one SMT core, a task with its own cookie yields in a loop on one
sibling. Each attempt wakes a SCHED_FIFO task with another cookie on
the other sibling, so the core-wide selection picks it there and forces
the first sibling idle, and migrates it to a CPU of another core 0-50 us
later. The yielding task must make progress again within 20 ms; an
attempt where it does not counts as a stall, and the first test fails if
there is any.

The woken task also runs in its own cgroup. After a stall the test kills
it, removes its cgroup, waits 100 ms for RCU to free both, and runs a
short-lived task on the sibling. A kernel that kept the freed task in
the sibling's rq->core_pick then charges forced idle time to it and its
cgroup, and crashes in __cgroup_account_cputime_field() or reports a
use-after-free with KASAN. Forced idle time is only accounted with
schedstats, so the test turns them on for its duration if they are off.
This second test is on by default and is skipped with -n, without cgroup
v2, or without schedstats.

The test runs for 30 s by default, -t sets the duration. It is skipped
when not run as root, without an SMT core and two other online CPUs, or
when core scheduling is unavailable. Also list CONFIG_SCHED_CORE in the
config fragment, which cs_prctl_test needs as well.

Signed-off-by: Ibrahim Elshahed <lshahed@amazon.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261120105822.7770-4-lshahed@amazon.de
---
 tools/testing/selftests/sched/.gitignore          |   1 +-
 tools/testing/selftests/sched/Makefile            |   1 +-
 tools/testing/selftests/sched/cs_forceidle_test.c | 471 +++++++++++++-
 3 files changed, 473 insertions(+)
 create mode 100644 tools/testing/selftests/sched/cs_forceidle_test.c

diff --git a/tools/testing/selftests/sched/.gitignore b/tools/testing/selftes=
ts/sched/.gitignore
index 4e3a025..8fcb37a 100644
--- a/tools/testing/selftests/sched/.gitignore
+++ b/tools/testing/selftests/sched/.gitignore
@@ -1,2 +1,3 @@
 cs_prctl_test
+cs_forceidle_test
 cs_dl_server_test
diff --git a/tools/testing/selftests/sched/Makefile b/tools/testing/selftests=
/sched/Makefile
index fa50d13..7d3e9cc 100644
--- a/tools/testing/selftests/sched/Makefile
+++ b/tools/testing/selftests/sched/Makefile
@@ -10,5 +10,6 @@ LDLIBS +=3D -lpthread
=20
 TEST_GEN_FILES :=3D cs_prctl_test cs_dl_server_test
 TEST_PROGS :=3D cs_prctl_test cs_dl_server_test
+TEST_GEN_PROGS :=3D cs_forceidle_test
=20
 include ../lib.mk
diff --git a/tools/testing/selftests/sched/cs_forceidle_test.c b/tools/testin=
g/selftests/sched/cs_forceidle_test.c
new file mode 100644
index 0000000..ca89a46
--- /dev/null
+++ b/tools/testing/selftests/sched/cs_forceidle_test.c
@@ -0,0 +1,471 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Check that core scheduling does not leave a core forced idle after the
+ * task a core-wide selection picked for an idle SMT sibling is migrated
+ * away before the sibling schedules, and that the pick it leaves behind is
+ * not used once that task is freed.
+ *
+ * On one SMT core with siblings A and B, a task U with its own cookie
+ * yields in a loop on A. Each attempt wakes a SCHED_FIFO task V with
+ * another cookie on B, so that the core-wide selection picks V for B and
+ * forces A idle, then migrates V to a CPU of another core 0-50 us later.
+ * U must make progress again within STALL_MS; an attempt where it does not
+ * is a stall.
+ *
+ * Unless -n is given, each V also runs in its own cgroup. After a stall,
+ * V is killed and its cgroup removed, and once RCU had time to free both,
+ * a short-lived task is run on B. A kernel that kept the migrated V in
+ * B's rq->core_pick then charges forced idle time to the freed task and
+ * cgroup, which crashes it in __cgroup_account_cputime_field() or makes
+ * KASAN report a use-after-free. Forced idle time is only accounted with
+ * schedstats, so the test turns them on for its duration if they are off.
+ * This part is skipped when cgroup v2 is not mounted or schedstats are
+ * unavailable.
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <unistd.h>
+
+#include "../kselftest.h"
+
+#ifndef PR_SCHED_CORE
+#define PR_SCHED_CORE			62
+#endif
+#ifndef PR_SCHED_CORE_CREATE
+#define PR_SCHED_CORE_CREATE		1
+#endif
+#define PIDTYPE_PID			0
+
+#define STALL_MS			20
+#define FREE_WAIT_MS			100
+#define DEFAULT_SECS			30
+#define SCHEDSTATS			"/proc/sys/kernel/sched_schedstats"
+#define CG_PATH_MAX			(2 * PATH_MAX + 64)
+
+static uint64_t *progress;
+
+/* cgroup part: parent cgroup of the per-attempt cgroups, if in use */
+static char cg_parent[CG_PATH_MAX];
+static int cg_active;
+static int schedstats_restore =3D -1;
+
+static uint64_t now_ns(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+	return ts.tv_sec * 1000000000ULL + ts.tv_nsec;
+}
+
+static int pin(pid_t pid, int cpu)
+{
+	cpu_set_t set;
+
+	CPU_ZERO(&set);
+	CPU_SET(cpu, &set);
+	return sched_setaffinity(pid, sizeof(set), &set);
+}
+
+static int create_cookie(void)
+{
+	return prctl(PR_SCHED_CORE, PR_SCHED_CORE_CREATE, 0, PIDTYPE_PID, 0);
+}
+
+static int write_str(const char *path, const char *val)
+{
+	ssize_t len =3D strlen(val);
+	int fd, ret;
+
+	fd =3D open(path, O_WRONLY);
+	if (fd < 0)
+		return -1;
+	ret =3D write(fd, val, len) =3D=3D len ? 0 : -1;
+	close(fd);
+	return ret;
+}
+
+/* Find an SMT core with two online siblings and two CPUs outside it. */
+static int find_cpus(int *a, int *b, int *helper, int *ctl)
+{
+	long ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
+	char path[128];
+	int cpu, s0, s1;
+	FILE *f;
+
+	*a =3D *b =3D *helper =3D *ctl =3D -1;
+	for (cpu =3D 0; cpu < ncpus && *a < 0; cpu++) {
+		snprintf(path, sizeof(path),
+			 "/sys/devices/system/cpu/cpu%d/topology/thread_siblings_list",
+			 cpu);
+		f =3D fopen(path, "r");
+		if (!f)
+			continue;
+		if (fscanf(f, "%d%*[,-]%d", &s0, &s1) =3D=3D 2 && s0 !=3D s1) {
+			*a =3D s0;
+			*b =3D s1;
+		}
+		fclose(f);
+	}
+	if (*a < 0)
+		return -1;
+
+	for (cpu =3D 0; cpu < ncpus; cpu++) {
+		if (cpu =3D=3D *a || cpu =3D=3D *b)
+			continue;
+		if (*helper < 0)
+			*helper =3D cpu;
+		else if (*ctl < 0)
+			*ctl =3D cpu;
+	}
+	return *ctl < 0 ? -1 : 0;
+}
+
+/* Probe in a child so this process keeps no cookie. */
+static int core_sched_available(void)
+{
+	int status;
+	pid_t pid;
+
+	pid =3D fork();
+	if (pid < 0)
+		return 0;
+	if (!pid)
+		_exit(create_cookie() ? 1 : 0);
+	if (waitpid(pid, &status, 0) !=3D pid)
+		return 0;
+	return WIFEXITED(status) && !WEXITSTATUS(status);
+}
+
+static void cg_cleanup(void)
+{
+	if (cg_active)
+		rmdir(cg_parent);
+	if (schedstats_restore >=3D 0)
+		write_str(SCHEDSTATS, schedstats_restore ? "1" : "0");
+}
+
+/*
+ * Set up the cgroup part: find the cgroup v2 mount and this process's
+ * cgroup in it, create a parent for the per-attempt cgroups below it, and
+ * turn on schedstats. Returns NULL on success or why it is unavailable.
+ */
+static const char *cg_setup(void)
+{
+	char line[PATH_MAX], mnt[PATH_MAX] =3D "", own[PATH_MAX] =3D "";
+	char *sep;
+	FILE *f;
+	int val;
+
+	f =3D fopen("/proc/self/mountinfo", "r");
+	if (!f)
+		return "cannot read /proc/self/mountinfo";
+	while (fgets(line, sizeof(line), f)) {
+		sep =3D strstr(line, " - ");
+		if (sep && !strncmp(sep + 3, "cgroup2 ", 8) &&
+		    sscanf(line, "%*s %*s %*s %*s %s", mnt) =3D=3D 1)
+			break;
+		mnt[0] =3D '\0';
+	}
+	fclose(f);
+	if (!mnt[0])
+		return "cgroup v2 not mounted";
+
+	f =3D fopen("/proc/self/cgroup", "r");
+	if (!f)
+		return "cannot read /proc/self/cgroup";
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "0::", 3)) {
+			line[strcspn(line, "\n")] =3D '\0';
+			snprintf(own, sizeof(own), "%s", line + 3);
+			break;
+		}
+	}
+	fclose(f);
+	if (!own[0])
+		return "not in a cgroup v2 cgroup";
+
+	f =3D fopen(SCHEDSTATS, "r");
+	if (!f)
+		return "schedstats unavailable (CONFIG_SCHEDSTATS=3Dn)";
+	if (fscanf(f, "%d", &val) !=3D 1)
+		val =3D -1;
+	fclose(f);
+	if (val < 0)
+		return "cannot read " SCHEDSTATS;
+
+	snprintf(cg_parent, sizeof(cg_parent), "%s%s/cs_forceidle_test.%d",
+		 mnt, strcmp(own, "/") ? own : "", getpid());
+	if (mkdir(cg_parent, 0755))
+		return "cannot create a cgroup";
+	cg_active =3D 1;
+	atexit(cg_cleanup);
+
+	if (!val) {
+		if (write_str(SCHEDSTATS, "1")) {
+			rmdir(cg_parent);
+			cg_active =3D 0;
+			return "schedstats off and cannot be turned on";
+		}
+		schedstats_restore =3D 0;
+	}
+	return NULL;
+}
+
+static void run_u(int cpu)
+{
+	if (pin(0, cpu) || create_cookie())
+		_exit(1);
+	for (;;) {
+		sched_yield();
+		__atomic_fetch_add(progress, 1, __ATOMIC_RELAXED);
+	}
+}
+
+static void run_v(int cpu, int ready, int go)
+{
+	struct sched_param sp =3D { .sched_priority =3D 50 };
+	uint64_t t0;
+	char c;
+
+	if (create_cookie() || sched_setscheduler(0, SCHED_FIFO, &sp) ||
+	    pin(0, cpu))
+		_exit(1);
+	if (write(ready, "r", 1) !=3D 1 || read(go, &c, 1) !=3D 1)
+		_exit(1);
+	/*
+	 * Run briefly so the migration can catch V runnable, then block: a
+	 * spinning FIFO task would force idle the CPUs it shares a core with.
+	 */
+	t0 =3D now_ns();
+	while (now_ns() - t0 < 200000)
+		;
+	for (;;)
+		pause();
+}
+
+/* Run a task on @cpu that exits right away, so that @cpu schedules. */
+static void poke(int cpu)
+{
+	pid_t pid;
+
+	pid =3D fork();
+	if (!pid)
+		_exit(pin(0, cpu) ? 1 : 0);
+	if (pid > 0)
+		waitpid(pid, NULL, 0);
+}
+
+static void cg_remove(const char *cg)
+{
+	int i;
+
+	/* The cgroup can stay busy until the killed task is fully released. */
+	for (i =3D 0; i < 1000 && rmdir(cg) && errno =3D=3D EBUSY; i++)
+		usleep(1000);
+}
+
+/*
+ * One attempt; returns 1 on a stall, 0 if U made progress, -1 on error.
+ * Increments @freed when it frees a stalled V and its cgroup.
+ */
+static int attempt(int b, int helper, unsigned int *seed, unsigned long *fre=
ed)
+{
+	static unsigned long nr;
+	int ready[2], go[2], stall =3D 1;
+	uint64_t t0, spin, start;
+	char cg[CG_PATH_MAX + 32], path[CG_PATH_MAX + 64];
+	char pid[16];
+	pid_t v;
+	char c;
+
+	if (pipe(ready))
+		return -1;
+	if (pipe(go)) {
+		close(ready[0]);
+		close(ready[1]);
+		return -1;
+	}
+	if (cg_active) {
+		snprintf(cg, sizeof(cg), "%s/v%lu", cg_parent, nr++);
+		if (mkdir(cg, 0755)) {
+			close(ready[0]);
+			close(ready[1]);
+			close(go[0]);
+			close(go[1]);
+			return -1;
+		}
+	}
+
+	v =3D fork();
+	if (v < 0) {
+		stall =3D -1;
+		goto out_pipes;
+	}
+	if (!v) {
+		close(ready[0]);
+		close(go[1]);
+		run_v(b, ready[1], go[0]);
+	}
+	close(ready[1]);
+	close(go[0]);
+
+	if (cg_active) {
+		snprintf(path, sizeof(path), "%s/cgroup.procs", cg);
+		snprintf(pid, sizeof(pid), "%d", v);
+		if (write_str(path, pid)) {
+			stall =3D -1;
+			goto out;
+		}
+	}
+
+	if (read(ready[0], &c, 1) !=3D 1) {
+		stall =3D -1;
+		goto out;
+	}
+	usleep(1000);			/* let V block on the pipe */
+
+	spin =3D (rand_r(seed) % 51) * 1000ULL;
+	if (write(go[1], "w", 1) !=3D 1) {
+		stall =3D -1;
+		goto out;
+	}
+	t0 =3D now_ns();
+	while (now_ns() - t0 < spin)
+		;
+	pin(v, helper);
+
+	start =3D __atomic_load_n(progress, __ATOMIC_RELAXED);
+	t0 =3D now_ns();
+	while (now_ns() - t0 < STALL_MS * 1000000ULL) {
+		if (__atomic_load_n(progress, __ATOMIC_RELAXED) !=3D start) {
+			stall =3D 0;
+			break;
+		}
+	}
+out:
+	kill(v, SIGKILL);
+	waitpid(v, NULL, 0);
+	close(ready[0]);
+	close(go[1]);
+	if (cg_active)
+		cg_remove(cg);
+	if (cg_active && stall =3D=3D 1) {
+		/* Let RCU free V and its cgroup, then make B schedule. */
+		usleep(FREE_WAIT_MS * 1000);
+		poke(b);
+		(*freed)++;
+	}
+	return stall;
+
+out_pipes:
+	close(ready[0]);
+	close(ready[1]);
+	close(go[0]);
+	close(go[1]);
+	if (cg_active)
+		cg_remove(cg);
+	return stall;
+}
+
+int main(int argc, char **argv)
+{
+	unsigned long attempts =3D 0, stalls =3D 0, freed =3D 0;
+	int a, b, helper, ctl, opt, ret =3D 0;
+	const char *cg_skip =3D NULL;
+	int secs =3D DEFAULT_SECS;
+	unsigned int seed;
+	uint64_t end;
+	pid_t u;
+
+	while ((opt =3D getopt(argc, argv, "nt:")) !=3D -1) {
+		switch (opt) {
+		case 'n':
+			cg_skip =3D "disabled with -n";
+			break;
+		case 't':
+			secs =3D atoi(optarg);
+			break;
+		default:
+			fprintf(stderr, "usage: %s [-n] [-t seconds]\n",
+				argv[0]);
+			return KSFT_FAIL;
+		}
+	}
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	if (geteuid())
+		ksft_exit_skip("must be run as root\n");
+	if (find_cpus(&a, &b, &helper, &ctl))
+		ksft_exit_skip("needs an SMT core and two other online CPUs\n");
+	if (!core_sched_available())
+		ksft_exit_skip("core scheduling unavailable\n");
+
+	progress =3D mmap(NULL, sizeof(*progress), PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	if (progress =3D=3D MAP_FAILED)
+		ksft_exit_fail_msg("mmap: %s\n", strerror(errno));
+
+	if (!cg_skip)
+		cg_skip =3D cg_setup();
+	if (cg_skip)
+		ksft_print_msg("freeing stalled tasks with their cgroups skipped: %s\n",
+			       cg_skip);
+
+	if (pin(0, ctl))
+		ksft_exit_fail_msg("sched_setaffinity: %s\n", strerror(errno));
+
+	u =3D fork();
+	if (u < 0)
+		ksft_exit_fail_msg("fork: %s\n", strerror(errno));
+	if (!u)
+		run_u(a);
+	usleep(100000);
+
+	ksft_print_msg("core %d,%d, migrate to %d, %d s%s\n", a, b, helper,
+		       secs, cg_active ? ", one cgroup per woken task" : "");
+	seed =3D getpid();
+	end =3D now_ns() + (uint64_t)secs * 1000000000ULL;
+	while (now_ns() < end) {
+		ret =3D attempt(b, helper, &seed, &freed);
+		if (ret < 0)
+			break;
+		attempts++;
+		stalls +=3D ret;
+	}
+
+	kill(u, SIGKILL);
+	waitpid(u, NULL, 0);
+
+	ksft_print_msg("attempts=3D%lu stalls=3D%lu (no progress for %d ms)\n",
+		       attempts, stalls, STALL_MS);
+	if (ret < 0)
+		ksft_test_result_fail("attempt failed: %s\n", strerror(errno));
+	else
+		ksft_test_result(!stalls, "no stuck forced idle\n");
+
+	if (cg_skip)
+		ksft_test_result_skip("free a stalled task and its cgroup: %s\n",
+				      cg_skip);
+	else if (ret < 0)
+		ksft_test_result_fail("free a stalled task and its cgroup: attempt failed\=
n");
+	else
+		ksft_test_result_pass("free a stalled task and its cgroup (%lu freed)\n",
+				      freed);
+	ksft_finished();
+}
