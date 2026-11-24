Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534166;
	b=mupeCLvu+1qazJrKHXBqi0XyLy/nnjZZmUl2KRq61B9hwoqyTw1B7JW5xfzPkJ3fjzrA
	 wOvzCkapT1wD28VO8X2VNpAJJb+xuxkVVR6wPU7iP/Kxr6SHEDA7TIbEfAex0/lsygL3v
	 xFnRO24YyMJRimyQs7nAz+L9t7EQQy4tW1KYBG3EBmMEYwWA8cXLvcGcbWjMU55698eVn
	 k16d9QXOTpYXo06AUqWmQa2pjJzIp1Bj2sP+IgZvac5aLvaXxg/nY1HpDC4ErQD+5m1jr
	 LoKa6GOAaD5W0JWkRMokq+FThJRt54pELWCM4ga0GwRU6CFSLvmuagmDu4kXz/VBHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2ysHIx7OAraiaiAmcr9Nxw9/M7uLjCFoSJcKljkgX3o=;
	b=jAH/vq++ryUZul7Rvn0GpzaPI4UD+F8leDaLaJDVoMamwsXGblR6EiPaqRZ45/Rlk+iU
	 XwpO0JFKLfwp924JeeX7hLWzFRzByLaAQfQBoX04va9OJodSqH773Z73AfVMc8yVWg9E/
	 VvGD4gVKM5ALJJ5+KQX0gniMYnKvaraChdu1RJ54TCQWyd2teZind3mSovrEiKdMWcnU0
	 rX+d4PhbL1IJkRwVlI1rTXYNQW6bjSHiRQ4KURerODgRw/Zn5GbEeq5klMVfDDRuAroI1
	 o9NGZNHTwXG7ceynwy793KQWvVCrIfVsWOScyNPyQ3FqZ2fZis0BVvXxmqM8SjEi6hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWtSJzxV;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892BA606A6B0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892BA606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWtSJzxV
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so39419925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534165; x=1796138965; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ysHIx7OAraiaiAmcr9Nxw9/M7uLjCFoSJcKljkgX3o=;
        b=hWtSJzxVuYnhbnqKLcL28au2F+2wCyyp15AyqmSJtUs5HyX2fwBqcYq5H1YGjaYPOG
         FU1YPNWMNV/kkbv9bm/RdSxk60co7H7qEcRbvW3+gesqC/1p/J4FYXjBmZERzdV1bl2s
         tiEX6aW63AC/uCHCND862Ex/2YoYBR0MTq1/WlElBPdXIOghahFMKCano+JNX+tE881m
         p7WGcx02GlNIpZ+HIQLkOrSDIZHAnBMCbgCYXuYRZiFIPpTnhSgRN/dsKLKGnSjmrqWh
         bMoL15SfeXx5JT8fHpp5A7rXs+xGQL0aYBKmT1R5qUnAkrazIn3OVB9EJupzglHetYbF
         crhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534165; x=1796138965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ysHIx7OAraiaiAmcr9Nxw9/M7uLjCFoSJcKljkgX3o=;
        b=hkeCoW2fVrU0eUwtKNFY47Dm616NYbD6zfmpB75F7yYUTOHVI1tg1HgRrUoCvqN9iw
         AvVQu3fSVHIfUMRoqRm9upJEFZ37sYr2elKNnZcZ9WJwIhJpjfiEvGYNbbM5xKATT/Rb
         hIxxC9bvCTztXo88e06bjooDrQNC0tCv1+9/SMzfYDxEKLLgWjG6p7HeEwIPYRAz4w5o
         sLVOjZEsMRq0OM7TSq+yexYee0Oo6Gfcgyn5RovahLK5LUefm0Npj1+WZAFNQNoyb5yA
         MbNIX7U0HJ78LsdVCvFNpiOmOGp9N1b68SufKqdHy8c1/bNACEADk+gJzwGOZpCZCLrA
         AHrA==
X-Forwarded-Encrypted: i=1; AL+hErErK11WO7NZQT/z+fHFRdelnVlXZUtDJnmu9JilOdmFzsTHzozBTuYuefFxi6vk2nZHTdjRI2gwMRrLUtI=@vger.kernel.org
X-Gm-Message-State: APuU4Z98wjmqSVZpUHwv7phMswb+pGet3Zici96GZCdC5YqYv7oT9tJO
	QyAx2GzKTF6+O3wr5VsQ0doOTDz0qTp7R4Upxw5oaYiePUZUUXI5MFt+/y3Y9lzALGvPm/+IhiZ
	pX8IOvzgJ1IoJfGVqARMopw==
X-Received: from wmbgx14.prod.google.com ([2002:a05:600c:858e:b0:4bb:52ec:7054])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr295304835e9.12.1795534164490;
 Tue, 24 Nov 2026 07:29:24 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:32 +0000
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
Message-ID: <20261124152845.2233401-9-vdonnefort@google.com>
Subject: [PATCH v9 08/21] tracing/remotes: Add dmesg tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

When enabled, the dmesg tracefs file enables the redirection of all
events to dmesg. This is similar to tp_printk.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 139 ++++++++++++++++++++++++++++++++----
 1 file changed, 125 insertions(+), 14 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 91c6ab9d5672..f23d3386da29 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -21,6 +21,7 @@
 enum tri_type {
 	TRI_CONSUMING,
 	TRI_NONCONSUMING,
+	TRI_DMESG,
 };
 
 struct trace_remote_iterator {
@@ -43,6 +44,7 @@ struct trace_remote {
 	void				*priv;
 	struct trace_buffer		*trace_buffer;
 	struct trace_buffer_desc	*trace_buffer_desc;
+	struct trace_remote_iterator	*dmesg;
 	struct dentry			*dentry;
 	struct eventfs_inode		*eventfs_root;
 	struct eventfs_inode		*eventfs_subdir;
@@ -395,10 +397,15 @@ static int __alloc_ring_buffer_iter(struct trace_remote_iterator *iter, int cpu)
 	return 0;
 }
 
+static bool trace_remote_do_dmesg(struct trace_remote *remote);
+
 static void trace_remote_do_poll(struct trace_remote *remote)
 {
+	bool yield;
+
 	ring_buffer_poll_remote(remote->trace_buffer, RING_BUFFER_ALL_CPUS);
-	schedule_delayed_work(&remote->poll_work, msecs_to_jiffies(remote->poll_ms));
+	yield = trace_remote_do_dmesg(remote);
+	schedule_delayed_work(&remote->poll_work, yield ? 0 : msecs_to_jiffies(remote->poll_ms));
 }
 
 static void __poll_remote(struct work_struct *work)
@@ -453,6 +460,14 @@ static struct trace_remote_iterator
 		trace_seq_init(&iter->seq);
 
 		switch (type) {
+		case TRI_DMESG:
+			/* only one dmesg iter allowed */
+			if (WARN_ON_ONCE(remote->dmesg)) {
+				ret = -EBUSY;
+				break;
+			}
+			smp_store_release(&remote->dmesg, iter);
+			fallthrough;
 		case TRI_CONSUMING:
 			trace_remote_inc_poll(remote);
 			break;
@@ -487,6 +502,11 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 	lockdep_assert_held(&remote->lock);
 
 	switch (iter->type) {
+	case TRI_DMESG:
+		WARN_ON_ONCE(remote->dmesg != iter);
+		smp_store_release(&remote->dmesg, NULL);
+		flush_delayed_work(&remote->poll_work);
+		fallthrough;
 	case TRI_CONSUMING:
 		trace_remote_dec_poll(remote);
 		break;
@@ -499,13 +519,24 @@ static void trace_remote_iter_free(struct trace_remote_iterator *iter)
 	trace_remote_put(remote);
 }
 
+static bool trace_remote_iter_is_consuming(struct trace_remote_iterator *iter)
+{
+	switch (iter->type) {
+	case TRI_CONSUMING:
+	case TRI_DMESG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void trace_remote_iter_read_start(struct trace_remote_iterator *iter)
 {
 	struct trace_remote *remote = iter->remote;
 	int cpu = iter->cpu;
 
 	/* Acquire global reader lock */
-	if (cpu == RING_BUFFER_ALL_CPUS && iter->type == TRI_CONSUMING)
+	if (cpu == RING_BUFFER_ALL_CPUS && trace_remote_iter_is_consuming(iter))
 		down_write(&remote->reader_lock);
 	else
 		down_read(&remote->reader_lock);
@@ -522,7 +553,7 @@ static void trace_remote_iter_read_start(struct trace_remote_iterator *iter)
 	if (WARN_ON_ONCE(!remote->pcpu_reader_locks))
 		return;
 
-	if (iter->type == TRI_CONSUMING)
+	if (trace_remote_iter_is_consuming(iter))
 		down_write(&remote->pcpu_reader_locks[cpu]);
 	else
 		down_read(&remote->pcpu_reader_locks[cpu]);
@@ -539,14 +570,14 @@ static void trace_remote_iter_read_finished(struct trace_remote_iterator *iter)
 		 * No need for the remote lock here, iter holds a reference on
 		 * remote->nr_readers
 		 */
-		if (iter->type == TRI_CONSUMING)
+		if (trace_remote_iter_is_consuming(iter))
 			up_write(&remote->pcpu_reader_locks[cpu]);
 		else
 			up_read(&remote->pcpu_reader_locks[cpu]);
 	}
 
 	/* Release global reader lock */
-	if (cpu == RING_BUFFER_ALL_CPUS && iter->type == TRI_CONSUMING)
+	if (cpu == RING_BUFFER_ALL_CPUS && trace_remote_iter_is_consuming(iter))
 		up_write(&remote->reader_lock);
 	else
 		up_read(&remote->reader_lock);
@@ -563,10 +594,9 @@ __peek_event(struct trace_remote_iterator *iter, int cpu, u64 *ts, unsigned long
 	struct ring_buffer_event *rb_evt;
 	struct ring_buffer_iter *rb_iter;
 
-	switch (iter->type) {
-	case TRI_CONSUMING:
+	if (trace_remote_iter_is_consuming(iter)) {
 		return ring_buffer_peek(iter->remote->trace_buffer, cpu, ts, lost_events);
-	case TRI_NONCONSUMING:
+	} else {
 		rb_iter = __get_rb_iter(iter, cpu);
 		if (!rb_iter)
 			return NULL;
@@ -630,14 +660,10 @@ static void trace_remote_iter_move(struct trace_remote_iterator *iter)
 {
 	struct trace_buffer *trace_buffer = iter->remote->trace_buffer;
 
-	switch (iter->type) {
-	case TRI_CONSUMING:
+	if (trace_remote_iter_is_consuming(iter))
 		ring_buffer_consume(trace_buffer, iter->evt_cpu, NULL, NULL);
-		break;
-	case TRI_NONCONSUMING:
+	else
 		ring_buffer_iter_advance(__get_rb_iter(iter, iter->evt_cpu));
-		break;
-	}
 }
 
 static struct remote_event *trace_remote_find_event(struct trace_remote *remote, unsigned short id);
@@ -883,6 +909,87 @@ static const struct file_operations trace_fops = {
 	.release	= trace_release,
 };
 
+static bool trace_remote_do_dmesg(struct trace_remote *remote)
+{
+	struct trace_remote_iterator *iter = smp_load_acquire(&remote->dmesg);
+	unsigned int max_events = 1000;
+
+	if (!iter)
+		return false;
+
+	trace_remote_iter_read_start(iter);
+
+	while (trace_remote_iter_read_event(iter)) {
+		trace_seq_init(&iter->seq);
+
+		trace_remote_iter_print_event(iter);
+		trace_seq_putc(&iter->seq, 0);
+		if (!pr_info("%s", seq_buf_str(&iter->seq.seq)))
+			break;
+
+		trace_remote_iter_move(iter);
+
+		if (!(--max_events))
+			break;
+	}
+
+	trace_remote_iter_read_finished(iter);
+
+	return !max_events;
+}
+
+static int trace_remote_enable_dmesg(struct trace_remote *remote, bool enable)
+{
+	struct trace_remote_iterator *iter = remote->dmesg;
+
+	lockdep_assert_held(&remote->lock);
+
+	if (enable == !!iter)
+		return 0;
+
+	if (enable) {
+		iter = trace_remote_iter(remote, RING_BUFFER_ALL_CPUS, TRI_DMESG);
+		if (IS_ERR(iter))
+			return PTR_ERR(iter);
+	} else {
+		trace_remote_iter_free(remote->dmesg);
+		/* trace_remote_iter_free has reset remote->dmesg */
+	}
+
+	return 0;
+}
+
+static ssize_t
+dmesg_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
+	bool val;
+	int ret;
+
+	ret = kstrtobool_from_user(ubuf, cnt, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&remote->lock);
+
+	ret = trace_remote_enable_dmesg(remote, val);
+	if (ret)
+		return ret;
+
+	return cnt;
+}
+
+static int dmesg_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%d\n", !!READ_ONCE(remote->dmesg));
+
+	return 0;
+}
+DEFINE_TRACE_REMOTE_ATTRIBUTE(dmesg);
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d, *d;
@@ -923,6 +1030,10 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	if (!d)
 		goto err;
 
+	d = trace_create_file("dmesg", TRACEFS_MODE_WRITE, remote_d, remote, &dmesg_fops);
+	if (!d)
+		goto err;
+
 	percpu_d = tracefs_create_dir("per_cpu", remote_d);
 	if (!percpu_d) {
 		pr_err("Failed to create tracefs dir "TRACEFS_DIR"%s/per_cpu/\n", name);
-- 
2.56.1.809.ga0b61035b5-goog

