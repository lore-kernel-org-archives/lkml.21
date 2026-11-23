Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430890;
	b=yFWs30k/2hWeNWNXwjhlSbcyR8Nkgrw8nMzVK96Q0XsairPFxHnx8B292vd85drBwTBL
	 hpjNBYMv85qa+Mat84kFph7uRLy1hk4CD2sWR1Gq3/HT1xN3pVPz5QQ1rTLKeT0REULaT
	 XYjmHfHEeA42b/SJSs3GZUyK7UB5qW21MDgjXHzEY1+Ac5Q4rzI60qOcyjQ2T+v1IsWMW
	 fyaCxQ1BX9WE7LWt6pKY2jGzkpRwHO2JOylzIaNiFU1hIHnKcBbT8GbQYwHTMP03HRHMG
	 bjL9CaMDdl0Q9DYCeUecXjjLezhfxld6Uvx2ysXwRzKNmcL38B1qLvdS/H38cXc2+8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
	b=Zd+4XnEo7bBBxinoHmmPDqYy3E+H0mXElbZt2OqBenbJZME9BvGEEXjnysJIZ4A9Q4XW
	 D5jvenZH8td2yBWzNxV6lAX2SZ0xyNAR+H1udGIcnhMKAxPz9Jg+6rzKGCA9OXWaA3fvF
	 0S12MPw1ThfWqMwbdtNdf500XLbhzFEziBR3l/oOXxLsHwk5T3AiE8LxXJqYuGXuatows
	 0Ks1ff7DXgpq6Bhwu7KyKuZeMyo6hCGyjgq+Caekaymp4pk9WhP3M43YJ7SQemx43rXR3
	 Ev8pdonV6KyGOpFsGon7jX7XYCZ6AQ/2gsLbeaJZvpuWSWLOIvPTFsbL1Z5bh+1E/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zd/uHTvI";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1212606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1212606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zd/uHTvI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PBWMIW9d
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IZtY3490943
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e4rxHmb8Mfs
	2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=; b=Zd/uHTvIdICT+UPLuXyWg2CSkE6
	82I3JHYoho6ZjBGRlAy7vgPsHfLI6PdSg4uz34ZCfwunmd56MRrb4z3SaPovarQT
	p9amf4bbJWW/TgokESA+/G5RA2WmLvUgJiEL/bK4yhnA6YUwDjwMPMnIrvLwxodJ
	MPVDybGz5UtSmb0DKKBFVDPJhS44LJcvmRLci3CbyBf4jNQeETkhEEkaBYzLMn3p
	pgSTmkmWncJFwK+Z9TDbLNWJUtQLohQJEpuu2zw0AAW8urVyPRyxslFXEqknYzJC
	gCBvRaAYMEVLpFznOqaXOapa2Koc3iFn/w8tIqjDr9gvBUK+cKlXWAi/Yjw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsh7gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:48:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso1498792a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430887; x=1796035687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=PBWMIW9d8wVVMtc5ke71vIOwqGX9EL2Ohj9DBbwULHGwKI0oYcBQEKEXS0lyliKNxw
         00i+Gc9Eb/K4Jj5IaR//NQs7eqFWQj/dPy/2p+UqzgoCgNSjKKayDfn+DMmlJaVbRzRS
         WbxkE6+CwknrIEziXzuYRyIJ0wtb9+XQxYOpYBS5pXm/jN/pHvz12d3iZOOQaiunQZ6R
         XXA7BFzlIZ97T2xagjxTtXz4+rsgAh7jpAN+9Q2Q6mrkVmxHQjpqh3EMhDRTqQFTKtE6
         onDEvVzA8Ca/ZxYcUmYuw5Gus1drooem/LV7Rsse8mEPvaP6wVuezAQQ6K0r83Gxsx9u
         3VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430887; x=1796035687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4rxHmb8Mfs2V5hVWMwOEeJbVf4uW1Vk+cPyv2Fzq44=;
        b=xew49Ht5FzYLMH6TI0mrWCP8mDD7JbKY0XDUEy79wSnqMlg34BbwSzU/lpGsVfCBOy
         PmWd7Nm3BcsG5X84NA6lBvxfcgXLqAKmXiTz0W5PVT7DjnXJgjBwCtoEOVxnzsR07Ssm
         cgUONzfyTtzXCmJmwDI0MiZRrfi7qTUDGkCvE1JhU+hs+PRRAhRkI9K6R4Dk+qnq/eVY
         YVMI04QJ3eHdfVBHOquj0wARMxyTMFF/JrMHjPb2dQ1cSCMw34UBpiLCE5Ad1Z5FfUOI
         1THEjcYnQ9TW5dfvkm+cx+CYMnPVQNlouAOEVc4C2E2MkPdtWpc6zYkkECeRxJutjtgg
         YUYg==
X-Forwarded-Encrypted: i=1; AL+hErGFGyuCZpRaNSVBvqS9/jwVpXKTXAr/X9KmgWUjiBUNhSqhsrGPajNujiTIA9xhCB0b+SBtrNGpCEBvF8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AtTmwSj4qKl3Mzx4qK0QI88fp3K9RiBF0ZP+7cYendArPkGbe
	ZYOdAUt9VBi0+gYJWy2TzTyMZTWTF8i2p+IY+SSJEdwMJklyauhHX/6K9IDole9XX/fufg0JweM
	JiaK6XNXXhqaIFulcS27LICZZohLv/jflRgUw1nvVb7G8deSeDWvKXWDsU6SJ31mL2UQ=
X-Gm-Gg: AZFdTZcykHuSYooU8mYYudfJGdj0wGrmA6u9XPWNM0e9BeLUxXZeS2/UiTERKVhhvm+
	WvyYGqeZhFzxNvuWqhgealNczsHj6C+D1r9tq647kUKAOho9zNTEU/Ddl3oyBpPl9rfV4sVvRlC
	Fr1dkd5XOrIrc1IV1VL84zQk3HwHlAbKaBYTewVeN1KTVAyFAcWqC+x2MJF9qnHBCnxAyaFUd1h
	OZhqP3MZOjT40JUl/iPJNhd/QucL0m9yqk0UeUrj9AFfqeIJouFEGErEjEk6ZNTU0NAswJalRMG
	8BodLl52VZ2hgRRXgUx7O9jA8Muqm7kOA7ewUMgizMj/UHDcw7huAF2qBTMQSnyo7g+QDOtTYPy
	PDiK6aVHGZ6NhSb0XP5+daU9AJrxnwYg29ApoOYt8wWjEHRKmoOs/4Jjn4LZl54twXKrlLxdAMh
	o3Orh1Og==
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206460b3a.36.1795430887524;
        Mon, 23 Nov 2026 02:48:07 -0800 (PST)
X-Received: by 2002:a05:6a00:3403:b0:8a0:3307:c46c with SMTP id d2e1a72fcca58-8c87cb4678fmr9206445b3a.36.1795430886923;
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:06 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 05/11] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Mon, 23 Nov 2026 16:17:20 +0530
Message-Id: <20261123104727.1539149-6-faisal.hassan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0419e8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: cbl6I0mSMfVqd20NLeYk1nxuq36QuN75
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX/S5APgNC+nss
 tTrR4f2BXFVkekjjCr7dPJwbyVW64vSQ9oZnAEBh2SmlG0x702G3hrHl3nVjmt7jE012rz2P9i8
 MCT0GIESvEKyq5MwW7JxdXm6M1co9a4kDWwVMVvaGVcegEtGeR6OPNljniT2dtSBEqUKZnxMmao
 5zTRdBBdLBpomoN8GZ05VvW+Jknu4Fj3fLOMusRKz3t7hbmc9V9vxBYEyFG+JRhwyfpKlPUxHW/
 aYeZwrxgWAKqaSgeOXIqZ/SlBhr43Onek/UOAUmdxffZsaPqvpQUnnc6Av7lXgZ040mYwZZ+azh
 oCn+dxUIpB8lLmFoWEPtcXn2YsakwIQRene09wmyar92xI+YtieRFc+4dtCVa2DFlUsKUPWiguu
 Zf0562dAsVRRBNf3l9exA+rDhvhaxfS8VRre2QN4wxtN74BY49rsnjL0HlkikilHmyUOyEUnZKl
 9tZcrYRzbngF8K0ks0A==
X-Proofpoint-GUID: cbl6I0mSMfVqd20NLeYk1nxuq36QuN75
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX4vv/Uw9cvyRZ
 zEB8CCusNHc0rfNm/qlHvs83m5WrSsGXVZYBHvrMjm8yjERaBceIt//yt9RYPHihYXaOfYYmfcL
 82mV7toV3fkCxQFsOmjexKUg2m9CxHA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

