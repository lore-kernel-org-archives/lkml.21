Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601977;
	b=ejhP/zyIx7kVF7sKeGabd+wrvt4W4evSdoNNxjmq222A4uIP5zyL0V7a/9VOfUr2jyFd
	 IQBjnRwTJkBO6UgHz4qG0hEnHkxOfVDn7sbxBJBvf5cXCEWyv8UhBTTecQt0fGYBSV3IX
	 6ygPJUgJ9SN2xfh3K+ahh2xtxo4faJIaDAbL8tTsPt5qHliX8PxosIYmH8LZaOcbq5GXy
	 YwnIzj9Cua79CMw8KVavuzR8yAOgVL92c22AVOnfO7bkjpIHNIFLfvCV8JhngIQFHXpEd
	 N+d7k0++YH4yvRWqm/jUqMfmqBSC+BmG34+Hfpc9JrY6aFvttFrb09/6h89khx+C1Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601977;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=rX4DuslT3LaxAdW3kiRDtz6zvRiG/FzTDvxhMsniXL4TOc3f29n9Rt22f1ydXvyvqN+2
	 7L6jf100UunCXTqh/mj4aIhmwk6FRtciF96ywbxdR2FcLVs41j10dntNkMLDhxzJM8Nw6
	 H7Xd+4u3Vx8WDsTdM1W/kDPayDpl0IkprVoeuYzBthzN20YkNp//Rp8bjuryzmhf6idki
	 9xsiXBA0O1Fplicc2B8YkE4mQSxIbfggEWpjFWi1O6JxATElYBrwQiQTbwTcrcTaYVZvt
	 4olXfjkva1RGtgIgJsu6wLYhN3FsJihGRbY2oSnSZx++aZ8zq8SFySJOQRP7QvGNi+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771BC60A262E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 771BC60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BUqvqEhC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bqVbrQCS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mii53642223
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=BUqvqEhCsOj4AdGB
	Dfktwk0NHcI+gwD/hO33KMhCdaTlGG13Cpb8+CArmd0+hHGBTh7RbmKIELgYsiDu
	eSCfuB3DiWDPOuh3tKu7NkJKZssBP77I1KMvoNRGN+sUkpTYcrxlk4lyjKJmKk5M
	FLbzp8jaLTI5K/PPqPp/5FQ9Z+9xuTEi/zr18deOygnyxXqYsmvjVGSwlIjrFNoh
	8JENEuH6u3Dtte1HURIn1CkvoVpURhonrNEXt2sDuMzyoa2Ynms42BFIN5g4WjFQ
	3o5IgUOEjNVoCex7eMmva6dujZrAPmzgjsgw76WtyVsBTn+4yqy51VBGM3RKgCqB
	hL77Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ab2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so154744585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601975; x=1796206775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=bqVbrQCSv84uqenS8LEaQJu5xs/wRXNyd+J8kzVmW1vIP6EKAVjB+Qye1AXaNZZzL+
         DMfTB3+pa5wTw1qEuNgDvmYmK8Je+Pz0M4OF7C7Xybknnsu42iW93nI2J1ygbPhYl2/X
         td88eqC7mg9fKIuojZZWoJFz7qwP5ePbCfPsbkB7h0xWG0lfumxKQjJIsrIv/nXtvdRr
         QwIkSNTshUMZVqj8SCMtAaBN3m2y5KEyi98I0OaNUI45GwLljH73wqsAQ24h5/jar2LS
         08jDTntLD2AMwnF4B7MpqF6Vsw24GoSdan3nwykf5j7sdfkmZHGtR5TPzVRLRyFBw13U
         m6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601975; x=1796206775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=azqa+a+GKnft5keH/HOzwa69zWfcG/0HvAe8sr52riJTba7oyUnYCDzeMJa/x6MJRY
         3yA/umBpLelf1Rd6oua/JWJO9EM1lPxMoK/w0L4Fdc3T++yczLzdQ5ZbXunHiBqmDfkQ
         s74suYYkNtWINRADEZu2NgA511d99viJ6cZeWvpbJQdAuS+AfJRRx9KKNpE5Svp/55qe
         YweRBrmWfBr/zyZiDRZMeEVdMV330XIZqvYA8WPteqmLeWgTQ9Fe/ViJ/r+T0FO4dik4
         INfRT6ejP9znu4h4MoCxLUJ35WD9uB2EWP4c65Lxcy9t03di9Ty3wfkppkvPq/Tq8NM+
         x78A==
X-Forwarded-Encrypted: i=1; AL+hErGHpqZnS/z71ej/icTEJQUHYfrGFmADARpa2MIlP3qMkuGkcAC1yZDy79RWF2ph3ibGdFcqfRe3vIDTfsE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+Drxn4sQfP+adq7yLaMNKcgytOhMLp4AcCg/HkgrLpaiL/FsW
	oa0r0KHbYPYL1omjqB7DdsQ/61b5/kIkyOyxOPaU47OQ7Ita6hVfQwS8RmbleSGDCHoH3C3VTfe
	i28dnLayA/Z9yWUoPAgaRCNuyd/V3idh1+i/B20jMzJTdYvi+nnonDeVVMuKCKyzzM9A=
X-Gm-Gg: AZFdTZeAXW3dz9l/wcXJPPgfASsZ/P4EQT0IbpTPtFa2tWXKJ4eMeSz2qA4+dkAgTu9
	salpIf29o05aGJloZfORTNJjNyw1WHWQYylDgs1rDwIQzmeX8ea439O6G+hCk4kMinZDSDAEbc+
	0MJXB/fx3w+pkk/QQ9vhT0yXR8TQF+XAeY1F4nThwTSb9eshyTZ3dow/3ipzskPRysXNTMGaxb/
	qYqUE+K/nORM6akEDf+FGtNazYXKEWDdu56L/e1FmbS/d7qnQB2H4KO9NWy5uf+/VIg8kxJaLer
	PYlnQ8NgxqAr5G7PJ3S/OoKyHSJ0GN2wpWSrhPuc6fgzRZRKsWr2y/AvSzsw46oLSrHzoL3W+vH
	X9B/ykje394P9HuUmsLbr3/Zi1zezld/GCktEgAA2j8wVe2SV0tLk3g4uCR/tReMECL73CA4hoE
	WI/bwJIBg4c6LkfSd9g4Hc9cGEeQTA2CXBW+uK7yIqFsSJuEsfb5WOFEVuie2myizee0sDobgDJ
	ensGGHvrOS9vKNgKqjtJL3yGxQ8
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742284685a.69.1795601974915;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:949:72c3:def2 with SMTP id af79cd13be357-949bab78ae9mr2742282985a.69.1795601974439;
        Wed, 25 Nov 2026 02:19:34 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:29 +0100
Subject: [PATCH v2 5/7] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-5-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b637 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _K3QI8l1w6wBHNK2Rx0sXCWqohioLtmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX8gHsCPR/QRix
 jxKvKZcgLC6EcX01DZ7R50EcG1vLpyoo0scLfvPMd5gd/mXlY1mHu5EnCadVsGHdov2AFLCz6dM
 iW1XsRJhkG99oCNAvyvyioeuP1nGAnL0hY8U+fDv+e0XJyyQuZjXiAqFghGYXGZkgy/9xOfZjWv
 uDb4Ym5TZF6Yy023yyVNMZUbTmP41OXa2YZtqPi4nRGFq+Fivsg/PUhesIl/FpExZP5yv4G9ZM4
 N2G6RrcuG4NnY1zS130aoaZWSsRfkcItN4oDEWDd10qvjUk8cS2VxqdgGAEmRUyCl4YJqQnPV84
 iu3FxYH+Rr1Op7z2jH4zxe6ZwKarEKCAbiyAcVBIuvKBnIg4ED+N8Qzep8j2G+MFnAWGUb2aBuN
 iTU6q8UTLNp1BFY1e7AqJ43QOFgL8XIXCAJV3tT3Uvm+FMiAusXsVuJVo2fh9ZWatAqo7vyGYTN
 m4jp6q9IwI2afnoIs/g==
X-Proofpoint-ORIG-GUID: _K3QI8l1w6wBHNK2Rx0sXCWqohioLtmY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2vKKOcmRpRwb
 swmIN/mX5aH57/X7eJXYag10Ta+fqAvNUNM4L0o7qHTmKkEM9uzfgBJSIBZ9GM5EN0EEUkx2ak5
 xdPzKAs3WzU2gnBIiViQfMB2p9+JE4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

