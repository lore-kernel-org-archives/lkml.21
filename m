Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115531;
	b=e/lt/x4qKcgW4YFeWTNcEtNvz/rFodKfu8qvNaeGt9b0vovVP+qlurPtxYevRNHDqQ3/
	 nj7qjOuhsL7SOvm2lO8UQJTTZ2q/yV35mYGv7KbcsIsgCmICfcI0/QqwAXm4nkCZnYD0k
	 DTui8gJqfGLzvensJKmDVJ3WfW/NaRm5MGM3D7NnoUHQFuiPUGkUUdPJg9R7UjrxXnRsF
	 4T2fP3LISd3TOot1T11vrS4ZdkgYkuLbOAwAvQnWEt44d/iZBOpxdMc85t+fNQS1pLzKj
	 iSVl5A3dkaLJYuyzi3ZrfAL9C5O57yR00DaUXBuIAl+t/2f/d6YZX9n4dudvfL7dqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dwyCEAim6gO40kqqOYIgTnUKBWLi3TPB7gPBoByislo=;
	b=mekXqCTyS+TsXJGoUrvFCBnEOwVj548evu073u2iN4JTcJTz0M/6h/6UPzjKwyk5RAJw
	 PM7fDU3TYwoCtC+xckIKxR7DLmUqEweNeRqVjJmZmC2LA5p2xff3gNH/k8NbheSxbh/UB
	 pSUUcG8cLZ6XTI9L3ZGWOCssNjJVQSAulW2ppONLetm0WZ9tXj7bVUh7/+tS4YhP6m3xU
	 LjibN58ZwdkbIx3ZZPxjaA109wNsIP/WX5oW+JZtlMnXgC9aZlA7EOugbGbdVL8sDPsu7
	 UryEgR7lxsMsw++9KWbrT9F8wAxttHmwhih+LWJlFQEUVLagYFpOPDy+LcNaOqxMfeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXpu3izc;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E55606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E55606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pXpu3izc
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6b8e2d8df4fso58370eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115530; x=1795720330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwyCEAim6gO40kqqOYIgTnUKBWLi3TPB7gPBoByislo=;
        b=pXpu3izc7Z7+QIGVR5RmK4NW+4or6x/sMwnUnYRDs6ZZ3IVnr8H8RVHn4Dg6Y89K71
         GZRTCbBxoDrZMx78Wo5HQK28LI+n24CTOIdrwK46Ci1fXN3EO7vT+zTQP+5lx24a7UKP
         VUUGa/YLMSEnPQtfwUx1Vae5F53hT0MQH3ITneMcCgfuO8c4qktdm59vQAsIjos3s1MX
         0hP7YVvQrKrYCIqpcomf0ZPMpJqHPtuL6wztotAk/Lvcycc259i90qKqodCEzgXKfThr
         7CHOZyw8bPnJhi51ZBdxqysc/3aN7C23P+eFn4t9sUOvs0bT1RGVZtlEkNcjTOhxDUCe
         FjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115530; x=1795720330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwyCEAim6gO40kqqOYIgTnUKBWLi3TPB7gPBoByislo=;
        b=v5UUKn8Dx7PdcklvTupheHSH1PwJstHwbuCqp6veuXoKGcseAM8xjxM0hBzQ/1C2nc
         rpVWqvQdZhaFQqA0KAJgzA6lnbkQhvgC1DYShlA59ifiWXKbxgLcvYtvTHv9V7aFZom7
         1ei1w4x8ElLConNnPuhPJ38IVizIl5mmedfWdgQWxpCPo46gftdT7PGI7X6646n99tVu
         JIosnRmxIySqMRW97biDfxXxffW2HReamvZ1WJcgcuM2bVpYHvGB+kEz+73ylT2E+Cgr
         kMwFATEMAwlKjwojs9HLclvrOKkmSRkEmaBTZyyuPdwNMvvBl9cMPRJtWNmJRg5fnJ5x
         zEmA==
X-Forwarded-Encrypted: i=1; AL+hErHO7OCSgRhUdKYMPnNkkJILEgK7v+7qlmcM/FrMJLhXSi3X5/oL6EIyJoU3TbwqV85l8Nc8ivZrd9ughMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9i0ARJKcyN8XmTomAuntw4UD2KBzxn5nrd3T77VjQcqm+re4zu
	Yd/lvNaaCYo8tUgPrP52W0MTJzYHeT4HPXGt9Qh+RmBvCOKaeVVrOx+F
X-Gm-Gg: AYBFou2kMQ6ZPgNwO4E8JaJBcnFC6fxEgKh/8YvNPwPMgtj7qg/7UV7G0KaD+3zZWRG
	0t7/0CRx2CuxRxAkYEbbZE7fRJwc982sZQPjHmGw81BlxbNfaXoF8yPvju32NxpYlXUx1IiZ7XP
	8uN9mniCrSEYNtVy0MkWfd3bFSZBhPR5Yp5tr2vOiO7Pq3wUBVnmUnfnT7GfNRhSL4F+TR9DUrj
	vqqfLGFVkHLXbELwxD9OP+mreIwdcPvQ0tFo6IhW2qMRF65ZvsyhtLXV4X5q9+intYv8cYihfAm
	TTTGurpLDySJzqiuA0KZyJQzkIGYbXBaHcYtvwD0eqT1oTdne10t6SeqaepAbaf2/5ii11VW/lH
	t+/EIasEhgkGdYJp1Rz8vJBnxzyXMAl1U0aKDbPzBj5tsBHFH39UxxQPR3IlpXVAyruvMV3OX/v
	lQw2+b5/fq9PUfTEucacLPnX2IZ5PycRTiIwNcQxTZ1Vy7WQre8VCllAke/YpkDdKRcJtq+kxZ3
	pSmbwCO0UnYmXX5gHM0IFlpkrfO+bFjMh01PUgghX/Dn/WUBqYTrsQzYG5NtLJq4Hj4HtzZIFka
	6K0NUwWDIaNEISMf/hqlIJz6yEA/8ACOJEFgteQXe31lmJ50zFtIKwRgb2u/cfQJwiFId9hp5un
	HtmkWaNx9B3pxlHIr1PwQGo5edF+VvyriY7z0prMHjVp6finic6QV1Z0Gte0=
X-Received: by 2002:a05:6820:3510:20b0:71a:efbe:ef21 with SMTP id 006d021491bc7-71b3920c4e2mr444880eaf.5.1795115529905;
        Thu, 19 Nov 2026 11:12:09 -0800 (PST)
Received: from FKXX2DL94F.bytedance.net ([72.29.204.230])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316910337sm293858a34.23.2026.11.19.11.12.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 11:12:09 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH v3] ftrace: Reject "!!" in front of a set_ftrace_filter command
Date: Thu, 19 Nov 2026 11:12:05 -0800
Message-Id: <20261119191205.32892-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

A command written to set_ftrace_filter with two '!' in front of the
function glob triggers the WARN_ON() in
unregister_ftrace_function_probe_func():

  # echo '!!vfs_read:traceoff' >> set_ftrace_filter
  WARNING: kernel/trace/ftrace.c:5675 at unregister_ftrace_function_probe_func+0x662/0x870

The command callbacks strip the first '!' and pass the rest as the glob
of the probe to remove. filter_parse_regex() then reports the second
'!' as a negated glob, which function probes do not support.

Return -EINVAL for such input in ftrace_process_regex(), before a
command callback is called.

Fixes: 23b4ff3aa479 ("ftrace: add traceon traceoff commands to enable/disable the buffers")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
v3: add the comment above the check that Steven Rostedt asked for. No code change.
v2: https://lore.kernel.org/linux-trace-kernel/20261119030900.37343-1-evanfengff@gmail.com
QEMU with the v2 code, all 7 probe commands: one WARNING each before, none after.
Found and written with the help of an AI coding assistant.

 kernel/trace/ftrace.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c7d74b33d36d..4e4337243797 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5846,6 +5846,13 @@ static int ftrace_process_regex(struct ftrace_iterator *iter,
 
 	/* command found */
 
+	/*
+	 * A double "!!" confuses the parser. This isn't a boolean operation,
+	 * simply reject it.
+	 */
+	if (func[0] == '!' && func[1] == '!')
+		return -EINVAL;
+
 	command = strsep(&next, ":");
 
 	guard(mutex)(&ftrace_cmd_mutex);

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.39.3 (Apple Git-146)

