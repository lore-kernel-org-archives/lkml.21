Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337993;
	b=fJwKNdTJe7D5XLilIfbOGHIiZ7yFy17q/4doBGfsFEU5S2sbC0XH1rGB8HpTZqhpt6p/
	 hf2MQ5CrfUhiKWuDXS/WybGOmGhEFLW92Z8dp2DuJoIOvIDocCimV3pk/uIIk12egH0gh
	 GVT8r6jAs9Vk4fadRz03IlJm9MK1Or1oHPg1xqwuchivwiFo6xoWwg0w06GGIgE5pCZhY
	 mjK/NdNAfxOZC7uNO/zZk1WID7S2bBboeulLYi4UIWlOzYoaKfmz8pFP6osMhv+WAJIh/
	 0SACPCaUXCcUhRy4ZL4inFL5alowLIRUp7A9z/EBjHsMHENtE41tQiCnlQA3kCHJCHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTPWgO0CuwXoWuldNc/A7e21ttac5pv1FgyvraAwCPY=;
	b=z+1DEPtd3PMSJTDA4uZFF5CSjJAxyJYpBi0MfD7jJwYpFfeqBW1iLSoIfaRVS5pA8VUJ
	 yyd9mt+rWTFY50dlLtJaaonkk3DNC4jQIDYI+aYB24GrdaOGNfhcpzI/mAzblI7/5LznV
	 s53S9bIDYwQ/u5FYF1Gjn2g+zUoDSefd/VF5LgOx1dLwTGz0SMCWd8TlRNHB/Z3b2zMI3
	 wuS+DQzHqIgYTncLT/0os1NO0Z8Pq1WQ9xGqFQBoZbRSxA1NQb2R+qCUH647J1R7L/q6W
	 XL9tK50lK3sqqlyCS08AxKJZs21W7ARyAmkULALuOJGV/7VHtcoGVTL3RMJfsmZwjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnC8dJta;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31B9606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B31B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qnC8dJta
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so2894410eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795337992; x=1795942792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTPWgO0CuwXoWuldNc/A7e21ttac5pv1FgyvraAwCPY=;
        b=qnC8dJta/qKch7yEz9FkUiwrJk2vHa39dBcGFx8Os39ne2DQlc+AndpXSqBi0TWIKz
         mBXsM30VGSDo9YHI9OoUlv3xxl+zTUlpZ0N/B3tIPdNUgvJ/T9WTJ0wr2FBa6+9QaJJO
         xjv4yoYHZIlizA2xfWqabycqFFf4drz5TgNXh3fhhCQQP0/QNMuSvp+ivuidwtn3GNHZ
         9shwUtxrQkmbXy3w6B7bgAFuhTETNVujWMMHybm+SZNGRCQFHohZSAIzry3iu5aShyaT
         Vzq8y0kvgYpQXia4S0lvohab7eMEFiUNyebOo4Jy0AkzPGwQr+4on4rXZNsACNbdNTF0
         Vo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795337992; x=1795942792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTPWgO0CuwXoWuldNc/A7e21ttac5pv1FgyvraAwCPY=;
        b=vMQdmKcLYAq58bBczctbgl4oc+o9fYTEnjre+9LOg/9b6/ZigqF1AhXpXLizOvjoQp
         7MBNMwo2TTQoxyK4f3u1OsqfJz/yAoQWSju8fp35ENSt3BeTsXnJoKQRHppNGd4c9JQq
         8M4Hx/dJczTi4VYYBMieqAzi20le4L5aKLq+qFNU/TUiE9msWoQS9CAkRkGn0pFHu3eE
         roN3+0sWnCMKAKqFmIKgdy+/YfNz9oqL0avc/bmcYPJD9/5kAWq6qpIyY1S0xLqVB2e9
         4RK/QhEpnArsvhGq2E5nl6fcZTfcjcavvnxPZVfzAoeQIe4gaa9vimXcYgxHJ9dV9Pfh
         9HyQ==
X-Forwarded-Encrypted: i=1; AL+hErGanYTS53kGOgxK8AugFo/xiNehKojmo54wvBZcqAX7Y0AIBmNG4WznaHwPR447YFgkS2darACt6J+5pd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hC7i3H8EKGvGMTlF6hVFELjOtisBZ7QCho03Z3di/ZH+xivlK
	JisEPD6JlsVfVIIQZpBV3f4uXEQ3l628ks1BbgJPV8bkRYhwzpg6q3+i
X-Gm-Gg: AZFdTZcSW91jzL0aLco/s7l/EL2P3YU+Lim532DTYrxdEksb8+99/Pof+qD1jlZtYLZ
	qnhXYfuzfC1MKT8JNi+/UxZ+OVUyP8kwxxQ1lw4QCM6HoRNas2TGyemSDm5AhOF56hgMjuLUIaE
	xwWSZxofac094V5t6+T858kxlniATVyUiFrXA9vfiIX5UNk5Tchn8K5P5XLjDrGqM+CsFvHYuP4
	dWTDry87cLXR3BJvEjmPoCTScuj6PSxj96OR6TR/rDajpccpUsgsD9g0zGXj4zGP7QrtCE2Co/z
	lei5opXUL1urcA6c+eNaXaLcwMPbsZCmu7PUNMs5d7hVNiFB9T2yvKNPQMOhVmc6W29c2l0eZ3R
	M3rxnr+hMHbJ4PQTwSXYOCoyesremgMAT56h57KuwlmeY+MskkSaSKGy4ROrkNNhY6hKpKFC1HW
	PY0uzwBcIKoyY4NTsYdxaE3iXljC6MjB81sKeLrh5S3t+5gFswIeeHuP4ehpAQtp0fzgevbINVb
	a8IH7tvsxzGGwy4G7/T5VjcOPwRzA4T0p2pc/FYAfgLTunX5d/OH9HjuzKa9raW1L75qbrvGXkl
	lu8Gn0ZWRcwVG49gNGBm0w==
X-Received: by 2002:a05:7301:6490:b0:386:9618:309c with SMTP id 5a478bee46e88-386961832eamr6230317eec.22.1795337991494;
        Sun, 22 Nov 2026 00:59:51 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm26785995eec.22.2026.11.22.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:59:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Hang Zhengyang <hang.zhengyang1010@gmail.com>,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v4] perf stat: Refuse a group mixing tool and kernel events
Date: Sun, 22 Nov 2026 08:59:47 +0000
Message-ID: <20261122085947.3107661-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111110616.2249764-1-takano32@gmail.com>
References: <20261111110616.2249764-1-takano32@gmail.com>
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

A tool event has no event in the kernel.  user_time and system_time read
/proc/stat, or /proc/<pid>/stat for a workload, and duration_time keeps
its value in perf itself.  perf-list(1) says that events from different
PMUs cannot be grouped, with some exceptions for software events; the
tool PMU counts as software there, so a tool event stays in a group a
user writes and, when it leads, the members are opened with its
descriptor as the group fd.

Two things split such a group before it is opened: the parser splits a
tool event from an event of another software PMU, such as cpu-clock, and
evlist__check_cpu_maps() drops members whose CPUs do not match the leader
under -a or -C.  The group this patch is about is the one left after
that, and it cannot be counted.

With user_time or system_time as the leader, get_group_fd() hands the
procfs descriptor to the members, and the kernel rejects each of them
with EBADF.  With duration_time as the leader there is no descriptor at
all: its members get -2 and fail with "broken group leader" in the debug
log.  Either way perf stat prints the tool event and "<not supported>"
for the rest of the group:

  $ perf stat -e '{user_time,cycles}' -- sleep 0.05
                   0      user_time
     <not supported>      cycles

With a kernel event as the leader the kernel events do open, but the
group read is rejected: evsel__group_read_nr_members() counts the tool
event, while the kernel returns one entry fewer, so
evsel__process_group_data() fails and the events come out as
"<not counted>".  The form -e '{cycles,instructions,duration_time}', with
the tool event inside the braces, is in that shape and has not been
counted since 6828d6929b76.

Counting such a group means moving the leader to a kernel event, which
changes the order of a group the user wrote with a tool event first, and
it also needs the group read to skip the tool members; that is left to a
separate series.  Opening the members outside the group, as my v3 did and
as Hang's v2 does, drops the group semantics, and a group that has a tool
event as a member still cannot be counted.  Taking the tool event out of
the group and warning, as Hang offered in the notes of his v2 patch and
as evlist__check_cpu_maps() does for members whose CPUs do not match the
leader, would let the kernel events count, but the group would no longer
be scheduled as one, so the tool event and the kernel events would have
different enabled and running times, and the warning is easy to lose in a
script.  For -e the braces are the user's explicit request, so perf stat
should not quietly reinterpret them; metricgroup moves tool events out of
the groups it builds itself, which is a different case.  Refuse the group
instead:

  $ perf stat -e '{user_time,cycles}' -- sleep 0.05
  A tool event cannot be grouped with kernel events: user_time

followed by a hint to put the tool event outside the braces, as in
-e '{cycles,instructions},duration_time'.

perf stat now exits 22 before the workload is started, where it used to
leave the rest of the group uncounted and exit 0.

A group of tool events only is still accepted, as before.  A weak group
led by user_time or system_time is left to the weak group handling, which
splits it when a member fails the open with EBADF; any other weak group
that mixes them does not fail that way and is refused like a strong one.

The code, the test, the man page and this message were written with
Hermes Agent (deepseek-v4.1-flash); the work started from Hang's report
and the review thread linked below, and I reviewed the result, built
perf, and ran tools/perf/tests/shell/stat+tool_group.sh and checkpatch
--strict.  Kernel events cannot be opened on this machine
(perf_event_paranoid=4), so the EBADF and the group read were not
re-observed here; the group is refused before any event is opened.

Reported-by: Hang Zhengyang <hang.zhengyang1010@gmail.com>
Link: https://lore.kernel.org/all/20261111-tool-pmu-leader-v2-1-3faa0fb98c51@gmail.com/
Suggested-by: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/all/awC_aZXD5FBGu4mO@google.com/
Fixes: 6828d6929b76 ("perf evsel: Refactor tool events")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v4: refuse the group instead of counting it, as suggested by Namhyung Kim
    in https://lore.kernel.org/all/awC_aZXD5FBGu4mO@google.com/
    This replaces v3, which is withdrawn: its group_fd, read_format and
    disabled changes are dropped and no code from it remains.

    I read "prohibit grouping" as the group that mixes a tool event with
    an event the kernel opens: -e '{user_time,system_time}' is read by
    perf itself and is not refused today.  If you meant every group
    that holds a tool event, dropping the has_kernel test, and the weak
    check with it, is a couple of lines.

    The parser still splits a tool event from another software PMU, and -a
    or -C still split a group whose members do not share the leader's
    CPUs; this refuses the group that is left after that.

    A weak group led by user_time or system_time is left to the weak
    group handling, which splits it when a member fails with EBADF;
    any other weak group is refused.

    Ian: Hang offered, in his v2, to take tool events out of such groups
    with a warning instead.  I did not do that because the group would no
    longer be scheduled as one and the warning is easy to lose in a
    script.  If you would rather have that, I can redo it.

    Namhyung asked for the leader to move, then for grouping to be
    prohibited.  Hang's v2 (Link) takes a third route, group_fd = -1, and
    is still open; only one of v2 and this patch should be applied:
    v2 counts the members outside the group, this refuses the group.

    On this base, -a or -C with a weak group led by a tool event
    crashes in the enable loop with a released fd array.  That is older
    than this patch, and the libperf fix "libperf: Handle an evsel
    without an fd array in enable/disable"
    (https://lore.kernel.org/all/20261111101625.2204836-1-takano32@gmail.com/),
    which is in perf-tools-next, removes it.

 tools/perf/Documentation/perf-stat.txt    |  14 +++
 tools/perf/builtin-stat.c                 |  76 ++++++++++++
 tools/perf/tests/shell/stat+tool_group.sh | 144 ++++++++++++++++++++++
 3 files changed, 234 insertions(+)
 create mode 100755 tools/perf/tests/shell/stat+tool_group.sh

diff --git a/tools/perf/Documentation/perf-stat.txt b/tools/perf/Documentation/perf-stat.txt
index 8ea17da89976..34323f446e92 100644
--- a/tools/perf/Documentation/perf-stat.txt
+++ b/tools/perf/Documentation/perf-stat.txt
@@ -65,6 +65,20 @@ report::
 	Multiple PMU instances are typical for uncore PMUs, so the prefix
 	'uncore_' is also ignored when performing this match.
 
+	Tool events such as duration_time and user_time are read by perf
+	itself and have no event in the kernel.  A group of a tool event and
+	an event from a different software PMU, such as cpu-clock, is split by
+	the parser, which warns that events were regrouped; -a and -C split
+	a group whose members do not share the CPUs of the leader in the
+	same way.  A group that is not split and mixes a tool event with an
+	event the kernel opens is refused, as in -e '{user_time,cycles}',
+	instead of printing the tool event and leaving the rest of the group
+	uncounted.  Put the tool event outside the braces instead, as in
+	-e '{cycles,instructions},duration_time'.  A group of tool events
+	only is accepted.  A weak group (:W) led by user_time or system_time
+	is left to the weak group handling, which splits it when the kernel
+	refuses the members with EBADF; any other weak group that mixes them is
+	refused like a strong group.
 
 -i::
 --no-inherit::
diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 37752d6bfef4..7396cd92346a 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -2469,6 +2469,77 @@ static int parse_tpebs_mode(const struct option *opt, const char *str,
 }
 #endif // HAVE_ARCH_X86_64_SUPPORT
 
+/*
+ * A tool event like user_time has no event in the kernel: it reads
+ * /proc/stat, or keeps its value in perf itself.  A group that mixes one
+ * with an event the kernel opens cannot be counted.
+ * get_group_fd() passes the leader's descriptor as the group fd, and the
+ * tool event has a procfs descriptor or none at all, so the kernel rejects
+ * the members with EBADF or perf gives up with "broken group leader"; with
+ * a kernel event as the leader the members do open, but the group read is
+ * rejected as the kernel knows only the members it opened.  perf stat used
+ * to leave the rest of the group uncounted in both cases, when the CPU maps
+ * had not split the group first; refuse the group instead.  A group with no
+ * event the kernel opens is left alone, as perf reads each event in it.  A
+ * weak group led by user_time or system_time is left to the weak group
+ * handling in the open loop, which splits it when a member fails with
+ * EBADF; any other weak group is refused like a strong one.
+ */
+static int check_tool_groups(struct evlist *evlist)
+{
+	struct evsel *leader, *evsel;
+
+	evlist__for_each_entry(evlist, leader) {
+		struct evsel *tool = NULL;
+		bool has_kernel = false, weak = false;
+
+		if (!evsel__is_group_leader(leader) || leader->core.nr_members < 2)
+			continue;
+
+		/*
+		 * The members of a group are not necessarily adjacent in the
+		 * evlist: evlist__check_cpu_maps() makes a removed member a
+		 * leader of its own without moving it, and so does a weak
+		 * group split in the open loop.
+		 */
+		evlist__for_each_entry(evlist, evsel) {
+			if (!evsel__has_leader(evsel, leader))
+				continue;
+			if (evsel__is_tool(evsel)) {
+				if (!tool)
+					tool = evsel;
+			} else if (!evsel__is_non_perf_event_open_pmu(evsel)) {
+				has_kernel = true;
+			}
+			weak |= evsel->weak_group;
+		}
+
+		if (!tool || !has_kernel)
+			continue;
+
+		/*
+		 * A weak group led by user_time or system_time is split by the
+		 * weak group handling in the open loop, as the kernel refuses
+		 * the members with EBADF, and that is what :W asks for.  Any
+		 * other weak group does not get that far, so it is refused
+		 * like a strong group.
+		 */
+		if (weak && evsel__is_tool(leader)) {
+			enum tool_pmu_event ev = evsel__tool_event(leader);
+
+			if (ev == TOOL_PMU__EVENT_USER_TIME ||
+			    ev == TOOL_PMU__EVENT_SYSTEM_TIME)
+				continue;
+		}
+
+		pr_err("A tool event cannot be grouped with kernel events: %s\n",
+		       evsel__name(tool));
+		pr_err("Put it outside the braces, as in -e '{cycles,instructions},duration_time'.\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 int cmd_stat(int argc, const char **argv)
 {
 	struct opt_aggr_mode opt_mode = {};
@@ -2947,6 +3018,11 @@ int cmd_stat(int argc, const char **argv)
 
 	evlist__check_cpu_maps(evsel_list);
 
+	if (check_tool_groups(evsel_list)) {
+		status = -EINVAL;
+		goto out;
+	}
+
 	/*
 	 * Initialize thread_map with comm names,
 	 * so we could print it out on output.
diff --git a/tools/perf/tests/shell/stat+tool_group.sh b/tools/perf/tests/shell/stat+tool_group.sh
new file mode 100755
index 000000000000..3d5e468f7ccb
--- /dev/null
+++ b/tools/perf/tests/shell/stat+tool_group.sh
@@ -0,0 +1,144 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# perf stat tool events in an event group (no_mlock)
+
+set -e
+
+out=$(mktemp /tmp/__perf_test.stat_tool_group.XXXXXX)
+stderr=$(mktemp /tmp/__perf_test.stat_tool_group.XXXXXX)
+err=0
+
+cleanup() {
+  rm -f "${out}" "${stderr}"
+
+  trap - EXIT TERM INT
+}
+
+trap_cleanup() {
+  echo "Unexpected signal in ${FUNCNAME[1]}"
+  cleanup
+  exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+# A tool event reads /proc/stat, or keeps its value in perf itself, so it
+# cannot be a member of a group that is opened with perf_event_open().  Such
+# a group used to print the tool event and leave the rest of the group
+# uncounted, so perf stat has to say what is wrong instead.
+refused() {
+  local group="$1" tool="$2" rc=0
+  shift 2
+
+  echo "Testing that perf stat refuses ${group} $*"
+  perf stat "$@" -e "${group}" -o "${out}" -- true 2> "${stderr}" || rc=$?
+
+  if [ "${rc}" = 0 ]; then
+    echo "perf stat accepted ${group}  [Failed]"
+    err=1
+    return
+  fi
+  if [ "${rc}" != 22 ]; then
+    echo "perf stat failed with ${rc}, expected 22  [Failed]"
+    cat "${stderr}"
+    err=1
+  fi
+  if ! grep -qE "A tool event cannot be grouped with kernel events: (${tool})" \
+      "${stderr}"; then
+    echo "perf stat failed without naming ${tool}  [Failed]"
+    cat "${stderr}"
+    err=1
+  fi
+  if ! grep -q "Put it outside the braces" "${stderr}"; then
+    echo "perf stat failed without saying how to write it  [Failed]"
+    cat "${stderr}"
+    err=1
+  fi
+}
+
+# The events named after the group have to show up in the output.
+accepted() {
+  local group="$1" name rc=0
+
+  shift
+  echo "Testing that perf stat accepts ${group}"
+  perf stat -e "${group}" -o "${out}" -- true 2> "${stderr}" || rc=$?
+
+  if [ "${rc}" != 0 ]; then
+    cat "${stderr}"
+    echo "perf stat failed for ${group} (${rc})  [Failed]"
+    err=1
+    return
+  fi
+  if grep -q "cannot be grouped with kernel events" "${stderr}"; then
+    cat "${stderr}"
+    echo "perf stat refused ${group}  [Failed]"
+    err=1
+    return
+  fi
+  for name in "$@"; do
+    if ! grep -q -- "${name}" "${out}"; then
+      echo "perf stat did not print ${name}  [Failed]"
+      cat "${out}"
+      err=1
+    fi
+  done
+}
+
+# The tool event as the leader and as a member, a common group that puts
+# the tool event last, a weak group led by a kernel event (it opens and
+# then fails its group read), and a weak group led by a tool event that
+# has no descriptor to fail with.
+refused '{user_time,cycles}' user_time
+refused '{cycles,user_time}' user_time
+refused '{duration_time,instructions}' duration_time
+refused '{cycles,instructions,duration_time}' duration_time
+refused '{cycles,user_time}:W' user_time
+refused '{duration_time,cycles}:W' duration_time
+
+# The tool event in the middle of a group, and the first of two tool
+# events, which is the one the message names.
+refused '{cycles,user_time,instructions}' user_time
+refused '{user_time,system_time,cycles}' user_time
+
+# evlist__check_cpu_maps() takes duration_time out of this group (it is
+# read on one CPU only), which leaves cycles and user_time apart in the
+# evlist; the tool event has to be found anyway.  On a machine with one
+# CPU there is nothing to split, so either tool event can be the first.
+refused '{cycles,duration_time,user_time}' 'user_time|duration_time' -a
+
+# A group of tool events only is read by perf itself, a single event in
+# braces is not a group, a tool event outside the braces is not a member,
+# and a weak group led by user_time or system_time is split by the weak
+# group handling.
+accepted '{user_time,system_time}' user_time system_time
+accepted '{duration_time,user_time}' duration_time user_time
+accepted '{user_time}' user_time
+accepted '{cycles,instructions},duration_time' duration_time
+accepted '{user_time,cycles}:W' user_time cycles
+accepted '{system_time,cycles}:W' system_time cycles
+
+echo "Testing that a tool event on its own is accepted"
+if ! perf stat -e user_time -o "${out}" -- true; then
+  echo "perf stat rejected a tool event on its own  [Failed]"
+  err=1
+elif ! grep -q "user_time" "${out}"; then
+  echo "perf stat did not print user_time  [Failed]"
+  cat "${out}"
+  err=1
+fi
+
+echo "Testing that the default events still work"
+if ! perf stat -o "${out}" -- true; then
+  echo "perf stat without -e failed  [Failed]"
+  err=1
+fi
+
+cleanup
+
+if [ "${err}" = 0 ]; then
+  echo "perf stat tool event group test [Success]"
+else
+  echo "perf stat tool event group test [Failed]"
+fi
+
+exit "${err}"

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.53.0

