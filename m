Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687001;
	b=y61yVxAp0yITo6tLmXEOoCP8UIm1gUAg3RwwNBSdQL64TDJTJ8S2kmrWMTe6KuELfqF+
	 fef3cs7sbVnduxloZ8XRLfXpQZSHJEicr8i6mgcQMhp0kFkYbY448/UfwWK/YbnULSfzS
	 TkgkSd2l7jRFDXOI187WM7QQNcoLMJUJatNwgA4ikfaxG9SMtXjeA1v+tUffCTxgf0T/Y
	 DTWSqxRsj9GSCtcJZgNIXELzIzrBo/M/Y/L++W6xylXi+nZ7dGQ/iHQ3euEAQctYBQzQc
	 Tn46ulpHp5DUuslAS/N5pRLuRWGyh+HKpQKqxLR4lVCW7r2sqlROuuA6+C6THC1fxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
	b=gQKlocq7OweQybny1owEe0e61rBoGWQlnDKGLBjRWVstr9Ee/wmFlW4MBnSqbv441qp2
	 Zd2OTMp5Vc1b0RHBweO+mub0bKMR7CRD2mpXpy2oBSU7n/NbsVZC6rPeEkOMUhkjgkxuK
	 W+AX3otsGAXBXTbpniWXAUGceGWkyMxQz+LE5MlQr5YGlujA3/vmeK1sSR7tEujb+ZNfJ
	 /0lPnKh52QaSY+kvpO3R9P0YSUBJU++2M64xFb10HwXcza++cIDXya9sR+ASTLseZ29ye
	 XHZbC48U3C4JFeVuDjDXVIXPUnRw6JhEL9eWvOQ74a7r5SXKSg9T6yIWhiFyNMRhWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Wx+w/Vj1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/NfOX7B";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39004606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39004606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wx+w/Vj1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/NfOX7B
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwZA2175562
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0gHqynCP1e/
	J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=; b=Wx+w/Vj1CQ+HgczuYa67jq3cnDg
	W0Q4nXuvO4KyynlqUJHw9o4Ge5t5PCqPW7x14Y5O5KIGTnGzrvzbjrFYuTpfJqQj
	woa0r7aRQcDfLemnS37AmxHpcyD1ESXb1jLB8ymonMIov5H0zJ3Wp6Khz9P8vask
	0dzu6UwOTxwIxpsaQ+vxSaKVKejJOurrTlXzm09bM+PLHunBQjOGZyq37hxhRJCZ
	7Wc0QLp/A+8ok5UPtIUjQcQC/IyvNqla2r2qU0TNu/j14yusQW0sDQrce6Wc37Bv
	CMI3Ns1xqylb0qIcU8Br1D9InQ7AZ3HMc9s6Q7inwuOqxfe55fgIC3MJCig==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuvq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:56:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so4862116a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687000; x=1796291800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=c/NfOX7B6pZrolwqKs+LslfUpA0F9mHFwGa0yw0PFwlMZlWT/UgfSjvdqYJswWoTTI
         XRGbf5iIh2PhAtP9FNFSvdQi0XNMhLI4VTL6JUGpEjhPvZoiTTeeycHgGSdnJOo7qru5
         zb9e+2bDADvMERQDByP7SHgdCs9JKvnu3emmZs0eupAFEXp9nMEd3hl53UkkzcDqQHZd
         bnkaIQPRTirniUczyNF0w3iYauMZvcjOlItuaSTZPrfz7vCHskBTaM3E5EdcvBAqLIrM
         8k2ZY4c+JQJy246AGeUdHG7ePS2cwB+AZolhT3pCvY/ZKYbTRW0ynJ3MGTVNObS1PAeG
         H5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687000; x=1796291800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=iTcWIuvY6GxNZoOHCgVYw5rs9Oi3kcTgq3iDsTYH47wk4wO8uM8k4Z/iY7bzuWke2s
         ydS8LDjjSObUu9301VjCCSLGAtHd7njbohIQwH+uegTim0xJ8hbVId0+iGmqB662G9ZP
         u7PETHepnsmNGrknwrcLixzl8Jc8oOnWsRZRfoFiSg88ZvDX9/9nvPSMjX5PRF+MTiHA
         rriqFy5vKArcJYle8YmIFowjPs6Jquggywcuq4CmIEL4KVCWD8h4mYonH2C9gX+jw9yL
         4cv0AluGqDIijm2RvmiPirI8Ogv6PIH2bySTJ0+wUeExWZCJvc2nnKOcIIAM1QJO25bf
         L0pA==
X-Forwarded-Encrypted: i=1; AL+hErGLgXCe1+mgU8G0HzMmzYP07prz0TUa4HsyrS+W4+TyfxTbBHYPqRtPDx+doBewOj5AUJ4gKbcmXFGYzHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RWnfg+8qme9zPiw33cugOOHBXMY8wsOcGHKMm+QloP1ho/gU6
	sU5oeEGYUGzw0yMURb58Ok4tdQOFmR9IlLWDFzSJq5b82AwpYbrTXnuOYTseTNZocZJNF4ZAggA
	IEGmQlXkGNjmRwI+hIXmTwo++IEiOg8ZpApV6bFv/L4EA9YpM/vvmFdrsuP0zKkmAjbo=
X-Gm-Gg: AZFdTZdqtGP2u0f9KMQ3gqTb3pRHDbRm13sZfhbDfobf9bqHuOlkY6pOY9NlgZf9ST4
	CCfZ8pWIUjRCtPTPmVlkzW75RyWbylnTR1uVrsoCmqKnAqIAPhw/AaYxOlHHgRXW3D+1FDcX13O
	hybAyWG1seZpvo1OhrELaRlxU8jmYUXXC/raP5DGcBKeivucS8BvfvNStZb4h/BkISgsgQ7hlSd
	Ri30iBF4uDFsq9ubtZdXufjjhesad/m5B+9M6kP351HilGmC6E5/ODuu2Qd5ctNCKrOvaVWyTH/
	Femgj1KrkVRgzVCkQ1IXpcW4rrqwbNnmHDj291TJwKE5o/6mYW2F5tGyhWUFQap2F6lesGx8r1k
	sVmDhXvgGl0X6kuDtSuq4tWd4zrchc/SnMc5Qp0Q1QI+Gi7Wap6OGdRUAjVknhcC7H+TTHvhxPR
	DjwPWFLVBXBYBZNg5rP08oMAnWtnIKnKFDnfrfMOnU7NEqO3GlND/A8MLIvIAJH4cMsw05TK32F
	g==
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282825a91.0.1795686999573;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282809a91.0.1795686999021;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:38 -0800 (PST)
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
Subject: [PATCH v7 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Thu, 26 Nov 2026 15:25:26 +0530
Message-ID: <6fcdae2ebe6a263f872357b2aff272f9cf7ebe32.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
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
X-Proofpoint-GUID: WL6oatU4lD28ayjmlgr1l2k0remOKQDI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0CwPtxaiqIKk
 dmINVeY8nXi5S8e4E3detWuxx93LS4VqqrNJQ8scN+qs6m+t5As798G/+T5tK6C8wvur4Xc3CZe
 5mHuwPzWt04zrMlEk8YFp1xxRpt68Z4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXxcFdKuSIBve8
 fV9kaqWi5YLRC9hL53eH9JnxDsEYyp2AOV9bABWGgc1ubeAnxFpHOndlRZQ1kTKNgc3U9Libca+
 PUT+wOyQHYP4p5SfPaBK86y0vp9oRNS93gVA02tDdyRwdZZZJai2X/0SFubxJ9eAiakI/Chrsy8
 8h/lavSl5XBPqZ59E/8WcwmDl62PwqLslyZVoy5N5Xn2yH3d7pUfyVvjQbKEqaDut7FIeqGvooS
 y1d9P2UUi3tAaaQdvZttXuSDzH03NqNCQryOOUMitEbHxfvvcr5rqUmMCG346Mnratp5Sv1oJ18
 lW3PMDa5/+SYGmbVOJXV4tR/BBehmayBCgo5QvjOZXClW9R067sIhHtWRFbAId5bTRjp6iRt9ri
 5dRDG53+3Bf7esmzfrbUpTZzvOtB3k1ie1n3PQOLepDCWbGoMIp1AhyuN6Op1WzuhJgzqJAgwoK
 3UPXT3BpnactOpOJlbQ==
X-Proofpoint-ORIG-GUID: WL6oatU4lD28ayjmlgr1l2k0remOKQDI
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080258 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kiQ-iWSZUmGuUuZfK6oA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 128 ++++++++++++++++++++++++-
 include/linux/gtrace.h                 |   7 ++
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 728235fc9bfe..754c5f71168b 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
 
@@ -24,7 +25,16 @@ static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
 /* gtrace comp specific data, to be used by core functions only */
 struct gtrace_comp_priv {
 	struct gtrace_component comp;
+	/*
+	 * Protects ready, start_count and owner. Serializes start/stop against other
+	 * paths sharing this component and against driver removal. For a sink, also
+	 * serializes against gtrace_path_copyto_auxbuf().
+	 * Raw because the PMU start/stop callbacks are called with the rq_lock held.
+	 */
+	raw_spinlock_t lock;
 	u32 type_idx;
+	u32 start_count;
+	pid_t owner;
 	bool ready;
 	bool visited;
 };
@@ -121,13 +131,17 @@ static int gtrace_probe(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 	int ret = 0;
 
 	if (gtdrv->probe)
 		ret = gtdrv->probe(comp);
 
-	if (!ret)
+	if (!ret) {
+		raw_spin_lock_irqsave(&cpriv->lock, flags);
 		cpriv->ready = true;
+		raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	}
 
 	return ret;
 }
@@ -137,8 +151,11 @@ static void gtrace_remove(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	cpriv->ready = false;
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
 	if (gtdrv->remove)
 		gtdrv->remove(comp);
 }
@@ -481,6 +498,7 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		ret = -ENOMEM;
 		goto err_out;
 	}
+	raw_spin_lock_init(&cpriv->lock);
 	comp = &cpriv->comp;
 	comp->pdata = pdata;
 	comp->id = *id;
@@ -692,6 +710,114 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->ready) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (!gtdrv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (cpriv->start_count) {
+		if (cpriv->owner != owner) {
+			ret = -EBUSY;
+			goto out;
+		}
+	} else {
+		if (gtdrv->start) {
+			ret = gtdrv->start(comp);
+			if (ret)
+				goto out;
+		}
+		cpriv->owner = owner;
+	}
+
+	cpriv->start_count++;
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+static int __gtrace_comp_stop(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->start_count) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cpriv->start_count--;
+	if (!cpriv->start_count) {
+		if (!cpriv->ready) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		if (gtdrv->stop)
+			ret = gtdrv->stop(comp);
+	}
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+int gtrace_path_start(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		ret = __gtrace_comp_start(node->comp, path->owner);
+		if (ret)
+			break;
+	}
+
+	/* If a component failed to start, stop all the components that were started before it */
+	if (ret)
+		list_for_each_entry_continue(node, &path->comp_list, head)
+			__gtrace_comp_stop(node->comp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0, err;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		err = __gtrace_comp_stop(node->comp);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 562cd1eca162..77b2835c1647 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -295,6 +295,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	U32_MAX
+	pid_t				owner;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
@@ -303,11 +304,15 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID. Returns a nonnegative ID, -ENODATA
@@ -317,6 +322,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0

