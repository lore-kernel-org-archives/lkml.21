Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988524;
	b=tVf/GyoTP8HPnippPV2AeanUCp0jvsJ/UO8XJWdj/eOmqiRC+wRdzmWc7x580p4bDi8l
	 soYwnRm0IgjGik4lH35kZ3zhrisWX4JvOlHpzfltK1NnV3qjkzCm5lDsaSwtkVtwsUyBB
	 /WzUSprFDgeJ/ZGdzL9ALtOg3RuhwGTUtOQq+TAe2nelsSJQwRE2bOE+XCuKVc2mhzm8N
	 /sIlCK9DH7V7eaTIgGKZCCBmZHPJXjvQjFS+j9idNPnYhbQFtuqspFHfOMroYboFjSttP
	 6WzG/iFGkfF/J0YX49islD6fiFlvwYlVVJmqv2Z9XCqkCFAR1uanWSXAUkd/grhrkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NqBTWbYhrgJljwUx8WqJhkg4ihbk/Vv19VCK3zrjEUA=;
	b=ELz7lIznncZwoDyPNR1dSnjhA6VZlFQlp09ZPR991WPb/VPusaEgW1rB1J9Lx6QAFUOb
	 dNl3i8E7b5S2KiTfzdc5OemSz6aJJfEP+2OUzr5rCoPrV2yXdx6L3WLgwJp9HYXCHiL78
	 I+hs/Un4gatBrLXKK+0mtc1t4dAyGhNSieoJvpWaMldeYg18oCX1LqI6DAiXAzUzMfMN5
	 OGB2FN628OX0jfdArrb1G65+C5vCqzPbRHRWatkXX0BWMnYOgmsN44wXXT+v8+ze1+p6W
	 Z2CM6isphkL5uzEv6nTuGnOL0PCMdaaxqqLSgj5ynMwxHye331H5oeCDMUGr7/R+Xow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="d/7Io1VV";
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3441606A88F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3441606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d/7Io1VV
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-381dc4b8f40so918744eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794988523; x=1795593323; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqBTWbYhrgJljwUx8WqJhkg4ihbk/Vv19VCK3zrjEUA=;
        b=d/7Io1VVBbIOEreAOJxktmHodlkVrpBDoA/cprL6W1ywaKOagFc8hIDgnAXixEbFvO
         LQ91kuOgnuSlXwuFi5EKDccqoIS2LazfKOhFsO5RpOmUMoRKDPb+wWY/b4XexsgxeqiD
         V2H5eWb6peY5dY923yYV+grX4rPKTWOHcjIQ9IykbUCJLRvNTXOUdKOuWsuS5r6LFzZU
         FPXN2PGmjNrFP+usqXl+K3tpita1IB7JHUFPLcPzJGJZhwxzAfmdMRFOxV0dCOPQn4+w
         /HnqCg2MQBcChFSXxqUj0o/3R7rpfjnK5VsFWbCcQXuqXUtbfcsieVHze9NApSS5zWQX
         eBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988523; x=1795593323;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqBTWbYhrgJljwUx8WqJhkg4ihbk/Vv19VCK3zrjEUA=;
        b=kcVbkEcitU7sqn1KMbwMf5+33m/+nrBV5/gfbeLKNfXR7UFTIERssnjf1r8gD7E+SC
         6wyW4AZ8950nQ8cRwXBZjlzGE7E6NyofVKgGMww4HohZr4VcXpjZMdJ+Ccmrjv4AEq6A
         tsyvsYNyscHd9FhG4fS5auswU+o3Tt2g4WUoVN64oMXuK1us1aEKh+8N77CQe4VDAKxx
         /MK1YYWVhpvOpdO3O0alHqknH9McjSD687fwxcO/rqMDv2nNhfPsNUvpfR4gUpczcVGm
         L2y78Mapzca79wjI6jyIoCctFPUuUPVeNp+8iPR2YrnY74R1/E2KhZh0vj4LqmKH4o0l
         DW5w==
X-Forwarded-Encrypted: i=1; AL+hErFeqfZ1ThjbPrNHtaK0w7oI3XTqWJPHD65sBzGXMC75xEGlxuAMUumU9losV43v5lPRsoyaiUj23wwSHtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VTxcYmLP+lkBjAcKQLOVpripwl86qnLGtyPcd5onMM/Qsz6Xt
	JrjR9/p27FceI39yjOEun9hn5EalyO9Kdy3HAW2/ZdxctaWPh45aDaeidy2PllnQXuREjC+9dAE
	dyxMB5z7ieA==
X-Received: from dybmw7.prod.google.com ([2002:a05:7300:cd87:b0:382:7604:3dd8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:d08c:b0:381:edba:caba
 with SMTP id 5a478bee46e88-38280a385e5mr1870465eec.17.1794988522456; Tue, 17
 Nov 2026 23:55:22 -0800 (PST)
Date: Tue, 17 Nov 2026 23:55:12 -0800
In-Reply-To: <20261118075516.1278903-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118075516.1278903-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118075516.1278903-2-irogers@google.com>
Subject: [PATCH v1 1/4] perf threads: Don't resurrect removed threads in last_match
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

threads__find() looks up the thread under down_read(&table->lock), drops
the read lock, and then acquires down_write(&table->lock) inside
threads_table_entry__set_last_match() to update table->last_match.

If threads__remove() (or threads__remove_all_threads()) runs in the
window between up_read(&table->lock) and down_write(&table->lock), it
clears table->last_match and deletes the thread from table->shard, only
for threads__find() to overwrite table->last_match with the removed
thread. Subsequent lookups for that tid then return the removed thread
from table->last_match, causing stale event attribution and keeping a
cached reference until another lookup evicts it. In addition,
threads__find() unnecessarily took down_write(&table->lock) to re-set
table->last_match even when last_match already hit.

Only update table->last_match on a cache miss, and recheck under
down_write(&table->lock) that tid still maps to the same struct thread
in table->shard before updating table->last_match.

Fixes: d436f90a64f3 ("perf machine: Move machine's threads into its own abstraction")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/threads.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/threads.c b/tools/perf/util/threads.c
index 5db81b9..736058e 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -85,10 +85,13 @@ static void __threads_table_entry__set_last_match(struct threads_table_entry *ta
 }
 
 static void threads_table_entry__set_last_match(struct threads_table_entry *table,
-						struct thread *th)
+						pid_t tid, struct thread *th)
 {
+	struct thread *cur;
+
 	down_write(&table->lock);
-	__threads_table_entry__set_last_match(table, th);
+	if (hashmap__find(&table->shard, tid, &cur) && RC_CHK_EQUAL(cur, th))
+		__threads_table_entry__set_last_match(table, th);
 	up_write(&table->lock);
 }
 
@@ -96,16 +99,19 @@ struct thread *threads__find(struct threads *threads, pid_t tid)
 {
 	struct threads_table_entry *table  = threads__table(threads, tid);
 	struct thread *res;
+	bool update_last_match = false;
 
 	down_read(&table->lock);
 	res = __threads_table_entry__get_last_match(table, tid);
 	if (!res) {
-		if (hashmap__find(&table->shard, tid, &res))
+		if (hashmap__find(&table->shard, tid, &res)) {
 			res = thread__get(res);
+			update_last_match = true;
+		}
 	}
 	up_read(&table->lock);
-	if (res)
-		threads_table_entry__set_last_match(table, res);
+	if (update_last_match)
+		threads_table_entry__set_last_match(table, tid, res);
 	return res;
 }
 
-- 
2.56.1.703.gf848ed807c-goog

