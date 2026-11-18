Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019396;
	b=AlKf77sde9R3zNs9D+8D16RcFoJUb6K5eHwjAXdNo4AF2ym5b1PodnTTWsTZq/KMS45V
	 LaQQQYgD0Br6KgZKGMAo5ZUnYHIBkMOfpskdTASPAvGx89hCQXMxyxaHX0qcSggOiVYqH
	 R0n7qCydu1zjf7nNN7pNT0r4z268isjq/RDS6uqdabSOTSU0ifc0E37T1fYvMsVf1o6En
	 w+vy73d08+qHbIfe6Nb2KKe0jofFNXsqgN5cvku7f9yOkGkmwayLrPc3kPuK8oqREgK1n
	 1U3b49ILK2mC0nUwuUCF/ajc8wq8GOl2Ny+5GPMcTDstceCL/YLuSz19REdrYqK0DBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=;
	b=gkxyN1W9NnAZqNxUG8tPO3KzRzMTDXREuhm5Rg/XzIkVM6CG0WWJbmiyv8XbPvcQOgOb
	 DCcI3MwA1tIImFZNIDHn/lf7HzS2qca/E34+BEr71w2WhlY2O0I7l70XyZm42I7gp3uRi
	 P6hRJS601w5HebNEiIXkB9pgnqqhiT1t3T6tlgVNyDeH5uuIellkgpih4DwUICvX3fJ0I
	 Qc2YDbuKlUrNnjTnCtIbfoL/W6HJUeewd7htVEFRRbioSJklwyl67mmfrBgZ66ok0AYZf
	 mKQN9KTilCz3CbO7g7A2ucyuCgUr0RdXqu2CPFrWUdqXgq01Mh+/WxweWmgiXFf9Ozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0ydXO7k;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9194606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9194606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W0ydXO7k
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12968375e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019393; x=1795624193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=;
        b=W0ydXO7kl3a5UIBTyabgYyvxKc8+c0rSj+af04j/VnnXmfDb8OLFPeQagC0aJsTyfk
         L7tlPeHdV84Sh0ApfLJaHj0WiR4aaqshwAtTXMHrxn67VyaSWGrfUCwkwXMzU47/qsDn
         ABJzlVho+7E6inEHIWDXr9LImysuYqh/tfiGuvwqoZOTP4KZin65HCSWM+58Y4JshxFQ
         BoB5AytN+2p5z6QGPRPbUqa9jvrxDHgO7owNGuKLBp52e3wbVVGQUH3z26g7Sv5U8WYC
         PJ3uBPRnZmLXpt9srBeA3QieiTM3SQ4WkSZ0Bi4ewjeHgJKKgEi2e4UlxYFS9u+REUWv
         QY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019393; x=1795624193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRHWKRUMRo3z2ZrNBL7a1kOoOgKp/NNfuj874KBAObM=;
        b=XWktmJgh4pq3lCoqePuhupvEhCdTZhLMQdv9UathTOqHEgAtWT+4JG3bFhefDYhTGO
         Ot5KolWP6zquiCVlhSmW+8SOUP2GbRyAt0YRx4HRWVexbrLDyyPwINSho4ZO57774O+i
         tdmdy2VvFWajTE8j/CIEi1aAhdPE4hC/ExWGA1xnqmg685W5wiNrDs5nv3aaxlxoDhwl
         Ktq/e9Jou+msf5XucLk9c7U/A4kDExNrB7X7UxMRuGazZDKcX28uVXXEzSJqqqhqSHxM
         hENCz1hWHQgekgxzKXs0/KS3UdAQpviI8R+TOfvVNOs/LpZd3IPbiOxdFi+Augn6C52Z
         fgiw==
X-Forwarded-Encrypted: i=1; AL+hErHGPYCTo9ye52Hcjjogw8xfyP4aEFH8EHVkcIGZ7njgq8bmyUL4oxOCOrbtbfw+HNi9QUF51OfxqUsoOhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dJ26HXsQyvtdia9XWb/L6ldGDE3rGHiVcH5jeGpE0WXJDx6Qi
	uRhFDe25oawEkgUDUmeXY8Iw1gNvyEFmxufJlwE92A4IHaWSbzhxGpZrKMrXbVWLKgE=
X-Gm-Gg: AYBFou2tc529chusDcPQeSlWP/t8G6HyyEySN2p60os9WN90/gPIjz9boEo0F9Sg/H6
	pjeYUufrtGmyMq/0qSnjwrVr2fvRpJPbu3bIL/N44ZVq+AFQ6okeHMgdRsLcylWZzExS4UvlXE2
	qiv8iQ4wfK8gGxwVd7TZAS0wMcjW3QWVZ3TZWdDHt+U/JQT7Y7XV5QHrvU+WG5QQq6YAj36vZvO
	9gDzmU++W5L66BSSBhws4S6KsVxKPUm/beRLoyE8QqPc6CGMuKCMbAtTMcr6j3yVR59dkTsIu09
	fqH0CSUVDE2FzEv9dbEEs1kxUzIqp4n849KE4zlTayGohOwYojdu8zFGcC2RPRtRoWTHIwGG8xV
	hp7J4mTrCX+AlCMvFRfUpp84+cK7jJg9eT7dxG3DYKPNt1ptfQZ+oIrPChX8YKz/MyqPwp9jHrE
	+cWESLevUaYmqDsrofKR2IyW86WSRT0lNGuEB5PDAedVkaZE0yKy6RzyVf58ZwCTdZb+Tem2BFW
	4ZYC4kSYlEuohxaRNOrFtDt1/uHsrSQ1kNqFqXY0AbQ+slpxBIC9WC9DqonfUwiHkIb0B2RahMJ
	pRy4Ylt4/HXzpiiK0hxYUYSLj3j0uF4rvpf/YBpNkDGQLvQlqUyuWQ==
X-Received: by 2002:a05:600c:1d0f:b0:4bb:56bb:1196 with SMTP id 5b1f17b1804b1-4bb7da349e2mr62508195e9.23.1795019393189;
        Wed, 18 Nov 2026 08:29:53 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:27 +0000
Subject: [PATCH 05/34] perf cs-etm: Use the exception level to tell kernel
 from user
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-james-coresight-jit-v1-5-dad4d90747f6@linaro.org>
References: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
In-Reply-To: <20261118-james-coresight-jit-v1-0-dad4d90747f6@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

cs_etm__cpu_mode() decides whether an address is in the kernel by
comparing it with the kernel start address. On arm64, modules are loaded
below that, so module code is looked up in the thread's user maps which
results in a decode failure.

The exception level of the trace is known for ETMv4 and ETE, so use that
instead and only fall back to the address when it's unknown. This
enables the ability to decode trace from kernel modules.

Fixes: c9a01a11dfe6 ("perf tools: Add support for decoding CoreSight trace data")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  6 ++++--
 tools/perf/util/cs-etm.c                        | 12 +++++++++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
index b9397151748b..f133e11ccc7b 100644
--- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
+++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
@@ -462,7 +462,8 @@ cs_etm_decoder__buffer_range(struct cs_etm_queue *etmq,
 	packet->last_instr_type = elem->last_i_type;
 	packet->last_instr_subtype = elem->last_i_subtype;
 	packet->last_instr_cond = elem->last_instr_cond;
-	packet->el = elem->context.exception_level;
+	if (elem->context.el_valid)
+		packet->el = elem->context.exception_level;
 
 	if (elem->last_i_type == OCSD_INSTR_BR || elem->last_i_type == OCSD_INSTR_BR_INDIRECT)
 		packet->last_instr_taken_branch = elem->last_instr_exec;
@@ -607,7 +608,8 @@ cs_etm_decoder__set_tid(struct cs_etm_queue *etmq,
 
 	packet = &packet_queue->packet_buffer[packet_queue->tail];
 	packet->tid = tid;
-	packet->el = elem->context.exception_level;
+	if (elem->context.el_valid)
+		packet->el = elem->context.exception_level;
 
 	/*
 	 * A timestamp is generated after a PE_CONTEXT element so make sure
diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 51431a4d5db7..3fce3c357943 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1134,8 +1134,18 @@ static u8 cs_etm__cpu_mode(struct cs_etm_queue *etmq, u64 address,
 			   ocsd_ex_level el)
 {
 	struct machine *machine = cs_etm__get_machine(etmq, el);
+	bool kernel;
 
-	if (address >= machine__kernel_start(machine)) {
+	/*
+	 * Prefer the exception level when it's known, because arm64 modules are
+	 * below the kernel start address.
+	 */
+	if (el == ocsd_EL_unknown)
+		kernel = address >= machine__kernel_start(machine);
+	else
+		kernel = el != ocsd_EL0;
+
+	if (kernel) {
 		if (machine__is_host(machine))
 			return PERF_RECORD_MISC_KERNEL;
 		else

-- 
2.43.0

