Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443156;
	b=DJDRxrEoNohr0Lv6gZHOoB6japxZOi8H+uBKw22boWbpHlAllm22YQdMo7Gc7QNN41QQ
	 CbTe6xWltqI/btHGn3Ys6XJAmydJXZku3YDezN9u9Y3FQ+GGgfa0hMPQJCJeg2067+jVX
	 fjt6i6ewwEjHQcenoALM7CkeCJnNAWjoZHntaNsnwT0UwGO9hycEvDUQSYN7EzPv1mrk3
	 1r7qCFxJNaXWDcUd371PYdVlJXCRwJ4/be4Ds/hsD3wtypSkc3COBoTiETQe2XRUoThTX
	 +j+INUdsSOobnt7Hk2QKM65/fzJzimb0f7zTuGT7NhfyMCmK27qiEkFiQpq050ip9WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
	b=xkc04sZKtTi2hEmJgU8mcBPaEVspVmF/eApmxZeScmELMYICAkvKSYLTaoGWToUpO64s
	 D0nww/hagcD+GcsSUemSBSYblIVZh2oVR+oEpfY7XBHM1nirJ1X9uXweyvsq0TGS5OD1m
	 fmi6zYtuODhqRh0fLVi09t5A0HYCR2Uj9CVgnvDO/jqU4VCSEa6CUaDQdimPKMwonMCQc
	 0NJTDlQiWY0bNHjlGgzxdgNfbtelYEVVVJ1uGk3BIBrYL5KZRVWQri6RNweJ6Pw6ypj4R
	 EwDSict3UCkQ0U/UI3cj09oCdXTf/VcSsUnSOdGpqcNfIabh4kPI+N+yMnC4Sq4yDUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKocMOYx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHMSnGwT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4075606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4075606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZKocMOYx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHMSnGwT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL2dF2442981
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=; b=ZKocMOYxmja2LYus
	uJysaQFVhq0gXn7bdilgo+wb7nKzGltb5swiYoYEic8DI71pOM33oYFP+/wwYi6E
	xQjcf8zNZ/cm5Y1Ncfnb0GnnsHdHoQ9m9vZwJTpO4RM/z7NLrquIjRREQf0G/c48
	AKV8Frjrale8Z1dHRie5em5v+Cyb4aZTMarxhNG7sd+pUoGuG5eSGCLDqkhbPcAX
	4legnvQlpS/6/IPix8KBRzNPjWLSLZE5faBMbKsyYrzQhq24hWa8WSaRNd1EpQlt
	b3hIL5Umt9GsLT1tx4Q2PIgeVLj17rgEqAPvbSWIY92FoAZZ4lT+WnxzZkTwLBYt
	OE+YQg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k1r1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:12:34 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ee4ca14454so83747e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443154; x=1796047954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
        b=SHMSnGwTOnxggiRKitcgnBYeAevLrf8cxCOiDJdVwq02PZDCKZr1VUW6BynTpvosNi
         eSiuhBHAPF22cTQgeD13FsONftVknHPz0sWH8o8tYAx2m+HWWf0nczPvGZDURpc+F1VO
         ggkVgMPuQYKM04e+bmNSr7O2WLZXzjmziqwF7kGRqsklxU18rN9bv1tPRl5tll0NdyGj
         AuxMtNyoyjHJmBybiIZ833YQXaYPQySxe4kSHhXKOcM4fiM5cDS9R0Q6o5+In7h07BVF
         1DU7ldH6FdQrwTfjjIPvL5PisnfI/APB0EgTb1ChtXEayrntmv5THyCVR/puKqN/DWXt
         cSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443154; x=1796047954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fq75inYXxrYikV0Ezj7Q8lFn8dabO3zvGhweT2/V8MA=;
        b=kEAZieK5VUxJZmALIhon0cKlU4KpJ44lXdLg+a88C2CeRuaGc+xSHhAhiTsNxpDx8N
         QpCEpEwix/hK3zHWUZVksVoRufeW1GVX9CWBxvbMW7NGv4iz3Dq13MH2pfgA5Jj+foiT
         Tl7YYG8O1kf/Xb0U8Lb3tvKp6DeLut4TwRhM+dB3V9WpaM5OhCArn5QgZY1RK5zElzJg
         coJNxG2HWLKI1rA/DePHiaInIczR7eGJCPgjtiOXATD/Q+nbsPULd6ER4pUGcto/jUFB
         tmT8luZKh8U0q+XUhUjmSzYzfasm6VzZu0UZoWRAq9euEqvOXiS//+AWYdc4yIs1hR5f
         NNAg==
X-Forwarded-Encrypted: i=1; AL+hErGt1Pn6iTHMQm0DZzuHhBSv7/Y5I1eGbu+U2CkaJvqq2ZZsRqY2xQBKkBO9Nr6fYShJi1uYfYcxJO5vOjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9C/yQ+ajlC6XsibKI6gS4RpI6LT4enp42RzzEBBvVH9+EzPucL
	CX+j3vk50979g/fWgA7M7i+F8+rP4yicYbNbQr4ETtIGqfbI2SV4NtpfMNguUMPehF3VJz8cyPz
	sKFZCMxeZitfJS6/vOnI6FFh6mSv1WUueMycvELwygsaCSuvgWMCqo90z9zencXBkb+o=
X-Gm-Gg: AZFdTZfVFjxe9XJXBHo/TxxSQ1SyhCo4EP5mUZWXHZUANzT786+IT1Q/NCq5+S+EQsN
	npFgTa3auOdtNkgPx7Ec2gs2jwPQJGtvuhytKiYxXqtBHYeQMOejYPsC/hzfYMoAoFwetSAJ34W
	+lMUxeHJ4gye9w/HioHnNeIfQY1VeWmhu11s3ITNcK/9xKx0r9pOThW1vnAFstvlTalmgMdV+Kz
	9SL76rEKmWH+ChDonKnBEFbxE25Ga7eebxUVzcEfw5A5/V0o1mrKgRFgC93kNtvAveNHffy/ks1
	7j6obp8ZLvW/Er+CjrZGKGbzr4AMvINwtvs/DcMTlXy05pMGcqTsEQMXrIO9EPIV67kYINz5I4c
	z2kZP/MOYTwPBgi9bxcK86EdEnnEYpV6+U0DFPcjPpH0zb1LYD1czu6Wb+/NH+jTyZNju3MY=
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr6901113e0c.4.1795443154228;
        Mon, 23 Nov 2026 06:12:34 -0800 (PST)
X-Received: by 2002:a05:6122:c20f:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ee8afd6c93mr6901052e0c.4.1795443153673;
        Mon, 23 Nov 2026 06:12:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc73d3sm409929066b.64.2026.11.23.06.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:12:32 -0800 (PST)
Message-ID: <f151aad4-4642-4e71-aa25-3811d29052cb@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 15:12:31 +0100
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
Subject: Re: [PATCH] MAINTAINERS: Drop David as Qualcomm SPMI PMIC Arbiter
 co-maintainer
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-spmi-pmic-arb-drop-david-v1-1-c6be14d9d22d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX5vEAXS5MLn+b
 Ris0HVjd3/LMGrTiIOumgASar46VDc6S+2zw0R/NtermJWH8daS55vfSc+nAgQkPFQyzYeEhI0X
 T5aCxRRY/YbsbyfZQtbWj0A+fIeu0rU=
X-Proofpoint-GUID: Fy2p7bTZryXOfoQyM5qGZPtghb1NYQrg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX946kkec6BsPM
 0AeoWpRpOct1eIn4bckI0vv4drsE5iwBVt3OTREEy9kReU8AFWv6jjPPxaoWShoyf7dIHY4Ee0K
 HdySxgtkFUn35s8lQKaHts+YyRHeUsR0o0EXDnxvaIivRpwCl0Cn4Nxra+cPqXJZZqnmYvebo0y
 B3BX0/H2XnL8l0Y/q0oUdcN3TIHPcvaQ3EJE0nKQ+wyX1umn3+hngHSykUquz7HGCRIRCCIXK9O
 o561StJkyCyzBoUdb/zfZbLapj6dBLBW85cF8P/4iRH+GWNVxDrFZ03BcN+KHJ4kr/NsjVOrWJF
 ehcgsBxLoIjyt3AzqQkuEurkBugFBDdU4Fw7VYfvy42VrhCQsVyxUBgqj7eVJ85VpUj4gwakaoP
 ELFxCkZ/pZWYCgw5QsRUt6MeMOm3wji5vTRW2m0BiNuObMYTLZGC/FpjzPdLrjjnwQ0nLPvi2LO
 N5aGGGHz+0exJQ6X9FA==
X-Proofpoint-ORIG-GUID: Fy2p7bTZryXOfoQyM5qGZPtghb1NYQrg
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0449d2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=q1OLuhYBDE6bPA1skz0A:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056

On 11/23/26 9:37 AM, Abel Vesa wrote:
> David has expressed his intention of stepping down as co-maintainer of
> the Qualcomm SPMI PMIC Arbiter driver.
> 
> Remove his email from the entry.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
