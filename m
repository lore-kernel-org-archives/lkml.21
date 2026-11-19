Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076806;
	b=4BCcC3Lf04QQ8P2tf7ZdRj74TmSBtNWiQF57EfRfwavIJ4REaN8jB/xZvutyiOrDkIFj
	 ChdTus/FmLJsb+LNSRp/vOGkN04GqDS+iW/MTSyGAhn/s/FA3ps3zQd+HFLBI/l1EwS6u
	 3WxKSnNLAIqmK1R1n1eirEItrMYgIR2YypA1GNWVliGWeevYs50JHBl75FV8Cr870Y+im
	 /1egC6ymDXjP+hDpv69d1d33fzg/kHVOqB5JN0ROGj8u0QA8sqtRB47AnIbYTqP2929Kb
	 4iOWaM+PMp+oU9yK/4nKuOQ9H2+L5Wn+I73bL+s8Zx0Z0mazNm/Tk49esa5bxSFzNzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
	b=zDKMXoag0oVLDvvTJl54TeeUy4OXTFhV+GslKNUGmMSTPtqwaoYXMfEo5FN3V/W+ubpx
	 feHn7x8ulA2yUA83EKnT8pcJtUxhkzHGW7+G3W9urNKWAVUgLo5I9MzW3Ft4hAVoXdGAN
	 sHer13oJ8pw0vHLtVDd5yEg4OF82jpQLnIxB2F+jYES5B+qYKPuuYsdRO4FXQuLGw5LF/
	 qmSCoVW2XscH/n9fNKFqcnUpwQOoNFpsGILCitvb5St/QZkvgfHOrAHvz5WJB94jh2TPo
	 I94qsGX9ms4uAPe7T/WsgpDLt03uxhAs33dTmNh5aiAGIGH22QtchqZsVRJnSLpqrHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWiV+r3R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgBKVTo0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A70606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2A70606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FWiV+r3R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgBKVTo0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6wGwn1534889
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=; b=FWiV+r3RZtlNKwfT
	1py8YOPAZSkDTk9EwoP6seWbhh9wci4VXLG+Yhql4WMFWgYCqW1RPcs2+/4hkpQE
	0iLmOgP3PMplG1FkwGSRW2GqoHtk5mBAjFHjJ+VUE+CEP2Ez1Vib+yLlrjApeX77
	KLtXo5BeOGbrkyXkhaZkaoP/yWrFPVm/dLvGOUGCiSsmZu3PSm32og8V3u+Erf/o
	9zh7at3qP2y/UJyn0y9TknF4+nTqvy0mbDJIDzSUYvMdbEfd8lNXLORVl2CKeIwz
	ZdUw1/Q9p9ESZUldTslRRf0Lpg6V4P0P5CFd4c0EG0R9l5czLVKe6+GamPLiR1jm
	6vQQAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcc5xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:26:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210ec7cb34so3850956d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076804; x=1795681604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
        b=XgBKVTo0E/d85n5nMEcW0Tg21wqoL44fu2Ve02YbNeQigm4JLzuVoBCLM/V31CWSzp
         ib2N5M+CkbasJ8dtGS51zc8CUsyEqV1VXTJ6Zx0shPqW/hkxlgZzWnA2tjwKZltgQEqH
         OL42tX4gh/CarIQMbwevHSZ5Do0QKywk8/xVLbumgBtt0/1Kx1atnzIiwXE1TYWv3Q+9
         DKNT6X7d2FyyVL0od9n6cXQxPHu7ninb/U9I9JCq8o9i9AcTx2O9dobV2KAS3V5T8GuD
         QHuxYbIYw/reTCcKdvrzNXpsLQpRqG9bx3l4RumHsaApvFGNkPRuO+fF4Fj1jCga/bdG
         AMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076804; x=1795681604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8GWse/FZkpHqoIzSRRy90QZ23uRt1u/gc+qU2cET1c=;
        b=FbaX+HBlCy5/Fg0PJ2GKuhjHnQijbKWTWC+/Yc+Ms+v751gfEtWT76kVK9MQAmUFla
         u6CQFBBLO/Y2WEpT932jqc72kdd+BK9ZCmJKrYdqWlaHq0v6GvRaYE0QzWpjx/+MtQqK
         kBBKzHAS1WaN4mEdRgqSvhpR4bkHST/OYkWs4a93SQTD3XgkuC4W9OGW31WHJqwKKOn1
         dGai2mJ4WJguwzAlZzamAL/8N00U/S5MJnK3740DC535ZsfydjBV7o1IETMfcRnmV2ZY
         MJ0vSaMrMRsD3Ogr0IT6Jbj93vsDttdr0iPBkICGr7jUMrMpcXq0GH2jdJPA+M8sxpUp
         l+9g==
X-Forwarded-Encrypted: i=1; AL+hErEcrvbRnwZiDIPrXqq2NwKMfnuBHuXGIoeuFf+o7pUzymmfzXR/5FIFgnxzr6+wgrIglVrmJrL65drks+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mW2WtXwb3LKzxEodugDuAraWGHqOaJ/g4tsWZHxZo4l1NYsYG
	DQFMlP95xBiX9CJ/FmAzgx56ZaZajZLuWlS9P7yPiMF3TnqAChcuwEUCWv52qqWhoT7QjNrJL8M
	gmJwv7usker+z6HzT9W7VZ19i9ObbmzKhtpW0v+NNEEF09aIYf/o9OMdcwgQAat2Yivw=
X-Gm-Gg: AYBFou2qtecyCIH8K3OANjzINbcs4GwYeAjhTAghCPoekq6NHzHSiCuEcwxs+LkHAKf
	FMXelq/EwtHol73/BzFn3HgcAGvWxUc5A/ClJ0QgYxDRiVAHcpbX+1LFgY6n2rYm5FVOejDBrP4
	kbDeZWS314ndoo/ZTjmf8zGvdJdWzFRB2qrHx4vz7a3ImsjArJhfzQeejdoVl0Ed5grnsFuQ8Ys
	Feb1HBV7hxie6ncEOTvC9S+932ZEAN1Cpvbx0Lxd8i78IVS4C9U9lKM9UPpE6q40N4+sPHKaDX4
	95JCUbZYKJll6CSFTRBQ2YC5YXOp3eUGnNcAcQe/7DJDrEAX4GQJrj73zQz9n/2W0/bUn7boF4d
	/L99q7lqkWUB6FCt6u2J2wOgoiwoOzxSWD45DAzGIdgpMyGXALfyF/1NoqCIF7HDzsuenI37JWS
	hfTX7VCTLygUVe4Tn7ktjkmue2JQR7r16Qz+Vi
X-Received: by 2002:a05:620a:1d0e:b0:93f:34c9:9248 with SMTP id af79cd13be357-9499971d885mr862086485a.22.1795076803855;
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
X-Received: by 2002:a05:620a:1d0e:b0:93f:34c9:9248 with SMTP id af79cd13be357-9499971d885mr862083585a.22.1795076803407;
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:26:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:28 +0800
Subject: [PATCH v9 26/29] drm/msm/dp: wake threaded handler for HPD IRQs
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
Message-Id: <20261119-msm-dp-mst-v9-26-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3017;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=1XWb8mR9FYw/3EXAUOxkw/H8bP728zpMqkwMJ+1kf7E=;
 b=5Le6Ow7xDjp7G1d+34n2dhDxOimAVUJpPTRb+B7nB643hXwWmX1xNESzkxoim+Af4c/zSgvct
 O27nfarjCEMCTfn5Y2SI9LsyEWTBTnrKBPfNUtkUhN90d0gNTgbDjgE
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afeb2c5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rr3H4PImTD0NAioKu5AA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXx2s2Xin+aPHn
 XsywaSMYDdRT/S5SBCMmXGz3/Z5VIleRwOVQw/ZRjjhTFAfepKM6bX/lGTylnGZq/8qF6AHR/4U
 bXfWVr507RTAP5McDdcPULPTCooV/aJ0WWROdS/AQfnuYtlL8gxY0kKxn81EKL2mnYjePs+Odp2
 Vu0wMPMGRh1lKewgxgYhGZtYcgOBkoKe5xPvUQWgYZcPrrz/lPXBr9348ojpfBcpqyOtPN/bI28
 Pqi9+C+Km/wje9oIRcYy/BTfgy7QA69vvjs7bBiMZPNenAno5nHqXGBRoQu23gXhgWkOU7sfTKg
 nKjMfILrycN/nqyefHK5mwn0rDGbwcPyfuv5XoP6tA18/9v7I0Y+fB+aQuZ8CwlkX/R3fv7GkBT
 GKF+j/96Hf2xiSHB/8znu0/TpRVNCpqv5C7wKPvEl5frcJM8P8RpzkFXfUOFXrU8IZ0JkAI087k
 xUJh3M/4r4rDTfibfGA==
X-Proofpoint-ORIG-GUID: Ye3WHenjPfLZv2RAh-6FmSZo2YbQoW8w
X-Proofpoint-GUID: Ye3WHenjPfLZv2RAh-6FmSZo2YbQoW8w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXzohLjYHhUyhS
 GohQxSp8Kb5oBlsFWdIiQpoGXsUAbnqYtsl8rCxm03c8Y2PwKFauc0BxLwHclRcLedg3XguoJHn
 lCr87DB1eQ9OvHlL5RDt/oHGmWnukQY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190033

The primary IRQ handler latches HPD status for the threaded handler
before servicing DP controller interrupts.

When an HPD interrupt was pending, the handler set its return value to
IRQ_WAKE_THREAD and then ORed it with msm_dp_ctrl_isr()'s return value.
If the controller ISR returned IRQ_HANDLED, the primary handler returned
IRQ_HANDLED | IRQ_WAKE_THREAD instead.

The IRQ core wakes an action's thread only when its primary handler
returns IRQ_WAKE_THREAD exactly. In that case, the HPD status was latched
for the threaded handler, but the handler itself was not woken.

Return IRQ_WAKE_THREAD directly whenever an unmasked HPD interrupt is
pending, after servicing controller interrupts in hardirq context, while
retaining the existing IRQ_HANDLED fallback for non-HPD interrupts.

Also report STATUS2 interrupts as handled. msm_dp_ctrl_get_interrupt()
acknowledges every pending STATUS2 source, including sources that need no
additional action, so they must not be reported as IRQ_NONE.

Fixes: 5043357e75ba ("drm/msm/dp: rework HPD handling")
Cc: stable@vger.kernel.org # v7.2+
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 3 +++
 drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 8012c3d47711..bf3f1b35abdd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -3021,6 +3021,9 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
 	}
 
 	isr = msm_dp_ctrl_get_interrupt(ctrl);
+	/* All status2 sources are ACKed by msm_dp_ctrl_get_interrupt(). */
+	if (isr & DP_INTERRUPT_STATUS2)
+		ret = IRQ_HANDLED;
 
 	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
 		drm_dbg_dp(ctrl->drm_dev, "dp_video_ready\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 6f1f9dd3660d..ad8c30a8ea79 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1091,23 +1091,24 @@ static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 	u32 hpd_isr_status;
 	unsigned long flags;
 	irqreturn_t ret = IRQ_HANDLED;
+	bool hpd_irq_pending;
 
 	hpd_isr_status = msm_dp_aux_get_hpd_intr_status(dp->aux);
+	hpd_irq_pending = hpd_isr_status & DP_DP_HPD_INT_MASK;
 
-	if (hpd_isr_status & 0x0F) {
+	if (hpd_irq_pending) {
 		drm_dbg_dp(dp->drm_dev, "type=%d isr=0x%x\n",
 			dp->msm_dp_display.connector_type, hpd_isr_status);
 
 		spin_lock_irqsave(&dp->irq_thread_lock, flags);
 		dp->hpd_isr_status |= hpd_isr_status;
-		ret = IRQ_WAKE_THREAD;
 		spin_unlock_irqrestore(&dp->irq_thread_lock, flags);
 	}
 
 	/* DP controller isr */
 	ret |= msm_dp_ctrl_isr(dp->ctrl, dp->panel);
 
-	return ret;
+	return hpd_irq_pending ? IRQ_WAKE_THREAD : ret;
 }
 
 static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)

-- 
2.43.0

