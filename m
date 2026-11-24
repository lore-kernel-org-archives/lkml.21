Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534165;
	b=OwAln2W5YYPwQyf7cyqF9O+2/pyAzuUuT5FjnecxO9axfhcEfb+8ZMEv+EfNi6YiNlp/
	 6pUbiafUvuVOxzRvkdY8wMftMRKRXMmGh5BZOLxJZOB7c3TI1Vi61URyDCdXS7nG6iBNi
	 rds26qKHjq08H9Ok+ixjND+NFdJ8JHHOcvmnwq6MV+6p2mLaQ2s0LRP4VnDlxpJ5pS1Rw
	 iWKH1RX2Bgo2wMWCETtSToKoMBVre7qqG0GxPLnwUgQz8LsGVsf6BSOcHyB0N9qIToNaq
	 mpWXcyoVh4TgP+Xj0i7JzgMeB/js/2BEfAV/YmUcDl+EY0QzuCxSNmZopZVHt40QYfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Y/Uj491OsdnUjOoSDyqgMNt+3fuzPwe2BtrlRMSYbx0=;
	b=kAMcvn0E9Ov7LLndLgSKprF+kdXRh3uqkqhaUxT+1ZQlKLlis18znXOxy7ymqdcwXGVo
	 vs86QmGfjsiuP3W+wQku/W2lTvYSFCm6CBWnYXyKonzHJmBLrdcz1gg49IhjoWCjNyFaj
	 +3ipNmnrBMApbBVFUSoMyBvtEn9l0zMP5Njuwnkn8oYU2Dk3tcJIhwyuV2LbkSo88lTj2
	 srZYqytdv8m/3y7CMkX0JqZ8fYYLqf+ObowmTAoR8rFuOsmMhNCqxa4zwZYftp4pBv81y
	 yPyzmheJdpj9YRmhAARiAntuAGNNRLzBTKIe9oOoAF1tDlEKsqXU7ooKRlQEhxRYYzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gOr7W4Pk;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FBA606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FBA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gOr7W4Pk
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49d70f45b22so2707994f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534163; x=1796138963; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/Uj491OsdnUjOoSDyqgMNt+3fuzPwe2BtrlRMSYbx0=;
        b=gOr7W4Pk8JjVgnECAfkejKAP++bQhLJP+r1cPnlUJvXBUhxhDn91tCPs/vFbIOlzlg
         RbsJClzIZtHT4JhsxwARTlSbWvOfrxAc8dDsHBKBRQQYVyIZkmOPJ17+HLTTQPd9luL3
         lRZectuf6wuspMAnltmcuPlgEMhYC7CXbcXnLdfLkQ7xvO7WkdXdnVimTZxohHEqR/dh
         hGCRbfRzEpw9ly5AR05f3+NmllT6wJHt/wn5fTpwBsAod2lXZB5mNACIVD9v/T0MsEbN
         GBvToLHQV5AFnP6dNaFdRoHCiko00IOqzSmcw0FiMKv7q1js2ZND6iNfVHxAytnJ96Yi
         410w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534163; x=1796138963;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/Uj491OsdnUjOoSDyqgMNt+3fuzPwe2BtrlRMSYbx0=;
        b=LHvmVHkl1vaxPKZEu1j5K73ZWjtIdg5IH+jyOvtKl8OTv03ZjTCeLpZEd5odJ1hgWC
         DiydjuL/Edx+HBwqR7lb9MSVe+nzQK6GMEVeVBKcOqg9X/NDIxpl8OkF5Bo7SU5zHqKE
         U1cAY/oadAamnmXAlx7RAuUPVqTj53qNl4MgKXBL9zetWwAETvPWNF4Iu34cEdWET2r9
         KEduUClVV2wFSDpVI7v426Uw+FecTkn+cvWZJDqVqvlPfA3NowgQUhwAqfiYrdjQ7PPN
         VFlGKE2CZPyITvm+9J+xRoyhUfmvwJwC88l6GldZERB4eNWmdbq20CUK+IjIhubT0GrD
         x2UA==
X-Forwarded-Encrypted: i=1; AL+hErG/R1Rb/9hqFlmF9b3uMGkAxhRjNSW6Xbtyb14ChhWTd2Dgbc2ANyQ9rrFSLsg7bmm2mlk3mcZTcpNCHYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FWlBz/AaG5GIf/ukKGlwIAV06J6KXjiJROC70LHf7uU+W0/bz
	MQlKLjmJu1WHEz/K90eqakhlPXP+FGhCJcfJO7X77Yr7TiSs7DyJqS8p9g2EktkqNj+AVPmI0YM
	1C3xZUxmK+rPkTDYDmINJtA==
X-Received: from wmga21.prod.google.com ([2002:a05:600c:2d55:b0:4a2:966:8982])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb8880fb9bmr299223215e9.23.1795534162357;
 Tue, 24 Nov 2026 07:29:22 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:30 +0000
In-Reply-To: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124152845.2233401-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124152845.2233401-7-vdonnefort@google.com>
Subject: [PATCH v9 06/21] tracing/remotes: Use a single per-remote polling work
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Having a per-iterator polling work is wasteful when logging several
trace_remote per_cpu/trace_pipe files in parallel. This results in one
work running per-CPU, where only one would suffice.

Transition to a single per-remote polling work, scheduled on the first
consumer creation and stopped when the last consuming iterator is freed.

This blanket polls all CPUs, regardless of which ones are actually being
read. This is acceptable because the poll consists of reading the
meta-page, which is a fast operation. Also, it is more common to log all
CPUs in the system than only one, so this use-case should be favoured.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 51 +++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 7faa589ddf42..91c6ab9d5672 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -26,7 +26,6 @@ enum tri_type {
 struct trace_remote_iterator {
 	struct trace_remote		*remote;
 	struct trace_seq		seq;
-	struct delayed_work		poll_work;
 	unsigned long			lost_events;
 	u64				ts;
 	struct ring_buffer_iter		*rb_iter;
@@ -55,8 +54,10 @@ struct trace_remote {
 	struct rw_semaphore		reader_lock;
 	struct rw_semaphore		*pcpu_reader_locks;
 	unsigned int			nr_readers;
+	unsigned int			poll_cnt;
 	unsigned int			poll_ms;
 	bool				tracing_on;
+	struct delayed_work		poll_work;
 };
 
 static DEFINE_MUTEX(trace_remotes_lock);
@@ -351,17 +352,6 @@ static bool trace_remote_has_cpu(struct trace_remote *remote, int cpu)
 	return ring_buffer_poll_remote(remote->trace_buffer, cpu) == 0;
 }
 
-static void __poll_remote(struct work_struct *work)
-{
-	struct delayed_work *dwork = to_delayed_work(work);
-	struct trace_remote_iterator *iter;
-
-	iter = container_of(dwork, struct trace_remote_iterator, poll_work);
-	ring_buffer_poll_remote(iter->remote->trace_buffer, iter->cpu);
-	schedule_delayed_work((struct delayed_work *)work,
-			      msecs_to_jiffies(iter->remote->poll_ms));
-}
-
 static void __free_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
 {
 	if (cpu != RING_BUFFER_ALL_CPUS) {
@@ -405,6 +395,36 @@ static int __alloc_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
 	return 0;
 }
 
+static void trace_remote_do_poll(struct trace_remote *remote)
+{
+	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
+	schedule_delayed_work(&remote->poll_work, msecs_to_jiffies(remote->poll_ms));
+}
+
+static void __poll_remote(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+
+	trace_remote_do_poll(container_of(dwork, struct trace_remote, poll_work));
+}
+
+static void trace_remote_inc_poll(struct trace_remote *remote)
+{
+	/* poll_cnt <= nr_readers, inherits its overflow protection */
+	if (!remote->poll_cnt++)
+		trace_remote_do_poll(remote);
+}
+
+static void trace_remote_dec_poll(struct trace_remote *remote)
+{
+	if (WARN_ON_ONCE(!remote->poll_cnt))
+		return;
+
+	remote->poll_cnt--;
+	if (!remote->poll_cnt)
+		cancel_delayed_work_sync(&remote->poll_work);
+}
+
 static struct trace_remote_iterator
 *trace_remote_iter(struct trace_remote *remote, int cpu, enum tri_type type)
 {
@@ -434,9 +454,7 @@ static struct trace_remote_iterator
 
 		switch (type) {
 		case TRI_CONSUMING:
-			ring_buffer_poll_remote(remote->trace_buffer, cpu);
-			INIT_DELAYED_WORK(&iter->poll_work, __poll_remote);
-			schedule_delayed_work(&iter->poll_work, msecs_to_jiffies(remote->poll_ms));
+			trace_remote_inc_poll(remote);
 			break;
 		case TRI_NONCONSUMING:
 			ret = __alloc_ring_buffer_iter(iter, cpu);
@@ -470,7 +488,7 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 
 	switch (iter->type) {
 	case TRI_CONSUMING:
-		cancel_delayed_work_sync(&iter->poll_work);
+		trace_remote_dec_poll(remote);
 		break;
 	case TRI_NONCONSUMING:
 		__free_ring_buffer_iter(iter, iter->cpu);
@@ -1003,6 +1021,7 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 	remote->poll_ms = 100;
 	mutex_init(&remote->lock);
 	init_rwsem(&remote->reader_lock);
+	INIT_DELAYED_WORK(&remote->poll_work, __poll_remote);
 
 	guard(mutex)(&trace_remotes_lock);
 
-- 
2.56.1.809.ga0b61035b5-goog

