Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687067;
	b=csQQ+0fol188q1GRBPxhG24ZKuL+RZ7gSoa2eCN0QnoYB+ZRgt2G0Bc/vi6OmXAS9MJM
	 eg5ya8T8CmAFA/hZRm76NuyRgwvW0NLbK+2KKxBE3uuwT1vzUIJowfMi270mszSmMT0WP
	 AI/uRidMIHKjYmesx/LJzVlRr3ODx14SXzvCXiSIsh6Rlp9m7zc2ZPLyHxoCAOBkOEmAq
	 huJAbCpidHCQBECgSU2Vjo8yfjtS0SZjDmA23gsaV2v7SGtHfGB7yRWKAUkxLKs0YXZ03
	 DPLsxnVn3l8WnoKzWbjH7RqdcIfXMKQp4LiSqb1pObBu0ASzlSEu9RLBAtLe2E+IZng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=agTbkmcEs6TrqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=;
	b=duBf2TtSqsf8sEzVKE6+IyxKBKZzgyAykaEMZmOPKEvo0Y/PW/OY7vkQmJmGoXuXuSha
	 HJ6XLu3byaWqRo2Z7qOfG9xY20o0uRIE/17G/KeAO6EjIIDiQTi74SbMTD7OVj/3CZpdg
	 vj4NL8dtdj8jdiAnw83QN9I5PJgdl6ZFQJ+3xlcPpl1/2u4DR8R7XAYkNgs2eeDCHQ3Lp
	 bevn3zNvdnPtXixW7sOmC9N7sCphJMhzoZuZ8gzPYLkDwNr5193BYE3e2PImgfw5h4ItF
	 Qf2QQUnLMz7WRGMvIZ0Ii9qp0tMIA4B28+1sGpFFCDYYlcqeazjZl1Nck+4GwQTW4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jN9WcARj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXUQ0FjE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7349606A681
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7349606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jN9WcARj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VXUQ0FjE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvcF2594845
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=agTbkmcEs6T
	rqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=; b=jN9WcARjBcn1WcAkR79jKyT1xuQ
	/YNmSDJ+uNLNDCX2IYxOmjLxvlOmOx23WpaBrhEK5g0yTIefcsg54laM251CU+UI
	V2ua2Y4bGJN9FFXIe8cnTEZSXqahqr+FU+N4ynttO/WsfbFpRHo959dgao+2puCh
	Ju++asjdC+5GJDeXTh7xbmC5IU0zChRNrmDr12WbgqMXDEmu+Iq0N6EPe9AMUl9c
	vzJZMdhzncRCBdM54uqsC03fVD1dedFtR4EvWR0lsX/HVE0NFsfp3/tHHJA+8A8z
	kWk0LIhQh8573ckIQhHd2WhYMcY0izYm/dHaMSfejt0h8wkeoy3MxSmbCyQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sak9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so8938780a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687065; x=1796291865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agTbkmcEs6TrqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=;
        b=VXUQ0FjES9Vx/pHSOwQnITjzlJ+pQZg0S1FiG7i+hLP7CAxKv/bGkYA6rEpUnsytdX
         luzkoeDY0MjXgF9AdGzKRwqnH0xwFAFiJbJeDFMK3en+oyid730qEVfDxPwBAd0ozDbP
         SBfJlYYYa6Z2AxoBy3xilsf/LRaYdOMu8YcxdtRnT+jBD7b/ZHegIyZZTtd8vCeLui7Z
         n+Xaakjn3bvwUWsv6Mo60lJTq/MpIJ7ABH/76lqh3uRSasg9leN0BR3sdbXEOR7uyUwY
         hHpGqw69S0e39BN5O1MPFtapRFmTgCQ72kVo17LYxSIvX0xhA4d85BNvQRKumloy8hHV
         vnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687065; x=1796291865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agTbkmcEs6TrqXAuW+7FRD7KPDJYeBrOt4eTWPTpJa0=;
        b=HDI7cNjBHhsPH4yuub2SwLCtdM3KH+gBZxKBGpiej0fjWPeGPrBfgN4UfHUQC3eTwO
         bAqNhWftLiX/4AXd5nVjLnqchHwhNtmVvjdzDCllT+i56/kfimcLnCTgFj7DhLMr/SA4
         ZGPo1psY7pFMuZ4rGDS08Cp3ADSKmbgF7K7SxYuA3aBv3uYs7mRsygH1LsynBHKgU+Va
         sGLHZuzAZA2QF2Q8C1fyWxnAH8aqPxyf0R1m2SZP8Fxxim+AnBnRreNSzVRGwlHfcKby
         sRr6z082F+kFe4ylbQb7UeQdVvRUX18y3qjigdpn44E9YiJSz6Oeu/JFisgj6jxh2MCx
         AGbA==
X-Forwarded-Encrypted: i=1; AL+hErGTlfi+Yp66QSfXwOq5A3eT6vPH3CX3P1c8qUObbCGuyOta4Tq4kMcjHXgyPGVd2hXuA4faYjuNf3kdzTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iwVnIakHXLY4avW2qWjuQ68FANL7M62cZCwbnpqn8H/Nv1QJQ
	M7ZT+ToZBtIasJum7Z6nIHmbyZfiryfg+F55GR/H44mfOeCSn+kVaUMXckWx6tuBSFAM2n53MpZ
	lrHhTTKDdmnvzSTsdWVoxZauPJEor9KEQNiryoVweGgkcNVBlsSNFl05Bqkf3HbO0dlE=
X-Gm-Gg: AZFdTZcAsNCZIvp1fY676TW2KitZCtSAj/ygTeWX40bmktSK/FS1VkSuOUl1NMUJKAX
	C72IeMqCIj068loDXioiD7shLQPGSY49fQ/WEWDc2AT4Tn6/VB9jVq4qciBL5/XpQ6ScYw/DVOh
	s2PyTzds6R6VRNIRts6jcJq/s2gZH5zB4NEwsoN8JtRlzfgaPLgtQwYAyOsY3o09P+aLqKcQ3R1
	Tp72frGEZ+KLxk/LJKAD8XRBgh3EwE8jSC+g0/aYX8/zPF5LB0pglnZ1t7EZ+VYVXpCrz9n7hlA
	bAOkXCupjKHm+k6z8u90a3gDyYPnlNHGBDZiQqJBlzbZMXgXXR+qgdLFywlu6Zgrkk2VPJmOKYc
	wLgJQuBj0sfc/FT2Idn9pIy7qy4piToYY8S7BSuWTuYhJVaz5hNZHNzYSnyFEl/PmsV80OfqFFB
	/VS9sEuX4D9WTkMTOMNzcO1oI+1FQAgx6oIi++YPExq573Zf9XN35xzQVeEYUKzSs/ByhmAavyM
	g==
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr22029441a91.54.1795687065252;
        Thu, 26 Nov 2026 01:57:45 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr22029418a91.54.1795687064755;
        Thu, 26 Nov 2026 01:57:44 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:44 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 13/14] perf tools: Initial support for gtrace decoder
Date: Thu, 26 Nov 2026 15:25:34 +0530
Message-ID: <905e9e671d6b23bd33527c828c3dee212341e246.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080299 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=QMbGdu15EjEoZvaX42IA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: RG4k59_Y9q_zT-zIF6Rca3cCjhOTXqLD
X-Proofpoint-ORIG-GUID: RG4k59_Y9q_zT-zIF6Rca3cCjhOTXqLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX1ikoaQ9dAeIb
 YjZAHoxvlEokhYx1jFRBncEIpr1opTllyln+/uy0FZLF6WYpsTnR8GQuwcHLX+xaaqGUlzaqRGQ
 6gFvfcOUiF/aTgEWEGDzM0VwXuq4GX70zCrp0YAgHaK/jn0psVdsZ96dc1vFy9nofZCqKh/JzBW
 inVKWvudbIgcVI4z+do4hchOgLiuB+xkTvoDZ850gd6pEmweyPLgxR1vvvuwCUld1Z/ckWj2A2l
 twWCahSB3/kSM4KAKiql6xoHkZy77jjewOxsaU1zuA04O9Nogm0KGXR/XtPuh6mFXpnpwN2b/8Z
 IRoWMtGZ/s3te3t52TLZbrqWUMrPZu1jrDFUwCby94BP/9EzZHTrAPlcLER7jfBJa7PFesFFIp/
 +pStftAncb9uVqQqcMUvlSemfxDTR5s9vz+fZwc6pwTM4PNqTU2CBqP+32rTlmaQKLpEn2HgPtw
 3H9OxlL0xbGHwURGXCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6apnCyy7SwVo
 4GN/sMqhJ/2Et+UV3EdUNec3MX791dNCgqlEwNlAxiFYABG43UWglxfq49JnnpINcsEywGH7YrW
 wStmDqFrp73TqMrr4vDO5Zql8ZhL7to=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

Add bare bones support for gtrace decoder so that the data received
from the hardware by the gtrace perf driver can be written to the
perf record output file. Actual decoding of the trace payload is not yet
implemented.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/perf/util/Build            |  1 +
 tools/perf/util/auxtrace.c       |  3 +
 tools/perf/util/gtrace-decoder.c | 99 ++++++++++++++++++++++++++++++++
 tools/perf/util/gtrace.h         |  1 +
 4 files changed, 104 insertions(+)
 create mode 100644 tools/perf/util/gtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 2c1f880c4c47..ca22b84cb9b9 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -147,6 +147,7 @@ perf-util-y += cs-etm.o
 perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
+perf-util-y += gtrace-decoder.o
 
 perf-util-y += parse-branch-options.o
 perf-util-y += parse-regs-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index f77b674dd724..742f21b268b8 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -54,6 +54,7 @@
 #include "arm-spe.h"
 #include "hisi-ptt.h"
 #include "s390-cpumsf.h"
+#include "gtrace.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
 
@@ -1433,6 +1434,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_GTRACE:
+		err = gtrace__process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/gtrace-decoder.c b/tools/perf/util/gtrace-decoder.c
new file mode 100644
index 000000000000..503fbaac12c6
--- /dev/null
+++ b/tools/perf/util/gtrace-decoder.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic hardware trace (gtrace) decoder
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stdlib.h>
+#include <internal/lib.h>
+#include <linux/zalloc.h>
+#include "evlist.h"
+#include "session.h"
+#include "gtrace.h"
+
+struct gtrace_decoder {
+	struct auxtrace auxtrace;
+	u32 auxtrace_type;
+	struct perf_session *session;
+	struct machine *machine;
+	u32 pmu_type;
+};
+
+static int gtrace_process_event(struct perf_session *session __maybe_unused,
+				 union perf_event *event __maybe_unused,
+				 struct perf_sample *sample __maybe_unused,
+				 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_process_auxtrace_event(struct perf_session *session __maybe_unused,
+					  union perf_event *event __maybe_unused,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static int gtrace_flush(struct perf_session *session __maybe_unused,
+			 const struct perf_tool *tool __maybe_unused)
+{
+	return 0;
+}
+
+static void gtrace_free_events(struct perf_session *session __maybe_unused)
+{
+}
+
+static void gtrace_free(struct perf_session *session)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace, struct gtrace_decoder,
+					    auxtrace);
+
+	session->auxtrace = NULL;
+	free(ptr);
+}
+
+static bool gtrace_evsel_is_auxtrace(struct perf_session *session,
+				      struct evsel *evsel)
+{
+	struct gtrace_decoder *ptr = container_of(session->auxtrace,
+						   struct gtrace_decoder, auxtrace);
+
+	return evsel->core.attr.type == ptr->pmu_type;
+}
+
+int gtrace__process_auxtrace_info(union perf_event *event,
+				   struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct gtrace_decoder *ptr;
+
+	if (auxtrace_info->header.size < GTRACE_AUXTRACE_PRIV_SIZE +
+	    sizeof(struct perf_record_auxtrace_info))
+		return -EINVAL;
+
+	if (session->auxtrace)
+		return -EINVAL;
+
+	ptr = zalloc(sizeof(*ptr));
+	if (!ptr)
+		return -ENOMEM;
+
+	ptr->session = session;
+	ptr->machine = &session->machines.host;
+	ptr->auxtrace_type = auxtrace_info->type;
+	ptr->pmu_type = auxtrace_info->priv[0];
+
+	ptr->auxtrace.process_event = gtrace_process_event;
+	ptr->auxtrace.process_auxtrace_event = gtrace_process_auxtrace_event;
+	ptr->auxtrace.flush_events = gtrace_flush;
+	ptr->auxtrace.free_events = gtrace_free_events;
+	ptr->auxtrace.free = gtrace_free;
+	ptr->auxtrace.evsel_is_auxtrace = gtrace_evsel_is_auxtrace;
+	session->auxtrace = &ptr->auxtrace;
+
+	return 0;
+}
diff --git a/tools/perf/util/gtrace.h b/tools/perf/util/gtrace.h
index 63f7560fc15f..acc25748b4ac 100644
--- a/tools/perf/util/gtrace.h
+++ b/tools/perf/util/gtrace.h
@@ -13,4 +13,5 @@ struct perf_session;
 
 #define GTRACE_AUXTRACE_PRIV_SIZE      sizeof(u64)
 
+int gtrace__process_auxtrace_info(union perf_event *event, struct perf_session *session);
 #endif
-- 
2.43.0

