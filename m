Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778926;
	b=M51PbvUPH67ht/VFz4R1XY2h9J3ks6xsNXFc6YdZ8wGDU5fvb8OBApBe2Ka+VgutN0ZF
	 6E0Y5+vjgASI/LCfzBP3x663bv86IjEflBsLtgEEB3xSYl+FE3BXItrchxYTRLLeSVdN5
	 ForYToFpcSiQlGjwza/Dez6eaptV/uIYmfKjXwE3OmO539zhEZp378ZWYKMSGAFHbsMzB
	 IFRpEt68GBR6imwzwBizf9OtyvI2uFacQA1/DPgUZCSKKiogQ2OKkua2ro/fHR6X7FHnM
	 H66+BTHM5PqM0tt11rz1rQyImrN3KCLR+im9ly1s91/bcT9n1GOWxFCZTRYkNUEmAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
	b=2CUiXkPz4EuvUuMXPkffpAYLhgTel0RzU/8ZaF92ivLJSF1qsDblJIYSca68fw625/Yc
	 OEV7sWdDZBDye8ydHTeXLkMuHmK2+He1dmVxUMHqaQcc8X0gOM8C9uaafJg9wvpB/dL6n
	 AAJRN/+XUi76geTgWFFqe+GPqBWh2ZOg8u4pt6GQXmfu/LZw9PCZ4o0o0qmu3rwEp2PAL
	 j3eADuagPfF7oNPM1StaSHjn13f0+B8C0ghtADzak6LUy5B73ma+FjiphE5VBBkHkYIXJ
	 xj300pqriL+BcPt6VNQzJA4eoCa54uvcX0DS9sj2dTixmSVMQ47am9uyqeLV+gxYY+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cffWaVwq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoXRxvyC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90901606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90901606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cffWaVwq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eoXRxvyC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApJSk273463
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=; b=cffWaVwqTRC4Xmkk
	q7CQKO27Qf+HBe7JXDPh3qS8EMBx76rrdczz6lIFAV0VPeOdqyVEZAGMh6+6g/cS
	NhmmwRw/QQGVUnYqkKcASyknzWEx8xdLsykuJh6v51+e8LVyVmAWq6bZeznxHcy2
	NWBaJzTR2kyRyrN0zSw5Tw7Xf1ApAJdCvdfTX64c9LAEms1IbghLnVzOLWcxoVZL
	IR966B1kRxA+GorI5u9NVn9IjJ6sd10Dqvp2/ov9FOe00Y3qfTk8RuqFdmVN9lrj
	Cxx07gW8c8NrPAdBpFJk9OsG/Hv6FlQGtoT7csVFMlUVcfWeyCXKIek2fN3flL0f
	Lk6hpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49arx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:28:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5476f5bd009so24934491cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795778924; x=1796383724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
        b=eoXRxvyCcG0GcIcguIYGwmHfNh5pI+biCVzVc7biSCICitb+H0DkMW9ywsUKxDWDlw
         2eI0Anexx22OtjIOu0K5DCmfLe6jVButs+1LotzkN+9fotpvLNvpiw/wJ6klowLu+Tyh
         h/A2TavREPeDBa1RzIQZEKE+iFxFSWE66fDcm3LN7qMjOKej5/WDKqxOe1CNPTrGo6UT
         rEWLhvNoR2sYPnPcHxW9m1DAHY/kOlM4EJEQ4DViiYFuzhmMSgK5t9aXW7Bd4p7uiGMr
         efU2fBE2rcwTrQw3sThmco0QB/6a4LSVdj7A2UIpQVRsut7szxdycng9s9TldFdCeTi1
         awXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778924; x=1796383724;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3QcMFLkVoOVQbwwuwu7BQKszQucYPXEBAdfvcVBv04Q=;
        b=YSp0/87Fd82krpOk3a9Wlo2BjwFSVh7t/QYKCBxCxI9MAXAfWtsP0s8BsxK2xCJN+O
         LvjsIxPd6ThIzznTk9bQn9BXEsGkFx9506nQO1gKX0YiQV3ljdgs51zFDp6J7g+IUQC9
         7DATpHipYtSKbhWqBd2wPwo/2rnlr//zgCyg/7H2VVDMmI4nUOnAXQF9JezrxOyuNmYG
         X87SClL3znYEQ5UaTaK4mzYp4HsI8+1wVtaTDfPACrawvrrdqZhZT1K2lIF0tI+yr/iu
         jdGLuhKkJFT0IvSOZxNtixa5PlD0Ax+DCdXSDjDuDMly38N7iuTZIL2ZlCaUWPdXqhJ1
         wx3A==
X-Forwarded-Encrypted: i=1; AL+hErHI2HC93DrakuBKgWezkfJL12A0xSCeOeEWDEJ/lNmGDoUhd9ba9fG7c9JjMVpSUohW01zKA0auqIUjYks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5+F/Y39ra9qKHqQDef9j70qKOWdALX11T4+sWljLNrLNAKct4
	JinJEuqrHQ84oB3HuKLyBu4S+EzumqkAHr4H3Ltcokn8lygc+cBOYasFdlqlOLS+MxwBdV7ZGNg
	r3Rx9ZocxfVFjrHMxMvPXvFgEGTScl90VPtM4aAGOB0G+SS3ayHzR31aPYUdrJoBdwJk=
X-Gm-Gg: AZFdTZeYEZUsKg7untV7LUYeKeiUxE4PgMTprZPdaK2D8zSME0WPPwhjfMB9c4Rln0f
	klkfpKzR/rs/3S/gi+hY9dCCas24XpwiYudJS4PykMEICr7Nokt5Y16IIHJlrfITksxEM9uSDLz
	Kq4nlmuyKG8pVs+bjDbo1z3smBoqT+w7quFYkdAECF4t5M1I5it+Q23YKjh6ug6auMVnCJUDkES
	9H+BpEuvIWJrQC2iVml4zhEi4SpRY4o4k2jyuvIBMjkYSNeFsIjk4Pl46WvRSrm/IP/5oExZIsT
	LT1WQLwnVkCiU0KuD0J0tYrKoqtCEB5pOKEAF0DdwQvRtyMM/GfwOmi0NNkZXtaXxrDizZ/bv3W
	7oiwpXGMwCCFKA9CeBunTzpUcaTSBPVW85GykcFgYstzJBlSBTd79WE0F+JuvVJuZrt3iuTY=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4352516985a.4.1795778923779;
        Fri, 27 Nov 2026 03:28:43 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr4352512185a.4.1795778923280;
        Fri, 27 Nov 2026 03:28:43 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm853935966b.80.2026.11.27.03.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:28:42 -0800 (PST)
Message-ID: <a049f292-848e-46cb-a2b6-0c4a82e9a7e1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:28:40 +0100
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
Subject: Re: [PATCH v10 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
 <20261126-shutdown-v10-2-fed60d9687f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-2-fed60d9687f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xhj7BRiOUie6PbeOUmlROEYlb9s8Z9B8
X-Proofpoint-ORIG-GUID: xhj7BRiOUie6PbeOUmlROEYlb9s8Z9B8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX/IexN34dob99
 RSwFDjZ9y7mz98PYPvUO+RcRBCZ+cxFBzYA1z4f0A0YUSM6dCNUW9Dv1hhqaa2H49K9JTGdOuZj
 b4pmwr+g5/s1fMA2GzCcTUdgPEN4kus=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfXxTanEQlBjMi/
 4Wi5/B260nGs209N0m8g5Ub19UL39d2/SYwHeG0El6TlBfg7uQ8PKtCLG/X7nTCks8psc0z43BL
 WOQ/xoFGDlHMZbsk58TV09jf0h6wN/h4uWkiSDLpR2P5n4H7j9MbX/dw3p9j6vgNoiklbUmHgyU
 19oNMvQ6esqwLlXjbxLKdcK/MQd7XHCJBOJ5jPaCRnIoKhQrdkIXRqg5ErMbNjDRYSppQzRJ37c
 LWxZJc0KqwmC3y4YgleMAoc3nIHVEctJ6IET+AXWXLq0brDFLRyhwTcYFLpgLS46ppFYOzKoIus
 SLqy+mR0BWJccaZKZK6UTs9iB+HBdFp5CG80Wcv2NU2YLggfIpj6jVnUpOPoe04jQHPvlvmygCk
 CnANXKRU3l/AetPo/t+qnkcWq1llkerY5aMl7pZJbe2BGqPad23rknaodtLhhAIf2zhPudO1fJG
 cQ8SWFXEtJk5+dwSDCA==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09696c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6YwwngTh1o4zImgwx78A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/26/26 6:17 AM, Krishna Chaitanya Chundru wrote:
> dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
> to check whether every downstream endpoint can be put into D3cold before
> bothering to move the link to L2. If no endpoint supports it, the
> function returns early and leaves the link up.
> 
> Querying D3cold support during shutdown is actively harmful, not just
> slow: pci_host_common_d3cold_possible() requires every active endpoint
> to already be in PCI_D3hot, and returns false otherwise. If any endpoint
> is still in D0 -- which is common, since endpoint drivers aren't
> guaranteed to have suspended by the time the host's shutdown path runs
> the check fails and dw_pcie_suspend_noirq() returns early without ever
> moving the link to L2, leaving it up right up to the point where the
> system cuts power/clocks to the controller.
> 
> Add a force parameter to dw_pcie_suspend_noirq() that callers set
> explicitly to force this behavior, still call
> pci_host_common_d3cold_possible() unconditionally, since it's also how
> pme_capable gets set, but ignore its return value and force L2 entry
> regardless when force is set.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
