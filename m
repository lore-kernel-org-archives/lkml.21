Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196480;
	b=swuL/POFmY2EWASB7pQmJZ23sjWCeDUtyPW/90B7u3GVLjpydxgdq4oLH/reqENTglNd
	 Xmu/5zxFatC9HPU1/q06Eys3zTKzZOhxx2iWiADgnk24McWheXG1J9U/AazjCsBUYMj/j
	 UZrYYaF2DO1H6xWhtVb9piIYwEFd4QfHTusRX60RO2TGRGVhvSkIzW+uz5VKvbtNTo45U
	 jLTyeizYA+BvMEbj1FlHMrIwDz0g4wNdf909BOa4GWyyD+b4HnHHxclMWZXx4Gq9WFDeH
	 vbwQR6P5sRmbu/QUWRZNf2bucjmeGsOpxspThWe37LNcxf9ts5b50bv2XylSGE9xAPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196480;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=lzIgs+W76LQqoYUTm1kQXWQqaHfl/PbRnrufqq7spSk=;
	b=VdQNaGQ5ryq60gYq7+jCFrvpCfPYWFH+A3F1HQEYT7udcRvtojSYs9yi73YF5QAcY/Pe
	 u17Q0OwwdUdGx0kPepS8mRkDYY4H2s7+UJnX6HKmWKwHKozhv+mLRtMvMT5NLKvtOtruF
	 C4eNW+4BZFFnZZuCnAAGVG5wux8TWVvC9Q35KPEfue2eRvZQXgtFNttArTnj6FT4tq1Wl
	 0NeVoDJGVh2phNsMaSpLd76NUfYF6quZhH26k4Wgu7TVtpGM+UD2w77bF3oHx8nM3GfRe
	 6lBXaYSWhO6mptZlQXqhafJW9hnTyS/T7tjGBtNQA/+/hkdtc3Rf88Vt07sSdvcjYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="OwYIp/uz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D42260A6F6D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OwYIp/uz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73AB1F01802;
	Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196479;
	bh=lzIgs+W76LQqoYUTm1kQXWQqaHfl/PbRnrufqq7spSk=;
	h=Date:From:To:Cc:Subject:References;
	b=OwYIp/uzsPRY5AFELr2ar6rPEbYTd7MP3aF9ivuD0r6qNrNI/Pfz68L6ohDgY1ZkY
	 MHZE3H80t+HI5jBMp2zRMTt/h3AonFXuefryE8cwRvZsLgjcPuI89gfeDOTox9bCHQ
	 RTjSUI97EI+xObxOVqZIvIcUT5QrESml87gksa0XQVXGS1KGD1leOcda42wS6PA4q6
	 oWBhxRucY2eLuLyKQhgGy42ZslUXi3WAXOKgGI/TFTE4zB/f05mgn8ilsgv9b4VWoU
	 5K9ISUj63ea1ybARbt/POoooX6gJPf5TQB6kk3p0EGakUEyn1B9N5qL7sn1377uAf9
	 wJA5scck87gnA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbv-00000004aSq-0HhR;
	Fri, 20 Nov 2026 12:41:19 -0500
Message-ID: <20261120174118.891370080@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:18 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <briannorris@chromium.org>
Subject: [for-linus][PATCH 26/32] tracing: Properly match strings that start with numbers
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

As an optimization, set_ftrace_filter supports writing indices (numbers)
instead of function names. This support was added to the generic glob
(fake regex) function, which breaks the ability to filter string
patterns that start with a number. For example, PCI device names tend to
look like '0001:01:00.0', and a reasonable filter might be:

  echo 'name ~ "0001:*"' > /sys/kernel/tracing/events/rpm/rpm_resume/filter

Move the MATCH_INDEX code out to the only place it actually was intended
to work -- ftrace match_records(), with a 'func' and no 'mod'.

As a side effect, this also fixes :mod:<module> function filtering for
modules whose names start with a digit.

Link: https://patch.msgid.link/20261116182710.1.Ic0625a2bd2e6f8960c0f75e5d15f14f3c84d1d38@changeid
Fixes: f79b3f338564 ("ftrace: Allow enabling of filters via index of available_filter_functions")
Signed-off-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/ftrace.c              | 3 ++-
 kernel/trace/trace.h               | 1 -
 kernel/trace/trace_events_filter.c | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c7d74b33d36d..6654da9d1bbf 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5029,7 +5029,8 @@ match_records(struct ftrace_hash *hash, char *func, int len, char *mod)
 	if (unlikely(ftrace_disabled))
 		return 0;
 
-	if (func_g.type == MATCH_INDEX)
+	if (func_g.type == MATCH_FULL && !mod &&
+	    func_g.search && isdigit(func_g.search[0]))
 		return add_rec_by_index(hash, &func_g, clear_filter);
 
 	do_for_each_ftrace_rec(pg, rec) {
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 6b695a7f42c8..1fec567e789e 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -1807,7 +1807,6 @@ enum regex_type {
 	MATCH_MIDDLE_ONLY,
 	MATCH_END_ONLY,
 	MATCH_GLOB,
-	MATCH_INDEX,
 };
 
 struct regex {
diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index a1c298210059..6704ef3d9520 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1152,9 +1152,6 @@ enum regex_type filter_parse_regex(char *buff, int len, char **search, int *not)
 
 	*search = buff;
 
-	if (isdigit(buff[0]))
-		return MATCH_INDEX;
-
 	for (i = 0; i < len; i++) {
 		if (buff[i] == '*') {
 			if (!i) {
@@ -1192,8 +1189,6 @@ static void filter_build_regex(struct filter_pred *pred)
 	}
 
 	switch (type) {
-	/* MATCH_INDEX should not happen, but if it does, match full */
-	case MATCH_INDEX:
 	case MATCH_FULL:
 		r->match = regex_match_full;
 		break;
-- 
2.53.0
