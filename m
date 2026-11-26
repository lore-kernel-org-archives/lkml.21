Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687018;
	b=Qby4xE7PjBNfZe0USHgl+Ns4Wp5Zg9zhK3aGm72kdH+Cu9a0+VFYXaxaXSikFUEV47G2
	 +t7Y6tL/wc1kkS2a/fy7FovbyKbTbWCrhKq8My6RAXyfujM/YAIjTsXE9VK9KHBDu1sLk
	 VxzaUnfJHo2s0QXQ9DdRJ930bQ8Zgaxh7Gbi2+EnwwnzjwAafm/v8cf+RBvBXGvnSE3nS
	 YSRYmqzMFO9uyIwX4AMKfnm1pz45SfY2aFshh+0Ly1A8JMoSfhfkurncpw44w8+k5gGzc
	 v1Lr0I/wE5RGnRgrHtK2ehWniyhAOrr/Z/tFzUC6qv3cqWtmQjOfuMzhQRI3GtB7jPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+crTlNC0lbPa8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=;
	b=MxTrJfo7JpWmNH24Vxqhm+Skzi4Xvi+4sGrAmeENW0aysMO61g/tHF67RW620C6lPCRW
	 0yX1t2UwFBAItZE3A4QhEKXZCTbDA96j7QKckqYmPKswJzoVbDBZa1l2JARkEzRn2XVlR
	 tiXFM9um+7u/6ZESMMa5+RBJMthvsjTkbEVyEgH7Ooi/DnmAVHG0DTlxwRwFAqGA+H+nU
	 HEsxmmxY749+/aenBaTKJAxqUbovxAcmjxN3Ty+JNFrDpbHzzJvcoQcnGLPwg12QQTlCd
	 eoSnEjFxi+YJpyP2zYUFPy8d+R5cbeKBu5YwOfK14HxVuMkFMb466nCEwbGwyNqrKZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqF0juaE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dl+AIiNu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqF0juaE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dl+AIiNu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AsHB2885476
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+crTlNC0lbP
	a8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=; b=XqF0juaEDFRjGukOOdZlnb5Pezp
	+kHyIY49U+ZlHDYS0RTH+Z6k/pjUIBp4G9B4PT3hxhKY5j1SZ1939t8+o49lOvdO
	bwJ2GffkfuHxzgnrSB42QycFV9LucjgcvCpTzRgaSA+SxUZxnDWnbk1MTxGyFB3I
	AQLNcEF+u4bAW5n6sIl4goAS//OmxMcieUgt9TvXYHbQYfyboN0nYHCRFVnrJP3j
	6xj/JLWSWdNQ8bzYFKwuJpNagBtTjD+hfVYGcmALyUg+WOViLVJyh276NvMTQtI4
	4HtxF9orzD0LnVYdUuT9jUR8clAqK+dA0Wl3W3ZxAEKPxtVe32eG0MpqxCA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rgvhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso6800567a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687016; x=1796291816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+crTlNC0lbPa8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=;
        b=Dl+AIiNuQUuSL/m6PnG4ofpAS75oTqYeNj7kJcB/PzkI4scRrseQJ1IOxdDp5kDf6o
         jzJjaUoR+VU3W9sMwS0d46QOiW4Q+RWRSyl+q+hZifjxUA3IsmGC0pgyvgQroiDMfOla
         b3mPkVqFIQ/pcJ7o06Mhb7khXOsIS+3uqhrEK8ZUJRLnh+s4/jk7nxCdqoioftlkFLMR
         NBU5W2pHFOQ4G+XEKo8WbNzLNmdugrVS+JgYWBjTli19Q2JskkFJEAPqg8eozISgHbsK
         kUAE3UeXaJF7+tbCP//PFLDnmaidA+3uxIJaYLUdlcXfWGbRQWQ4Et2f2/Dap9WfOUQm
         muFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687016; x=1796291816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+crTlNC0lbPa8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=;
        b=ve5hkclXkHRLpRlY+1c81RdVgG3SvdVRxJg0/1fopvQEHaKTuKJ0f0eAe+CVrsnG9/
         /BxWxewfTvPdnWuQSC+u1Oo/slFJXV0Ya4ZMCIKHVn0+iR2W5u/k+lhs+w7j4lyI+M4B
         0uD3s3SGtRLF0rgXjuO78gjC0GAB17zllRBn7YBw2UcT9+vKpdQi9TkhuCCLHzCUBMHi
         pLIiRzcTwuto/4M6mC9z56cWdXe6HgLSWzEZw3IKmWwkZs97J4Kjtr9kiVXmAkhFFiiJ
         mS92ZEyG+77lKYyLmj81lHqlcgm2WD6TLiaQHrXYDQranE7kl/y8dCsuZBKEBOXM4NP0
         5hpg==
X-Forwarded-Encrypted: i=1; AL+hErGiVCrHl/RHQsRQT7oeZa9npq+NUx2VVTys6CIpHCeMcIPpjT7HyxQDPA5zzQ01LZfLTRs71dkk5Cn6Drk=@vger.kernel.org
X-Gm-Message-State: APuU4Z85QTt1GC/kKFNad6+jV1vhHHCNnG9StiXlW1MwHDub4YmWZNvm
	v3JL1ra/K09BB2PLWvGtMs7UIwdZxAjDVlGmuoofW3xBWD7IX0pPHazjpccNLMD5LrL21Y6VsTC
	M+kclN0fb9PhNhPqpm6/9UkqFuvBf0977KDyOJ2OY1wjq5R0rbbd57EGwZbp0eDqsDK0=
X-Gm-Gg: AZFdTZfBoYJjqnjrAvfCsGmpGg1v0+ioT3vSF35gFk0W73EsxLbl+U9La0k1QRk6R/x
	mRLyKv0QX20xzvV4hM/AF5W7pClwzRoMvDd0YMek8wrofCPmD3KFfZl3hRr/joykuF8SrZxbQpX
	7mgAtyXEjmsSxtRkFW3550XV0SzzjMXb+lBm7b8+53p/JGvpmGk98C7P3UAv3x3g9w0A0xkYfrN
	0cJJ9D+vOAidmb6cfbHrpcOIqawChBJVkgGKWzdQ2zWUCsE75+Co0IISX5zaCnNZvB3qwDaAA4a
	+FQjsO0N+OUbA6R0L78VpVn808yLhJYCIzNB51CS4boVqW6xtlhiCv1dvdeVEe3iFUlj8fNN5ht
	/4LPFB4S7eKxCqMAGsAmF1ZwzTRPuxfM0u21lrqS1ZGdjsL7EFfTQIuSi0kmolf36dMYe28l5W9
	MQ/dtllSRVGrPefrsInVIpbxDi4u0/vR8+KSGvsMpVKSWcknvJdxpTwlgZb/pv05uNginHXwOWc
	Q==
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b41c907eb4mr11742350a91.20.1795687016132;
        Thu, 26 Nov 2026 01:56:56 -0800 (PST)
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b41c907eb4mr11742331a91.20.1795687015626;
        Thu, 26 Nov 2026 01:56:55 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:55 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>,
        Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH v7 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Thu, 26 Nov 2026 15:25:28 +0530
Message-ID: <115ef070f1edfe8be3e7862dc4c90ef9eb19d568.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/SALu4HRxIBb
 jM/+K4Tg71EDeNsxyNWy6lhz2ZwZPm3A9SjC7TGP1L7RTe7js9sNdMS0M9Na73Eujh7Q5IQ7YXM
 MA5dbSdx/VpgbkB8OJVQsSFnoqnr/OzivFGmHFf98oPZVqhW9lT/UoSpVYMod4Ovf9J9q3p1wQu
 bttl9S5f9QlRSFC00B53jZcrA6tMN2w47GMCFJsf1OYd+DEntj4pUkJE760JdziYztYek6DzvVH
 ngwrfnvIVuWzGdB3NSNyNwNKeAyTjmP0dQtDe4sizCrmhKZmgFTO3UYV19tE0Nf15g19HwLVnJd
 sII/Tnk+2bjFlRhL9G1UJrLRAPZKdb92SFYKzQkEkDbXG9BEvN9qMXaBdgvpMqN721lPLhtpCvO
 kaSEPxonloYcJWZgSbOopP7znCWBVLFKnzaQzUdXqGClwnd8oDD5cWIZsJBlPJSaxHdLVAD/ZEt
 gCDt3aUlw+l/Knf0NDw==
X-Proofpoint-GUID: wawvqMdN0I59EVuaDw9PPKb6zs26zHlJ
X-Proofpoint-ORIG-GUID: wawvqMdN0I59EVuaDw9PPKb6zs26zHlJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX7Kcvf08giao1
 hUWgA6FiC3JkSUQ71575IGXsfmKXQ3YZ9EKsW5ZJ2EChr1yRKEi5M6I6r+eKLklJL+dilgx73iz
 F0UoPbm9j04xiLXZlW73PtAxJcH30R4=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b080268 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pFyQfRViAAAA:8 a=_A7cn5ShWJPA6JD9j4sA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Suggested-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 42 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 31 +++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 754c5f71168b..af282cc95b55 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -818,6 +818,48 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *size, u64 *aux_flags)
+{
+	struct gtrace_component *comp = gtrace_path_sink(path);
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	int ret = -EOPNOTSUPP;
+	unsigned long flags;
+
+	/*
+	 * Copy only after every path using the sink has stopped; otherwise the
+	 * hardware may overwrite data being copied, or the same data may be copied
+	 * to aux buffer twice. The last path to stop does the copy. Holding the
+	 * sink's lock also stops another path from starting the sink before copy
+	 * completes.
+	 */
+	raw_spin_lock_irqsave(&sink->lock, flags);
+	if (sink->start_count) {
+		*size = 0;
+		ret = 0;
+		goto out;
+	}
+
+	if (!sink->ready) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (gtdrv && gtdrv->copyto_auxbuf) {
+		*size = gtdrv->copyto_auxbuf(comp, buf, *size, aux_flags);
+		ret = 0;
+	}
+out:
+	if (ret)
+		*size = 0;
+	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 77b2835c1647..92265efb07f2 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -307,10 +307,37 @@ void gtrace_destroy_path(struct gtrace_path *path);
 int gtrace_path_start(struct gtrace_path *path);
 int gtrace_path_stop(struct gtrace_path *path);
 
+/**
+ * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
+ * @length:   Size of the AUX buffer.
+ * @nr_pages: Number of pages of the AUX buffer.
+ * @base:     Start address of AUX buffer.
+ * @pos:      Position in the AUX buffer to commit traced data.
+ */
+struct gtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+/*
+ * size is both, an input and an output parameter. As an input it conveys the max_bytes
+ * that can be copied by ramsink and as output it returns the actual count copied by ramsink.
+ */
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *size, u64 *aux_flags);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The size parameter
+ *                 is the maximum writable byte count, at most buf->length.
+ *                 Returns the actual copied byte count.
+ *                 Reports AUX flags via @aux_flags, including
+ *                 PERF_AUX_FLAG_TRUNCATED when data is discarded to fit.
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -322,6 +349,10 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 size_t size,
+						 u64 *aux_flags);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0

