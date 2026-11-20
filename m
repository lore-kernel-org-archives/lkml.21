Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196480;
	b=R+CU+eUMCifAllQ/NY7PjCj/9lznoxk4QYRBAcLV1r77MDM6OPSXtS3/qqx95Btb8Tcv
	 sZ9xGXDzU1ICnm32qOwfhCbdoSROENDOuEFhUFgs2Vdy2gsKbR023wE4jQOk5TcNjqk6d
	 dCmIpqxYWIvxMvEpk1e7uYQXxeB9x0YchnVjJyi7mLWRXWkkGTVlldi1DVETqqLRyXZl9
	 KlCuPsUXiQw8Du6VHDDtPKshKUEe7tocP6VkOy/tL+VLdlCoFHPFx2DLxD2JnwkYnSBKC
	 id3PFiOOVHn/EiFWil76uRJfm1dhEa+qSZ43IZhhMwpdk2ZSTL9+W+T16vT7JZ6Kpow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196480;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=lV4kSlOLfexhl1NhD87IJN1K3uK4hO5rzeutZ1C7NEE=;
	b=c2eZkGPRwUEvwNvxa59GQMWbcW72BQ0mpJrKB1hxWVsxIWTIoWG6qitDhzij4ONO6DDk
	 lhCDdoaevLlDpoosxR3QgKLaZmN6F8vw0YgeHxScjFh4Dpzjvo91hjtnP0kr/phXkgXIE
	 k/KK6zOKhFl0fjdq2tTE6KjXAs/z4JAVQ5LL5TWSu9uEzX1Sc972IH10EzV8zb6I2jWwW
	 jqk/1jK3U0KbNHBg1sKgtF1epuAD1flO+xP780a4kGpTSHCNCrWHj5zrvbLnYTouw5VWw
	 Hnpq7djF8M/F8XcGJa0fFi/YU30FeNsAtHLTfPGWrI5kccGHXF6VBxm7yZDExBTjq/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8tba28F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56F60A5BFD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E8tba28F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000441F0180B;
	Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196480;
	bh=lV4kSlOLfexhl1NhD87IJN1K3uK4hO5rzeutZ1C7NEE=;
	h=Date:From:To:Cc:Subject:References;
	b=E8tba28FreWLAAE9F7hubmYjByk4JcLPLZ3FC8JmiulrX7Dzw51wQeZhDxz1cMLnL
	 c3UDPH6ftVUvMjYfOmt204CMtx7Wit+ijGds5t5RexzO66dg5ZBHK9nui/vBTL8hfL
	 GxEFLQb/ihZV9iLEa4bfN7yeSLx5YLEXBc8ATxKBEtPiG4THJ+Nk3BiqSRnHie2G+R
	 1AHwey1jZD9j/YIhb1ZL5ybIfvFFy+V69feAPMWpLGsRt+N1r79TiAY+7CKM0R2tLw
	 nBXesXxJgH+i22ZVT8Dv2HHXxAwAKWsYtOsNyS9MX1Jep3ffkxv28q8m0G3HILJ541
	 W+Iv52oDr+aBg==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbv-00000004aTP-13dr;
	Fri, 20 Nov 2026 12:41:19 -0500
Message-ID: <20261120174119.088587233@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:19 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <briannorris@chromium.org>
Subject: [for-linus][PATCH 27/32] tracing: Add tests for globbing number-based strings
References: <20261120173852.687189370@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Brian Norris <briannorris@chromium.org>

In "tracing: Properly match strings that start with numbers", we fixed
bugs related to string fields that start with a number and also use
globs instead of full matches.

Add some additional startup test cases for this.

For easy reproducible testing, I abused the kunit.py script to boot a
minimal kernel with FTRACE_STARTUP_TEST enabled:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
      --kconfig_add=CONFIG_FTRACE=y \
      --kconfig_add=CONFIG_FUNCTION_TRACER=y \
      --kconfig_add=CONFIG_DYNAMIC_FTRACE=y \
      --kconfig_add=CONFIG_FTRACE_STARTUP_TEST=y \
      --kconfig_add=CONFIG_EVENT_TRACE_STARTUP_TEST=n \
      --raw_output=all deadbeef

Relevant line:

  Testing ftrace filter: OK

Without "tracing: Properly match strings that start with numbers", the
test fails with:

  Testing ftrace filter:
  Failed to match filter 'str ~ "0001:*"', expected 1

Link: https://patch.msgid.link/20261116182710.2.Ic117871c2b1e94c5a2176903a5c3316a10584e61@changeid
Signed-off-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c      | 74 ++++++++++++++++++++++++-
 kernel/trace/trace_events_filter_test.h | 12 ++--
 2 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 6704ef3d9520..7018964c94fc 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2856,6 +2856,8 @@ int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 #include <linux/types.h>
 #include <linux/tracepoint.h>
 
+#include "trace_probe.h"
+
 #define CREATE_TRACE_POINTS
 #include "trace_events_filter_test.h"
 
@@ -2867,12 +2869,22 @@ int ftrace_profile_set_filter(struct perf_event *event, int event_id,
 	.match  = m, \
 	.not_visited = nvisit, \
 }
+
+#define DATA_STR(m, s) \
+{ \
+	.filter = FILTER, \
+	.str    = s, \
+	.match  = m, \
+	.not_visited = "", \
+}
+
 #define YES 1
 #define NO  0
 
 static struct test_filter_data_t {
 	char *filter;
 	struct trace_event_raw_ftrace_test_filter rec;
+	const char *str;
 	int match;
 	char *not_visited;
 } test_filter_data[] = {
@@ -2924,9 +2936,46 @@ static struct test_filter_data_t {
 	DATA_REC(YES, 1, 1, 1, 1, 1, 1, 1, 1, "bdfh"),
 	DATA_REC(YES, 0, 1, 0, 1, 0, 1, 0, 1, ""),
 	DATA_REC(YES, 1, 0, 1, 0, 1, 0, 1, 0, "bdfh"),
+#undef FILTER
+#define FILTER "str ~ \"0001:*\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(YES, "0001:"),
+	DATA_STR(NO,  "0002:01:00.0"),
+	DATA_STR(NO,  "pci:0001:01:00.0"),
+	DATA_STR(NO,  "0001"),
+#undef FILTER
+#define FILTER "str ~ \"!0001:*\""
+	DATA_STR(NO,  "0001:01:00.0"),
+	DATA_STR(YES, "0002:01:00.0"),
+#undef FILTER
+#define FILTER "str ~ \"0001:*:00.[0-9]\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(YES, "0001:ff:00.7"),
+	DATA_STR(NO,  "0001:01:00.a"),
+	DATA_STR(NO,  "0002:01:00.0"),
+#undef FILTER
+#define FILTER "str ~ \"0001:01:00.0\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(NO,  "0001:01:00.1"),
+	DATA_STR(NO,  "0001:01:00.00"),
+	DATA_STR(NO,  "0001:01:00"),
+#undef FILTER
+#define FILTER "str == \"0001:01:00.0\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(NO,  "0001:01:00.1"),
+#undef FILTER
+#define FILTER "str ~ \"*0001:*\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(YES, "pci:0001:01:00.0"),
+	DATA_STR(NO,  "0002:01:00.0"),
+#undef FILTER
+#define FILTER "str ~ \"*:00.0\""
+	DATA_STR(YES, "0001:01:00.0"),
+	DATA_STR(NO,  "0001:01:00.1"),
 };
 
 #undef DATA_REC
+#undef DATA_STR
 #undef FILTER
 #undef YES
 #undef NO
@@ -2977,8 +3026,29 @@ static __init int ftrace_test_event_filter(void)
 	for (i = 0; i < DATA_CNT; i++) {
 		struct event_filter *filter = NULL;
 		struct test_filter_data_t *d = &test_filter_data[i];
+		union {
+			struct trace_event_raw_ftrace_test_filter rec;
+			/* Add some spare, to append the string contents. */
+			char buf[sizeof(struct trace_event_raw_ftrace_test_filter) + 32];
+		} event = { .rec = d->rec };
 		int err;
 
+		if (d->str) {
+			struct ftrace_event_field *field;
+			u32 offset = offsetof(typeof(event.rec), __data);
+			u32 len = strlen(d->str) + 1;
+			u32 *str_item;
+
+			field = trace_find_event_field(&event_ftrace_test_filter, "str");
+			if (WARN_ON_ONCE(!field))
+				break;
+			if (WARN_ON_ONCE(offset + len > sizeof(event.buf)))
+				break;
+			str_item = (u32 *)&event.buf[field->offset];
+			*str_item = make_data_loc(len, offset);
+			memcpy(&event.buf[offset], d->str, len);
+		}
+
 		err = create_filter(NULL, &event_ftrace_test_filter,
 				    d->filter, false, &filter);
 		if (err) {
@@ -3000,7 +3070,7 @@ static __init int ftrace_test_event_filter(void)
 			update_pred_fn(filter, d->not_visited);
 
 		test_pred_visited = 0;
-		err = filter_match_preds(filter, &d->rec);
+		err = filter_match_preds(filter, &event.rec);
 		preempt_enable();
 
 		mutex_unlock(&event_mutex);
@@ -3027,7 +3097,7 @@ static __init int ftrace_test_event_filter(void)
 
 	/* Need to call ftrace_test_filter to prevent a warning */
 	if (!trace_ftrace_test_filter_enabled())
-		trace_ftrace_test_filter(1, 2, 3, 4, 5, 6, 7, 8);
+		trace_ftrace_test_filter(1, 2, 3, 4, 5, 6, 7, 8, "");
 
 	return 0;
 }
diff --git a/kernel/trace/trace_events_filter_test.h b/kernel/trace/trace_events_filter_test.h
index e651dfbd345e..74a9dba91545 100644
--- a/kernel/trace/trace_events_filter_test.h
+++ b/kernel/trace/trace_events_filter_test.h
@@ -9,9 +9,10 @@
 
 TRACE_EVENT(ftrace_test_filter,
 
-	TP_PROTO(int a, int b, int c, int d, int e, int f, int g, int h),
+	TP_PROTO(int a, int b, int c, int d, int e, int f, int g, int h,
+		 const char *str),
 
-	TP_ARGS(a, b, c, d, e, f, g, h),
+	TP_ARGS(a, b, c, d, e, f, g, h, str),
 
 	TP_STRUCT__entry(
 		__field(int, a)
@@ -22,6 +23,7 @@ TRACE_EVENT(ftrace_test_filter,
 		__field(int, f)
 		__field(int, g)
 		__field(int, h)
+		__string(str, str)
 	),
 
 	TP_fast_assign(
@@ -33,11 +35,13 @@ TRACE_EVENT(ftrace_test_filter,
 		__entry->f = f;
 		__entry->g = g;
 		__entry->h = h;
+		__assign_str(str);
 	),
 
-	TP_printk("a %d, b %d, c %d, d %d, e %d, f %d, g %d, h %d",
+	TP_printk("a %d, b %d, c %d, d %d, e %d, f %d, g %d, h %d, str %s",
 		  __entry->a, __entry->b, __entry->c, __entry->d,
-		  __entry->e, __entry->f, __entry->g, __entry->h)
+		  __entry->e, __entry->f, __entry->g, __entry->h,
+		  __get_str(str))
 );
 
 #endif /* _TRACE_TEST_H || TRACE_HEADER_MULTI_READ */
-- 
2.53.0
