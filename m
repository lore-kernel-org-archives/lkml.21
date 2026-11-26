Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687025;
	b=IIRwXql+Tqj0OM6pgG487lsR4v/TcVhE3NtQVxjGN+yfkRocxu/63+sbhSCWzWjOZQSk
	 Znn3Lr6P3D1KGhmlzEntqw88XK5caNhwdQ8Kfq9L286aCDKLCsU2sRvVQlTdtc9A3SWTE
	 w6ijug+24zqbGg8S3HuPAsKqEtqlcGr2ATy8hqiD2KLEOpjm0FgJUpC7JwWdto3mvXkVQ
	 ZzPCoMgZOlme3E7FRXywBkT3ouzw60SPuCmV1yHSCgQrETWT5bTDrREuLIqmTIOkE3rA1
	 5XxlBTyZh7vajjECFmm/1yaexf1OgYgmNoYqwL4KZsrGrCB2SyfJoKXXpzRGkHpH29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
	b=yHPLeFuio6I3j3dGyFxe1xIex8d+nzUhFE5ZTjoojjBhK4HMSH87pl0Y+Dxdkr3tp5pI
	 eF7tVEGQ3PmGW9XRlej6z+N5a4NljWn0rpmllc2STn9TPkH6PGh5S0HA8gXaBUCOkgZ4o
	 v6CWRHnk3ihiSWGip9eG6bS0TVV2z7CjJRricDp7Br8cKkwuGzWP9ir0blmBWGzgfTv7S
	 pWQXDpANH4dafRt3DSCCr91yFLxR19LOZV3CNId+Z1hwzk0srPxK1Fdyx4o1NHyg+gcv3
	 fFP7D4Z1EI/aEw5Ygs1XiI2EktMAGUYCem3YgYX/jNZFpEeIc7ynEGlqrP24DsZDE/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaYkzIRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyC2EXpp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C4606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810C4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aaYkzIRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyC2EXpp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BBc83548522
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lfRhNGzjGAC
	5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=; b=aaYkzIRxZXcJHaBdp4jSIfCz+5E
	K9xoSbeJbEiDpHz4gtJpWdjdyov6gHHWrrkQO3k8I11CiQ6Na3E4om/F9mLwupcP
	c/PHwgQ1UE2fYyE7tPwyGYqJnTitMHI7qnEP1maElN9pmdh/MhhPQL9cvEeSp38N
	r0rfMzpSagZezwfmgx+2aJZ9ABqQQ8b1Rj4WAMC5X6woy58gCOXVExbNJJe9VLX1
	rUV+OA31IPMSegN9BiKGZtpnUx/A+32Gzh3u5nkMoHGLEjMKPxTBPlPJxmvIAlUW
	H2SACXO3ed8XcaOt79X/jlAZfJWl/zC9ywh1g6cO+wStKnspMPvxiRZ38Qg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaud9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:57:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b505a2bb1cso864832a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687024; x=1796291824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=GyC2EXppKYZMZ8mnEmHbWt/4Z2vWKq/TvVPHpBKoz1cCQrq7v6p1dKpLERSAUzMDgl
         9is3TQzRx3xZmqlnuENDcvNyxnC/xdWGgGOO6nhYgSX4EySw5k2CUIFXhvYq6Zm/sCUD
         VyHX/ghKLk8Q2mLm9Jgd2sodyRTgXKv0sBzZ9SrTkXrOLyjYYvdmwKdLbVlgTBBg12Oj
         JfVqk23owPp1mIbzzbSX0Q2K/8FqBorLaNTj+9Um9CN/2xxTasdz1+6E9Idm9llZCK1B
         sIN4V+5bZIKXPPrvIIMRtJ5LTvBq8E7ZE6l42epA1i+gZfJw12O0L/kiCXkl7I79mmff
         T8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687024; x=1796291824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lfRhNGzjGAC5v2pz4w27/QjNSD/M3WEXiEhcu7FVeRU=;
        b=a9smeJ2XdMowGq+D/hclF5gq+/Ge3Y2EHYUNe0hJyo93aJbzVwJw27CrLg+vM378ZN
         1bDM8e6WzNRl/4YSTCqqjOOgVQlVmfg5yVpT378YBF36DrHrz0xmWQeLMUZ+ygVKBQMn
         tccNdMzqHyjlPfrdNYtgQKhUMd1S/hDhcLuCu3flPAvDk4gKKSVM2I9HRrUj0bFByuE7
         LaI4rNuLV8+uBs6qq0Iv/nIbQeRzlqdSSnGJbHL18FDrZOVS6lHFNYU3HKLSE+cU5eco
         IfKp9oO7NKYC0Zucwrr51dSC5z7IWsOGD92Ca00cIskX4SXahXiuRHnVRXALE/s40R9o
         wVbw==
X-Forwarded-Encrypted: i=1; AL+hErFdQhgFKm4IfAB3vYRqSypSMh0lYcov+LfjZwxbX5k251GGqpKKtg3aC6tWKwzubbqLlP3dNUcgQUJf3eA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Iic682cRzekFf1A7JGyCrk29NOUM11nrhmHG4DOIBY2uf7YN
	OG0mA7scqL8pZAapulUqnzJDT3MguHvchuCn7lKpjBPEcJkUZoOsspgaTdn1OnJd6sq1Sg1l5N+
	DlmlWi+PGhi68a0YQOfP+GpvuXKDNLXtLr//TBrPzF4eLzNLKpSB1YInZHmxRCIDH4sQ=
X-Gm-Gg: AZFdTZeQj+/w4miA6R1ESFEe+J5vzKa2LcdC15NI4RPw2frmNki1DD6AaOVGCN8CFwe
	AkLJy2Ylv4VNJ+YNxYIqjbpZMEKioHB9kOtwnMEuhLZ9XU4j91TjRp1Ahss+Tn8iZXZWfYKT5mR
	wuxIKHaMF/N6lnP4qECGpSeJhcuOiDEf1+QAg8ZgezX8t8IiSXEhEV7ZcLKfDkkq1ju/QGrR1qE
	qjqMSwWNOL4sYMyXtnXrHXbGVSXltyNYxJkch1MctsX6VG6BOs9H5khilYn65UhjO/pdYaFX4RF
	bijNgA5i1Q1syQvuZf4ljKc6Mrs15zJGlu5cBTzc7uBss0XtgFt5xkSCojM4X048XGs1zwHwhPa
	/w1xXKKq3ap6rXX4BJpx4ENHtA56POki15pftMQgO39n7pH9OzD19LyT44nzgr55HATBY/3yk91
	r4BevqXWDa5c/4STeGmdoME1HUoHFP5vUQWEaj4lKYIW7jMmobOWzcys9KX4uj4bDg1lulrM/ph
	A==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227867a91.40.1795687023972;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr18227849a91.40.1795687023520;
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:03 -0800 (PST)
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
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 08/14] perf: Add gtrace AUX buffer trace format type
Date: Thu, 26 Nov 2026 15:25:29 +0530
Message-ID: <6a984b05685f80e6d2f5ab57f0fdb1f79fbcce6c.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX2+FhXvY28nfp
 u9S90R52h8rxBLDy21aKVOfh2oa/3IHEQQONk38jHdKetZ/aGf+4by13qVbq483wX1NOEh585YL
 fAiAtQ0N5LodS+x1d58DkLEeRF8G6jI=
X-Proofpoint-ORIG-GUID: 9hjrFZT95UDSXEhZyPB8szpP32MqV7WL
X-Proofpoint-GUID: 9hjrFZT95UDSXEhZyPB8szpP32MqV7WL
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080270 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=EjOQMhZftjg6WCmXgxIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX2u+Q4Ekc8vXe
 sDA4oYsEfyHpDy9r7RhDpzbb221CK7NOWuvcfld5+NPnstepB88v6S6dY9XbFYbN24HuU7zqUCw
 asWaOwP5c5gkMeoL25DnNeE9o98tOtr9m9SY/B6vumDrPayGTPsrm12f11rgN6yx512ckTZC13S
 57medwlUP2rRQ5BI2W5N+b46bjbZNiIDGuteRnA5kjmRe2j2kLZvPeSd3W4JbGwJ9uQFrjhn6ug
 3c7x1kaw2YQvbgFLGlCXIKSZK4oluq3irjmM5UTH8VCp3ukmQ+an6jVChnsj3adnc+awpfUGyyu
 xtwQzGWU7+xbO17LQmo9mR9XgGUxZtgvuQyUqgTHwOGl/mAUlqd6H4NdjcxXnmMN38JHY/DPUPu
 NyQd4dl+Fyix9QKNEwqlnc6hAkeSHD6zIb17nOQsvxIRAeqjf7JPEuQkBXe7wXXevFVWi5gzaD5
 SkCi/7x78xhPXDiUdog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h       | 5 +++++
 tools/include/uapi/linux/perf_event.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index c49fc76292f7..dfbda95a0d23 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1352,6 +1352,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0

