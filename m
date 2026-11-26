Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714467;
	b=YkP/y6ROhvUFZ43p9hs7Q76Gl8CeaFygRA+BWq6VrwYOz/6O1YDTasZcn+qcP9ViKY3C
	 oUEnIj5+CfB1/7/b3tluBk5CDsnMfSCKViDoXtnjQDgFcP+nBSO+6zplPPnaEbtVfbfbg
	 taYIKxTNQeCsqV/eD2DIw0IbEnJ6Q1tpnH6Uf7hza7lS2LA+fT8k1NcebOpUePWMdPM4W
	 o9jlnFUPpqM7bl3Susmdn6tVM2yybMKp/xtLuKV6FoTn44posayT7YY0HRsHPORO3M1pU
	 U+I9lvhWdGdOlCEglgjU1sGF20SmiSk7Zfqy0F/v6P+MR5svDNo4wtd3qBNfxZeLi7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
	b=22+BJoLgl3CWdCTgALOnq5WxUOyLTIdKVaKx0FythqQshOg1VuYTBJrTT1bOiPX4RGqQ
	 XO5yhbA6Y9WQVRG4CC4vdN2d9c9R46f1PMwmhBxi2BzcVuWObH6M+z0nNP1eSP6sO8CeC
	 UXgmEM2hjzCfyGg7FfEBHp/w1xLuYAuDxI07ZI7xAO2roZDrvIpUD/wQMXNXKfRw9dsx/
	 aGF4MHxgT1hgttxI8adlezTlUUbrsI7guWRyXBq3yEEvMgNiYWaoQqPp29U9kXBALxzmK
	 A51+Nzhm9WfyrvloTCQ4Q+wx3yv8VpZ7jQWdl2Wpqe7GaJyyfyZqjW8LfJjqqf2WiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EAF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EAF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c9OGn8pS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aaUhnfPJ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu70L2835123
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=; b=c9OGn8pSyXWiy3jP
	ZlD6X/tWVRdT6GibDnT6G3OtkWv6guKJyfvdsDAEItLIyH/jAC7SQjO1MbcWGo+h
	eUx7Az0fAnd9dpVWGjOvQO6u3mbU5RTjU1R3o+qoF7zSWmg0uMAKuvung9Klb9EX
	LmZYv/GiFXS2trGnD6sGWHm8xRwAmpTNf/ilHfG2KXg90tUK1acTPdcTBfGNXdBD
	/9wFahtAe97F2f2pYsbrWPEGSUJSU7/S/S2aIta28seBHp+BLu8LvMigMqU+iRmf
	0vOHHgQ/mk2Ny8NwB6OjLT8rRHxZaXlOlCTYX5+hOaPQwAacLZjPY/mjfzveXeKk
	Muwg/Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgmtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:34:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40b011aa4so8649488a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714466; x=1796319266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=aaUhnfPJdFdxVad2qFVzUzpYaFZwYoFyGAgS+wVk1k2Ux/wHvsgfy2Oo4I4joAYmFn
         dGU+Be7IMAM5VA9U7NE00Uj0LBT6nKV1++82VxSqgAUjbC/+xNSfT087fAXVP7Z+Wfhu
         eCPJm11FPibJ0P9Q1FheYIN2wHpmM9eHw64Y44dTdqvWony2ZvIyU49aZHEfCtRoaSOR
         q2jLijvmFallrqArE6P03wQtzlAPZY+trIKUR2mmoDeRaEQrLwXRM6dMqK6YPEGrM0P1
         /V8qpl9HmV9MuS4smjvzzTscbIhBFjTlbUOYyrlnhDdjh70A4cEkEs0DLtwLZBqjcJEK
         b+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714466; x=1796319266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAM7pQYhZdvEW1ETslRXtOjChEJigCxTZT0kkHulOzw=;
        b=BJWk6Et139jDixY87pRnv8sfjJAmU6xIaG91n2qG5WAj6EquYULupKvEiD2VqKcGvJ
         NNvbazsUNOhVpKwGbKZaW3p9fL90ntG0rRp8LmYge+TJ05/7qqj6cZu9KTaVBQfI1OYW
         8pDAwRSOPiaDFb755Wk1g5/C9KzYNzi9wm+p4kY2N5cgSTzcpCAlj493/y8hshEhLbbB
         fr6eHhRV0EcihVPPB3dNd8BnmIXDllKj9SwIJmQ1ldYYgb7FDWo0BcY19bo3SIc4i+Au
         7dVJ2MOrzyfHK4P66Zpuj6Xb3OyQvulgcz/FEBvFfFHuOfHJurLJR6MPasNzK/lAO4dH
         z1tw==
X-Forwarded-Encrypted: i=1; AL+hErHaC3AG/TMuo+FMcixw8jafNAurPVDc4tyxDCKZaexZU1iDNSd088qWijkl8Wip+A45hXCT1uPh1Y4iKxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xExwr4kW9Ij4z6/GgKzoeV+c5Y4cEh9wMt3sYswtxZewAZXfT
	SBED0N/m/z3RDLWJ3Umia6PxlOZ2qfCdI3qPcvYbv5fh3D6znbR1O34WyDwirbgMfQTUMrCvw+T
	xkt/wMhHj3rwsMcV+gOxpfKwuNFoXbzddZDdQjNBG/F9Y6Y5c7Ov2gilmGpxTRx1HJ5w=
X-Gm-Gg: AZFdTZcbqvu6a+6jYF8HBWVjcMQVJ9VUhg/y3jr33dh3St0sOMRb4tf3hCHrJRd0Vks
	jYHISBu+RSXNcjnnws9G3GDap5uUhxp24kE3MSAdRzBFcUmyTaVazOaHAHXqOVQ9DelDMShL/WA
	pGH4ALkLA7t3fD72uSiAWOUBYsYR0jJYYqJF2cJhRU7EPU0dl3Fl8ZjS1ACViQdFIFgE9bri6Xq
	K3B44Clyf8E9vidPjyAun5BR8HCIF1b70q+jwiRpsTpi6EXLZqDFxONw7tgVBAvMx4OU4OnzZ/c
	ePnp7C9CSxk9yWJWzxWDcVST0ZsteGp9Jzw1k910HhXBKVkLHKDiEvPPRPr2xWDTo0txMy3mOfX
	xz6k6SI+qCS4S3+6dpCbqP+TAfOW8iipVw9Z8fFkZ0aAC808TvPd6oVRwL9rd8qt/CXnR/JAEPw
	GbzlOIaSwVUC29rQnk67ldGqlviDFN4O8EM/0T9ukV
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204589a91.18.1795714465814;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:d22:8600 with SMTP id 98e67ed59e1d1-3b41c8fe1e2mr19204570a91.18.1795714465312;
        Thu, 26 Nov 2026 09:34:25 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm33227833a91.3.2026.11.26.09.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:34:24 -0800 (PST)
Message-ID: <3c0a98e5-0696-45eb-a0c2-83f429f6c76b@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:04:20 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yTOXecSWNJiX126MSVs78vzKJfXAq-ew
X-Proofpoint-ORIG-GUID: yTOXecSWNJiX126MSVs78vzKJfXAq-ew
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b086da2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fyVOInN8tGEjVan_8WYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX/F7TNW1y6XCj
 V4Dr4hsqw3n7Vr4raGUUySdNbW1AOMOyPXaCaEmg5x60+DUJnIKZ7JBmEOMj67Gos6lBYbx/kTx
 Ar18hvGX/lWUcw9cTMRrosNTXrLoG6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX5lfTYSHqJX84
 yXI3nAkNyqn8xDWUI7I2YxaGVqY9wQu93DXdt1TcbWzYxbZ3S6/flKgCT+7hP4veMIlAQAob3KS
 HgDFiv3Pdo2Jq1SfvrBtg1HLqnDAf+XdMd7LF9eutldS+AoXckqIWYgD6wlDuIeWpuQ/u7sKj+0
 BeynAiCylmlLawG7idat5ggzjGs9snBtT9SbyA+9IUzfsq3ci6cUw736mxbYBQCfWi2wSszki7f
 MCeoFq/0S4bPeQuNkm6Ux/Fy7JwG9n/OwwMteHqJVMss0bQGxNKig8bm/0T4V4Atf8rgVs6/Rpy
 nkG0PGUCmvVMQ+ybnOlkwqwMc9N63HGNkNwyIC98+vy0R63psShalK5c9FmYWu9k5vHr53zwu1q
 641v+e2FaUjDvMtt0W0rBfVPNiq07hOrFRPtb1ypsVWvOtkUs+A4Tnx4q3MZfB97RuWkpe7Dyv9
 xSkprQcIrqtUEBkSJKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
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

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   		qcom->current_role = USB_ROLE_HOST;
>   	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>   		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>   	} else {
>   		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>   		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   			qcom->current_role = USB_ROLE_DEVICE;
>   	}
>   
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>   
>   	qcom->dwc.dev = dev;

