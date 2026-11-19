Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057745;
	b=mDmGaa1viuGspbyWGgSmibfcyHnxbE2y/NwG045l+5zGpj4+AHOb7CsaJtjc+DMEmi9O
	 E4FxPKUsbjjdPYlZ+sXc+2EHdoqENug++mNOtCIrrX5+IJSR+LEVcsW/LpRXO9P/U8STl
	 kyQ8HVBV5qfGkglQl7CXZCh8pIf7jrQCFwfu3clD5Co8HzlrVUjYN3oEPehrCu0uxiqgV
	 9MSNHg18aydIixVt5xgoDb4jhM/xQ8TKDtTpGfugCILWGBHJrDZ8qQpvNrv3eD3G433RC
	 kcOaKnWAyXADQbwHmR/oP2RAx5CLonzHVy2Jco097e5p0X3DcZVjIOzuEf+pTEgPPrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r7dnxHtK8RkgCgZSr6np7k+vnrFRmkzlCepNeeA4tmg=;
	b=ggbVfe0MhPxtj6d+VJ4PL2wepnoNKkBIfqVV1WYIwXjS0vcHJ+Z0YrkOWfIG/JUML83K
	 ywf6XUtdEBdf0hD4++yEOIdbvsQUqihWG1LTUglPR3bn9PHgINP5ciPiF2tvYG5U80uw8
	 SLgJdSmuhxgoubifSZOZjvWduOkuOKn53K147t4lsREosZtlGWcde2IRUa+A8Lr4AdUvd
	 kJGb1j+Lskpqyh+8KOe77QwYE3Lyg9Ug6BM/wlQ8+KEE2pBp9+wqD59LClJz+N4FOh1Dy
	 DNmrZwNpT9av54f5Lb8fIcENfGy3Mpro3gR019KZuCJPfMS2d3N8E6yU7YxF5lqLPzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D87I7va0;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25408606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:09:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25408606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D87I7va0
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3712b6d9843so1947221eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057744; x=1795662544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7dnxHtK8RkgCgZSr6np7k+vnrFRmkzlCepNeeA4tmg=;
        b=D87I7va08/wwoduX335hDH7kRaGyO2QauSdljCbfwvtVNeqkYXqR5ZmB0QDcFwlD2V
         dgF7JKXPZcN9xxEInSwljqBKzOVIaLZcZgpPcD2bJu36IC7l2YG/EQE7YO1dUcSyBa50
         +E8xBTMqjfMQ24WeUn7lyKs+4mms80/9FfWTyjpfs2LKT77Pdf3rTRVhmpQD7OkWZfIL
         nRJIXvZ7JoLzv8wNyKKEZfN0LFRJSJdKAe8v+eFoPxHe9iBdI/0cHZP6T9UhOEqmwoRe
         jzJEucCdYbYax5E7J09n6Mv1Y5tv4+soECOcVr61VyyvTRyhVJzdt+zxWzSSz+5lo1kR
         PFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057744; x=1795662544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7dnxHtK8RkgCgZSr6np7k+vnrFRmkzlCepNeeA4tmg=;
        b=RzpwUIVGwW/BP9pbRwmGwk9BfOUhN4pn9Qa7VnD0HKya7qOwwIAg+jtGHuLGuwekWc
         95YnNdBUUa9o6xDt+3GsFXF9pqrjnHile2FrKNnvCxbh6/jlNtqiqmSUPohKY7AbANaX
         qImDLw5yV0uUgkrMkEfsogGA5BERTv+WQ5bUp9j62aHqUJii0DFiDs7o6YqcMLvOCVOW
         cFefiaFdj1cxJUPxUmhQiOGYyd8RLyxrVfaekRqSyvbSUheiM/rvWjKQ6rEmmalmWt+s
         dIb3jUHH8vNKqSfL4oGvQdAEa6jv6187LLCCt/NjsXQTTSRAQr0Ckx7yAR9hvWI+Dh10
         OFBA==
X-Forwarded-Encrypted: i=1; AL+hErGyd4FAgcdU4PYMIPyEPQr6xoA3rpUonEGbY/YZF/pSckPmjNz9qFUaf9NH3c7upjMR9zxjNLDAlEqcuYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MyZz3MIZB9ietFp+wzM0UO8kJLXuU+6z9iG8PDHwih8LZA6rt
	BQ9TAjovUXvzpw5HccJk2o/U79kUP/fWyahXR9WrTfXUEUl1AeTDu2Go
X-Gm-Gg: AZFdTZd1Jiz5CpL+tcU+2rTArRi7n+EhdjMEo/xzB4sPnJxbVOzMgkyg3yUXvsPYYdS
	eG+7idI2suyT8mcoq4+grNeuGPQ0Se++Wr9K+rmuectLR+I82o7pGlbM0FLWR2UM3LPvn9ZJMy0
	wJqrp4t8NPjA2anfr8hgT9jXMufQw1xseJCvawtDWMdLh/+1LJZvcHqTnX3YZfLrTEJuDfJ4Ztx
	iAqa6FItvo4uR/rqY2o17ZFfM7kt+mifSs9CjpiHU4H31wY7H7wlSuenaErFpYRRR4yJU2L6YXU
	jefkoEPdZhLLKazbpat1/FmumtSHSzuDv0y/Ra0YqaAmCo8JA6Pxo/l+9VhYJlObELgc2yYkcfx
	4qMetFw/QGOiK6OKWf9DjwWITu+djxEMtwWjKTX5gLk4ZUawcCpykBp8ad0ywDFjnJ86yJdBBaw
	H/HBlaFwkaqFbCkJuV131E3qTi4/ebn+eUzAUpOVy0ar4IgQfRMF/YpoS3F6VmErmb4oWsM8+7M
	Rx4dANYs0+AxqYtofFFDZ3fZX42raV3N/VWs5hYIJNbtIZLjjsOuboxWUP1Rm01K1JM+NWfLBoB
	j9H5pzPx0p3xMDzjQ/6mJ3BEYru1AU974i1zuwKBjUirYEhOqhQVtBl6bC2RkbnOE/A6Dzs4Aqy
	3B3XTYV0ZLIskW2TOyYIiUZ8sqWZDzv8tvMz5amgXVgPrpYyH4OkeuzGYvwit3ZRRk5qsSxU7
X-Received: by 2002:a05:7301:428b:b0:36e:b05e:9a74 with SMTP id 5a478bee46e88-3828161a511mr4153472eec.30.1795057744246;
        Wed, 18 Nov 2026 19:09:04 -0800 (PST)
Received: from localhost.localdomain (c-107-3-155-154.hsd1.ca.comcast.net. [107.3.155.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3843559c264sm1991115eec.22.2026.11.18.19.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 19:09:03 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH v2] ftrace: Reject "!!" in front of a set_ftrace_filter command
Date: Wed, 18 Nov 2026 19:09:00 -0800
Message-Id: <20261119030900.37343-1-evanfengff@gmail.com>
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
v2: keep the WARN_ON() and reject "!!" before a command callback runs (Steven Rostedt).
v1: https://lore.kernel.org/linux-trace-kernel/20261118032637.80038-1-evanfengff@gmail.com
QEMU, all 7 probe commands: one WARNING each before, none after, other results unchanged.
Found and written with the help of an AI coding assistant.

 kernel/trace/ftrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c7d74b33d36d..44a861f021be 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -5846,6 +5846,9 @@ static int ftrace_process_regex(struct ftrace_iterator *iter,
 
 	/* command found */
 
+	if (func[0] == '!' && func[1] == '!')
+		return -EINVAL;
+
 	command = strsep(&next, ":");
 
 	guard(mutex)(&ftrace_cmd_mutex);

base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.39.3 (Apple Git-146)

