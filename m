Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714362;
	b=dSfqmEHPoGzDdymuDoMwoHnema62YjiK3Xpkhs08wxhN9vrfdG1pgG3jeVqop3ZzTchw
	 9WmSqD8vvDECxmchE20D2MXnWFNt4QWhigldMdRXCM9FtutUeCLCh3gN8nuktC2M8VCdL
	 l0n6y3P/3rBaw5koYVTUfZJwjB4D7m4DHPfW8bcbTJeIQTi9BiFySO5dGmqpSlcGI6RcV
	 x6cg1aLngu79H+DGJTyIKTQ7K0LR9jMMs1SldxnAmMYntdk9CKPEddz6jyfA6o0MmS5FT
	 XWzU4WvmBUTMBqjFsFze2F0GbQUlxMQ1s+eElDl6FhtBug3nwQGo5r31EiXHfTVfONA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
	b=hujNA/a+xSovmj79KDgdPoIxwN/2cuAiflk6FP2t9xyxAo0bwcrRR2uY7Bblj5X8nHQb
	 RMXnfK7NhDHRXkuYWDoyglqV7yGM0JHlY/I4UYwk4ic9mQtZ8CxP3sUTR4ljAMsNK3uvE
	 6u7aPUQKmo0ONfy6eNnZRRNUeWQVUW8U1L1VG+VTJyhmz8Pr/kjnU/0MRkyJTSQJYz0UF
	 UFD6+FscYdVNvK5/iMaU8zkNFpOF7zqxXgJpRLW6i2qJq4QjlOqLfVzFZq10Y8o4zr23H
	 waobPWa8QCQkerXccjcEXaglSuH48JHebnHtnZWy863iUMvpk2yLl3m3Q/s/WXTX4mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8AF606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8AF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldwzgPvB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz83se3p
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFuJBw3750176
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=; b=ldwzgPvBGBcqnftN
	Xv8RY/jQgo8lMmw/5jLTZ+/bVcLP32F9M6jjF9LdRKDrJb6uzqkmNWaHvupCMJsH
	JmhftRmaAsNWOnzfz1ZKUlqP9g/Qe+ad270462y8rRxR+zesePSW2hSroXTNfCOT
	li4Q1ErkLIwM8i4pxc/NgMV1P/5ijGastp8S+UB32IBh5qosjSRTXoSNg3Cg09EM
	Tfz+hsOKRVWb88LsAf+zAZ0l2fk8YlV/3ql+A2mJH5tdwnyqXgQcI3QiB9A+iHes
	9f8xpI+R/NzLJhALop5oIr4BD37HuDJAVwLIx+8ttNGvK9falD9/gzStjnzA7ZRt
	y0I7bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sc5xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04004edf1so46619775ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714361; x=1796319161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=Tz83se3p38C1v0D89CwewiTgagEy0CFroaeyOzdVtjWd9kUHUCFODHhFnD6liO09Bj
         xdSZ+1+WBFpu38kYr+5/v5BoTJvQtZbzT46kKM9qDRPvXrm/hJe5UddeQrqexcWbDgUs
         UanBdtWuygWMxaCT8xca8v35mMw4MPHwPl9xTdWYXpg0HgVJWEnXhQDW7NE4cuYHEmdq
         SGXzEO0/UI7kp8JtBHoJJ5tzgcLYaPZ5c6a84zmIL1anOTPomay8oHQrZiqA6MulRWYo
         prAAVJy6SE/+BcvCYT3hTjCa1Ew5SqB331gl5+3I4vtEHeYT/o1T2VZuEMFN0001GwGJ
         XF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714361; x=1796319161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d9QHHcFfpRjmiOA2EOzjqJMr/IIGvSYy+UhP+4kYREE=;
        b=MqFkFp3e2pqBs5ROCSEI3bQp62WJcG87PscvGoxmRY5DEq0KzwzaAdPeN/RbjrzmPQ
         P7KBin5KHtWNKg6K/EXDCuUhTkdONj1liuJ+inhrfxqw5SA2jJnu/01KhQg6CejqvVsS
         jtcGJGG1hJ7EKLDGO1NGddqRnlP6RVifwTru1SK4FqIz7dAdBVfyUla+4W0WXy+3k+CU
         cQk6uotauv1FexaZVfFrhzZgqKrUBRv/4/lC6p2x67P0tyG3iI7eYRMQHJHDU8Hne5dr
         TwphDspxn4rqv56wjoNXTUmyoDLyXFtLM1DxU3gwd2aQVcdRxv6jDdWzE6Po1cw7OeAF
         EeSw==
X-Forwarded-Encrypted: i=1; AL+hErH93uR2fpw5JyLsGe55wdYOsZjB/VHrl6NCIwq02ORatpgkRuKZPXdewf6qt5KdkKGleBmo2J8KuOiA6Cg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tTd8WVoeY4D5GmmhmUP1ch5+0gYzTG6OgiDZ71fs9yVhm3FxR
	Ll3N8k2G2ZdAnFVGauPW+INfsHw5JnBCeWrPifeKWP7Mg9n2vU+r1i92Jj/P+Ly/2+D17AxqLnI
	koiRUd4Hlbb7DDIHhIkFHTN696i/IGXQWJcOA/q4Vcyu58IvUh43Ov0Nlp4k9WNpYIeg=
X-Gm-Gg: AZFdTZcd5gz4HS0y+pnbnemieK5RRpA9D45wyTjofPc7J9h6VK6/gju0OWS9mqW8xSR
	MEJcIm05inPQ9NKdr3GYxCCuzGCrIadfwiLXDYg1W/+VwyevrCJOwfGjfS+ewCkGfM3q8Pq7UGO
	tntEsjL9QYJe2AYRkl0+2q6t0ttsYY/g67icSV/3CRKQTvsHZ6lXGp2PXFXxmAHEYNoRxCZSUS+
	nv+m2POXpJHCgueTrzxV1yOATekKLzkkxOSCN8QKTCAiB27PY2ymBvBuCW3e2CA5rE4jn2eNmg2
	33CaoFdnMHOiAt18DzWjri0LeMogRaCdKD6iilPHoCXuHq5vwyVq84P7ctrzUwwJtr5v1KJB9XA
	0mkJUpQeJUaCkSLTdnv8jDtjE9Z3MvyVuswb+JgnmQHmnG04QAR/F/Y9XKMxSGZpBTuIBP8OhGm
	S0AXMBNWyWCwbkR6ve+pR7J1CPNnJCc9KivyD/a+rU
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757945ad.73.1795714361068;
        Thu, 26 Nov 2026 09:32:41 -0800 (PST)
X-Received: by 2002:a17:902:e551:b0:2ed:ff4a:6d21 with SMTP id d9443c01a7336-2f03f1beef6mr213757755ad.73.1795714360588;
        Thu, 26 Nov 2026 09:32:40 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b8a43768sm49779685ad.31.2026.11.26.09.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:39 -0800 (PST)
Message-ID: <e01e6db6-9581-4003-b874-bb0a49bc9b8e@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:02:34 +0530
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
Subject: Re: [PATCH v5 08/11] usb: dwc3: qcom: Restore VBUS override after
 system resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-9-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b086d39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JdB8cOfk_NMNDU_cp-YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: f8CBOQmb6YoTOuDwbYfn-xaka_VrzRDm
X-Proofpoint-ORIG-GUID: f8CBOQmb6YoTOuDwbYfn-xaka_VrzRDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX3rHXKuWbkJuf
 KUZobxI4105RDkvdmaOEOG20FaPku9tjndVwujsifu/G7zTOI16wFocCdd+Lu6ZPfKyULlFVQiv
 HdCsYJJs0S0IvIiJu9wJVMC+R2uiqWeCu1nYRdT5+PzW3woeCNDShdAviGPS3/dQOVfQjUFAJ6X
 DZqlPbi3l4Qqmybqzsk5O47J0668KMVbwyWbeDIK8neX9ambTUonFjGOde7UUI3+5Oihecw7g0O
 DhZnEuS5y7jyxb9eEx3HJqoGkoMWEOXBWr+lfXjpthT/NzBqmQOF9aBz8XJX/gIFLZyYGCga4rs
 TxmPFUhnFoIQKnL1CQlZkIzNYRDaEwmduf4boJSmsFh7BMXI60HKb72tSCAolwqJMONNLQ9liZK
 lw6tdGOqbOcZmvHPVUBsPoFn7SGlnZLuAs9GvH+kU+Yf/6RsEEdze9gxQ5uae+iP6EtDkndkbtb
 c8JSsuQJ2rOA1j8B7+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX9QT4nDvCwM3K
 Zh1I/dPVPur96TaGkDCHRS7ODASWNkmy+m847cEZAyPxX4MW+JBBxPPZqDpZFaisJ4lFSQezms0
 tTbozHqnX7syMfdFRXlnggwvI1SFLCM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> The controller reset on system resume returns the Qscratch registers to
> their power-on defaults, which clears the VBUS valid override that was
> set up for device mode. Without it the PHY does not see VBUS and the
> gadget fails to enumerate after resume.
> 
> Re-enable the override after resume when the controller is not in host
> mode.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 8e8d7e59c6d5..50fca06c83d4 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -457,6 +457,14 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   				  PWR_EVNT_LPM_IN_L2_MASK | PWR_EVNT_LPM_OUT_L2_MASK);
>   	}
>   
> +	/*
> +	 * The reset above returned Qscratch to its power-on defaults, so
> +	 * restore the VBUS valid override set up for device mode.
> +	 */
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg) &&
> +	    !dwc3_qcom_is_host(qcom))
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>   	qcom->is_suspended = false;
>   
>   	return 0;

