Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770984;
	b=Q8ecPBNoBhiC3VlTX04eDoNfGlTgADcBktSLoc7GVDQQY83SDO1S8GiFSdfDabV2Qfnq
	 qulVsMP2xpba3tP5AlnPv4FMy4+8w6Pgp6DNPpiX3Ei4qyo3R0w+8lbrGpezbwqCz57oM
	 40OBheu6FMfgvktprktX+Mu5l9YDTrRGb2Kgb8XbE6hfpCbj+MOmkF011B0cay45bivR/
	 r7wevlNFnel+MeoQGyxlqj+TVzqsoNrknCTVzgBuauXDR4dlGqxetkM1zznyj05/NIXH5
	 yMgfijGdzu3zEsRJxp0KZ1i+icTaVlw9OPOW5A3iymCh2xxrfd88j+63vLX5UEQc+cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
	b=squYU0O30MJG3d0mcj03M5VlJg7YXKCKdBVwNJYrYk274rw56BCMfnavHYa7l9/40xNC
	 JbS/bM0PLRvefO+ifFVVo7IA27yQHYS4aBQ1BiyN0CTSL9NCZ6+HXlxI+7cjGTfqA8l3e
	 l+aLzLoJvk18MhO+trawc0za7zSxebuDjYOiv9R/F7H4PZx+dDiFtp3efnsZtHxJnNj4r
	 ZA3JDYedpQ8kL9l0MRMX5OVqkxci4q94t2EAglFa8griyS2zoIZKSdyR1ZHFfzWG/yDu5
	 E9QN76TJSTfcNlMM7+xJfPYkVxBaPJFwwpBSAUk4pW5xUgBnysQkA1TsnS9Nva6UqYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="h7a/XazE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0G9n9y1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65626606A337
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65626606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h7a/XazE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b0G9n9y1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7H5NS1565696
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=; b=h7a/XazE8FBb/WvA
	r64lseyDJH4D0lvjddy9criGTAeCYGSLTQ1WRdXiwTrF5gHCks9C78apUYIfzEYI
	NvrNAtNOmHrSjjk4Lba4Ch6TLI7ejt3ojPT0VMTOMQs5KmrH1ZMljmd/eYAFj4h+
	53QZ0j1aObEa2LX+HY4kul5TlGhGlBVpIFe2ubsuJjyICCoqtvk15TrciJOwdzdR
	SJYDeWZMPqkipA65SjHB5bx9FFSoiAtDrJ+/2eSn9GwJSmN9wWZxLKCkF5NQACfv
	T+kfAAdnprT3N6Ds3v8KikW4ZRSGWoK6orS9IpNjwmNcGAuqTrNXp1ttw9AETekK
	EWyPCg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garp6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:16:23 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso353369e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795770983; x=1796375783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
        b=b0G9n9y16S4voYKJv/uzktEeyyCupLwFwg5SfcPI/RIHqBXvEJlkToP6Ud6FMAdlhl
         rf58YOdmS3imahF00HkKr3FPkqXYvhElHWkNgUIn/gJMEnOzan5LhgMgpc9eWGGvVDeR
         3/X6UPI//UobCTUEMzobMdaizh4+TDm33U+tYMe5FLoUnGU82COZ1yFZcvPjgwHXF3bA
         x+kI9RqMxla8E+W72pdasAgh+Ma4SJR4MjGZN3w+tBl9Y8yD+M4xHWtVv0nrmG3dXu6Z
         zOEZ4yyeagZ9n4zH2Kv2Ik3DVqJ929sXB3+sjiW991b3S5g4or2egNvoobDIqjo5tVwt
         g4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770983; x=1796375783;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcf04Jxl6fK6hJQpv7NF6ewyNk/t7CcRJRXoJj/gHYs=;
        b=GC6vLepBzBWgN+VHq+e1TYCJNSY1LerjqnvT3APQ0bbWwvzn6aaOnKB8pIZl2udOPF
         aYvi7LP4RR4lFoDWbhtCVX3CXiYcsk0sd+xbDgd+ho0UzTSYZLcHGiTdV+VkQl6hfX3N
         YrlE3b3yTkvK3KHb/vBk1GI4vhrNYIiKZQYdnByQLS14Q2u8Sj8cS1bXZ0wv7JYz+gdo
         LTdoNlNotNAr6abtAi0ntaneq+eBPWrAyQcf/riCgaKdTQJAw3Us1ylQaJ2qsVucsUs2
         Wg6Fw8ndmGZNZOWuFpWJU0KJWKRVxny+9ZZbm5JjXhKuWTbsej7vpaJAWtbNLoo1tCFw
         Ki4w==
X-Forwarded-Encrypted: i=1; AL+hErEi6/4dguwxoSG/r+Dy9+O3x9EA6ZwyzH9Eo9bPzdKvjDezl9666E6V7O9lzuJnSBknd3p/gX3mSeO1Lfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5p+tXcsXbox21jUm63Q3pV0Y/hPis8EcKaE/r5raE4tqsQx+i
	T1l+P+jlChK9TNiJMNln1aBu36d9OXsvL7nnDynycVwyHDcLVYR/Pw9HnJJcvLtS11Xa93t67uc
	n7wAmjHg0dSniqUYZub4y1mrp6ZF/olmFQksF+aAagwi5utuJSatQ2p+ZHpotWh5nqMU=
X-Gm-Gg: AZFdTZcxMU4VVv0FEDi+QfVMh/dPjERmrVodFzvnt7QyiPdxOAyOy/EbYJ+P+ruRASx
	O5dBR5X21flKZH6idqt5+rV1d9UU8w2gBSXCJEju6upq35Hh4TrrSwRpBVRI6SS2RGQRmvAmmir
	o/gTIpM9oK8V4/EsAZGyZHnmiuTAyEEtcYqoFseySTlUsZPIr0v/D1slYiOhaIsA2erKte6TJzC
	meMhxjdPhfbLMO4rgTsgMF4lnlhCvtm0xdq1HrcXAUUvCed+eBCGVMG6YozYd7G+MtSztRUKsHE
	jYoypKsfR47B7BzudYIllOvIPAviuiqx5aSLqIQy0A4eOniYwL31ttnyF5lvyPf3OGQV+Sjd9g8
	noeU24R4ijQ4FGqZosIf6BDGpHpLo1gBMkK2XoKzKMaRJ/PRpm+cXhjTZe33TWI20fZdDlK8=
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr17415355e0c.2.1795770982616;
        Fri, 27 Nov 2026 01:16:22 -0800 (PST)
X-Received: by 2002:ac5:c00a:0:20b0:5ec:afc2:c0f6 with SMTP id 71dfb90a1353d-5ee8ae00500mr17415338e0c.2.1795770982220;
        Fri, 27 Nov 2026 01:16:22 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb11ff543fsm3852235a12.2.2026.11.27.01.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:16:20 -0800 (PST)
Message-ID: <483774ef-1125-44dc-8712-73c0850386f1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:16:18 +0100
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
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Netrani RPMh interconnect
 support
To: SignKirigami <prcups@krgm.moe>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-interconnect-v2-v3-0-1136e2cc6e3e@krgm.moe>
 <20261125-netrani-interconnect-v2-v3-2-1136e2cc6e3e@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-interconnect-v2-v3-2-1136e2cc6e3e@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Cg1V3unJoagS6JqEfGfP3WupCoAv2rb
X-Proofpoint-GUID: 0Cg1V3unJoagS6JqEfGfP3WupCoAv2rb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX5ajQTWJTsOLw
 XUyBr4QzOog75b9T69mAMNd4u4HwM+vVqM3upQaPyyOsXq6IiGL3lGW3wa0NATcjsys/didNd76
 4osUs/qiSt1HfACVUqwX0ZzNqZkVn83LJuixYNdbLaIR18nr8PizSLSeSzqyHsFThcbL+d56a31
 LQlyNGIJfUAZuB2ibP524bbrERUPqlzngmm7+OOT6xdM1jJX0k+EXpG1auqx1X/rFifz5iXB7mO
 PLIOw9wM2lN5Vr4/vAeOYA4mERz0mP1BIQEX703TEYknsdu2PyhXNVzlTYdvjQtkGqs84q4qzSw
 oYsUq02A9iwwEF9ssCVURtFv/Hig1o16+ihVEjT2qGbvdIuFXKaz2m/yQoq+Af0nTqNFnPLPMWr
 LWrCPxZgspLtPMcUnOorbEKjy5EnXY4Ai0irBUTEwLFfNtXaFPxHFi/4pd+5mr8o6WsdFstFjhc
 ryK7FvUh5kUJ5411K2g==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b094a67 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=HlFBRxzNr9Pio0NObxYA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNiBTYWx0ZWRfX6VxHf8mSp2JH
 7rfhB++ovHoy58R0vhJ3iJI6r96q6yph+R5A0AHrULP4CQzYrwpK21LsD8IDHQQnhEQ43rzsTZa
 7/YKShg7+sEl3+r2bQVFVxLhE5gRA0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270036

On 11/25/26 4:45 PM, SignKirigami wrote:
> Add a driver for the twelve Netrani RPMh interconnect providers
> described by the previous binding patch. The provider tables define
> the bus topology and BCM mappings used to send aggregate bandwidth
> votes through the applications RSC.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

[...]

> +static struct qcom_icc_node qhm_qspi;
> +static struct qcom_icc_node qhm_qup0;
> +static struct qcom_icc_node qnm_a1noc_cfg;
> +static struct qcom_icc_node xm_sdc1;
> +static struct qcom_icc_node xm_ufs_mem;
> +static struct qcom_icc_node xm_usb3_0;
> +static struct qcom_icc_node qhm_qdss_bam;
> +static struct qcom_icc_node qhm_qup1;
> +static struct qcom_icc_node qnm_a2noc_cfg;

You don't need these forward-declarations, check newer files in
this directory.

[...]

> +static struct qcom_icc_bcm * const lpass_ag_noc_bcms[] = {
> +};

Please drop the empty BCM lists

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,netrani-aggre1-noc",
> +	  .data = &netrani_aggre1_noc },

And unroll these lines 

You're also missing QoS settings, please add that (along with their
clock dependencies + please make sure the platform boots succesfully
with clk_ignore_unused)

Konrad
