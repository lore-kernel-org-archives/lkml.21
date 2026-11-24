Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534179;
	b=jl1QEbgiwJfrzrjtXiL8JLg5pIHLLiRkYpuHbp3wH/zw4WlcsY80FJqgXIds6ERL34iC
	 GoNu+NYmqhRE+Yl+eVXpb2mj7Ts/KuUZm4bOHUIDoUA5CUxVKCmvxtFOkKmRIhoi7Lb9X
	 d3LBFs5TfC+VNJKjhnaeRwIFOtLbwy3aHs3lN+LPP4udnGyuo8zGLmD0mtVvh57dz8RKd
	 SJUJJxMj+H1gXJ4aNCAfWmkRk1VAUBocf9v5EcjZZK58l7WMFo/tTZQv+BqdP9ovOl4HA
	 HzrCF4EwgBsoqavyLI3BKHSspqklg8HAPR4SIXRMi5ieub0m47re6yh9ETNetZ/Y9pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=T5hheb2oNnEOH3DX/CJK6Dfr7i5urP5k3HJbUopSOI0=;
	b=SoLSIjejvXy27cMGljrlHCTrzB3oY/BmeuZc8MzqZIJoQTt2liETXrYWTApeho9ebYJ3
	 i1zv1Mw6QLcE3oB/8o5g2kO6c+B5v1UDz1PgGK6nrWyeZx+S43hS2AW/EI3C08cAN/SL6
	 blz32XqeyyGy/wyon4X0zClPm0SWaFnmJlfNjMm1H6dIiU45mUO1SsBuYk7xmlmssc6wH
	 1I6QR/jCX6L0zYJznLWOHahXZU5J+4JKy81VQ3v9DAm4CDrIfqVae1w+QWjaT1MaP0XYz
	 pQ4VJalvas4iGiUkle7aH1vNlWr4OyEE37whnn3cd/V3DQl6KfwcPcFG7wAIIWPqDzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="g7/UAp8B";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472E3606A6A8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 472E3606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=g7/UAp8B
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb8ae35aeaso39047235e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534177; x=1796138977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5hheb2oNnEOH3DX/CJK6Dfr7i5urP5k3HJbUopSOI0=;
        b=g7/UAp8BzN+swUrBMFcXLbrJE4Ae8gjYnS/oD6rSUlENUgCdMXejv/+DlgDn92fVCi
         C9v6YaTr/4/ZD/GUf1epYoS46GYo41NzCojZeAC7FruvAvU+3UdS27OfvGcEpAcuoq/F
         tFmNDP70f/6WTw+/7SXPgiywh2qgQ6e6bK2aVlEcwaB9NYKqY8F7LZ7S+OLicLtOwfcD
         KqMRzpuhlT/inOVN3htRS44DVeh607JF8dCsR+7vD4d+t3EoEcqVkaSzobMM4jSt+4Ln
         W5ilxEq92peVQlhJqSv9LJNG1SWPcsg0nqeDz/79JIoGdzI1jjbPhg2onYOLPm4zANoz
         rktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534177; x=1796138977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5hheb2oNnEOH3DX/CJK6Dfr7i5urP5k3HJbUopSOI0=;
        b=aSFwTJlIRX7+xTxyw6IuV5D/AsYWqFjjrM1oOOeBYR+fmEV2nKMboSC+VMeVRrKDoL
         KQKAYrR53d3DtP30BFvIC2Pexhx/3joI+HU48oxZoMFsIx56rtOkqOnWoT88GMAENuMq
         y2aouasQjwJcjyhZRAxIS+4Cpr8eXVNP1/gmM4iDqAC7kj9RBHfHaTmhU5PIWp5tauKd
         HQAFwFk+Fv3wRoyKQPWKhMyBpFfoHq3rSOoYa2u0fsv8r4YFGW5KF+vf0mRb+NV1fM/E
         MUd6qNJFwE7uB//VzePtjuRi3PYTMlisaa1+fTcm0BBxeqEtE6TxmvWBB87BnI1jVaee
         M+Mw==
X-Forwarded-Encrypted: i=1; AL+hErEVE+DMKxreNPjqZH6aYPbiARUxxsSNzLZxkUR7B+DOoZ5ic/SMX8a9kubJ00PaFEZixnUWwb558Ec01Zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KFE/NKw97OxKeMvmYbDcpmUWhCTpUX9/3kSgtY28Yvz1IyTo+
	1ms5Z/7MZsf9e5gZXlXXmT3AZlY2JTNn988eesb2sots3T9fBbtzEyB++pD/OcY91x/X4pDaL0T
	Qiekkgv8rJ46K3k/vfmxNMg==
X-Received: from wmbz10.prod.google.com ([2002:a05:600c:c08a:b0:4a1:8bbb:59bd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8184:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4bb8881e969mr287363775e9.28.1795534175885;
 Tue, 24 Nov 2026 07:29:35 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:42 +0000
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
Message-ID: <20261124152845.2233401-19-vdonnefort@google.com>
Subject: [PATCH v9 18/21] tracing/remotes: Add poll_ms tracefs file
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a tracefs file to configure the trace remote polling period. Keep
the default value to 100ms.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index c7d33cb3d37f..0a899ed5b34b 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -1137,6 +1137,46 @@ static int dump_on_panic_show(struct seq_file *s, void *unused)
 }
 DEFINE_TRACE_REMOTE_ATTRIBUTE(dump_on_panic);
 
+static ssize_t poll_ms_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
+{
+	struct seq_file *seq = filp->private_data;
+	struct trace_remote *remote = seq->private;
+	unsigned int val;
+	int ret;
+
+	ret = kstrtouint_from_user(ubuf, cnt, 10, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
+		return -EINVAL;
+
+	guard(mutex)(&remote->lock);
+
+	if (val == remote->poll_ms)
+		return cnt;
+
+	if (remote->poll_cnt)
+		cancel_delayed_work_sync(&remote->poll_work);
+
+	WRITE_ONCE(remote->poll_ms, val);
+
+	if (remote->poll_cnt)
+		schedule_delayed_work(&remote->poll_work, msecs_to_jiffies(val));
+
+	return cnt;
+}
+
+static int poll_ms_show(struct seq_file *s, void *unused)
+{
+	struct trace_remote *remote = s->private;
+
+	seq_printf(s, "%u\n", READ_ONCE(remote->poll_ms));
+
+	return 0;
+}
+DEFINE_TRACE_REMOTE_ATTRIBUTE(poll_ms);
+
 static int trace_remote_init_tracefs(const char *name, struct trace_remote *remote)
 {
 	struct dentry *remote_d, *percpu_d, *d;
@@ -1169,6 +1209,10 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 	if (!d)
 		goto err;
 
+	d = trace_create_file("poll_ms", TRACEFS_MODE_WRITE, remote_d, remote, &poll_ms_fops);
+	if (!d)
+		goto err;
+
 	d = trace_create_file("buffer_size_kb", TRACEFS_MODE_WRITE, remote_d, remote,
 			      &buffer_size_kb_fops);
 	if (!d)
-- 
2.56.1.809.ga0b61035b5-goog

