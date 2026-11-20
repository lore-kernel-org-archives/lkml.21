Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177736;
	b=0g8PoaqsIVKJ9gW6kDvviA0bs0ipPcshnPQFAST7tieR4Y9sOyL9siNhjjpWhfdfhZYg
	 pnnC/SCh9/d4SnqBErQthZYqo7o3p92Iq55BczjidJWOiAsPRwelPKhIFZ/Bzoilkj2hI
	 Ciqugyp+XYw7GleQbsCYwnDPzdLkinOPkcitQ1GhRIvbNI0sRsGDD6iZqQ0wf4v6Qit2+
	 pRGAv7zf4GAXzWnJ20IYynrjz7Dg+AcGQdbwC8wbIeQtq58dfQSZflYQVe9mc9x8yK3TH
	 a0MsAOiKnkCuuodwJSjOER9S4cS7qEpvvDAEq4lvlgwRUBU3w142EzUkG3rAAqfxHKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+KA+YLla3am2sIk9vQD6p3FihKCddHdYMt501msSpC8=;
	b=vHLJx0YE5m+yiwzbKZ1uW9MXihP/3rEhfRda1+0N+59xZQtmhAYLuL+poViWg5hKuY+Z
	 2LFbxU0lYYg62JF4Wc42PigP/22N1tjMw/p7qsBABgFeHWDimT2OjJWqsAVK1KRU2/Mnv
	 qXRGt/wS/yW6JKVPmiz8dfJOgB75AQKGpJTYdbn57K3XYsJbN5zzPVos6IEF6nD5NlvJf
	 52lKAMblzUhzQlIUNqIkcqmGGfWeH1m/ZzsiFZrZvbkW1bN1g0MXS8x2FqYlzaKYyxcIx
	 qy8QbhHgkWD3UzTsazSYV86fWHJJDTQZUYX+3wTwQlcQY+owaXS6BI2S1HBDEshJUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weOiSFkP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5D1606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5D1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=weOiSFkP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so441113f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795177734; x=1795782534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+KA+YLla3am2sIk9vQD6p3FihKCddHdYMt501msSpC8=;
        b=weOiSFkP5LHC25zLAuM95X9lbET+Pa1kwiWB7K2SAM1CrOOM3ye5/GwKqW8kQojbc7
         EbyaH1FLJB1xBSAetDIOwvcutl9a7QdA8pdLftMPnRJAkvjTQstW5afqsH3pLKQfU0RB
         8tZrJq1oUDUFJ38j3SR48oVlzkc1RVh16w0Osssxi55mDPFT9fFTv3nppfLM+znpkKFF
         eVwbJ5YhAA6BMRcNSUBcpW7Jy0T8GNcSNF+IYohDMK6YuWSZT4t8LTcwDE6ERMGMnFcP
         z1OS8xWrDALZSVj4NC59nxGdf4Dafcem/5QW7wCjMBrC0lRqEsk2cKHcu7z5e+uaVLSw
         mnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795177734; x=1795782534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+KA+YLla3am2sIk9vQD6p3FihKCddHdYMt501msSpC8=;
        b=QYjknWJuW1bgHm4rPjGvkYv8HETvd73KhCKL9qsnvFlKfbX5k+v7Rwx5t1V36kqikp
         Jq8w6b9kDSbZez2nOoO45VM3i2JWUlGI21r3dyWvb3jaWoTRE/4InD+F7aLlYo5dLX5O
         sI2ah8TfnZGpQSk6O31YT08rCq1SHSQJorfBgtStgGcjfPaIJ2VKCTR7ecKETbTBy0H0
         ZYV6IQN7Ig2MK8EMC1ivsHagw5NbPF4UPc1oa5mWE45xQEJlGTGcO/NQiz6ZDwa7T96p
         9M+X/iXNi4V48MBN+ZmkVUgCJv99/YdSvV08srveacURl+xJU3Nq0YFoogxiyqUd4XRZ
         wz9A==
X-Forwarded-Encrypted: i=1; AL+hErGRlDFf7XybgBKXJq+V0/w8878FcLjPFInazt9FeKjiyJVSXh+d1bjoUMwGMqW9DZ0RErQm2WjS6BzFiEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zdCm7rKqmMPSA6oJe5Si/KbENqLi/gJWlZMF95lF9afo5KIL/
	tvDc85o4M9skEoxTnROkiy2haOg4VeySvFNiwbm88jX+FJMgmjZM1EC4
X-Gm-Gg: AZFdTZcAFrXGozFwsqM1fSol28yxbbQGei7qf7sIvUq1bUu+LjFfB3vDJsI0Z3eqlis
	XU5YTU02Za8tGUeImIC1IwMw7hbuN4UlsmLgfTSUGaGEBbw44UpuxMxLV5bwvB6Mjo9YyddJrCN
	xZRbgqzO766T/d9M0Roxj7MsKFS+vzCNgFQ9/OrohzOBtjVs+krTohc1m98ESTbGJH3oB0sEHk1
	hW6JiaapNIS7bPuvHaL1LK5/ZhlcIMwWcxUGYcltzE+HG8cim/Gz/enH4ZI/g/oN5mlWJ6wC4T3
	mFge64XErUDT8hz7VMxmoiB8B9UXfBv0QaY6r5gTSQY2U3ohrqZEn3ChDYluWOkp6uav3r7Z84Y
	z7+4VYUnJPuRGk/6g+Qa2R0zTcJZorZroc0YupTZIukRW49QmsN/E7gYNovs88IlRUl4NbyHOYz
	uKakoloL9Gy5owTGLKEV3JPvMAzoD4JjbEMsFtcsyA6IsxsPpjG2HEXLSNlUpjG/G0PxPLj7T8W
	CIjbZnsyysIjbDvQYyerpGPfpbuRWrN0RTdtfIzVqTjXg/IvNtL7+lwp9q9L3AIW+0CWndPWsuI
	c4koBDuwtM+Yia22XwJEOjBuA5bCdgITvA==
X-Received: by 2002:a05:6000:258a:b0:4a6:4f35:1bdb with SMTP id ffacd0b85a97d-4abb44d3448mr6020046f8f.39.1795177733737;
        Fri, 20 Nov 2026 04:28:53 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:477f:ff00:c12b:38c5:81:f768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm5312438f8f.28.2026.11.20.04.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:28:53 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] tracing: Restore custom event creation selector
Date: Fri, 20 Nov 2026 14:28:38 +0200
Message-ID: <20261120122837.1597798-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The custom event generator undefines CREATE_CUSTOM_TRACE_EVENTS to avoid
recursion, but restores a different macro - CREATE_CUSTOM_TRACE_POINTS
when processing is complete. A second custom event header included under
the same selector is then skipped, leaving its generated update helper
undefined.

Likely a simple copy-paste error.

Restore CREATE_CUSTOM_TRACE_EVENTS after processing so subsequent custom
event headers can generate their definitions.

Fixes: 3a73333fb370f ("tracing: Add TRACE_CUSTOM_EVENT() macro")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 include/trace/define_custom_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/trace/define_custom_trace.h b/include/trace/define_custom_trace.h
index 5827a4c92c744..177c628f2d567 100644
--- a/include/trace/define_custom_trace.h
+++ b/include/trace/define_custom_trace.h
@@ -72,6 +72,6 @@
 #endif
 
 /* We may be processing more files */
-#define CREATE_CUSTOM_TRACE_POINTS
+#define CREATE_CUSTOM_TRACE_EVENTS
 
-#endif /* CREATE_CUSTOM_TRACE_POINTS */
+#endif /* CREATE_CUSTOM_TRACE_EVENTS */

base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854
-- 
2.43.0

