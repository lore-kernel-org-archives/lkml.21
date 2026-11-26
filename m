Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710287;
	b=PLwGpL/4FkoURc2yXPkb0hqf44BTnZrT/zNqA8Ts3ns4jcrEWy0tKKUL6nmH3fFVD6pe
	 s7XIefSw3FK70obbdF1uVl/Cl6ZQN3vK4DZd/Xp385S9PQ4HT/WqwuFZp8GzTO4XTprHT
	 0g98nmAKpmi6m2CdobYrtxghi4aKb+0hPv6lS9TmKQ3lB74KAOgKSK3tlinrLsaYfee9e
	 ZbnCPKhgm9cXK1RXzB6wDTVZXA83S7A6AQRUXld3qs9Ga0BQZdEFcAwZSn0Wejca8IDfQ
	 saavAesbrhrojR0R9GDmm/QI8civ+21o1CHqzkVN6loCRMr0ZRF/aIw4997YWFFTLBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710287;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=Oqb0JYyK0RYb1i5OhRXLvl7EC+tNp6DOQnxtlb7h3BM=;
	b=mYFlFSBByfZMRJZQ8xqxd/6OFjMD139TWBOA/B+aQaBorcvj/nCXZXJRpuwT1NNH0TMp
	 PHkg9aSQMOY8G1KadFHD+rn0rgDFYZA6jjulglyF0HBrsiClcY4gcbq+bMlqg7wppuVla
	 2N+eVGL95u+yGP5vpWclgFRM1jdlYL03M4xKxjSw21SlWDj7T4aU9pUO4nwivcXuzCaTV
	 tmTGRVS0nSsc5DEyn9XcuEMrxv7Qio1zvEjsK79x0GXdqtE8D8Fth12Fv6MJRcxsmzsx6
	 sQhuKRP9HD/LOT7NBc9nE7cGbo6w+GNa1/W4O6hQ7fN8LE/5g7Zy5Oc5kX9h/bhccxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2SJ7Hq9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B2A606A6AE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2SJ7Hq9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5613F1F00ADE;
	Thu, 26 Nov 2026 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710287;
	bh=Oqb0JYyK0RYb1i5OhRXLvl7EC+tNp6DOQnxtlb7h3BM=;
	h=Date:From:To:Cc:Subject:References;
	b=j2SJ7Hq9Kb26CJev2LRHSFxgMcJcfV09DgrTwjl0DAUDcN/+XWfpP8kj9MVzOl56r
	 3MZf7Q93bGz/BNIM5sWImhKOgQbTpLNyx6NOqxPkB1K5c8lEe0pczXLZtCNx5d1MVr
	 zwGvcx96Dpp9C5DPxbpqkrXUgOITzMaWPtUgP/d3QPBdjA5dlwx5TzBUd9sFSqDTy3
	 ixFquZ0bBmrKmTkOHEzQLiA31kJUMWPbFMBJXD2uqcnNiyIWspPgSxg5/160oudJzx
	 0QOzp+tbveKGkZ73vHtYoVIq+tR2MPEYR9LZcg/ksbbMI3AKiYTA+2fhlxs/hXJrdX
	 atV39NO2VkQtw==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xWcH8-00000007bq3-2vDw;
	Thu, 26 Nov 2026 11:24:46 -0500
Message-ID: <20261126162446.515870297@kernel.org>
User-Agent: quilt/0.69
Date: Thu, 26 Nov 2026 11:24:36 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [for-next][PATCH 13/15] tracing/filters: Check for trailing characters after newline in
 filter string
References: <20261126162423.442922469@kernel.org>
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

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

Each trace event or subsystem only holds a single filter, and
append_filter_err() / tracing_log_err() caret placement assumes a
single-line filter string. However, apply_event_filter() and
apply_subsystem_event_filter() only called strstrip(), which strips
trailing newlines but leaves embedded newlines intact.

An embedded newline in a filter string (for example inside 'CPUS{0\n"}')
causes cpulist_parse() / bitmap_parselist() to treat '\n' as the end of
the cpulist and ignore trailing characters before '}', desynchronizing
quote tracking between calc_stack() and parse_pred() and misaligning
error_log caret reporting.

Introduce an internal function filter_check_newline() to convert the
first newline to NUL and check that the rest of the input contains no
non-whitespace characters. If any non-whitespace character follows the
newline, report it as an invalid input error (-EINVAL) without modifying
the input string in-place.

Link: https://patch.msgid.link/179323792832.740114.8136681613581516243.stgit@devnote2
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_events_filter.c | 36 ++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index fcdd4c552569..097b432647fc 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2445,6 +2445,30 @@ static int process_system_preds(struct trace_subsystem_dir *dir,
 	return ret;
 }
 
+/*
+ * Check that the rest of the input after the first newline contains no
+ * non-whitespace characters, and convert the newline to '\0'.
+ */
+static int filter_check_newline(char *str)
+{
+	char *nl, *p;
+
+	if (!str)
+		return 0;
+
+	nl = strchr(str, '\n');
+	if (!nl)
+		return 0;
+
+	for (p = nl + 1; *p; p++) {
+		if (!isspace(*p))
+			return -EINVAL;
+	}
+
+	*nl = '\0';
+	return 0;
+}
+
 static int create_filter_start(char *filter_string, bool set_str,
 			       struct filter_parse_error **pse,
 			       struct event_filter **filterp)
@@ -2456,6 +2480,10 @@ static int create_filter_start(char *filter_string, bool set_str,
 	if (WARN_ON_ONCE(*pse || *filterp))
 		return -EINVAL;
 
+	err = filter_check_newline(filter_string);
+	if (err)
+		return err;
+
 	filter = kzalloc_obj(*filter);
 	if (filter && set_str) {
 		filter->filter_string = kstrdup(filter_string, GFP_KERNEL);
@@ -2574,6 +2602,10 @@ int apply_event_filter(struct trace_event_file *file, char *filter_string)
 	if (file->flags & EVENT_FILE_FL_FREED)
 		return -ENODEV;
 
+	err = filter_check_newline(filter_string);
+	if (err)
+		return err;
+
 	if (!strcmp(strstrip(filter_string), "0")) {
 		filter_disable(file);
 		filter = event_filter(file);
@@ -2628,6 +2660,10 @@ int apply_subsystem_event_filter(struct trace_subsystem_dir *dir,
 	if (!dir->nr_events)
 		return -ENODEV;
 
+	err = filter_check_newline(filter_string);
+	if (err)
+		return err;
+
 	if (!strcmp(strstrip(filter_string), "0")) {
 		filter_free_subsystem_preds(dir, tr);
 		remove_filter_string(system->filter);
-- 
2.53.0
