Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603785;
	b=iUkJfTrkWzL55JazhqGIjvF2zXYYbwMMukVEkcS+DMByNva+tx2+m/4Ex+RSOZbQeg1W
	 xC2fSzfsRFtb2s47RdGyQmbTL4R67IxI9L7eLY5StdGvf11LIb6I6mKrY4iPi1jcxwGSC
	 WjLAKELTIBmoHViHYDq9RsgNZwFdf/IFA9+teleuJC9tSlLHXZ6I4TaU5rSSs1sB2vqBr
	 HgPkRCv+eGG3ebzueOEK5ya5YKWzntYY1Mo0Ci4oI+2KisRJFzPgrGTSEz+zfausL0dgs
	 pP/mc7lzjCvwYEI/xPPdjSqSW1bPgxVMEqCZideyGGFuJuRyUED5cK34gertvl9ehug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
	b=tvLa23iJJUdTowLTENlqga2rJ2azp7renunoYE4KX6gHYSbqz8A95tva+/isBCuDpgJ+
	 8mvkYDfMSYEcnoWFV/hTBzTkf6MgWD3RzhwFF6ub38BsMqnIuvyL3BNnqB8+vZUW0g0jo
	 rqxgyzxOKBvdt3DVSgvE/5mfZYZD0X7qT+s4ySIYR9eQ4STWWPkGXG9Iy9MH38X5Mnurg
	 8VzIMP7tP3zYu/PQDNBCSt12vOquiBV4vBkMtBBBZ7MyaPe8KMWRA+G+oSqCAyvrpB21f
	 +NIbAQxFqERmoSUO3p530MVToqbvpUCG5FtXFjo7EZ/s30EdFZPi/cQIXTPC6PS7sFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HsoW/V8C";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EHdRund/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DF2606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DF2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HsoW/V8C;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHdRund/
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTlx2356729
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=; b=HsoW/V8CpuiMFw5D
	wLxNlxpk95W9vXffWpDy80+NWOF2t2SVcVjn8RUZOrz5oMIj/o1yewb2CNMNYcUy
	ybed+vv0a53bCLRiENwkqKSrYe2iKNnSLilwpT69/6m1QcLypDATD/jVxe8IzWKn
	q1Fv51nA2QwMoeeKCs5RpUD0gNKBxx5JNPHQ87KlqEAUjHDmQnWrMhcsJnKZRUiL
	NnU4mQTpSzXaxdv10x6HC0uiFBkwkbb4Hg2JspKZ11qb++8/7TET01t0BwW5zHEP
	4vwgGo1wngVXrWgy/ay4dFl0Cpb6KflzJV0DTG4mOAii97nduYerZcyVdi3kEfh8
	V5IVbA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a4ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:49:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso48534885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603783; x=1796208583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=EHdRund/CJcF6w4AGXIYhwxuzOyYvAPHIhF5UhkNeRU2GwX9EGzkonHTvRGkJq4oNN
         WE2tDKUAsdtnY65xSyp6uoboApClU+ujU335geC2nVWxjOZ442B4dcf5CbrNBRtoElDI
         XcTUS6u20wqxdKqZKd03LkrZHs2Q0sAj09cxhwuam0B1/1HegIyVeA2IpQLw/wMXT3cg
         8LJLSIZiqrBMIIgrVZX7F4PsLn96d2I8kRDdXBI802mOgitUOMJIWfAaOWyE7IhOm/j+
         WYL/nkk1jdPbtjlvgJVIr5AsuVfQLqiwiajUBEj7aAhEwuuPPyyQfcyz8WQsTAReji6d
         zPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603783; x=1796208583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0Fcz3/M+uiOmSyjDB7LDH22c/hTHLyH6qOeY8tpaH8=;
        b=L4PoKdAKyiaSvxEh4VOvoNvM/shw9Ez3gLyWOnLyivH8BS/IJV9KAl9gWD2hIpNPex
         U/sbQahL/FjIwtaNBmAhfdoyd+uRuY4UEc2ukaaak7HGoADiYFznKFuO9wMJ0sqL7NWF
         3CZikbkrdKMpW2+0O1ISGFbxK+PEvujsnqkePOMPBBVUr7LMDXmCt47yV1xShD+afZ1T
         CSDYVycRVQFQ753Y3G2Azo23ZCBmg0VgLLPvebNsMulI3o++pv2tXFmqIpyMfT7L5CTT
         AzHc0XkwbSiSL42wIIOJGeBit4Mvqnx91QXsQubiqCoxykY5nLqR/3hZN+5u1qxvNvAe
         TJSQ==
X-Forwarded-Encrypted: i=1; AL+hErE3DvUsWQfhNqLKJ/Zw6WCjoD3YT8APTGnRaSpcrxwHi+D6FCOUvAG2MUZSPQ36OoMx16fR2HTP4dhN3bA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bXO7GMcBTuP1hXHqzr7wjJtpyJMS/+iIc4vNxJaL6ixQIYZHu
	M2Jr3vKu3REi5uvOHGJ2Tan8u9tJXGU5vcwbwDkqizysK9iOYuPZoL8BBZNTBmgfguyYswXoXuA
	vOg081q46P1b9lfCel/Quu0uvT2/xCO/9MmYzZrMpRVWtoI6pamT5nhpNpr0TowLGJ50DPtxnVZ
	4=
X-Gm-Gg: AZFdTZcWKmZA7NPXu8y3hi3RGjFOsluhtxTwPFToEBZDlcoChuukjrTr0qkboT7pij6
	zOQoMQ7nO8nvbGn+rfNJx7Pz8S40vgXjhYuZNxcNXwwdh7q+GKHxPElxAV+qGw6M++xMyU3Txan
	FKo/+bGnR1LA45Zon2QPNuLcgsGqBzhBpMXui9//E0R6TQzCAETCVjgemxdZRVdZbvRezCvN0OK
	L522CZlK0RrWIBe7W0CCxitF3ktHriv+rWCe8zGgK5LjCzn39Ss70tCpdqELKlC0eoET0m+nhnL
	MAk5Gsg4HX1ecPQIe0yviFIpfAtjXHculuyrSWVPGIDsoKyw1fKaUFriK656xmx9MMXpckwcY3j
	cIniTETk72fBVIMCRu9WbJUK1fv/+wh8Q8bBnY7lbr4zk7XWiDev2kKRf1MSib82ykcs0KwU=
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323737285a.2.1795603783392;
        Wed, 25 Nov 2026 02:49:43 -0800 (PST)
X-Received: by 2002:a05:620a:a017:b0:949:7642:6de7 with SMTP id af79cd13be357-949ba85c0b3mr3323733085a.2.1795603782968;
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm618256866b.8.2026.11.25.02.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:49:42 -0800 (PST)
Message-ID: <8fa6e8c9-213a-4af3-b1e0-9b6c3aaa2821@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:49:40 +0100
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
Subject: Re: [PATCH net-next 3/3] net: ipa: add SC8180X (IPA v4.1)
 configuration data
To: robertijtsma@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-qcom-ipa-sc8180x-v1-0-48a889acbe6b@gmail.com>
 <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-qcom-ipa-sc8180x-v1-3-48a889acbe6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NnhSh--TVnrTyFU5sy0T9Zu3FAlNv4Tu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX2Ep6wk0S93qu
 vmPiW4Wn2TRV9BxMS/OHvPfpRICy/cmFlgS4+FMasEJBcodeZlvwv7gBGKqztgjjddyze/3Oqur
 +AOpktf7os7L4TIgmXHDuJzcwGBnizk=
X-Proofpoint-GUID: NnhSh--TVnrTyFU5sy0T9Zu3FAlNv4Tu
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06bd48 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=wqfpHMpB0Ti-P-UBA1kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX50bYOmupDDit
 Gkd8SoYNklTUwFGNFlVCeqw+LQYJRWdyW4NK+OHKd51W3KveUfrJm+qXIVgRsj7pZkAI80jGtkx
 oiPC5bYutePFueE/iDFs2un45IWkqk1WWrzOAbmmswPvzH+YXaXgmLUcL/aZfOB3oU9baaP8as2
 G/cEmrk2w2ziC0/LQQWjMTMoOxM1KyCgAfFg9PFiTg04N3IDn72gJl5tqeCxVsrtwpORUxHbzDH
 gO3wEdA2OIM2YRrwMPezuW8Gs5UnMrjXg12rnWf15MBncW31CMZw3aFCpJoNj9z1g02V7abLZlc
 q6EprBe9Ktz2ge7IJECq5kqNpXWyKazt5i6XyGzlYxZ89QvHe+0sJdTzKMQIXim0QGVHf5ZuY04
 EGqDnjw3oiWIm2MKrhdDWahZCk8sNNW6s8tkNQbLIm951cmK+V98wV2jHpRngHtnBGSkzrzwcyP
 gizgUpGqONMVDBPBcsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/25/26 12:01 AM, Robert Ijtsma via B4 Relay wrote:
> From: Robert Ijtsma <robertijtsma@gmail.com>
> 
> Add the SC8180X (IPA v4.1) endpoint, resource group, shared memory,
> IMEM (0x146bd000, 8 KiB), and backward-compatibility configuration table
> (ipa_data_v4_1) and bind it to the qcom,sc8180x-ipa compatible.
> 
> Register offsets and endpoint/resource limits are derived from the
> downstream Qualcomm msm-4.14 poipu/sm8150 IPA v4.1 driver and SC8180X
> devicetree tables, adapted to the upstream ipa_mem_data layout.
> 
> Tested on Microsoft Surface Pro X SQ2 (SC8180X, Snapdragon X24 LTE
> modem) with rmnet_ipa0 MAPv4 and ModemManager qcom-soc QMAP bearers.
> 
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---

[...]

> +/* Memory configuration data for an SoC having IPA v4.1 */
> +static const struct ipa_mem_data ipa_mem_data = {
> +	.local_count	= ARRAY_SIZE(ipa_mem_local_data),
> +	.local		= ipa_mem_local_data,
> +	.imem_addr	= 0x146bd000,
> +	.imem_size	= 0x00002000,

Please defer the imem configuration to the device tree, see

6f82cb4ecdb4 ("net: ipa: Grab IMEM slice base/size from DTS")

Konrad
