Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430874;
	b=dArF1+GqDk1kLqRCPPCm0PJWBaw44hLRkZYU6UtX+pzpowUj5jmk5WasFwTpN6JgjtGD
	 ahUojgqC4jMJZfbwPW0rG9+U4t5rc1tnMS+NChg0EAAcmdzDv9Fap+EFMpliHIhTH5+6o
	 jOuxrPZ1Axn7NtHJCcrKTUbGGIDFt5x+W4l1YJBR6tPAL1SMkP1K2d8IH9fX8/FUWcSJu
	 6RXLGDVOw40syvU8dRo01zXw6+AIdToiFT+Y5mPN0UYGj+bla0fjznxihUfrgtBgOgdSc
	 sAdHCrys1syPHLpyYbGrqe9/hu+924+5kg5SDjAEXGctdzX8gAZcbhXE1YzUIhQ18FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
	b=eiRwU6FDVkVfOE9iJqXOgWPzBljd5di7DrZZzW5fDRJc88S+SkzLL+J2t95aFJgPFmBn
	 YXeBBl+7s7d3nm4pD4j3owAjmM8U4mQr6epHDc9usRh8WocTEJDQe94+XlP+OWiYcaIqC
	 gLTYkGu+BrP5yzZ7EsxwI+3SaMnNxVdfzA98nR2lnx4mrc4foyiTHlXz9ukTGhQTt1cjT
	 GxGmDAkan18ueVe0vjQ7lQdRIdvtUtiv3/aonH+YkHza7Sh746EO5DbjhBImIFWkbcfH9
	 v3Nl4bbqY//MDCtDSxALgZLvsqMB8EJJ8c3XR/Qtpks2iRhRtJ1y8T0+/uedJFgZOCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0484606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0484606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SvUx0kdM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NO3ouOOM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GbRW150222
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZkJ+rVwIQ8v
	5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=; b=SvUx0kdMi1jka39L9W8Ygx88qBU
	NqPK/oy1EnLsd6SqYoGFnI6S81lXgfRHWu+xA370ukTljdIusnvbfPgXHePM3iwz
	7wbwZH+fOz4CYJMuTFpTfOilqY9srRthsQxJSTPzRLvprmC4b4nyxhQzgqiy98Hb
	uqjEqJ1lSs80d/1U9IXQVEWFFxcIDxjnNSClTQewUH6W4xtYFOpV1sW2mxQfMvnE
	ZbM6cZinSO4G/Fr8cO5I4UTPyPuz7x+puL7iqV6DmBXKtyFo4d/xluFz57OvFIYq
	Aa0wNiyDsuxTT7ALOh9qYpf1byG6SiMwjcjTogHTd3Iu7DzYtv/Kf2DfKHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk69j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3380646a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430872; x=1796035672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=NO3ouOOMsGAKQqxhs+kP3wMese9Vw+36kTahtMRgUql1+Ipg5oqxJIaRelOEjdreAl
         XmR+le0UZldZSwyY8WJdwl/m792t0NYqvcBX6m0E2YaOqvS3AwtUS8W7cF1I0sRvGRVu
         9vgFlXYvD2WuslI9iDI4SnZ2fgo0QRFsuPWy1sDY4Qk9ZApvZqwUcfFB4jiDzXviTKbG
         Qa42+xteBWBJwPezLIWPYAMrIa6OUOXKzEMSkup7w916LBDoCH5Dg63mNG2Fduq7CT4p
         E0O6+ut5H/KwSN/Q4cBepn9hOP7lzjAtNQBS43XN/6mgLll0qavESVL75GO7SxTV9OC5
         XZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430872; x=1796035672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZkJ+rVwIQ8v5aYjaoNVB1DBIZS3pCEeLSUvciBoYZ0E=;
        b=zrEhqyKPX9L+DuLGNnbtJ74aiy4HRwYZRd+OadTLA9YYydXLbAn6cbxqoG6/4bABg0
         4Wtu3sGUTUpXNUIgo4ZjwkumEFyOOoC5seLqaD2CISp2xn7/AEP2DM5vSkDOybOc3bZo
         c108Ep9uQx4iu2Ebwd7523KrVkuh7060Cgu/gW7yPCgNiW3XaEJ7SM4BSLWPscSzsBYy
         2TdO99NbiddOP1961BRB1D8q8/B6Jy8vxBiHwe7rj2AieralFy81ZRBKAEoEo9KOKIVf
         V3X9W/Jx+8ewXU0MDN0li0GiTIK0L0vk4ThHfqnItTU+IybU7420bA2Mz1Rw4PC5R7K/
         54ig==
X-Forwarded-Encrypted: i=1; AL+hErEnv6TVlGZ6aE4tRhfBxLoJogY4vVKdXZCqtDkfn3Km/sP08FUSIdVASqwgeNQXcy4ghEGWym+LQvvHAQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DGhADDtLgDupjkCADUbRijTK5raRuwgXJfYdgRtcu4nxJ/nea
	Znng7CTzZNx/28SUu1ikO+p2fzEbc88m7nAlPsZpXaBRn57uJiSNRe8Nubk7bMjbxdy9kh+HBvA
	qjr87L3mOFfOR6pl2iUrY3g2pHt6zGao1FDh0iKBcFt/TAjiZekckQT3ZqF5kjOJTI7u9TBA/No
	I=
X-Gm-Gg: AZFdTZcgZep4Sbly6RCggWZtJpltJZ0Apxgi2WSvrYOtHGlHjqilk4H6CMGyGMz5+j+
	x++yu5OAFyA8bioPa+Xtta3HIk/L2cgl0MX2ek+OqlOYyv5CMh6luR4w45nlxpIlPpMiJNcd+FP
	wJF+tw4GtDiSW2cxit7h8wm95h70Au99J4LO4u6gEuz8Vr91VP+AN+jwSDaMKDlLF9XNPMVsktN
	ZJ3LZCqIAmfJWvHNQ5A+vH7X8wXUFY0hGHh94rgmd2fkALWjV7qF0hDJTuVaeAbda+b7cYCGUik
	ywKHT7ldrZMCnIeoCAzBrF7zs2jbAFJhVVKXsNfOfgKHK8TOQ5J+Wh8u1PZGdD2IF4b3X5uP+ES
	xEYglsLqUBY/kXtper9txtD+1Hrbi+GBLdlsMgzLLbfed1QI77ehnTz5+ON0S4rbHH6XtX0MzsM
	c2dqZalg==
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243524637.57.1795430872461;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
X-Received: by 2002:a05:6a20:258d:b0:3f9:9897:4bd with SMTP id adf61e73a8af0-4014da5de2emr11243503637.57.1795430872028;
        Mon, 23 Nov 2026 02:47:52 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:51 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable balanced on failed resume
Date: Mon, 23 Nov 2026 16:17:18 +0530
Message-Id: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mhEaw9kfyBwSwoP2yOOcGFrNmO3sK505
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXwUjEa8DCzWHY
 7Xd2ReA7FSXndGSCGfiDiNpo33gMMOn4Z+Pd6kInZ+XFtm8qY7c9sCb5nASSKLTJA3wv9bI53IJ
 wDsF2hjapM1ldoy2AK6MJRjS7nRz5hi7ireFuL/HBA4ZU+G0gJlDeorO9FHxD2+1V7VVR6PGE7X
 sxOsZhO0+2YLwlAxhFKdPnAU9q55MKY72kA6WOT2p7PikPyML7DWu/Kbm7ibCOWAE/ckq8Y1iAB
 8CaNfShfEjS1CzHMFg/M+wvXldAuRPLKttMcaR4Wo9dkkzS2JJ+KuKwHBhgPzlXCr4ukh9dEeNC
 +vvWjHscyzZ+iapebPy5r1a/xn8/g9255zoa+D/hT/5XPdfljTHATzdzivHZGMNkm4n9XjyUw4B
 oxXccQNpbkI+e9V01bk1wsxA4/QYMoRuJ1tFm0+ynPDeXoetqK6H6B5R9lqWmwgnKFm5SFjgXP1
 1VoolCoh8cRbEMRhLyA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0419d9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=zjLylsKXzqFT3lpEvI8A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX1VO+asEOjBIv
 f+BzVFE+uUeQBbVuKEP7LMGNj5GHpwlMNj0YeBV5V4VQUoyW7bLL4EnSQ4F9AG3J+E+f7V/66Av
 urIghX0ORMzgqhSoaGvpZb6n8F/xh9U=
X-Proofpoint-GUID: mhEaw9kfyBwSwoP2yOOcGFrNmO3sK505
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

dwc3_qcom_resume() disables the wakeup interrupts before enabling the
clocks. If clk_bulk_prepare_enable() fails, it returns with them
disabled. The next suspend returns early on is_suspended without
re-enabling them, and the next resume disables them again, so every
failed resume leaves the disable depth one level deeper and host-mode
wakeup is lost for good.

Re-enabling them on the error path is not safe either: the
level-triggered ss_phy interrupt can stay asserted, and the handler
can't make progress while the controller is not resumed, so it would
fire continuously.

Track whether the wakeup interrupts are armed and make enabling and
disabling them idempotent. A failed resume now leaves them disarmed and
balanced, and the next suspend arms them again.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 18db19cf2065..e7fadad9a4e1 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -81,6 +81,7 @@ struct dwc3_qcom {
 	enum usb_dr_mode	mode;
 	bool			is_suspended;
 	bool			pm_suspended;
+	bool			wakeup_irqs_armed;
 	struct icc_path		*icc_path_ddr;
 	struct icc_path		*icc_path_apps;
 
@@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (!qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = false;
 }
 
 static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
 {
 	int i;
 
+	if (qcom->wakeup_irqs_armed)
+		return;
+
 	for (i = 0; i < qcom->num_ports; i++)
 		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
+
+	qcom->wakeup_irqs_armed = true;
 }
 
 /*
@@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
 	if (!qcom->is_suspended)
 		return 0;
 
+	/*
+	 * If a later step fails, the wakeup interrupts stay disarmed, as a
+	 * level-triggered wakeup line could otherwise keep firing while the
+	 * controller can't be resumed.
+	 */
 	if (dwc3_qcom_is_host(qcom) && wakeup)
 		dwc3_qcom_disable_interrupts(qcom);
 
-- 
2.34.1

