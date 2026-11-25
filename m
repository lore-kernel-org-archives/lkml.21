Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626589;
	b=IFRmmDNm30+OVQguEWx3hMp5XYxS9KmzeUAievRGycr2eYjTnDqxeTNOme5GEd8vbC1M
	 GyWBWMf9CXT2j9T5KjhNLatigPS0EquiXzWqmbcwCf/lVG7rr2lGYa+s2C3YvSO3+loAE
	 D6ZI0kdbGTbE8w1cKiDgMib5v1hagqpHQ3LAWKIwhGCeLHg9FPXLKj2+vrIYRSlbu3yf6
	 k604H7vkN0DUm08SH4u2/drtYJYi98qBWEOYzu4Ud0b/6dyKiINeD6/3C/RoxRdyURcdn
	 om7VSx/Lv+QH8HS/PynbObAW7or8Y8tJjhlTOeOi3ph8ZDV2ZgifsdfFBxBPAjqGwBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
	b=sowLeWw5Lk+BtkcWQhnIlEoJ5tRKBXq8f+NlrALNRtX5CouoAOaSiYN4le+eJHmNFDmP
	 SQqK90XMOzjUoRTiQvjAfcn8ZPViR3uhr3RuQ+x22sW2nRnm8rJEJagXGKx7kyruD/3ci
	 FV4OkzhlAnEH2gjJtyTkmgUpoYgcERg8/MtvQeoMSpi5ya7lE+x15ZxEurmdOTHttHeTL
	 l5U6U/WPvIv30YyYZkMEog+7Oq22+3Cn8MhalZFF7aAp2/hA2i+SVaKetexjDuOnETG9G
	 BvCnSr4LL35i6KhrfZj3c26tjfHhJP8Tahw7xv26U0vV8j2geQ228bptmx4GM0WwsUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7ED606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE7ED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEq1AXIv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g8W78Mqa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQDpK1434280
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=; b=dEq1AXIvkaQYtT2F
	PQYrsoXWszTV7fsnNozEcnSX/a/6jZfyskL4ChCPeN6L1rvRUE5B2/H1Ek2+UM3H
	ykoNpBhh0iO4smAzQ7SOe73/EHdCN8LsbbCRfDeE2WROnLaoibVR7a3d6Nd5XOMb
	C91RusYZniwsKcvB/n422rECp08LMhIC48UiOKrNwshtdReIJWTnOVi5hYXXfVOO
	XR4rzSECQQvLozkP5ltDg5cIADh746d9AShqIdmHSqx6KRIFkSopUA4sSTayZPv4
	9HJ886IJ7aAodA8adUjOQCXoR6QHtP/g/TOTasXwBNkmDRtSh0ZEpFC2/1LjEVmN
	iAgb/g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnswrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:09:47 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4d09fefd7so55793617b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795626587; x=1796231387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=g8W78Mqa8iHavISiyrUXt5jKRrWyEGScHZP8L64BXjl3zptiPOCYiV0OqBfniSP0Sl
         EBFil6yycGg1XUHSU3ianHCdiESSCR+tFmoOp3xy9/GCnVDU7mm6VQnAfjZng6CzG1Jv
         V5eJfizLi7Rv12fuGsEPtCfW88VnRmeQY9GcE16NKrGWltQwutPf07mZZds/M8ofnz7Z
         t5htaGtYemmj0o2dx/xa2ZcZOJAmlJt4K9jsCRY6IaMPEBrI9kwR1Uwe9dr2aeEaGAri
         aPnSTlfw6u5mDZZa+SkpTSMDL6kq32XwV8i1G0F261NV+DOWr/b2xCerJ/RMLmGSRElz
         16eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626587; x=1796231387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ffacn7nRNS6dp+vdW4d5BImSYl5nd9SJIwmzdMpCXn0=;
        b=LYCTJvhXEGXaLYfrPQWWGODDGAOonr3gq1yZPp/cxt2JoQwGm7w7MpyofX2+EOX97h
         V9JlrbdJgssGawUZwxNst91ogoFg4LyQ+m0EgNfU9ShoF/FPZKILCV9UeGJmzNNzNcuQ
         sKhdhtA0dLU3lvxLcCFoNaOxQwEAC9Err/Tl9WgGMuF20U+Y9HRRKnzwPuaJrB+anOE1
         rBILR5+5q6vg6sv8IIi4+3R4mRgAEBhN7d3gxFK9j5SfKM15pQ8OQBsIMwLQioBbMd76
         BTBzQ8xrRSTaptsDjKLw3JnMJdzXA8WShXqy3lwCsfX5MSBSivBlmUGsIZE1/wefQlnn
         Pssw==
X-Forwarded-Encrypted: i=1; AL+hErGM8v2C0erUeRZHRBmeNYOV155DZFCx/WllMBNqBBblZHkhW0rJr1rfHF7EEWi+CEFAfteij1TFiRcqkAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UlKwKg8MtalrdbRhKH2pI/eGCXXTIA0uHEK0DRFP3NLgVc9Ff
	4lcYrZzrA+zcYyi9QUWjTuh4d6VBssa+sl9gJ6kmSNiyIesZ3BEYD8qXXC29XZLcZDCvgwkPAkz
	EROMYIUf8ZVpJorBDweA/EhGViEVa6sDD0kU7T3A80g2eVTV87BW2BSa03FB2dHoJE7g=
X-Gm-Gg: AZFdTZfgLYWb0SkijjoGXUcvBmjfwicNS7rxPqMv2Ou2rYteVsZNYuhyspaPRu0N6is
	dBWvfm34Wfe6Nwag6W9fToCxPJkN09Tnt98+FItNRM+TbuKeg3g7QGJV3+cNXJuJipONf/5A3a4
	hudDkJTtP+xhw21mX0TYYEzI+bnvQIQtd0j7Qsa1X4H8xbL+uBCYR6xvguINDrtizJfdsT9xwpq
	4Hzr6AYF9vdMnIIpPwKBm73K5USn6+FtKCupngSXSOjjjF6owY1fbhY5DSITW1aZGKV5M/ovqCn
	85jRHT6mBmF67WoKI4hbLjt/F7Hx702FAB0rkNAuwS/+9RItLydGK+plEC2ZYerLys5Dm52Hpq+
	NEyfGnA/C0CxD2KBZSOuNQtn30+Uf0i/pyFri1o1p0PBpUlCWuZaYZVRitxyrXv9SnFbyWg9mw+
	v2+sXqnPcMYgAk
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712137b3.6.1795626587247;
        Wed, 25 Nov 2026 09:09:47 -0800 (PST)
X-Received: by 2002:a05:690c:7342:b0:8b1:46a1:2893 with SMTP id 00721157ae682-8b520319b8bmr69712047b3.6.1795626586828;
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm19399409f8f.19.2026.11.25.09.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 09:09:46 -0800 (PST)
Message-ID: <f255486c-d4bf-4076-8fb8-7c6caccfdfd0@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 19:09:44 +0200
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
Subject: Re: [PATCH v2 03/12] media: qcom: camss: Add streams enable field to
 camss resources
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261125080001.2540101-4-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfXyTGXEWLPZDyO
 2G4837hKSwAOpQ2h8w6xwl0Iivxi8eIPUtQWtbbbfl1JInEkxQ/2P9wi6hIfzGo9lkl51yS6VMI
 Nitt0y8FeuFZu6ZeLv8jv/toDXQM0drcxwdDUTVgATuk3K7X+3GSgLEw6fo8WWnKIHWOXY6S/7X
 gKErY5sfXDY8VoqSP8qhuMvgLb9n22sRZtwEl8VgeYlStCTts8+4yqDXQozyIXKwHGWs1GhAtIW
 7SF+HmXM/LzoEEm53l5LCQRevobiL3kc4CNMEpkSHoYPegrwyKHZKgPfihMwHefjPuOjwCuLJkU
 MtaEgyMeT/BO8QmkKY6RuYxUFN82EYyVbAcLCz80roz3trWlBKSN2OyuDEp07J4TPYHmW+p35E9
 KDdOqGNXfu1+FDhv3k0jjtxbpqPuJLQuM3xh5U1byPGGXFQisXxS0Kiv6TCrEWkWdS8yuBtUjho
 1rM058YExJowUn2nsVA==
X-Proofpoint-ORIG-GUID: BAgz_qqHqnWZv3KlfBeOM0fPYdtydhjL
X-Proofpoint-GUID: BAgz_qqHqnWZv3KlfBeOM0fPYdtydhjL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2OCBTYWx0ZWRfX8jUi2XagK+Dx
 4zpkoFX91BcXrgMixFZtFLm2rMDfyrpUjPIK7uEh28ESxyzgZHKBGoKpaVd5ycFqIx1HfR6F2r6
 GSWTq7HFYEs0HssEk+we2wQ5lSDhLNE=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07165b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=gmv_cWQL6D0Jf28gQFwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250068



On 11/25/2026 9:59 AM, "Gjorgji Rosikopulos gjorgji.rosikopulos"@oss.qualcomm.com wrote:
> From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> 
> Add a per-SoC streams_enable field to struct camss_resources, used by
> subsequent subdevices to select between the legacy s_stream()-based
> pipeline and the V4L2 subdev streams API.
> 
> Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 7564a7c46fa2..621ea2e3eba1 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -121,6 +121,7 @@ struct camss_resources {
>  	const unsigned int tpg_num;
>  	const unsigned int csid_num;
>  	const unsigned int vfe_num;
> +	const bool streams_enable;

If all agree i plan to drop streams_enable and use stream api as default, v4l2_core handles
compatibility with non-stream api so i think we should be fine. Just that we need to verify
on all the supported hw's.
Keeping old non-streams and streams in parallel in sub-devices implementations really adds
complexity and duplication of the code which is general.

~Gjorgji


>  };
>  
>  struct camss {

