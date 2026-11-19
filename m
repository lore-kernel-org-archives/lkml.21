Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075304;
	b=0hB2o74Z5oIfmDtb26V6hgPGP6320052u7FwpFFyNY2kM8NtdVOlYvEgQ/VutZnMKQUW
	 9R55Oh4SJSNFzl7EsgOHkNMRgsLg+N0L6GxnDfyF4OfsB5ljMNq68x8S6YdeT/VeKHh0S
	 tYVAPJ7PtYVBdMGZWrI0JJA5rdIUdOqx/Hjn4etHfCUL+dCwGaPXwcN7hJhp9YqYVMPMM
	 lsydVmW6Cj6XkFsl/ULL3FADVD82i5uObHNla2px+2cUoaUKh5c/2cHQQIStczpIan0c7
	 NLoKV2JSSaBYAEMeBxA6E72kDg7t1yXECk8mbcB5wILzJDWCS/DIxmdGTWvmqIQP1zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BI3GiHZy5PM41ztBgWptxPosjP5yVUX7sfT56sMb9/k=;
	b=GH8lGDrAvEHq0SgPyip6KDyftfnJIOkAmR5Xej0JJwEb3wIThnftZhvFQY+9kWfGIYRi
	 XFYPmNRi97MHpkPHTtYqC29CuPe75zkBZa0x9tGvZYKj6l6cWWjCll6dJStVUdxkF7FM3
	 cMVNKQoJDm0kbVjNuJsPZ2TdjEcRRQpfsGVCW8w82HzLBZtp86v+hWj34YXlN8xJF2veV
	 bfHBh/zZLEocPcwxoZapOcPq9Hzo37UdASdSdXpSBtH9DSxP7kiSaAMOCZNGzae4D4oI1
	 3RfRKX/PU6furJT02o02koyua82jF8iWmDEDWZZaVp8VQ4zGNG/ihp6Dd9+DuYnDE5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMu2ZlI2;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA0A606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DA0A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMu2ZlI2
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso17150475e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075301; x=1795680101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BI3GiHZy5PM41ztBgWptxPosjP5yVUX7sfT56sMb9/k=;
        b=bMu2ZlI2o6HCtUAxMfEv1ledyJ03bapITiRAATkmdTsD09Vx/yhmG65NF47xEQyFYM
         yyUHFv/l3p9H9os8ztvdv5Y0xu28YstZXhjuJBo13XU6nqBkRVl4YzAehVMUsAfk+url
         wRi3jJszRTnEDG4/Zo5veRySKoTFPrhH/rByARHkF1AQKsJkrHSZRR5FW4O1AwClPeZ5
         rZoWQ7RwrOLHbxRYnc1bRyGj5fGgHJ4liIAbd3FkXKhVdjDdZFkLMn7bcbQGxNBr5Zqz
         z2DvuN7cJShasX6d2OmreaIpVZUSKLYyB8mKk0ACrEbp86SLBarcz32UGenx2mjGds38
         M/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075301; x=1795680101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BI3GiHZy5PM41ztBgWptxPosjP5yVUX7sfT56sMb9/k=;
        b=SSBlxaiDZSJ8Iy0ezHibgGPgmL63Z/cVCjswcuVHat2k5Ty0TJqGg3AuEIxmvVZC1h
         9AgdhF/put1UckOWBL/Hbz5lkT2Y6Er41UI53CIsXUn+aQU5xJF9qpZ/VTP80wVTb4nR
         zplulFB4pymU/yqEvY5Br/p3a/6Ay3K1xsmTkQiBwiSIxBUE+V3P8tzaHHJ3DZeJNSwE
         e0FVdhmdkNlualm2+4+4BG971RS4GcLc76ilX7jfIILDVLdy+2wkCNcFcqNNErxbM4kk
         /3uviLFLEjxILWrTJC7Wt3/gSb0Es2inoqCi0r5TAOayuLTqno1WBf5uitO7HzubhWeH
         0bLg==
X-Forwarded-Encrypted: i=1; AL+hErGUUxlFzyV9urpqV/HJ5NifngzImTjsaHl4DcBBVvpAhMQL6rpxpJC1+Gx2IeFrcR1y6rs1CbhsiA8iBIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B7QnztxTYCtXuJBCWVFO+aqdHcpJJlxpQ9Wi7V0cKJ+h+jjeR
	pokrHspBCxuVivuIp+ZToPNIdzpqHwlUwAL5y9ZCk0iC3+JPqZP8ZzLH
X-Gm-Gg: AYBFou0ubZJBEJiliJtVLyK27V7QISdnpLio20pkaW/+gkdC3pgVxdsp5RauPDo+Vkj
	bA/rpi6oOf9YL3tjoKWC71dOB+AxGAHXwvZ/5GUW7YAAcvwm/VSiCT6IBUxq7PGPv5MPcZILYmq
	cvxy1T+Rx/nyJ40jDnHb9hpaJP+BZvw8T7Z8Lzi5oP3d9iP9qhRsPOHoONFbAa1emfV/kTGNjEV
	AzooyfzkIrbXfIxopU3OdF009kyqInH9ijr2f4GX7z8HgFMzoVDBC9IE1tor8J1e+Ec5V87Gxtq
	jvj+1rCy3EqekMPJwETyiUv+pJ8XATdt6N53ccN0WO1e0dL1KrlGlKSlZh3uzNQA6gsAYIq4PNv
	H02eEpAZ3bxCL7G+ErauwkVnLvOgsKtnL2ZlxdJvLb5IAy6RwsjewNSRkVvNDdThrUnlkQ2ZMcB
	WgRUNxlXcWKbwoF7EVI8KdpYm9y1MUqgo4BFbKBzTM3ShzRPTbDyyEmeCmIHWaKthElpa2ef5eT
	x9yU9OJISYuQN7LcgghAHWH8ZVofe5IaW5FTwEVUhxXkHy4MziYQPtbFK1x2dDH7pXGhoyIGo52
	hkgsSKZfhmXAit9q1RvCAqeaxrcNUEUwIPCkyMliGge+1Aah9xXA4/8zhRSLJauErXIs/YQHbbD
	NWZhxmRT7mYdP1Q==
X-Received: by 2002:a05:600c:1396:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4bb7da21b76mr103724785e9.24.1795075301248;
        Thu, 19 Nov 2026 00:01:41 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm11628805e9.3.2026.11.19.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:01:40 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Daniel Wade <danjwade95@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] tracing: Ignore .function on the function trace event
Date: Thu, 19 Nov 2026 08:01:39 +0000
Message-ID: <20261119080139.131834-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

For the function event, parse_pred() handles the .function suffix
before the ftrace_event_is_function() case, so "ip.function == schedule"
builds a predicate with no regex. Setting it through perf then
dereferences the NULL pred->regex in ftrace_function_set_filter_pred().

The "ip" field of that event already takes a function name, so ignore
the suffix there and let the function event case handle it.

Fixes: cfb58e278c6a ("tracing/filters: Dynamically allocate filter_pred.regex")
Cc: stable@vger.kernel.org
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: David Carlier <devnexen@gmail.com>
---
Changes in v2:
- Ignore the suffix instead of rejecting it (Steven)
- Fixes: points at the commit that made regex a pointer (Daniel Wade)
- v1: https://lore.kernel.org/linux-trace-kernel/20261114195914.2678414-1-devnexen@gmail.com/

 kernel/trace/trace_events_filter.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index c10951bcfc5f..2bbcc2abe794 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -1708,7 +1708,9 @@ static int parse_pred(const char *str, void *data,
 
 	/* See if the field is a kernel function name */
 	if ((len = str_has_prefix(str + i, ".function"))) {
-		function = true;
+		/* Ignore if event is already a function */
+		if (!ftrace_event_is_function(call))
+			function = true;
 		i += len;
 	}
 
-- 
2.55.0

