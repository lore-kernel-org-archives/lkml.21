Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447670;
	b=2+4l4SADYT+l/80OB5Cb4Z60o9rXSTtu/cfD7sy2lQr/9jzk0YnOk2b9NVIKvmjBnBCp
	 NVLe2WYKKBlp7iqmfHBljoFsZyJB0VJGWAC3tvmmn36TeMmIfoBN36hE0dD/3xoFqrtGB
	 HE+eAk2/Ct3YV1lqYPo8/SXpjPVQ/+1fU+6o5INWD69GW7eAVZEf7cn6vwEWF/oGOPIOS
	 uyyD78GbQq0LpOK/F3zt0ZjXl5WOZrmQlNDmZF9PqphSp+EUggeTXDToRDyj3JEQH98jP
	 ujk5mTBpJxIRZm09RSn9fbsOFL+IOm1mms8iFL+U+FznvK0U2yWsFCxU4KheGByDaCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
	b=KKxHgzEoWeW4FD9W/CUMv0PQVjwVNnZkx0GjDensKKSFhIeZhY7iuvYCuV4V9ciIo+iZ
	 W7Otu7GqQ2p6OLNqw8wQ6kXTSvBfz3vUIEriJN2YVPqdHczH6Pw90giAMH+DVvitueVzd
	 N9f2HLeBTm0/SCrqS01ttNaiyf8y6rBy8c3n5+XEg5Yuia5jbmG7I6Slb86KoHk0AZxFk
	 tiSbEBYkHfoVq/HsZ/RlzvgHxWWCIpNlR14iUlEarETJQ48sS1xz3g93DkzeRHLegpkVn
	 h/hcBmgFFIaZO/oW+SbXN/kzV7uDmxYJotOuFAOvMX0GsSBLBIyDams4kNMzVBCxnsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TTcFXTzI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKGHrO3b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77603606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77603606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TTcFXTzI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKGHrO3b
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKn3V2621939
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=; b=TTcFXTzIAnWUeCKx
	nACMD4ckphZxpj6v9TDEYgV+EOIF32+xjpCqu1nwpwFQfCr2lNBrOsk7rinxA52k
	zlpLL2CQ8GmnfOw1y9Szsa6cEg0fd5sl4mVMVByL8RHk04UutO/nSnYV+FRBOAAn
	VsO31AEo4c50WhM+Uw8LJR4MZdiZZjaORGPYHfGWVG2chqiWvF6U8bUYz1hT/t64
	GAShcZcd02ImNlRE+/ejIVFjYR8/Io6IhS+7KbsMPCsodrKOEXxEzC2srd36L9O0
	AThOx1ji3Um480miBZt83ZEcnCzwIEw0ODN1CGXxusEgkbiVlXEBuFLF6PtrWhLw
	1Bki6g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa2qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:27:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ee4ca14454so95255e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447668; x=1796052468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
        b=HKGHrO3beBF/r0JbF0kNDBwCwajg/L8uZqSoeU69+ZW4oHPggO8555UJqGquLD77Zs
         ro2bWwmv1ZD7uOkU/SXwdA1ENuZUbOr2HKrQw0eXUvw4WhG2ZA9ToBE+l0LVHdLNZcYg
         e5TtCmbBKHPeozIMgcSr0ywXG6LwOzUylH8PmuKP8KR1MGCHcFg+IPOYoHf9afRGBMJa
         D2X4o3typUEKaPugEJPPhQJRYQ0GGoeOUyFEHIMJtMVGsO8QLQN56T2z7Nb46df0dei2
         lUpHRGTDcZ/8KgPGRveg4du7mr/2dRdTLraaLzH0D35H96Ju/D4WnIYG7kWJaPmZyBPd
         cEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447668; x=1796052468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLGKNkgR6s9tTheoIvmn8i8Sl0j7xhzXeh52UoqtGho=;
        b=yNk2S0rvHXc//rhxdwDKOefFvzVDiQ3XpIAYVdxsmEJnNRg4IPTRrAKgtLS6VfZOJw
         RSAarJXY6U6VpudVUbxznQ1bF+dF2L3SI+Pdfsbc08KRemFx1J+745YwrHIQxYklq1xj
         IUQUSVRVT/WrxlE26PLgK68tX3VdU+DSLK6eIXZYAlMD/i/LamWYgcwLcMRMGwM2wvO+
         4E0cFjqwXy0QN7KcBXpYLpmQiLqmfp2GT8q97NNFjcsoKQra84s9gMKur2ucBvf8bRvO
         dqObjuOLwvsXmIHhVtmeuOL7yOEq5QagZLRNWOuOHLR6TbKqIEeddioWotL97o4liFDx
         fRGw==
X-Forwarded-Encrypted: i=1; AL+hErGUIrnUXi+/UFKbQOT9vndLElHCnorj1Ie9GewyUQYPLpQGn3udNkpbu+AxUEHd+5sN/ZFmFCuS5A2aCdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z4DiW7Sejq7huJ8YCSmKV4VtECYP7uRLzT7YLl/Dx8pbmTHeh
	7Sqvd+/vYN1nDLTX2hXMiHnE32+mqkLQNaia8mZtXiOb2oTRsKO4hzVpsXc1fjM3cUeyHrTEUQS
	3KL06KT78mllOBwD8JwSNUurSdWE8IhQBDok9ISa30WCXnvu1uU6XhkkioxjI1Jr8KGGrAU6xIZ
	E=
X-Gm-Gg: AZFdTZe7lST/2KXboR871UU2huaUTzcNgssBsB5guDAJS8cEdCTsV/pMlt3tmCNV6XX
	/ZtCf7RH1t2pzoAaD5TaW02xH2HNqCWpOo9jPjz/S5DVTo3narNUBPeBnhAcd5ZOLZ0kDf+DlQs
	04qoCi/N6u1tPFU22hdU+2AQdxxeHkM7/PH+I+ETrcLzq7Xp8N1kDDwRPRjbOLDjFIX3Vcx2GoT
	kBRBiGj3nWsdsSn80VdUZ5SGU7A5CjOPHdy8U++CF+yVpSyl4DK+s3fPcWePxGHP1kM2rBhAIWf
	Li4FnIEiVrwaXY1Qo6xj79nO6ab7isJq57cGdnfB5JoRyFnkhDgaQ9+n6Nyx0CR6r66YfuMaxVL
	V/GOSjVSxYd2OwYSFkMaX+N4YLdYJ/tc7syA9wi/yFIvjkPF8xar8DBppgwVZ+7KPqf1K5jU=
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr6702168e0c.0.1795447667705;
        Mon, 23 Nov 2026 07:27:47 -0800 (PST)
X-Received: by 2002:a05:6122:25d0:b0:5ec:2394:ef94 with SMTP id 71dfb90a1353d-5ee8ad0fde5mr6702120e0c.0.1795447667181;
        Mon, 23 Nov 2026 07:27:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm410577566b.65.2026.11.23.07.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:27:46 -0800 (PST)
Message-ID: <c8eaa9bb-951e-4076-be58-7090150b5c90@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:27:44 +0100
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
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-hammerhead: Fix the IMU mount
 matrix
To: emcp@enser.io, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261122-b4-hammerhead-imu-mount-matrix-v1-1-fa38561de9ca@enser.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-hammerhead-imu-mount-matrix-v1-1-fa38561de9ca@enser.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: asZhaiS10fDdy3vpg9vIqF8fohrwtcHU
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b045b75 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=l1nHKxr-XrZQ-B15pWYA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX6Cy1QM5vybfc
 a04pOWn0PBkc8YR3tHzvCh7mAXOxoXdfE4y7anP7Fe4jzGJJ770K3aQ6B6R6NFB1BmJ4ZHeze11
 QWF/Ma9BNLaCI+6pmdP5HMX8QLKSrnQ=
X-Proofpoint-ORIG-GUID: asZhaiS10fDdy3vpg9vIqF8fohrwtcHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX8nWQK3cbuLrE
 ffIOfyxbKq5V14JtvjkibAEPson21umqktGFg4xxbgck40TWyroZ8beHY9z2AmduK+6pJ4Su48c
 TH57+4++YK9c6VnAdN7dti39+l2jz3vsJqdeW9MsuZE5EiUMZivZOmbFOregaSaxo9KZ0huVBG4
 KbVX0fyHb3Dfm+ihF07SpjCbsYZ9Q9OjLJbLGaPxtWVhwoSrqQzc4bEx8A4UtIw6fWyZNKf7cdc
 hWfnEqc7MLpGS0GPOw+hI5O3qzp7NvbaZ/UHnFLbr+0j/HHO3nRO2KX9MOp0Z61fNj6oOdSpVSs
 0EqNYKBZbyOUcxAeNLW094zhJROwi6sNHNztY8AtceRcNLW2UIhB4bc/GdJgp8Txd4vAxyoD8F5
 Npv7RxXUc+VMzdC1rPbF+Wy+LFHN3GumIt26P12AKjEPcl873kVgOtduf4vzF0Eu0W6u81b1OHl
 8TFA/KcLWiZ02DrqlQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/22/26 6:12 AM, EMCP333 via B4 Relay wrote:
> From: EMCP333 <emcp@enser.io>

As mentioned on another patch, I need you to use a well-known identity
(i.e. generally your real name). I look forward to reviewing v2 of your
patches!

Konrad
