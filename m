Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687945;
	b=QcrMq9TRqA43bTiQkHFqGNDu0DKCoM2i3G7Hvcp69y9XHbsIqLZRJCqE6h9Fb0Xk75XU
	 TheZHKwZO8fUWDi9z89jp/5iuwBLPVhUA72drU0s55sy8UcQR7dyrg7rhru/CaoiqsUL7
	 kFfRNYEsv9aIaoVvnkLsxduF3DBBMMjRTH/iwxmB1/BlfPF5tErCP38dZeCjnnwKaaQaF
	 kQoHuzYe1MClo91xgFdbDH+9r198Z4na2TJcg3+rAgu0NTd8UBsT7QaQrWLr8jqrSYCrx
	 y+DoXjPn3g2yGL84q9XxxBFOm8RbQXPOQZMiAWEFoTAk9/Vb2l4tnH4sz7U4ou0imgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
	b=Ur3gtY/+g4mkmh4ZQKNMNx72AcggEXkfKkWxuGfF0Otq79ZWvsGv7NN0Ey4JzYAlU6YC
	 VoLgT+AHs2nH0KaDKW6I8fb1D23dGHdr4kdFaxT4A3G4HEFQl2nrjZNOoun00rqaDD5BI
	 14tBB2AXWzIrMnOIoK/XJWPR2x99eE9pqjHiKYtnX6pkfaCq9JPzXk19YEG0ZnoxC5O87
	 uufiHcTZsxZ47YwnrP6KfI3v6hFTFo+Rx9wJUM/Jc7yd0Ii9PF2tp+uZ0NZCyuE2dCmyx
	 pdWeytqHk6VFNJK8FI7b0vGLee1XapJXE0k/MTTsrrF5aHcziN6kuyo3ZxJ7FxPKF6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3B5606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AvFV2594844
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88afsBd4DBJZJXNBN2MdesvR
	9kKs2U7zYJzInFyRPBI=; b=GYoqK8CNmbpXI/XAZIXWy1BCQTbfYjkSAYGNe0uk
	oyB2cpyJ8jC+F8LetXo2cqGdEUUl/gu0SVDDgcf0dbwCW56zqRRByFBD0MMeN6yd
	DDEsA7dq0oqe43XJt/j7D1iw7gg9xEKqBrXTGqFweEcrCc9stnxkyove9DnNG4hN
	3sRcFNdJv9yzoI3NalvvlNLrqOZQSa3M5EuSmd9f//KgVLBjiyF87+CdHg7sMrnU
	043OBZbhOBG9evZzdsZlsFIC7rAtWgydU/nzVB/zTH0fe9IrA6Of0UkjxIvKmql2
	mGCdQJpAsBnB8+4Nzd93v/RuUQ5CXdmXfRrOMgiE0oV62w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662san8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso7384182eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687944; x=1796292744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=f8q2npDWeyMusPOpBiBYQ2BjTAlMpAEMs0MoHLCd9uJK7UkqQGMsilOi1IHA/DXKmm
         fW1rBnDfiatVDz5lJwZaFgrtDviXx2FFMZ3aRsB5VhFzOOEOyGBLLGDwJ3PF5Q1Bl54z
         ISYAPAYxDo2gR7/FqQ3BnvIM9o01Pd7pPKhw3WSqGuwf5xvY6P/Tqff56p2yAiyQfOPq
         sZMBmF7tSI/JbgmsM+ahE4taVkS7tNyepkYgaODnT+pupD3xNXl9xBvvkeYg9lXPZVUL
         raH0AjLU6Qt11P192i93wtd0bY4eawZfAEhF2sbbFxGrKCfmAV0jvvvKqDF0+zyotB3F
         7ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687944; x=1796292744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=n+gnWWGhLb6VhAm45Rw3vRSgUwi/kJVOU6NOcyW6U0vPRiFOxCnpZOhvQpYcnogbry
         3IBjJ9GqMoZzqO5IVhXKzI/Azv0F2/hbbx0PbDPyXUbpNbJmcigtM+IcPOPc5Ekec0ep
         doI37KfEovA6f3C+gJoMOr84wp06OApGo0P1hw8HVG3DPc0YsIDEJhD4ANq5gCr4Ao9B
         KknpbViFCpUVb59DRLZdrQQ3OgrWl7+mC40VdUqgfEktFC3+Zzp73VYaisgS0G0KiJmD
         Al8ky81vka8oId/9taNoTU6xDaK8KqtFL/+wrPwpvxNnHfkwQrFYKIzBnSHgcOUy+IK2
         WRLg==
X-Forwarded-Encrypted: i=1; AL+hErE37zawFEIJLiolKtW2lH8UACCUoNmcdw6KiUfpHcbYG6xbXDTk/aiuVQLEMhB2ePqap7eoPGhNszXqT6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DEgj50VSj+65ozkm6gOGwjG+smUpFz+RHWMKhajym2TetILsl
	8aH+SCDYQW50aJZiYhd33WdyP8/51qriNt+Sn2Ym4Ae6zqi/QxXmwFQ0wyx5zvBXxNbkRr3ZPT4
	YG3qGd7pMzzY/a7PDN4toDwQQIQhpr8ZcWvbVPBAYRGn2ft4D9kRJCHWMRaTHY4WFkis=
X-Gm-Gg: AZFdTZegfAddGhj+zoC6A8Slmyw5MBwtJzREedLewZvkFg0pYhvUmvgqcVWZqZOMxuP
	0QoGbiUckng4c/f2KY1qlttTqZT1nmeyfQvtD8hREsQmdkVRjUQy3gzuqF9jV6KlRAJU2s0MRoh
	HAaC52RuGBaICIv0uhS3FtAxvgJx/drytecu4LXmrQ9LQ+ccr++sXQshTWtOeba0z6ZCbJFgDiY
	1WoDgJZzRnfK5WZvk6zXLO9dRQGErSZNXOhCFgDMLovxogYhud2ZO0ld886y6sNZKrGz8m9Fg7X
	mAhdCwsOmyGB8dIcUH1uvKb6WO+hOLRsJu1hgVjTor3aaEXoiFe2Tg+7oKmNL/uEAn+vZnBui5k
	iC4enXnx/YEwLrJ62hNWNo0R5oTAIC+1DMpByu6zSq+4g66Q2RrW4na1EATb34DWzKDHLikXDF0
	eRP457pBY/vgPhC1yu10rJtPY=
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331247eec.1.1795687943958;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331226eec.1.1795687943439;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm51643252eec.25.2026.11.26.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Date: Thu, 26 Nov 2026 02:12:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <awgGBW9-cxJRlA_b@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080608 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=y33D9nhtfLLIXgUvc_UA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: AecEFHAFY2mvA8f5N2Z442IIPZwxlUSY
X-Proofpoint-ORIG-GUID: AecEFHAFY2mvA8f5N2Z442IIPZwxlUSY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX3jvRyaQ1gQt8
 SB5dJw80Jj64Bl/v1by1pR8Cd0gxD23ZQwcFZ4shYdd6r35tI/vuzAibKmQgLnVm3jvyFcN9nTQ
 vqpWZtOm5m2fJ3yfNWjaQYbjax1uEE4q0Jgj+uJZKRzs13OUphXzjvMMxMqY1h5/FN15pvyKt5Y
 J7dCN/YnAsgbywyyyCATLi52syPNF+u1B9VjaudPP1rKtVj9jAO6AoPbTdnxYTKtsJwyiX2dfA+
 Jemp4OKHDhBNJJK+1g4ytc81mQsNCLIL5RDpip0cl2re09VTz31JRmjWmDXL1cwf6ZeKWGBgS91
 /WPohTy3dh0kpWeSPSJYICJg6TIkJeZ4yFOgBed0FIUXfr6GJk2eSXgxV8Dk7jy6bExOjdv9wAC
 xf3aAe4qrIouPC4yHfpzkTWRxdrlrn14NGOagXfS/9LGwcNa09J76a8doDmKjm+dtmwLgGG1ZdI
 kzR2Ds0poJOMdFNCozw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfXzM9K1euD2Bfa
 R7YisofXqvxTBfqfVeI4lDYkgRvWpHBPxqs3XU/OfnF93exAmrf8dwTjJE/10grS9kQK+DCgSyF
 8SQA8fjoj40E/7E8Z5ukM2JkQBMWu+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260039

On 26-11-23 16:17:26, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		qcom->current_role = USB_ROLE_HOST;
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->current_role = USB_ROLE_DEVICE;
>  	}
>  
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>  
>  	qcom->dwc.dev = dev;
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
