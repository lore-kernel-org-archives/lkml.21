Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680420;
	b=4uYARlMMUGWKvW2pvp7yjLAJkzkp+nFplRG1vC/opLiyRH3rEi2C0jjGyk5OfTGUpBr2
	 XsCzmR2RdhT3lg/BjHvxFz2zXALuzWPdExlXmgxUQNItIOKCh+7SXnQym058ikHF7pONI
	 LLFKmOrJbRvPlxFgC6hDXSc13d+QdwBHm6AvXlKwbK5t0n3pSvK0qPE0nNULgZQAJmBKq
	 zYzyw3wLw+HQsl1o6H625UP9Und+tZjxBo0ByfAyBD4QF9oDc+FQRPzr/SUnskJMEG47G
	 S54KgSqdaJUTpp4gCjpjP0asGdBqpZ5RlPGIA9EWqUtQAN8169VXLU/ANjL4p/C3lRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
	b=xj4FpYm3/TtKSZsnPHxamLcjl7IwZ9GxuI3GdIHS5RwdLsOaZ4N4usNN71YfTEv94J72
	 r4Pp53y6ZC4u+2GO9w1Nw2NBKW6gZtwHztzfTJz5ABBFAKpsz/hsCWMowqerRvcAqrLcd
	 d1Q2r8FVYFYphzwSdJI/O1O1SyNmXCaWcuacMduMHPKlE9oUEyuje6ROMBNwZs9p5XV7G
	 +sUBGiGM6ZIyy95Uj7NQmUQK4ywpMdYPBeiv82nIzDQK06usxbaFQXtUuYfqHD2dFGf/k
	 wjKe9Kz9AwDaIn118PBPwD+SZHno/N2Pl27U5DyzSg3RZtQeom7UmXiKdo7V09t+VLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A1D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRGxNSFW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BH6m2700660
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=; b=cuTiIGukxXzABDFq
	jqGVYJsu0iutdk+Aa6KvmZuc0na2hHus0NXjieEI2uymsQsFayLc+UEn2Gq1OA/s
	sdNInMq9wfq6081GHTNTicfbLgYlVLDjnr+q7nElF7hoFnmuVYxn7c71tk1MXwA2
	umispOJGej+tL6KnYZcx/bRG2Cclgt7WYRUn7WFF+3CicgoQLPSLQhhFMi0oH9lI
	xtptUzDZRGpCe0WOmX3s8MaSlLNJUxJOYNNuPJhLuh+bv4kLdF6kJWGNmcfmjKpy
	3em34HXZB0x2cFpDQ+DhqplC+xYKb9FfRw/S28Rf133ijOYCYRx40PGmMDCcdwFs
	ewBrJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhvnfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:06:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9212f132d16so6174466d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680417; x=1796285217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=DRGxNSFWBGOg9sPyUtsxLyaRPwh/ftLTEJb9v5yoKK1HPhWb//hEygsEosCdRQZJn6
         6foNLXPthmcj79cqGnpuxLDRlPSU3tWRedK8vPynAhyXWqZEskz+bbcMDgXEzZ/CUmJI
         Fzi9HEBWbha22gRJCX3nIHTfkT3F+b2hd03bJIYXLFakPvmGKKu314cNdq2C+nyWnl6a
         KQbvGv/TJbfXVNDxO7FogF1cG0Oi+HE4Nwnqxw8GGX1H8hLsGd5kArFcyREAo1KSopq2
         pAIK6Qn3XRO6iub3eUbLOfe4sZrpUVXHqmEOE4EOn/z1lo1Yzs8EFqMyytGomCUZklXr
         G5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680417; x=1796285217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=gSRjnj5Hv5YLBEhobi3XXyDhJcEyFADud2NKmc3iaXyic524sgDkMPJewSCt03PACn
         jghQ0tY9T+ydWld+mjycYsn/2QfyDO6kYT0edYhT8rByQ+lI5/ZX1hHVJW1ZgO0IKOxT
         8Ms5I8UHvjVf5F8cUlzeUSxhR++d7hP+9cxETsImLj3PANX/8N821rfmZYByjinnlDBd
         ht1/664Tm/hXuoHqwSXmn32BCQy2v3O+keoSwoGNGMRo5rNuhpiAc/nD+Owa+LnJTtkk
         S4qY96f7T+f7C5E3YkaYCFLJchHB+6yewm4/enRc6GIekrWnJcB080/n9Viesho/yk1/
         7OnQ==
X-Forwarded-Encrypted: i=1; AL+hErEAwzzuHSwXtTmDiY2lmEF9K9kouxDViiIcaVZBKfDTnTFt9TO4xF8rAydHN8I454uhnWwpTCqel6kD5gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C9CfHFezsKWqqwVCBDi/aF0yY2HeHEHvRvB7SY6XLQ3JCxpBK
	yEijtlBsHM4vKRdNX7McF/N0j8h0sh8A3hqQ+H/r/MGtKQ8YTRxq/X14bGDy/JE+E65RHwL7fhS
	+H8u8HRtBHgswwfAKCuDenWHuMRFGpuibnKGwhLawKtJfd/6DXeg4zsKvb/H6tTJq+EigFHO2PE
	c=
X-Gm-Gg: AZFdTZeU6eUWQTTkocKyDSzkLtFEt5RSsAVkjPzMf8FX8vnNnSGwxuQn3qgd3uM2rzS
	fWGNFUYc+5nRiw3sYFxvqemcMqXpOLo0ZhzJVXpRCBlnb29x5QSoW/2hDh1KmNGdEzuTRShoSJ1
	trFyV4mvIR8s659W1NT0kejnMf9cu5nxHav5vQIYNTGUGh1dULmW3RpBodlGS/KoQOyNs74EzX9
	vaX2lhsGpyZygZLmPR12KKClxCSNA5BfTuGjzehJOq6TOXd1Ax6qHP+JWG3nkvtgJhyKq4pDLxy
	v0TG7kQSkxC9QaRAWrzNGgFPxK7UqhyXxhB08NtYSdDLwjYpiv9nZltUuoYg2S9dfjtUV/EKTak
	7+g1n998I7vmnClCZ0EgULpEB/qEr5Ztl5JI6FxNf5SI9XPfnBfgIiqxKmZqzMx1WWxN2I88=
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759636d6.0.1795680417022;
        Thu, 26 Nov 2026 00:06:57 -0800 (PST)
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759006d6.0.1795680416471;
        Thu, 26 Nov 2026 00:06:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm743942666b.20.2026.11.26.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:06:55 -0800 (PST)
Message-ID: <9c634c3d-0d74-4ecf-b9e3-180c2d602862@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:06:51 +0100
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
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07e8a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=QI7CjI1Wg2L04FBskPYA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: yjUg8GZbg5xZZ1UzkPZFfOIFadD6Vo-R
X-Proofpoint-ORIG-GUID: yjUg8GZbg5xZZ1UzkPZFfOIFadD6Vo-R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX0fp8PVG3/9YS
 mNUS5sOZRLiiGyXNs3ijbAYMqsmg4FUwntpeoTjOO2/xohnjE8DJN4ImvtZUVt42e+LJynhJ3U1
 UUUYy3Q56+xUvWSSXY0ceANd9pr8uZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX5WtujFiw1khs
 3fvmP2k8rMK9/8Pe1tduV0pPYI6Wvu0Tux4pWTJQAWdLURpa73tqQbFAau1kU1fJ67reVjNUjUm
 iatXTjMWRnsKI3ZrQQbrJT38rg7Vmv4pDJGIfIZUNVVropFvNJjXsxMCCLJz+Z+vKNC8j2ty/Hw
 zkU7OuHlBrXjHxzK31ri9hoeRm9Uor5ap7WAlE96JWrfi96XXg9zwONP4i8t43S93fSbzoLZQWb
 4An++ZO66tEXnpqEXsjg7e2pr+MkzPMpyLa4zam91bo8ybIMLFlzRigyJ+lkjFHvPAkkGo0bQ8v
 z6/3uU7NvStduENuYKqyy1TjHrUc9u4FqyAnj4FHDDY09zSEPsZD8QhHVI+fUZBMx9LbvjF63v3
 JmKAisvCEI59D/31n7wRn4iD4vCbOU5P+LzJNuwUkye/RsrS4kBaqHehX97GtQc/4iKL6sR/keo
 T6JpkEY9hW0VLpPonbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031

On 11/11/26 5:15 PM, Hardeep Sharma wrote:
> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=1:
> 
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
> 
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
> 
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
