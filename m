Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534161;
	b=rueLBccnnS96trCaTFF3D94fK/ZlNxrY0hNdg7+ddmfl4BbTBpsFpS38lJVUi0uxJZCy
	 9gT00PV1icjv8rbQLQKYgv+7jmWUvgsMXD8BaZy5bl2yoKKjNJS2KsT3f2ZVSQJPhjkK1
	 lEmJ4fjqbGHVbXWx+tKJbJQxvhX9vxyTbPU3aa/fYDaZAENRtBAertUFj9ANP95FIJCpL
	 q9sSy2oFbdOIpghth6a9ftEJHWU+hY8iu+rHMCTNo2tAVg8uOi0ZSBBJIfWicYQS+KkW6
	 XEH8ZiEwezemcmUTlnpi6xD4nXls5oIghHA7EGqb/ZYbhjjM1dvQqILlp/6I2PFj6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mQt8eIxPOUGv0YkmUsKHVGbPLTXxWDgibqzukp2v6tM=;
	b=oH+DQ6d+ANyhsMJLVaQItr1mvYuEKEhIzpVx/6jzooxjVPPWvXWFnggladqB8ujSLakb
	 Aiixw0vtC6H1CE/8B+5XKlQz6hypv4ZLjn9b7ilEkn2dQZ4i9IutnnhpUqFKoIBJ+ELcK
	 hXWg4bIo8ZksqyXE55WQkzp0nab6UYExvV7uviOguQ7qCsgbjEzAXGkNzNIa4JKDmslMq
	 9sZyG4yXPOTqZmjj+Ja5NcyhMEwZWQdYU1l2ptxlbWEPf7G9GMRKGy55A/1g7w9TQKuQB
	 I4MEpavazzm4F63i15M+ywaRXpF5EXL/lhkVeNBpTxV2rERzMH6WVYyg4feOLXOK9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jFjMtkib;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1527606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1527606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jFjMtkib
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so33167995e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795534159; x=1796138959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQt8eIxPOUGv0YkmUsKHVGbPLTXxWDgibqzukp2v6tM=;
        b=jFjMtkibiB4ai7juQDrqRK/oAr9NZZfhrTHrqpULqJtsAgrwO/kgvuXTqqPKhHsKIb
         t85uiSpWs5wBRshY9oT9whWAKM47XgJzwKsuzPTBCa8IzXTmhS9KOLyYVz53uQKre6x/
         0Pm9VAj0ia2LIgtkLhH5gNAnS+BL0uPYO3C4sAalmGBhlnO+ymkJKpYeKVoyndExK8Dy
         bgLgOvd0VMAR0urjL2k0dOCihq1IZREUciZz/a4TUm7D8Bly2/YKTeauFkJNP0qDVwyd
         wCP6O1QcfxS95sbpk/n9Xljt3weALIa6784CdD+J+kcpb+eUhKB06zWwDgtfdD4cYU35
         Bqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534159; x=1796138959;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQt8eIxPOUGv0YkmUsKHVGbPLTXxWDgibqzukp2v6tM=;
        b=wTUA+f0BPXufwY/Eo6uupMd6aDzNYQ7rbmD7Ug7+ezlDet1ZzZzxndsLe3pUaMtprC
         M2C6Dv2qUJKDPy67ZkUEnFy40zymbJ8hEJWEwFueJTyXbt5AYNzKPf21yamqCZTnm/F6
         Ueeru9lpgEEsQ1Bk/MjHeABpJhc8aiVhGWD5dq0wQ0L6kgC+wCzjgdt51orww+1kCllw
         1cjZyWjEVIDlSssIJBq51tgIvK7KK2BCvxTfhGXd7OdefW35X9+USD9OA6G4FxbyvGzZ
         NByFsewOWMd2ILuZyy55oAutvT3f+hP412VcFQrulMYKiI17wQhLyUGGLvz0RzZvfGay
         fc/Q==
X-Forwarded-Encrypted: i=1; AL+hErGL68LJbPPe9w2cLZX01mZKxpMrqfCX9dYLjpmCvuTUTpboMABueRwBz2wtkVb7wvxXAcKis/i+OpNSjcY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9mdOB6/6e8FcNFrDFIKpAC/x4N0xbONJUD0FEvRQpZfIjYNI8
	6q90w6wjJmxkj+bpNB5HKLgJVGurt2ln8EvHpNC3YVmcX8r4AvoJux5qU5ssG+ou+q4KdovC8tY
	nO4Qetqk8jCgelIrVgZAAMg==
X-Received: from wmot5.prod.google.com ([2002:a05:600c:4505:b0:4a1:fd4d:ad4e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3547:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb888098bfmr307202465e9.11.1795534159139;
 Tue, 24 Nov 2026 07:29:19 -0800 (PST)
Date: Tue, 24 Nov 2026 15:28:27 +0000
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
Message-ID: <20261124152845.2233401-4-vdonnefort@google.com>
Subject: [PATCH v9 03/21] tracing/remotes: Use kstrtobool for boolean tracefs files
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Use kstrtobool in trace_remote.c where possible. This is more user-friendly
as it allows a better variety of input strings.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/trace/trace_remote.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 8a1a0c4ea626..bd1b26cd981a 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -235,10 +235,10 @@ tracing_on_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t
 {
 	struct seq_file *seq = filp->private_data;
 	struct trace_remote *remote = seq->private;
-	unsigned long val;
+	bool val;
 	int ret;
 
-	ret = kstrtoul_from_user(ubuf, cnt, 10, &val);
+	ret = kstrtobool_from_user(ubuf, cnt, &val);
 	if (ret)
 		return ret;
 
@@ -1151,10 +1151,10 @@ static ssize_t remote_event_enable_write(struct file *filp, const char __user *u
 	struct seq_file *seq = filp->private_data;
 	struct remote_event *evt = seq->private;
 	struct trace_remote *remote = evt->remote;
-	u8 enable;
+	bool enable;
 	int ret;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
@@ -1235,10 +1235,10 @@ static ssize_t remote_events_dir_enable_write(struct file *filp, const char __us
 					      size_t count, loff_t *ppos)
 {
 	struct trace_remote *remote = file_inode(filp)->i_private;
+	bool enable;
 	int i, ret;
-	u8 enable;
 
-	ret = kstrtou8_from_user(ubuf, count, 10, &enable);
+	ret = kstrtobool_from_user(ubuf, count, &enable);
 	if (ret)
 		return ret;
 
-- 
2.56.1.809.ga0b61035b5-goog

