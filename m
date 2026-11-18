Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019400;
	b=P1ju4lgNcpOMvd6WyoVJ9ClKsuVouhMsgTJ4QzxM+ZVxqHIZGTt/oUF6naZNH45IUFi4
	 ky4yTy/U/X51b+CVe/KBOd/3PyN0hw9bsxUlcL8Fms63w9Tfpok6WYrwrtF7iHtwa1I7f
	 6VnFrVLd4whYZcWwCPa1k4HzxH3AUM35JuBFpzZGYJeTcFM9CH1gNgyTHyYG2v0KdA5I+
	 VcxVgyP/htqeBUFsDq0wCCS0wTiYGinI6DTUJpFx369+Y4+pUW2sXYdemi40l/jLpehQO
	 /9yZ56/lz+qutosunwGW0Xa2k57nF72Are22U9biNBTWWjgWo/oiHOjBaMk/PY4Rs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=;
	b=Ey3Ye9QC5Cl+iz3q8LBIqGlrI2zJzaLB//xyqPYmd0WkfGefvA2LsCRB4jJqTAJqC7+H
	 HN7bCG5aCRNp5cPOka4CS2Qp7mtQLROl06WrPjzxBMqDuqAy6Va2y5W82+gW/6aafmMnX
	 1gR8QMtvEhjM6ez4b/hxn/2uCwX34nP87xWxnQyMo2DShY8neThMQBo3cUQMikPVDu1Ws
	 mYY7RWUoOtTP+bbmFHXvru0CKNV/7iWQS5dwXiNa1gQMZW3e5MKm45HUE2x7obIutv/Z/
	 wqrKz5KPmqJ+2RKuiCKk5RtedN/TAcyBSgAPcb3pmmGIfeLjOr9i7PlIeR7JoKkOvqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NDJbtURZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56A1606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B56A1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NDJbtURZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14607985e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795019394; x=1795624194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=;
        b=NDJbtURZxxEfV5/3jhv2dVf9EbZiK6GuGOj1BjjjFpdaGiEKercbd8FTs6zje1nYSt
         IDRuk/9b+DuxuGCF4aKz2AKifJXTp8rtWppKhkXppGMPC12V/Ef13rjBGpurKEg3tg8V
         oc9tU8kNoqMpN76xVFpt5ZFYglRvSD/P3VjpovsQZPkKYp1yFejUWl1kjhFeI5ZYM/og
         VGt+WWoQuJnjgshJMBHAx7BourT3+Bdj0ILJz3KgbIjBiaCGisSXMCE2dO3wpNuIw1z6
         TZPkt8pTVF0FLnS6uZVHKUar0DKoMTHdYkfhlT34f5/L0QNBqG6wZiqZLAtZ3ORO10ss
         gc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019394; x=1795624194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Babeb2HFdoGfJcLZPBXE1y9vKgkFHl2HkzCwc6W1yGQ=;
        b=y61v+CtMhnV2hY8N/QyF+iC+ODrPO+OJVjZP/W56XnNyxpZtzhFErpKqTpgeCBEujk
         eeOQ8WA9ZL9tK4Xa5MoAKpeF/h3H/qy38Kt86NtLE8UT1Jt2WHocq6rdc6lFGTk3pOK1
         j1o96Eb0eHF8ndQQOfWaMnVa/pBjvB/AlGtBjFYi3mCPNGWPzKkkzbpVpQq0QqT1mHCY
         GgFQByXhnPh/+LVdlzuknEpfRt5uG6KqKqozYByLUwUCtOZtIWmIsLsL+tkDRDjJ80sT
         gMlqrCjGXX5z/wf/TDvSyRAD53ajZWV84P3KfJu26RC/+GVDnzsCXcnotVBfqMoZbFYW
         1OjQ==
X-Forwarded-Encrypted: i=1; AL+hErH/Cfq0rTpykWKZnZ9mCsbJA9QYhGhEd6pgLuz8HVFMwLR7D52m8vUjzdemhDuGybeOPh7ahQtPftq9B9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5OGCwGdfvhqg0PE9erntAxKyUkcbUfmnhhKYe6X2/OX1tqhHw
	/gnKeEWSGKpWUAUbdrkhOUpusSNbHTuaJglqrNftJogGs4YSSCC6iCPdR0pcy3UnYDA=
X-Gm-Gg: AYBFou28kYeAH8WhbSzhrVH2Lx4iSFfy16DOogSsmf6W5mZpsoETCi+sBYeaQ8q5Xtp
	Ac6YQnWwVaaGWm9kyJjrXHWfkNB3I/FmbZP71EZxxzt0t7aBXusoh6bB9Oj5crq+knoUAjOTz8+
	P1Hbh3vTq4OFfzNc/0E7S4uFqDbf/VlhLK7XerCGGl0YfHcUkQWqD2YPGnXFXqUlm5MdG27bK3P
	l9/d8+JcscktLAK/E7ORiimJN+QYtwlzhQm4pTsKWdviw/OpAPzwMMefRm/8H+LAQSuvMJLYeVt
	/mYQQSEWV+vgVBjEJORxxdqTyL/Yk30pbdZQe1sTAdMYFKWrgkXs21JkewKzwnEpViT1xJj98Cy
	/UdjD6BIbqhGComtsXHh8Uxtx3/t0SmMvPZliwWgZCiW1c72G6LADrmJyinRQZv96tcEbEtHoOY
	3XZ/8r7U7B5qgWJeoZKG2VNbOB+DQbB/Qpsh+xOSseXUScx7fZXwIpvMZRsKSifg4ChZNRF5QeL
	yk20cB+5dWJlkHC4NPVL+bk07fIiwYlf1ADE2WHHBsK406Ey66fUR1D3u4WNMIEG3Fdt6VIv7Kn
	VcMd3bUKXBFXBEHWR5nLykC+eULVqb4b
X-Received: by 2002:a05:600c:8b34:b0:4bb:781f:6067 with SMTP id 5b1f17b1804b1-4bb7d6cd404mr58751415e9.1.1795019394229;
        Wed, 18 Nov 2026 08:29:54 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4980927f8f.12.2026.11.18.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:29:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 18 Nov 2026 16:29:28 +0000
Subject: [PATCH 06/34] perf cs-etm: Don't read past the end of the map
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
Message-Id: <20261118-james-coresight-jit-v1-6-dad4d90747f6@linaro.org>
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

OpenCSD caches instruction memory one page size at a time. Perf reads
this requested size from the file on disk without limiting it to the end
of the map, so the page can contain ELF metadata from the file that
wasn't mapped. If a subsequent read for a different .so file falls into
this range, then it won't be decoded properly.

Fix it by clamping the read size to the end of the map. Now when OpenCSD
requests an address outside of that range, Perf will load the next .so
file rather than OpenCSD using the mis-cached data.

Fixes: c9a01a11dfe6 ("perf tools: Add support for decoding CoreSight trace data")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 3fce3c357943..fb4582dc378e 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -1213,6 +1213,12 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
 
 	offset = map__map_ip(al.map, address);
 
+	/*
+	 * Clamp to the map size to avoid putting unmapped ELF file data from
+	 * the .so into OpenCSD's cache as map data.
+	 */
+	size = min_t(u64, size, map__end(al.map) - address);
+
 	map__load(al.map);
 
 	len = dso__data_read_offset(dso, maps__machine(thread__maps(thread)),

-- 
2.43.0

