Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729954;
	b=EX8TXfnHHzMEXM/K5fGUkBybU9K5ikpL9rP/19ErAwZHiJCEEcPBb8nHwhbzv7NaEKUe
	 cL7gtOLApYAr/SPSnS/4/bwqRLPzEJN5qD9hjxssa1kWMRmL7oqkC/K45ryAtyNwb1s/K
	 FZ99pAzzGB/IY6CbDahH1ndEJFBQdKXEd3BWST/Cv6YLk7l+JggRJGkxEbjJu+ouVrkbM
	 lncaVwZM5f8JkQvjwfql8a6TC1a9BxEO+35UJvF+eh2lEhlQU9YOlYGspegUVE5Whd4Ry
	 dgoBBYVl2BAoMuq2xircnpQ4K19XwQwmQ6GznV40lviAjqhsZC7tXQXjG9Zh4BI1U1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RPVjfXymlZhaC+9syUEih0oV6JaxiWkxxyBiag+otps=;
	b=UhgIq9eswCqNsmRYH7+snjO1nNM3UGIP3LTP4QICpT53N01c9dVsxy8kpzSsHMJCiRCD
	 /UOTzNxuJyrR8JnXk05HlrF7QU8qKCwvfiPcOn+RZwcPxitokcvreKcJsSVbIts7OrZEf
	 +EMqBs9Hzz++HIVjU9pNAM8wdOkfTkcya3fuQEtIhGKBL+jaefxxDUxYFkLYCi6xpGeNB
	 wdS7oKSu5qvirYCuPq4klrSaB1E02Dx2II/0S76mSdiDxRREw2LU34zT0vkCSZuZPNuWL
	 MQaG9pRe1MHGSeuKg4ipkbNmgtjGS9D1H/RTBiSRJ0g+7tNZSGkVTSSODFvl46aeLZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0D+bXLH;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E966A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A0D+bXLH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so60699685e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729952; x=1796334752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPVjfXymlZhaC+9syUEih0oV6JaxiWkxxyBiag+otps=;
        b=A0D+bXLHuzEywM/7y6O+KwNpE0sbzFoh/i8DwYTAiBHOitSTz+u0x7DkMicruESpSW
         3u1dSjDMiGxqisIfAMzZqj+V8EmPKJ6Njh4PHdEedQ5lq2M5HCB+lEqqrGPF5ASo4kY3
         zRa3a4kBSGRqvaw+50mtcF58XY+DOfDa5InYvhr5aJcRSV7AIEH3TFL3p+VBMXB25qHL
         R3/HK3P+I200tAE1lXlRc6Agpu70rTL8+Ls28oj/JFTVfqFUDDGV0GtqPQUJYyw3C9Kh
         R0hyKKHQeZaRFeSNhw3G3pl3JC7yU1+0MHW0+8km1Dnt0qVTg2Q0DyNrvofGV0TMgxIq
         DEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729952; x=1796334752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPVjfXymlZhaC+9syUEih0oV6JaxiWkxxyBiag+otps=;
        b=2cxksESTPg/11+O4ZBy28uojGZTpt+Bge/+NdCaOKgcLthUeqgAFzv99kqYHT8yHyQ
         8cLRmOGcBUc74HmTDMHbLGcuF/sxWA+BhuHkTYyLV5Sq9eYbTd8B0f3V5nW8ez9SemkK
         W1L/FulXI4SdV/kZQvn53POiVdTcNZTggK01ySVrbeMg+9LNmmQUbaofSgPhAfx2nZ7h
         Duko06jLVzoyJr9xpuPt6KPHHRCeq/jowYuq6t7KUYagrVJshk8elEPEyoE/Mcres4h2
         6d4+GqgXFwwLbpLzP1WcKyfslzmKuyCKAwWWEmoo4YPCY7gf/HlvK/FwEw/clxLimVU8
         xoKg==
X-Forwarded-Encrypted: i=1; AL+hErF0K69Vzhn2Xz2YklYzzQ+v/Pev1zRuKLA0SuASO+Ox5KQNIxbJA65ldGTvyZWoxDLjS6g4kc0DlNlFCvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88uy/ewMWUgSQBS/Z1G1LlG2uBw1T050uL4lAarsfZiLQ6wSVM
	rzH/cEhKu7huC5gsFuMQIZDkUNkQmqcAJmOUEm3qKtvEbexUUUQZqfzB
X-Gm-Gg: AZFdTZd4licUZ71ufHV6asg8WkWsmQcTdav1uGy7DqTfg/FdDRne4iNxcE+Cyi18UM9
	8gxOJnbjW51jkiMkAwjLhklxlMrr6dEpJNsqWpQUA2ee/LiwlM7CdNwsEVAwkfRUIa+dROgivQ9
	PpD+bOnxTUHKMs+afvqsOeqSzZ9HaTc4TO0rQRxUwMuZvTC7xoOWDV6Bj9m90AcSts5Wc5N+5tC
	v4a0ghJFpmKGFlUUZHeEV/iT6ov8rb8EefSm/mUslNDaIxjlb4ERpmNCxephSvtECitaJE4yset
	MkD8njG3bE1qgBirOIdhtAOIMoqooq1LsaUkwnhMICC/iAMHBmGKnhRaKd3+HATA11K3i2YVqcj
	F5A75T0c8/Wv7VUSuCEO0kzXr0Fqx1RjsNxawRAvcY5rYpuFDR9PyVWes3qFhOj6iNICyd/MUyy
	kn8S3CG030BOf2vyP/lsUAK7j9C8V28/x6loTXEZuNwLdn36LGLIcwxydz0AD2CRFXnSgIEATHW
	ZYXylv/cn1Cw7G6DWaupt1mAHe91ajMPwu7dgzeRNGRVFM0abIgjfgc1uDE+8IoOZ1QC3KFxWZb
	Oi4NIVyScdsRY/XoYUWwsYyTRPibJl36HPxsYfkdxMGU1oX+2oEY5VGJEeqJ/vfLUesCdjQzMsy
	/QRyI69qY5KMSgA==
X-Received: by 2002:a05:600c:828e:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb88785a99mr427460815e9.0.1795729952237;
        Thu, 26 Nov 2026 13:52:32 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm889543065e9.11.2026.11.26.13.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:52:30 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] tracing/filters: Fix MATCH_END_ONLY on dynamic char arrays
Date: Thu, 26 Nov 2026 21:52:28 +0000
Message-ID: <20261126215228.1205862-1-devnexen@gmail.com>
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

regex_match_end() takes the string length as "len - 1", which holds
for __string() fields where the length counts the trailing NUL. A
__dynamic_array() of char does not have to be NUL-terminated or
filled to its length. The xfs namespace events copy name->len bytes
with no NUL, so the compare is off by one:

  # echo 'name ~ "*.txt"' > events/xfs/xfs_lookup/filter

misses "foo.txt" and matches "a.txtz".

Use regex_match_end_str() for dynamic strings as well, which finds
the end with strnlen().

Fixes: a3291c14ecf0 ("tracing/filters: Fix MATCH_END_ONLY filter matching")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace_events_filter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 42a57cb57ff9..68a20f5d68fa 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -2076,8 +2076,12 @@ static int parse_pred(const char *str, void *data,
 
 		} else if (field->filter_type == FILTER_DYN_STRING) {
 			pred->fn_num = FILTER_PRED_FN_STRLOC;
+			if (pred->regex->match == regex_match_end)
+				pred->regex->match = regex_match_end_str;
 		} else if (field->filter_type == FILTER_RDYN_STRING) {
 			pred->fn_num = FILTER_PRED_FN_STRRELLOC;
+			if (pred->regex->match == regex_match_end)
+				pred->regex->match = regex_match_end_str;
 		} else if (field->filter_type == FILTER_WITHIN) {
 			unsigned long func;
 
-- 
2.55.0

