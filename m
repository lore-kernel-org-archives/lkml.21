Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601974;
	b=goLjfBG0txjSohv/UbLwtdJGwk0plFBD2JpPfamAaRklG5O2x27xntJcY8k6IAN0k1QV
	 U6TyyM9FyyO3yHD8j/FJFxsIAM3C83PXIA4ZMe90Xj3JTS5FcoW0T/8jfgozLosPQCCd8
	 4XDRRmWLd+UnXEKUFyqbU+pO1EiNjec66yMb8nG65daehV4oskIfo4Oh7f+Dyc9X0beT5
	 HAr8TSvSthoOOwHpQ1A6g2FolDizRFFDfkQdqfq9x+80PCJpC3p/3hy9Dp6HelE8XWHpD
	 6w+LJjt/keJB29hwSR8Ftppj4Ul//qI52ygPjsKgZ+XfVkrGsSRMrwmRGfAXJufRZWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
	b=f/6hvxCC3AyDCDjtQWAOxRRU19GraXUMQFmQ1xNq4p5KyPd6TV+5C685Bdv8AxGdps+1
	 chXdaV8JYiwX1IOX7OpTVeK4amgSlg85glH9+0xZ4DseCPUbhY3iJoD9YKb6KuCMACGqU
	 JU0CZ0Y/0d9sH8wL0dO+to6eAoolqEBip3NwfQXzMk2ZE6FIAYgFVRt85zH1u1yBNSBV/
	 S4gl7pdpbFcSqesbuwsT2sa7fx4Y54j69KmpTO7W+gQpyOf4PO8FWPGPL7kwAKZikVBcb
	 BmBoNr3fBhrDcLaFnWKwaIdaFGys5quprZnEaPQ5XQ02WrMjhhB7a5dzC30uBRnqo3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxC6Muyf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEMfHjkS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D9D60A2608
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D9D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GxC6Muyf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iEMfHjkS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mS9H3764057
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=; b=GxC6MuyflReSheIW
	DLemYoZUTqvt9cV7Mb6XouThCA1aozn1UWmjLkc6461LUwr5QR6F69f7vJ+E/Ngt
	RRd74cY5pDgivPo+VUbQcC/12+JYtlpEy9CundiDVit3fwIKq1F6nmAx7uJPc9nd
	Tt+EsTFRetUC21lW0sHgjwNquiPhFFIX7yqqyeBI/G6WSr7WJV+IVcrb2zZo0AXA
	q4QO/mnFt2bucoRRy2LU5HItVLiB7ve8Zny8prEyycjVsRzyi7HV2LuviSJHypEs
	6snYf1HEu0M909gfEKKa8sGdmF3F6nXbpkFqszJd61Co7ipUd+X/ghyJtD8RxCNa
	wt6sKQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2ra16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944138ed63fso367111785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601972; x=1796206772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
        b=iEMfHjkSD+8Zh+44Blydrp4ZdGC3Cs4t+ZenK2z5SOF7b0qeO7cGhptAD9sNzM8DZx
         l8W+Y+0vq+LB5SKQ+A4cvsDH2r23VmPOeSsBQN0SSz1zubK2fxfRarUJvUQIbpWt9eH/
         4Ai4JUxpM9dhUNRwq8FXjdUSEvyagKgaQD3wWs/WAaHKYaUNujxOB5ohU6/ksIisfLDa
         0qUowhg0GIitcs0tsvRNZnaNRS9QfWVKerZoxHPyizVlM/w851jW+h2+dpSvB5PnaEx6
         69SobvMm7xyl+yw7TEUMeiJsshsURnuY7xtjFE2MPl9ypdn7G/05zx+42WZ/HLkcmkim
         9wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601972; x=1796206772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
        b=aRV/kgBzrzftICMvcENBequ8nQkttSXiGh3n3ZHM3B9JEkGIuBusBmbC95gQEwRR9E
         CDpBm6zAmLzzHvJqxflZgppCTDz7BTVaE61NhYjiMG73zaq0huVdv5xOhqdV7hNGnOMN
         4HM3TELUqWy9na25xvtoemHUdb0ZMWd172h+HooiTOGVn+82bAaw6AvOgtJ+U1OxIW8j
         8QAkVYe8Wk2W2ttMI5/yawSEz0MwCMs+jfDL0yYaQeCVXUDOhumjmOHscdQbkewlKSyY
         LthcSyTJqdAcYyettnYR9pGdCUmkylt4t+xrrTU39VurQBl22dalmHEEw3PwpGSIED8Z
         vK1w==
X-Forwarded-Encrypted: i=1; AL+hErEpunxUEzYMBTePDIX38Vg3fr1TBVo1ZypT4FA+M0zyDUj1sn/0TgDWNFqB/fIqrmPxPfjIlLLM3Ju+MSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xH+RT3+FdsiEKiPAdjNzXA2Qf59Vvi1G6/NA20TuPfUqZtg/c
	23IYb6qpcQuL78FUmEuh3RhWIObgFBHFCCCzClt5oLeU6mq+SgiHj+vOadNw0xziMAWpNAxY5g2
	8HU/RLW07/jjYh/ujkWgdo/kUihaC6ZuFfw5KTN9UhowjP8EHIoBvojA8ctHh9aiO7FA=
X-Gm-Gg: AZFdTZcHGh/IVgarXvjI3GQyUG6N6s7Y7dRaafgw2MfTfgRnIzBEzIl7RHb6aWL695L
	XV2M7mFtrqSXUPVJKdZfz/R4xQR+h8Zb+fWQxAebz0+ipEHpBGkhtcmeNoac8g26r1EaEbJPatW
	vf39xTZzjychr8eVs8TvC1PzbXj3O96sT7YuT1mztvOQ9RaNGsoea9igGDBRdh9NqWtzA2O5+eu
	JpbGURnHV6JnHqu8GP/1kvQ8l7LRwbhTliLKy7Y/s8Hzj/jzLtdqK7P9nwW7IxDx/kpJG2tP4Oj
	oYS4J3ALtJk93CZ5ddjdLCY0BuDznWpuDMFLR3q4QRv9+IL0RbbTNTNGf/WcLsjlqQScKkDYoim
	TuCBi5wUhMF0NPR8qvXRMIQL8QdA1hGve/v7sOGJjx5duqCBn9rfNzQKB7Dbt+uCkbQDcigsN/i
	0efYGPwa2gu2Xbxf1vPFnqq/3Xk+Vfm/AgQk0xnHLtSencLwX6h0n8P5JG1+Hoeec/RpAlmcRWc
	KFOo60xNrDQzmxhVFoAcS1F7hnt
X-Received: by 2002:a05:620a:72c9:20b0:94a:8e4:ef1b with SMTP id af79cd13be357-94a08e4f9c9mr78137885a.78.1795601972473;
        Wed, 25 Nov 2026 02:19:32 -0800 (PST)
X-Received: by 2002:a05:620a:72c9:20b0:94a:8e4:ef1b with SMTP id af79cd13be357-94a08e4f9c9mr78135885a.78.1795601972032;
        Wed, 25 Nov 2026 02:19:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:27 +0100
Subject: [PATCH v2 3/7] media: qcom: camss: csid-340: Report the hardware
 SOF timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-3-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXyKlPNMqBXvHK
 sNuCcCeyFm0dtgZVXWj95tyF0Ppqlvnv6HHLXgkVnb7PLSp9qd6X1w1Z2w/O1YJC8vNwGHs7jGO
 wGFrD/zVXzWi4z31+quQPgSHQ1u4zYk=
X-Proofpoint-GUID: CnqI_jCfwmBXpaD8fOkG06wF9ri0YVft
X-Proofpoint-ORIG-GUID: CnqI_jCfwmBXpaD8fOkG06wF9ri0YVft
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXyyot3/3JRcVK
 hmG3B/OOBUgqfarfCXmwbJv+Jzylgz6wY+cHGjPyK0wogP+WQnvH/beBhRrEz7C8ZQ6oxkpYNhm
 ErmCt08yUD46RmbYS45/5wgDbPcG5VxFfs1h1xbFK1h1ro0FjqAx7Lh0hVJ0lwRzuJ2sP/1F6lM
 hy0GcTqyJl77Fldabwixq9skViy2/soBvnO8mCk5QdvJGDeH6PHWZHOjoipd0DBo8iCJM9t4OD5
 P26cSIB8jpMbe7XQ9Vdut7qFFLaAKt7eCgfsoSSFFqSTNH/u90DanL3oFf95bbOrWViZxwW+v+4
 pgTXSWK73cjf0OWg4SjUDTB0CsQEO1l0bS4TUcC9Vj6KViGPcXeAQsrH7RK/wUh0Biu0Z0cKgYc
 JD55CtcqNRvo6GtST5lxdFSUNTUW/xlvZyZS8e5jyGi/VPajeJPKFSmObCXuU60FWd59RZPRF6z
 a1NVTEopVCtodXQn+rQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06b635 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=q_A1cxkaZBfKfFhyi8QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

The CSID latches the global timestamp counter at start-of-frame into a
per-interface register pair. Implement the sof_ts operation to
read it, so that the frame sync event carries the time the frame
actually started rather than the time the interrupt handler ran.

Measured on QCM2290 that removes around 36 us of delay, with ~8 us of
jitter, from the timestamp userspace sees on a 60 fps stream.

TIMESTAMP_EN is not at the same bit in the PIX and the RDI layouts of
CSID_CFG0, so replace the single define with one for each.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d33f21930ee56d714f41911cc077..ec4b1d9a86fcf08c2ceb12b4c4c2b85b5c7b8e51 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -49,7 +49,8 @@
 
 #define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
-#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_PIX_TIMESTAMP_EN		BIT(1)
+#define		CSID_CFG0_RDI_TIMESTAMP_EN		BIT(2)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
 #define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
 #define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
@@ -61,6 +62,13 @@
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+/*
+ * SOF timestamp of the most recent frame, a pair of registers holding a 56-bit
+ * counter value, the low 32 bits in the first and the high 24 in the second.
+ */
+#define CSID_TIMESTAMP_CURR0_SOF(iface)			(0x290 + 0x100 * (iface))
+#define CSID_TIMESTAMP_CURR1_SOF(iface)			(0x294 + 0x100 * (iface))
+
 enum csid_iface {
 	CSID_IFACE_PIX,
 	CSID_IFACE_RDI0,
@@ -108,6 +116,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 								   input_format->code);
 	enum csid_iface iface = csid_port_iface_map[port];
 
+	u32 timestamp_en;
 	u8 dt_id;
 	u32 val;
 
@@ -125,17 +134,21 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 	 */
 	dt_id = port & 0x03;
 
-	if (iface == CSID_IFACE_PIX)
+	if (iface == CSID_IFACE_PIX) {
 		val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
-	else /* RDI is raw, no decoding */
+		timestamp_en = CSID_CFG0_PIX_TIMESTAMP_EN;
+	} else {
+		/* RDI is raw, no decoding */
 		val = CSID_CFG0_DECODE_FORMAT_NOP;
+		timestamp_en = CSID_CFG0_RDI_TIMESTAMP_EN;
+	}
 
 	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
 	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
 	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE | timestamp_en;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x df=0x%x port=%u vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type,
@@ -184,6 +197,21 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int id)
+{
+	enum csid_iface iface = csid_port_iface_map[id];
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
+	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
+
+	return ((u64)hi << 32) | lo;
+}
+
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
@@ -233,6 +261,7 @@ const struct csid_hw_ops csid_ops_340 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

