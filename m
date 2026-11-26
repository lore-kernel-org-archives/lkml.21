Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678828;
	b=fbJdUvWUSiAMMJVGPbF3jxWmDQDNCrFkbEpsna134ucakvnmuLILCdukeF+9jfSXSg8C
	 oMHAHCzgVIF3YcdK/c3dC6EhaqJYNISJNj9b+8p7zfZsKRUZ3WiN0mloOGgKStI+QtbMw
	 PII/mflFh6DB+TPM+uE/A9OhtpzC3qXqXkv+MpnYUj7CBKZX9J+B6/yCmtaXbQaViLZLj
	 n1zCfGZlNCB2L/0NOImsF3mvRQ0Lnaz9lTIzKCBTwlKzXogHSY/uaslE+k0g/tC2xN6TJ
	 i8jBThc6YtGa1Cu5n2QcqTdLFHQBTPjpp3030ukr1+ze3Y/WhDwdfxA4IQcs3F1OldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
	b=2vxL2+6WupEehMzlfh9hcog8c/xxEPdvhzm9X6H0xUfVUwSEN2+Pd571M2l3T6fcLfwH
	 dzKEwztshSxRcUXaWCUy3Lh59svwfYzhLcbFVlYGKsC5VMP3WbyGRzgngTo2u/dxui8NK
	 Tl9fjC9WOk5eZ+vE2xjHmqD/UnLnhnSrouWqpWFLHEjb8y5xWxKRRZHrdA0zS4FZmo9tP
	 BHcLk12+nMY+Ya4FGvS3gsDtGnDKH+28O8zLnjGxUlSaDOSmQsI9JVKAbOYOFtFSzo8VO
	 u1e0KXNiUOyhiteIwfGOYgkqgVq2siXUYsMyMMoD+5KONm+yZAnta4jyZa+xWNtQTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51269606A695
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51269606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3r9h3Eo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbhqQaTt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B44T2335360
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXWlGCRC9JQkumWInitkE8i9
	IQlzJPF9vbX50igGRpE=; b=O3r9h3EosuF9La/6Gk7uOPkO4ocLiXnApEIAq0JS
	iwKgxZwIGDvt9pNdEIF4kg6QTVy+0uGoQUvInBreDTq5wxmPe4raq10qjgEDx7gw
	XRsbdE3bKZGT/zOH3xJpEzKRQZQBjwQnwI5VSPfaH3B+TNCEtOKrl0u63w8vDNGU
	SfG3Aq76yZ0r1PbEdj+aG8j5TTkpP9GuDPuHfZ23RdwzcTuSs0sY/twBfH8v2fwO
	xoaK+fDgSNB2OxS5b+AtTecoTxS88YFn2klbbOfsaBQmEc5swCkiiMztSbSLeYDR
	eeI6dTBfmkxJ2C+Dna+XftGJ3zlNETyh1RVjYs+/K0RVSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak015tt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:40:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so5784632eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795678826; x=1796283626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=HbhqQaTtUpIVHEYSZ/lBnCTkaiQmQU9BVp4ByHYxoHK7iB5Se6gMVgigWKa2RsKXqp
         ajWpl3lojcKhFfRrNdMSIaE0yEUrjhOf/WPSaumhIs4RtgsFoYRD8y2GdrwZc5Yd7jFF
         4R4V684rPRqQzBf6sGySOFgQMKWEVK3FBMC90QVU4ITpgNzxcaNrn5eU9lxcouzo9iYW
         ok/Pc5mKmuY/sx+3IjOcON6exSgQkxe9W07ldnmYwx0qmR1UwrZ+o2yurcZOTRxeiACf
         v/9M4YPVAQTwOKp0jFeuPYPxoK+oHHi0XNFRDtaBF+3f42hXUFmUuNPKQtZdYj/YH6xb
         pQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678826; x=1796283626;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXWlGCRC9JQkumWInitkE8i9IQlzJPF9vbX50igGRpE=;
        b=2mbG2jEu1IppVZ6wxtv3W0F2BME7JvNXZScl6oyeYm41aDrcpsLQOpCLDuFoWKEJa+
         0tFzc5ut8MCF2HCVSKDsyog36CmlAWgQG8w7zDLKNxKzWPhiFc0ojgXZYloZdKL3j/u4
         tR8icCrLpM0IhgVUyr3KMLDmqqP/8fA/t8KyVLRMBWmVTfRLIldiPSOlCHYCusKJQ4+f
         MOtX2KAFuR0CAY67IGf3FpxgTQwOLZN9STjErbvNTjV0DgKrHumXj2khKO3seVLshP//
         pawErOWQaunUzQLk73wBBiuchyDGr6nm93QnPAASJ4Q/73H1mgP4lcR5/MO3YXkbTP1W
         9mxQ==
X-Forwarded-Encrypted: i=1; AL+hErGoH/WYUcqR4h7vSj7QaJkUb91bgOFi/AQ1uUAAy4wbTHhYgYzxi3Nsuhno7HgFZLq3NyqcM1iDUr7p1WE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7bPR2E8Z8g91ZJ+hH9KqDxu7sWSuH+9gRPvTHEdt/b1/Ab7Zq
	uNrqor+yymv7qVb5TTR9xBkOIi12otmYe12gNlcQMlKz12AwxmtYmFamVwR3V8lXYZmeqw0F00S
	0c7V38apiq/mY4KyEPzL/u2ywm/B9CGxh0H5TJJp+vR1Rzk6n19vgArAG4Xqw7hkCDePDvMjmpw
	1bjA==
X-Gm-Gg: AZFdTZclCKm1gTzOOmUPXrxmOExTm5FBlqHTKsYXBEOs9BJ4AO+HyK5Na0nllJgSJWm
	50uo7ubZrwtXBVEpfTj1m99pL+28kgAsRM3O0RvpAVXXtoLHgbiWC9CATOIy4esgMKG8/EHuoUp
	8/Rm1Lklh03bWBuywmK8K0jNw6yfX0SE6ABN5X6H72zRtXo7lxJLI00oVB4598LN0YOS3elPYtB
	XJx7A14jiOPJkd5sSvb7tyUFW+trEHCAZdDAVTMvgyj/QJ4r+Vm6WTHEQrHjIVfKefwnh/cHslS
	91S+tzK2KFFfwWBH4Pk7G3SlYfVtiL0BvGPNWMAguMo45fqGrHQ3GfVLkYTkFUfMJ5eamlKCdEc
	kG6z0FKqvRZkhDkNiHxgzisXkIKfvXU8NboMFHXOa5bzIYcnBNyVE49cJuK8x9hX1/+2FQEbAYx
	FG1J241DSpiug3Md1+sfTNeeM=
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18107022eec.40.1795678825955;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
X-Received: by 2002:a05:7301:2108:b0:386:b99:8ff9 with SMTP id 5a478bee46e88-3860b999354mr18106995eec.40.1795678825418;
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm47180909eec.1.2026.11.25.23.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:40:25 -0800 (PST)
Date: Wed, 25 Nov 2026 23:40:23 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/11] usb: dwc3: qcom: Distinguish PM and runtime
 suspend/resume paths
Message-ID: <awfiZ8IE4UMuiO7P@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-2-faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07e26b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=Y18rF2VYFuf4IdEaWfYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: AtuLKoqi9rQ7x0ybIYcPDNpAa6NUNMsh
X-Proofpoint-GUID: AtuLKoqi9rQ7x0ybIYcPDNpAa6NUNMsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX0dVrQ7rCHssA
 lLIV27Q74Adhj2ZtZMa8Ek1rPMOMtwH5Pojo0yhHPhbgYJ12dmUd5+rfKTtzNfmAL4gMh1iPsog
 HFVXQTB+QHyXGGqerUEWynlFDO2NP9bSkIt63KSB35/7fMXXv3kvuItTjjCt5Fp/5GNm2+kczUX
 szOA6Zf/xajkCzJCZcfFu80jTAlGlAi7qnycYbDo0rIi/XAheDhEVszpICE9pl6/NhtNJ4Kylll
 OOS5idN5O23f9nxjjlNYlEYtN68MDEARsFCv4FH5Rv2/W2aDOAGO+8Xf3UCY6tiO+W40TYJiI7e
 87fdko2v8My4nyWJa/R2mQzNUiyr2u1jAaufI+5qwnR+g7t7BmeefWLEcCbxaIDS0fSYAuFqTtS
 tyRVz+OyqFcU0TMgeeGra0NRReETMBFxR2sJRuQ3IUnHC4BuAVuDqcuMT+UMGmQiABIvsQCPQjW
 WQ7KtswLU41l0tnbCCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX7/8Ui1Iyyf98
 g88EBZnSESkStRYIOtyYk0m92CxROGJtuxFWu6qWDsL04zVA75T8x5lh9M+R0WhRKJ2VqBgU4Nr
 z+xNOojbR8XWgg5aWuBbDzV31UMnZss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

On 26-11-23 16:17:16, Faisal Hassan wrote:
> The dwc3_qcom_suspend() and dwc3_qcom_resume() functions
> handle both system PM and runtime PM paths but cannot
> differentiate between them, preventing distinct power
> management strategies.
> 
> Refactor suspend/resume functions to accept pm_message_t
> instead of boolean wakeup flags. Use PMSG_IS_AUTO()
> to identify runtime PM (PMSG_AUTO_SUSPEND/RESUME) versus
> system PM (PMSG_SUSPEND/RESUME) paths.
> 
> Preserve existing wakeup behavior: always enable wakeup
> for runtime suspend, check device_may_wakeup() for system
> suspend.
> 
> Follow dwc3/core.c pattern to enable future per-path
> strategies like differentiated power states.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..7a7225b900b3 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -335,8 +335,18 @@ static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
>  }
>  
> -static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> +/*
> + * For runtime PM, always enable wakeup.
> + * For system PM, check device wakeup capability.
> + */
> +static bool dwc3_qcom_wakeup_enabled(struct dwc3_qcom *qcom, pm_message_t msg)
> +{
> +	return PMSG_IS_AUTO(msg) || device_may_wakeup(qcom->dev);
> +}
> +
> +static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	u32 val;
>  	int i, ret;
>  
> @@ -369,8 +379,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>  	return 0;
>  }
>  
> -static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> +static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  {
> +	bool wakeup = dwc3_qcom_wakeup_enabled(qcom, msg);
>  	int ret;
>  	int i;
>  
> @@ -750,14 +761,13 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
>  	ret = dwc3_pm_suspend(&qcom->dwc);
>  	if (ret)
>  		return ret;
>  
> -	ret = dwc3_qcom_suspend(qcom, wakeup);
> +	ret = dwc3_qcom_suspend(qcom, PMSG_SUSPEND);
>  	if (ret)
>  		return ret;
>  
> @@ -770,10 +780,9 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> -	bool wakeup = device_may_wakeup(dev);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, wakeup);
> +	ret = dwc3_qcom_resume(qcom, PMSG_RESUME);
>  	if (ret)
>  		return ret;
>  
> @@ -810,7 +819,7 @@ static int dwc3_qcom_runtime_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return dwc3_qcom_suspend(qcom, true);
> +	return dwc3_qcom_suspend(qcom, PMSG_AUTO_SUSPEND);
>  }
>  
>  static int dwc3_qcom_runtime_resume(struct device *dev)
> @@ -819,7 +828,7 @@ static int dwc3_qcom_runtime_resume(struct device *dev)
>  	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
>  	int ret;
>  
> -	ret = dwc3_qcom_resume(qcom, true);
> +	ret = dwc3_qcom_resume(qcom, PMSG_AUTO_RESUME);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
