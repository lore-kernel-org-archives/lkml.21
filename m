Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438094;
	b=3o4ZPba5IcRDvJmj88eE3HTOMCaQJiDwNpktNnioVFFrATMPx35M1XOKKVz4KYItU8t3
	 VRhuithGx7+rTl1ol1ph6r4OLaYkchyWBhCW83wlAp9YD2bypKDNf+OHbP5NC/5dhsYkj
	 7R8FsBM6hplaSQwl0ERk/w0OAEN3fxrN7OJFLge7g8P5YZSFwgU6jQNl5EfziuFWmGPeO
	 vzVMirctO1XO/cLObBU7fa0l7rzWj7EoHWrPFEswg3Xbs7iFVqrWGUJ73rS+Q+/WJKRTw
	 GGwjCmuKmIx2XP9Gab3Yoy6rPEz9Wt0jq4D7Lnkjaq+afdFGM5yBMQQ58jCarCtD/mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wna9vS/xSf5c+QLNwHB9LNfsNO48h9qXUUudf8Fk638=;
	b=AkIAfaPwUc99rdwlHzUhTm0YLCa2VX2i/aG0mue1RkHe5QKo6hLBleme2q/uyHaNV6Ko
	 Vq8FgI5Aia2fBkX8R7vvFxL11DP79Q4XreDyCni6aqyiCuncXso5jpeZ8YxZuGjv3exQt
	 aACGmlUGc0+MNVKUvqUBVvmpxaDAmyBdI4/q3ygq4UHhwhREHRttU19eloN0UZqnhQFzz
	 pQQrSJYQh+e5r46CCG5jBY11IP+KxXSIoAe2yi5q+h1ECabpnlb9N1XSnykVU/JJ40hig
	 Op6GErVD3g/jpxLil5DH0o8KBupFdJ9LP31xszCVaUYhxl911/FIs4WlBtdn0Ao3Fmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4hJ11+y;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2135E606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2135E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4hJ11+y
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCYnqO3630893;
	Mon, 23 Nov 2026 12:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wna9vS/xSf5c+QLNw
	HB9LNfsNO48h9qXUUudf8Fk638=; b=F4hJ11+y9IPuRZu7dh+VKoJg52q6FQrQ9
	PU3AOlQeSZHNmGjS3apTbJ9FrkHviHUDb+SkmTktQIsHlRE7QrLnb2Nnc4xSuQAj
	s4ZUp3XyWakYbJvipQgmtrcbtpssvktYpT9F9mXCpHCteSU1jpzk3gK1N+0wk/DP
	uED4+rooj/1Sg3jsEMUHEaeSnbZpxxEw0a/l6NNR8FIvNtKPDLqrQ51fRetcs4Vp
	jntXEn/gYIm23CEmMZeyJeG5SveCwOfvyST0jC5ioNeNRzuleITVw0FzqRIH7ULg
	/HeW2cZLIab+Ct6zSTBDt2GiUoSk3vPvXV1BNeIVv1Y/zh+J9SGAg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g12vj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 12:47:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANCJNlI741922;
	Mon, 23 Nov 2026 12:47:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3qufpmpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 12:47:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANCljaA44499452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 12:47:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4FF62004D;
	Mon, 23 Nov 2026 12:47:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F20442004B;
	Mon, 23 Nov 2026 12:47:40 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.24.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 12:47:40 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, peterz@infradead.org,
        tim.c.chen@linux.intel.com
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, ritesh.list@gmail.com,
        kprateek.nayak@amd.com, yu.c.chen@intel.com, vineethr@linux.ibm.com,
        vincent.guittot@linaro.org, srikar@linux.ibm.com, npiggin@gmail.com,
        mpe@ellerman.id.au
Subject: [PATCH v3 1/4] powerpc/topology: Introduce llc_override kernel parameter
Date: Mon, 23 Nov 2026 18:17:27 +0530
Message-ID: <20261123124730.1466978-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123124730.1466978-1-sshegde@linux.ibm.com>
References: <20261123124730.1466978-1-sshegde@linux.ibm.com>
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
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: EGKeXS2RexNG13Z_WeSDfoF6dpr5cdOR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX22xnroSgldJF
 wMBMHzNJpEziXqQ7Gq7OyB8seWfXQN8TH2xgXnBQvfr81zBtT36LSCxdJSU+nDasIUyhnDT2VNa
 GXva7gIQ00/hYJKmlwTLq61yOqPWagc=
X-Proofpoint-GUID: o57JlPVZ4qhwR6Nd_E7VUtOcaYwWDlbz
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b0435f7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=K5S5juBvcUcC1lOVBgwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MCBTYWx0ZWRfX/yuQg4FgrTxx
 COtHPc/73GztwDX2RExLW1GdxCG52b1DNCZuXL/xHX6KRgglkQDHJ5NEaBq5zs/TUa/rWGygkrO
 qJnesBbsPR6n64yP6B8TDqGciaAWW3jszbbhGBZhN3qXroz/aIY+DulPkJQ17Z3K+Zz9AJLqnnj
 d4WizBOe0xRJfJJ1ApeZiE3pxTnvjxiOc9b4BECbeeDlp/3Jsn7OlYB/3USzpDaCl6O3IQYF5QQ
 nAA6ssbYdSnvLk+wnYoKo2Kug9pgcPCTWQUxEfpY7IZX4AmWBwUdAaaHw1oVVmLRB+k5S1Kg7u6
 bo7yv9H423trvUgIKw40N97y+cpkbI9pVwtmflxJRhZSYwX09vFUdtLiu/nFGe2DrnsYgdkp06+
 ItYV+EmLnlQZgNLeQ+YN90MkmTNyQ3KJ1dqvd0tjdNvOBxTg1erF1og/+aCk3U2M7KgJJBqhD/+
 Wn5UAizHB6z4tvKIkbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230050

There is a new feature in scheduler called as Cache Aware Scheduling.
It tries to keep related tasks within the same LLC domain while
keeping the system reasonably balanced.

Cache Aware Scheduling assumes that the scheduler LLC domain is large
enough to be a useful placement target. This is true on many systems
where an LLC spans several cores, but not on PowerPC systems where the
scheduler-visible LLC is at the SMT level.
In that case, sd_llc_size is effectively the SMT width.

This becomes visible in the capacity check:

  !fits_capacity((mm->sc_stat.nr_running_avg * cpu_smt_num_threads),
                  scale * per_cpu(sd_llc_size, cpu));

As a result, it may be enabled but has no room to operate.
Hence provide a kernel parameter so that one can try experiment
their workload with cache aware scheduling. This also provides ways to
explore it on system with SMT=4 to see if there are any opportunities
to improve or uncover bugs if there is any.

This does not change the hardware cache topology. It only changes the
sched-domain level at which SD_SHARE_LLC is set.

There is no point in setting NUMA as the LLC domain. So give option
until pkg to experiment with.

Actual flag manipulations for sched domain flags and llc mask is updated
in the subsequent patches.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 7a25eaa59e62..446127ace589 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1059,6 +1059,29 @@ static bool has_coregroup_support(void)
 	return coregroup_enabled;
 }
 
+enum llc_override_values {
+	LLC_OVERRIDE_MC		= 1,
+	LLC_OVERRIDE_PKG	= 2,
+};
+
+static int llc_override __ro_after_init;
+
+static int __init set_llc_override(char *str)
+{
+	if (!strcasecmp(str, "mc") && has_coregroup_support())
+		llc_override = LLC_OVERRIDE_MC;
+	else if (!strcasecmp(str, "pkg"))
+		llc_override = LLC_OVERRIDE_PKG;
+	else {
+		pr_warn("Unsupported llc_override=%s\n", str);
+		return 1;
+	}
+
+	pr_info("llc_override set at domain: %s\n", str);
+	return 1;
+}
+__setup("llc_override=", set_llc_override);
+
 static int __init init_big_cores(void)
 {
 	int cpu;
-- 
2.52.0

