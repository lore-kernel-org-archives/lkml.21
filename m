Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698449;
	b=xkvjpdK8LT+7YwyEuHC2lSuOb0+OwY37fJpiNE4m7Kffmp8LeqxfgofVRovcyHm9d1B0
	 gnRKaQiUM24emL5ODGfbNAD1652eGkhqYfTr5NVldcgSmkMAW/KifettxKPwC+9coTZTw
	 doe+Zjh/eQ+touuPI5ELKjBPPuHty4RM2ZgK+DrObdyMWytQvvE37AC3nbzeLGutS9eyX
	 +gbO3660w43VTYOZg/Qy6FlasfnFw4KID7H2XHwpvqa7cC3jHAIGUtER6+TWoOc0ydA3q
	 AQe+FeacL8F/W6R7b5hGvJyI25uplD8xgxuFjmI8IKfbexGTxa07dc7Pu1D18Sie/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
	b=hSCFSsvJEnZ78N5tU2G42YAf14nmYFNVZmXksfjHyKOq4dfiPNvPrTDBwFUtwOe2ypn4
	 wL2N7YJmiSBM3Dx9wplMP3JEyFSdRSupSomPumIC4u6jqPX5bjNiYenEH+fLwNltkX7u/
	 hcaFcsBucWeON9oslFtyBYqCQc57GeB/iLrJwwOtffnurhjvHB/dWNbHl8KS7gHDS5rA6
	 FGxHqTMPl0xJCOoXI81lsm/4CDBFS17o6DmLmorfY0g7hcsv+9S6rNldbg9b6kSrqX63T
	 JBCho177nDgmgZp6o1L7M+8MsmrS8wX4dIhA4/KwLyzFa+H6IgvQmgLEk+NAxxiwNMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPx75k5X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cX5Le6vD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD4606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPx75k5X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cX5Le6vD
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVZxV3177954
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=; b=nPx75k5XdhHwI+L0
	l/r2eqJbKaVVDnx2nTTCCltg1LKiPpNOzgpta07hJ/bm+KUR+Y+4SPGfTz3BxCW5
	gCAJwzmwL1kZ+HqTQEZQVeSD050byW6vCtTtluuh9tu6uCy3hsRUQmTh7dSOJTsZ
	0Qs+unUZ1f/2DuthFfMKhOpUQaoqqOIbTL9WoiYOuYK0RMuWg0wATmQ+mZ1yWsPz
	dJGbDZppPbDsFD1Vla99Fpy3C/+FJQt2srhptHUKuFBS77Lu91NzwJUTcuhsEum2
	585k04oDxQD7Z7Re5ttPWlsBi577Vb3c+TH4RoVP8U6R1J/zKHsRgruoZSVR+0Kp
	VPQfFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sb7wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:07:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943fffbc5dbso51023685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795698446; x=1796303246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
        b=cX5Le6vDhMfWVUNl2bNqqPkAXCbqN+DiLLUZwWEZp/+WzMJkVF7HhFlpZyvNOcGsTj
         hCCdhwse+WnkswWFnNe3nOAHI9rioVL8TWmi71E+n7USc+1g67uOoaYqxAYFHQrEzpsd
         K8jgqSFEdAo0bBObvKZrdkYkjFub/gILbQWyQgtqGpLBTRLWLqsAYhiwCua4RICGdIjq
         KzrcWTjCFJRidYJx4Y79V5tmrJ0i5ewv48cj4hqK9wz9v31CvV52ob1KM3NOjbD4h6H8
         32FaNk/CkAav3keVSeMifJLjXdizCdLdUBX+IAFcZTN4uurpuZv3lgqAmhMxBHyWMGBJ
         jnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698446; x=1796303246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m/r7tY+1cY+d5JvPnaKis6TXcnMWfsaA3A63jNKdj0k=;
        b=vqCvbxqvJsnt/2lPTNIbBbWHqHVgN/egXXY8EZtZ8Hx4/f14QFpKeKdRT3ZzTD9kzU
         KpTT46htvhArv87/QQHtETRpiFAN+kqa18rN7qdqMMKc9bm3Ju6b/MZHDomhkMKE+Ljj
         Q30oaK/GKnsiFWge2UZGvMgZQZZnmlB4z4AlWUn5UdP66RPTLa0bDrCHGJZy1fAREw1p
         0PV5Nmau4NbBVKUNsZi8ei7veJMyD3TOsazzt6NUrhSfJzUCHAg4gjVGwwmnZGAPzzGK
         zqaOV7a4H1m09821GSqn0b17HHD/jyM01wz8BWOVjZI5kYiEcYJeg81YSCZGYA8eMA69
         RIRA==
X-Forwarded-Encrypted: i=1; AL+hErGBv1YrEJp0isVH+E+Mb7qHw4+wI/IR/dzLngmluwCVcY3WPV8H9OElDHZri1Evf1Zi7pGhC5wUdlphMmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w7qLyYhqMqtFtyTH1MJPauXx/cKGCfMAX+zuITq3OTHnShMNp
	GE/soiX4vPfi+gNwjuC2TmQwGPAseGr0pmhMBFu3vmbh/kVo+CbXszYiaM2BjV9pnw4rMEgMrYn
	OQc7xkrGe0D6i5IR1VEx4ZJW47pvoW3CTXIsBJWD6MQU3MZ4e0YmliGWL6qRApW1hW2g=
X-Gm-Gg: AZFdTZcHJXB6XK+2r77rtVC/o9u8ctguJ/++5UBC/BSt/6Di/NisOOLsXgeGUtmV6BC
	iAd/qx/fZHHmDtMH5HPP32FTjOXaCK2cPKJ2D0iRoYMeP3KFXvk0qrrYWa7meFhXwphUbs2Chdz
	NkseitaWzpVBnvyCiOIMx9OqXiOqZ7e3KvzXKwP4TA6kKhLy8hjf1YfGz3NOVwfise8BxUWGw3V
	grYAx7b8m2TsNpbJDYm+W6UoEZRtWGBLs2qxcrS/Qcfi/u3gHbRrevgMC45fotSkVAJkmM9O4c5
	EGfxcv4YOoA1188PUlNJl656ukW8CMk6VONo/alnyGWei5pEr2yoZJ9hh5Oh8Riw89PiccWPKdM
	a94QbdWjjXz44Z0lXShYG3DOpBeQROi2WmBfXfj8t4QDvDRf0jhoeXo8Dsytr4NIq2ux/ZF8=
X-Received: by 2002:a05:620a:72b5:b0:949:ee76:cfe3 with SMTP id af79cd13be357-949ee76d22fmr1906391585a.0.1795698446421;
        Thu, 26 Nov 2026 05:07:26 -0800 (PST)
X-Received: by 2002:a05:620a:72b5:b0:949:ee76:cfe3 with SMTP id af79cd13be357-949ee76d22fmr1906385785a.0.1795698445931;
        Thu, 26 Nov 2026 05:07:25 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm9687245a12.9.2026.11.26.05.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:07:25 -0800 (PST)
Message-ID: <b4aa73a1-ccdb-4ea7-a800-3c4ef20024dd@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:07:22 +0100
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
Subject: Re: [PATCH] PCI: qcom: Skip ASPM enablement walk on resume
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b082f0f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=M-jGJTmE-ygQmRKCDXMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: q0SfS_rIXhTRSVzJfmdqmJGHeG7VuhNv
X-Proofpoint-ORIG-GUID: q0SfS_rIXhTRSVzJfmdqmJGHeG7VuhNv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MSBTYWx0ZWRfXzUf2kQhdd1wV
 3kIXB5Awx+hsTlkwQ2xZYKADcfhMkTG4WOYy3qfRD17Mrt5sVUrCcWiu51AqPPVbxEC8eT4peVI
 e1AHgePU7oSzlgOCjyqbsMcI1OUDvtsCvA8qSkrV+zVasLu7UPGH3VE9OwmzJ2OXcBm0At9v7bY
 GAWNObMlMCoDIL2Kchf59A7RSwfqAxN+UPKB+BPYWW3JHF3wyWqWQsQuV3qJsdp3pnfUOZYv11D
 Hq1On2XPskdoNEm34Vcwmy5pbg010dPDFrZU44kEPUcHbaJDCw5idJhlMGZlO2+ljq/qgozxyP4
 u/EpRpQL2lNdRyaAPaddoL4TtNM/DIxPjILJ4cO4OIibRQBf2dc6R+cGEN8F8b8hsJEaAlQfOU7
 Dky7ncnJTF30viZj2uxj2qLNXeyVL/fvUfwPDPvk8c3xpux8zNvUhHl0JBGI9ZMn00AA0uea5MM
 B4jS2/DC6dzDjS6QbeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MSBTYWx0ZWRfX6yZeW730aiOH
 QJ7458REUVMkizwFB0Ymo4auAaoEZVcEwQYtfPiyBiGl49hwSfh8K1XM6RmLZikkXBuwYiRLOCt
 vyG16B3TnLs95kBYpHAG21gT0L88pBU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260051

On 11/26/26 6:44 AM, Krishna Chaitanya Chundru wrote:
> qcom_pcie_host_post_init_2_7_0() walks the bus and calls
> pci_set_power_state(D0) and pci_enable_link_state() on every downstream
> device. It runs from pp->ops->post_init(), which dw_pcie_resume_noirq()
> invokes on the resume path in addition to the initial host init.
> 
> On resume, the PCI core has not yet restored the downstream devices
> saved config space, so the config accesses performed by the walk fail.
> With a PCIe switch in the topology this is easily hit, producing errors
> such as:
> 
> pcieport 0000:02:01.0: Unable to change power state from D3hot to D0, device inaccessible
> ath12k_wifi7_pci 0000:03:00.0: Unable to change power state from D3hot to D0, device inaccessible
> pcieport 0000:02:02.0: Unable to change power state from D3hot to D0, device inaccessible
> pci 0000:05:00.0: Unable to change power state from unknown to D0, device inaccessible
> 
> The walk is also redundant on resume: the ASPM link state is restored by
> the PCI core as part of the config space save/restore. Skip the walk when
> the controller is resuming, which is the case while pci->suspended is
> still set at post_init() time.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index a6a0e3ecd921..bd1ffbf5c21a 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1174,6 +1174,9 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>  {
>  	struct dw_pcie_rp *pp = &pcie->pci->pp;
>  
> +	if (pcie->pci->suspended)
> +		return;

Is this going to regress hotplugged devices?

Or do we need this bus walk anyway now that we have 

eacf92a29af9 ("PCI/ASPM: Mask ASPM states based on Devicetree properties")

?

Konrad
