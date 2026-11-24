Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515209;
	b=XAth3GFQI/gddR/XnvpggkjCP8i1WALqcj2haWUrUtIi5OF3JUgK2+i1uDRKRvtpOKrL
	 ew/v9YQERpBfvYK9Fmpl3pAxw52nQOMsz6ZXUHMt5w6pw01sUTvNg7bNzOuF+Oe7R2dtG
	 hd4wWk8OMl81VYlpklJrAYhORKXnPqOakJ6fLhgj2Z8dVRFbTpFcsaBWVMLIEXPwMPZXk
	 t2aa9pm4zhoTOgCd3p8hsQfE0wEtQrSlDgFi6Q1QNuiYwCLdnqeKiGffGeBq3sopuZXTa
	 OFLlX22P/Nb3UWCuG21no6m4n1K3On8kU1+tqvkUa7dNU4SRqzFDOucTQ25RHxmJL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515209;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
	b=qW2mtM/DCaVVVx2ZsE46rWwZ3fKpGWfzGngjFNJqK3T8RCKd5JLZu/QQiRrgUoregXYC
	 arhIGptBGF7EE5zS6LNu268PRrb0yFnha2Rs//1oa9OWoqGW+0z/rykXlIDFoBJfsg60v
	 mwoEGQmPXmUBk8nOSYmsZOhodUrFg3JikWmRLZo1vTPxN1hhbgVLqVRTihJr0f4epw04t
	 rDoIn+7XfTKrck8JbTd0fykk3V0LoUd/8JZqM1QQgM9/xAX1JR+gh4pvXbXEyo8eLKTWd
	 RoLYW4XJ/bNBMTZlVjtPioeZgz5yW9DcPM33tS66ZghCwImhCs3KibO8l5YWFnoavZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="iDNxg5/f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9DF606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iDNxg5/f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMVH+aDS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8WG584128898
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jXZ6L78F6EFUbyACsiZAuSZs
	aiYj54Jynp+2S5EVBJ4=; b=iDNxg5/fCzrJEN/fr6lSGglP+NKGiUTg0bHDgGbZ
	oPvkxENj907CBnVb1tk4xGoAxAiY+79qAGhwrz1hkyrWqfC8oFUGSkHmrZ3/eGfM
	WzDlAKgin54Y9sGk9CmLcFxiKNfkiI3K2rl9+d801pKme6OnqQ1KZJi8HRE7UgSM
	dq7VCm9S+YK6f/zQgWJaSeOnhPfqKPSoZR9HtIstrS1pCDeeLLEL6MMNi82hDyGB
	W4ARPa8jv9Anpp6sji9UegFduGckSPRAUMCpgRPB43O8SsGg/8BLdMpNQyKc1waX
	98BfDijfjQViMKvKsekqkLTLYNkJTSxrWcCnfnSPqfOpyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt25cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:13:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so6443989eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515203; x=1796120003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=dMVH+aDSmOzOrv5taCHA3lxNcXLLrnBm22QohViRryiui61PbKHDboJ2yeIPhi9YlE
         KaAkGX82o5ET9dBT2gmYhKVyxk+0uGb0hQSRj2rtV96VJ22fe0tdzg9S/uWDRopPzNGn
         HOA64U2DvRq/Hif9HweGMzmnJEHTzUBztwy7Xat9rvB2HLsWP4v+w+872K9gJfyxOleV
         2yVQjxT4RCbrEPqlQTu54pn8J5Lo6Cdl5rIlAQNvf1IOFA4pQnKifxoGdjOPoVSwMvWA
         6+dvu/P4xDNl1rFS8+L/PbRV+1TRAIj+i1Rc8Fo1kxK/CMteSSdItAlM9htP/tsI3vy8
         dimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515203; x=1796120003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXZ6L78F6EFUbyACsiZAuSZsaiYj54Jynp+2S5EVBJ4=;
        b=SeeAGe2wybx9/vN72+BjmSiwlmnNjhYPbnSSjnnDhBGyId35bXDdXHnNLKjutznpcr
         doHGu08mUb+kd9wjONqj4ZNVxxgs7YaEtl03sE9pT6S4AnOXTR2REf9C3FrPKxrdT8tA
         d7KyCBgXkwRHmFSHsbwyIgPsO4chX4iHb04ETHCVKms2nWGRfQI6v+KwEm+Q6uGXX59S
         ovJna30S0hCCCeGujaoWjwEzHcIwEKRRjxNxxNVmEpDUYsuHbbN/nQskGMNaXlbkezvd
         nw20j6S1xuL6EMoZqRRlcDad19Xx+eMK1QjVmnnYwQjvcDABSu2F7pkl5CCTxqcZKNGA
         LYNw==
X-Forwarded-Encrypted: i=1; AL+hErH5F+eEs2dM2Mhg/VZ2wqeZij8/vapuxIbi+GQycZ6+x1HJaIyhE5kyju4lyAhlBfZW+EUey/kyLPo1l+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Z3994Pk8ZvmIT7vfZCC/iVm7neX89LMDoqdImNBUITB8QNIRI
	FLPFGb4HU/T7Uf9BxIS/UQVJYcrRZK735+mB4+GetL+x5BMS60gcn4raaM1YahcYzyOcr1Ld3Cz
	R7kvZldHhk2PAK5xfuU+/4H72PSe8S6hfzCFOnXcOJ7R42oq2qgx0M+etxJEjt6ZMSac=
X-Gm-Gg: AZFdTZfFpuCND7cIVBdPpbu9cGAdXjC8IzR0Pc7tIwA2QEwyF96VFrXT4HUEwMGlFuq
	Svw1VM32VpwdS1x7oiwd6q9fD2v092avluFV956OyHb4iybn7+hU3KIcYUMOtt9bl/4JrXOds5f
	WtNvV8D5s2BIjRa5rtZyfIHh/o+nalEpm7nNkBKbQM9gUsBpx36e4RxB98aA3hMV6XDqJAX+fYd
	fDOoKB4JOgNeyLUcEo1Z86FeHZ1Q5iGNI/FgCzKrQxEE/57abV8sSDGnRkd1xsbeaWoy0Otu2Zw
	MsQL/lKoiMjrksAcVBXipFzfMJgKwa6LP2b9irSC1qWyM/5DbCP8OTpGhouewbXUQLxJlWU5GrE
	JWrEOgiWXkpIx4z4HT8Nwt2vS80WSK0uXpV9Vd0hhIAJxFl8hy8dNVODtWIt719Ri94EOZKs4bQ
	Ql
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143848eec.1.1795515203352;
        Tue, 24 Nov 2026 02:13:23 -0800 (PST)
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr14143814eec.1.1795515202730;
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32189994eec.1.2026.11.24.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:13:22 -0800 (PST)
Date: Tue, 24 Nov 2026 15:43:13 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 2/5] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261124101313.vezsh4klcxcklg2a@hu-mojha-hyd.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
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
In-Reply-To: <20261120-shikra-el2-v7-2-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX9sUqRr9/SvQp
 ug/aw889OoBRkAFLi/rNlQTJlwtMNKh2bXyJQXiA+oy0AnawRwQuPgwnlrOWy0xYKii/JxLghca
 70BFMGJ9E1N+slTgywdtO1FGqoG7lp0=
X-Proofpoint-GUID: DURtDRQKdqXTNVc8iMebUlAIPLhGzBuF
X-Proofpoint-ORIG-GUID: DURtDRQKdqXTNVc8iMebUlAIPLhGzBuF
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056344 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FHuKVeeB07r6xee7kg0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfX4mkY3HaIPRPw
 p5aomcLUXU20gMl0UddyEvrC3ZQQQvg2MdMsPXn4IVVqruIq1UZi6N+WRPZHmU1FWx8+CooAnWX
 lroHNM29EEBESEZhvTb5cZrJ22WtN/W54NCxngV2VcmgVdQCD1b8MNQdl4+DWCnh5pHsiLKf41X
 V0p6LV/nktRe6PoYkoElSAeZ19hYEQUcnwOywzCgvZ5VqfAYxKIOehWf3NhWx+AsQ50zcEMU2uB
 sGrd/2Ezv4FETLgejIQ5eF1dToIyRHLxikmrh1ORETKhute3dffiKbtUOSz/nQd7EfExnYP7eGN
 oTMJmurqLxl94GD7iFYtcF9OSIz9WiXQ9Drzx6cZFzuGbfVCX7j/H8FdhAUI1YxUbazZbyK15xD
 mzW1UGQ4jxufNzfcQcYQUWss7C6U784dyEjOKoKOb7dLQ39NYcQ+NXxzY2h+UrDJcfn2mYnV6M7
 0ERk5eXXRz27xjIclhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039

On Fri, Nov 20, 2026 at 06:50:50PM +0530, Komal Bajaj wrote:
> The number of IOMMU streams used by a remote processor is not necessarily
> limited to one. On Shikra, LPAICP uses three streams, while CDSP uses one
> and MPSS does not use any. The existing single-entry limit therefore cannot
> describe the LPAICP firmware streams.
> 
> Increase the maximum number of iommus entries to three and constrain it per
> compatible: require three entries for qcom,shikra-lpaicp-pas, allow only
> one for qcom,shikra-cdsp-pas, and disallow the property for
> qcom,shikra-mpss-pas.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
