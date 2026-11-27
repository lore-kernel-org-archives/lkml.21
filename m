Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752703;
	b=a6VA+osKjEca7D5CanQDaEokkbP9oIfom0v0h3k6vfhJDhsac/oosA3p++tMbcfK5PXQ
	 aW3ZfgQ0TYUbx/aNQ3NvjsI6v7rdXszrcJmxrIzuX3V+I7345MAu5lZDajJyoQhYsopcE
	 We9Rv8RPfdV3MKLUZhL12w+PVGQSPL19VQQH1M0F1FsTqbBb+dpAxhccLF0WUe12V5zqZ
	 XNknhKD4sEVjrWGmd1nhoZgO2f+ziRvep+XH8ueSwSZ1bgtCT+t/FTEViTEd+wS+ol2Ot
	 LVmhEwCaNkrHJ5GwMkuexhDmbCFw893C7W3iLyHr3uFcEYLOpCVJyXEmXbPl6l01yrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bSS+TfzotcLZLnDjx2lsRE7c4zYm7LtguQHz8ft9Q+8=;
	b=mZG2nBnFVz/oOcE1xZQkeYe1UNw9e8I0jqQOu+zUVevGWP8rpjHTXxpkDKyv6CPkS4ZI
	 SEwJNysZOM9iR5QhCC23IrYvVHGO8URg30lNk4whtSyQZWBHcUAGijQe6OE7NA08p6+s9
	 pSvvYVARvpqBT+sloXdcpJPKte1ph+OWPO6AXNnrjo3zVtAj04CGs3JJDFcqsNKIePPUE
	 fivfpNltAim567kgyuzILBDHZ6zoMXPxwpg3aLtqXxabKyTYEYLytE7ieAapxpH3rY8qq
	 r1WOPp4VTiRMDsYZLsIc6X9fbZt7pKQTPeL60JdAgZj56b53Vz4enqFAQrAAVkbqxlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1Pb6fs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iE+zJtoA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B74606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PM1Pb6fs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iE+zJtoA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR0m0xF375629
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bSS+TfzotcLZLnDjx2lsRE7c4zYm7LtguQHz8ft9Q+8=; b=PM1Pb6fsJj8Pc+ev
	xL8J0l09Rn8y9r22af5x99M+UJjgOb0g3vXHprxTaDn6Ely61BEyzVurS4/OQMSK
	r6KfgTKeRE/L2faE9SoEcjsOg4172eAGDKvZxn4UTFxI2lRq7m9n18MNbwjUoVqa
	EcEIKx5eje+XTU2OXWKlpYmwTcXN3FzH+yQ/S3FBj7bIyiP+kIama3Oxu62Einby
	TGis3sGuwxVqiDaL8CMMe7WVwGX6VY2FOI5G20Shhc5HpWocUqFg+DjIu+QB+usT
	POI5WEbn2OR9no7cfekly636Wu1QjqhT2UPU1spr3RRh4Rf5/HR+ZCWEISlAwNAW
	CGt1gQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ymw8fam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:11:42 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so4054539c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795752701; x=1796357501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSS+TfzotcLZLnDjx2lsRE7c4zYm7LtguQHz8ft9Q+8=;
        b=iE+zJtoAuDdmx62d8h3yBqLMMxwVGuT5J+cv17489mzsjtQ+9qmMyAUSTSEl0hMfSc
         tUGYwHHu/1WKyIk7Ywl1CuWShLo5nfpnhxoEV/PyonjYvRLZPfd8kirxOKPbrOvsxql0
         pCa8jzYBpWAoOvf8/qfi/2+pbntSSvA3jDVf/rT2j9O3TuIO2ng6IogmVuUgn0PaFDWe
         75U5rZOxgn+qCEH/7zHvbQ4nZ0QYG6A++YxEdXywHiogd9LoiPqC5tG2Zkru/uBp2h8+
         IKqmn9wmoLT6FLjzATgQFoNOKPSl/t4RHbutrLhEGfrMCzTvGtAF/7cjjLcDGLRe5kP/
         9Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752701; x=1796357501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSS+TfzotcLZLnDjx2lsRE7c4zYm7LtguQHz8ft9Q+8=;
        b=eZFzsFP0A6BFQpUihcHh/p7nIQaChHGn5jEu38s7AtpiB7ET1jtt0N+AC418EWuNN/
         wlj/890hnsEscZTielb+DM6lksrA36pMT5pRE4PQxPLDlwuenUw0fWnLyay5RgsgTdSQ
         BUtKFrl3F58SejtmHng4zYJoD8l7wIq5cFExjM4TMkIUtkoWwCi8qXyLgbSQrbkJmO50
         FXFlrJvtj7MMJW6a+jcRab8pcw5NrsCU0W0KU0SshxoE/G6etvvRfYL3PCK1W3sRLObo
         YxEELaQqHPjGOEXGz/WyqkI4iRSimt/IiufcGwrgTl6mb0Uqi1wACgc7GrVbVLZUQdwV
         qq5w==
X-Forwarded-Encrypted: i=1; AL+hErE10Oawwc/MxNO1ZUnTsLnO4g16UUdaGOLcSaEXA9OjdTIOMwAu5w4hb2bmD6aKMcqTNvGMUA/VwVBHVx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lOBamRy5x0jqgWBSBXRIvd3PsXbuaULw2nLMrzwGgzxbQ15Zp
	aOXkme+sXRnU/V/1+daIQcMv4I3J/lGYMapxbuXopZAPuYyRoQJlfQyVgITFPgnK1bCsnuzE2qQ
	XzbPspZriyANjri5eT/Zr6Jwa5YgZAAfr5QaxG/dGysqQF9ExoyOuOe6T9duSJcqgRBU=
X-Gm-Gg: AZFdTZe0nWx++oKKIRR4gOKQNbeRpX1spAL8XHcWCtigmGN/aMnHvJzMSi2TFdwjokb
	xtQSncfivGml7vlCKFaSSxFRW4J4hgA0on8G4nH+UJ3MNAE9PA8uZ3xYFqa93nZZy+Ud76HnO6k
	PqI7tyYKdg8OZwOjnS8Z6w0puABQ3BS2mPeDxQUxQ2LkYRZgpAH14XlbvoBvbGAXCGCkBNzfXiO
	MMg8ExEYW2AZYqFOV1b2om3qnft0bwwy5Cs8OjFaiqr6/5tMcG/cjqsiy0KSgueMi9rsnlV6TJ2
	EZ+wM4LMtMs7sFtZifbEqEl54Vlwb4+M4n2rIDojJ3IYllBVBIAumU008MS4LjV/6OMaZ9cpiSx
	r+G9NX/tRXZp3bCQLwvS1QxoTgsFN8vymm0cXGO3eemrer21bT0UJXVdv5KLe4Bg01Mx2/LLiHX
	6zHTbe4w==
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr25839622eec.23.1795752700934;
        Thu, 26 Nov 2026 20:11:40 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:381:c532:3d88 with SMTP id 5a478bee46e88-3857093c38bmr25839603eec.23.1795752700431;
        Thu, 26 Nov 2026 20:11:40 -0800 (PST)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm82327331eec.5.2026.11.26.20.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 20:11:40 -0800 (PST)
Message-ID: <e8e6eb0b-9755-4f49-a4c1-03d2f0e52f73@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 09:41:35 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261126-qcom-aspm-resume-v1-1-a34625656e92@oss.qualcomm.com>
 <b4aa73a1-ccdb-4ea7-a800-3c4ef20024dd@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <b4aa73a1-ccdb-4ea7-a800-3c4ef20024dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxNiBTYWx0ZWRfX3wUUhnihe3w/
 uILVkCNAzPG7UsFIiac9j/LziOHsl9fd4sJfZKe0Pk4H1YH5zXWnJTC7aMiP4n+KIeF4ihEhYdo
 NlR3xDFX5lhUxgD7Rn+++YvUe8ZT1ds=
X-Authority-Analysis: v=2.4 cv=ZKtCCn7b c=1 sm=1 tr=0 ts=6b0902fe cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=m2VWs-Z5JUpV_CLSMugA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxNiBTYWx0ZWRfXyeMMnLLIf4Yi
 zjLPxIUBYsaCCIXInUiDr2ysIJC1Q7LGzeVWtupCeFhgu/wmJdNK+iHWlukR1RUXvw74aYtTrvk
 Od83DNFN8590EuImXc/0QS3VWluLFKCgLPG3yQ4JK7IRLuvneUYOVd2m/3Qv/vYxMrOmxOU3Q1K
 Txcg8n0o8b65QUXvd2LcVB/n92o3bF4DqXg09pJF27rkS0gpLPlH78J3w/aK/GwtkP+IxY2MUg7
 11fZckJKef8k66wGv8WP9wxwdGAaZWZ677yNz8K1WhEtXoJPp5EOOsz3H6K5teg2o4JKltlCnlb
 lPret9DF1X3XRiFyOfVG29SolGQYa9Lg9XE7HXVZNYfndksyPN5OcPoOZzUkCfvKAtnlCFdaGIp
 B9ekWBIWWaCvCLu8QKznE3WPTl15EZlrpq9bjOB4Dc/4kh3zMrLQDlFpYFmiiKu6llGM+ya+hJf
 nmgGJITMfd2rXAlBNPA==
X-Proofpoint-GUID: zAfr3PoFnw92-cETqkaIo2Dk60KqnT4d
X-Proofpoint-ORIG-GUID: zAfr3PoFnw92-cETqkaIo2Dk60KqnT4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270016



On 11/26/2026 6:37 PM, Konrad Dybcio wrote:
> On 11/26/26 6:44 AM, Krishna Chaitanya Chundru wrote:
>> qcom_pcie_host_post_init_2_7_0() walks the bus and calls
>> pci_set_power_state(D0) and pci_enable_link_state() on every downstream
>> device. It runs from pp->ops->post_init(), which dw_pcie_resume_noirq()
>> invokes on the resume path in addition to the initial host init.
>>
>> On resume, the PCI core has not yet restored the downstream devices
>> saved config space, so the config accesses performed by the walk fail.
>> With a PCIe switch in the topology this is easily hit, producing errors
>> such as:
>>
>> pcieport 0000:02:01.0: Unable to change power state from D3hot to D0, device inaccessible
>> ath12k_wifi7_pci 0000:03:00.0: Unable to change power state from D3hot to D0, device inaccessible
>> pcieport 0000:02:02.0: Unable to change power state from D3hot to D0, device inaccessible
>> pci 0000:05:00.0: Unable to change power state from unknown to D0, device inaccessible
>>
>> The walk is also redundant on resume: the ASPM link state is restored by
>> the PCI core as part of the config space save/restore. Skip the walk when
>> the controller is resuming, which is the case while pci->suspended is
>> still set at post_init() time.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> index a6a0e3ecd921..bd1ffbf5c21a 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -1174,6 +1174,9 @@ static void qcom_pcie_host_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>  	struct dw_pcie_rp *pp = &pcie->pci->pp;
>>  
>> +	if (pcie->pci->suspended)
>> +		return;
> Is this going to regress hotplugged devices?
No it will not regress the hotplug devices, since it is taking effect after
suspend resume.
so before suspend if the device is enumerated the pci core will save the
config space and restore them after resume which enables ASPM back.
> Or do we need this bus walk anyway now that we have 
>
> eacf92a29af9 ("PCI/ASPM: Mask ASPM states based on Devicetree properties")
for hotplug devices we need to relay on the CONFIG_PCIEASPM_POWER_SUPERSAVE to
enable ASPM, controller driver is not getting a call (currently) to enable all
ASPM with out defconfig.

- Krishna Chaitanya.
> ?
>
> Konrad

