Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449265;
	b=LdGwLe88dmPnTaquz5gl6y2NPJFuLffD99QQLvKVirpck8BChxk8cUHhkelrAgndI45a
	 zWDZV+SWmUU1jv5m2yp+80+jMJcL5OSFDDD9A/wRwYhzXoOJscbtX+ozuFItT1naiMzRk
	 RE686xASQEptsFfI09SP/mwZdGOAMGeJW081bBMFUh+eXuVB8YyxFLVEoRTOIdyyczuHG
	 tz3ppRRI/UADOj8rpLFp5jXVdslKpQu+UPrgBo3IYqD11lL9zOPq1IL/MqDEj8pX1PFGj
	 1Ia901lmMfQ72ga/iAxWd8yMF7eh4nRycC26Ne+7bZEjM7wXsSlGjWo2q5IKIVL5xqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
	b=g2Vu39vc6Bwq2HBpvEXUn2gnBCHGBRz91L6w1rhQ3TLrWnI2cYUfS1qVMaPh/b/YH/ph
	 NL7V3B9brnD5RyaIhDaoii0LPZFWO50miicwtID8alMIC2Kdj3AORuVmvXR8itJupmmmg
	 fBQA/c5lM53Hxfd08y5N2tinCrtARdIAwWl3eCUDCS42MBQ79MwCswM9bi5UzOAUSJ9pv
	 TaCI4C2kslJNUT2yrnb07a6N7zfrkeRsdW1rMEhW5kIyf6BfuUEsLnq4E5oHddpz+jRLP
	 iGe535nW+T1HvZ4VbIHUf873dku1hpAF2lvX796wmlt4ItscAPFkhut9ikoXEFePsBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5286606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5286606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR1fJlMt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GztqMX36
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKsCO2621997
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=; b=VR1fJlMt4WmeCj/9
	MGhs9jNJ4GGEbFs+HFKXU65iNmMWlrSiSCMdRLD/GJb3ZEEuxdWeQyoB+4jBvi4k
	sWcC0X5u+pdJ+Z4z2tkXXTQ93G0GQ5V8Pn2DI3/6AA8eXVOIakbVqcvDk4aczLsK
	S5BZ3GwKcpX9fi2JyR3SyamK19igcSpo1g276napf70pl2O91dMns5iB7vyfO6PQ
	HW/1Uhk/vQFwUOXiNcDislXDqaNlBMObGvWMRTgODOsAb/1NdVbn9Je0ViD6G1cD
	kBmpSaJ1SB+EbJu+8cmg1mJ6rDcZFbWxGQBgoUlRvxUWND3X+Gd+alTrM6YHbjFT
	A6INrg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa728-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:54:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so1187198eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795449263; x=1796054063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=GztqMX36iNxB0SdYXm1AeFHaA4lG+B9p+C/LDAvzCXNDN4RVpAivsxTENP3zWI3iO8
         NX1BgKWemhCnDJF9txyK++cWLUrpMlxfAG3Uc8f8eA21tIm4y0BTaF8u3bMe+cflOJHN
         ht+S2Q8gbVPXsJ32Lsnj2jZQf8YlLsYeQtzNMHH2gqezEtJKpRWSNpzvLbY0dJvBvR/B
         xbZIwnjz485qi2TgyR3qfBVDRDLV0ebLcd9zW+h5e76b4A9gYYDVWEpXgPSpNCJeRU4v
         K++9FFQPUL9BvP41OgcIrjzBgKLiUIbkjusLi6nawa8txYjJZeNW7WF7igoujsvc9T4x
         7dJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449263; x=1796054063;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lU8Coo8wWZO2xm73msPjjDouSOiEjViRNz1SBuRFc0g=;
        b=EldggN5Lp3gtoiDoaSsSTw2A2swScqYYXAcc9DB8+6LjYUNCuag6H/o6mRfUhFOAe7
         KJOVMb6euUkWYMmmRDEsKm9ghOF2toPv3nuEMHR/BTmJrYsWwtK80aJjfyoEwSM+T7u/
         nfufxrClcHWD7+/UYWQTVh2R5Qr+OrP7a9qvtAqEYX8uIDrPHrtUYa7mqLAI4Z7Pzam/
         wU4Sou2pwJFsGlg4Uv2EE2LSA/qgImZXGTKhocYRF3bOn2l+MB3lagA0ka7t3Z57tQbC
         stgXYeWRqdeR6qA9q6slygHjS5a1N9pEnBEh8jXWugTi3yZWqsSwhjlrWDsBg7pHQx6z
         t8GQ==
X-Forwarded-Encrypted: i=1; AL+hErH7Zt/2Hw1/uDl5z97HdvLSAdDTISsb9J5w+PaNvcLKqn0D/rlZJ70Z7L9kyPaJDIBOgh/6q5tCZHtgDsI=@vger.kernel.org
X-Gm-Message-State: APuU4Z90WClw49GOXSKYCQM6lmd2oY3KKk2PWvxl1wuJc5vikNPfzupw
	L7PHb0uOlfGgT73KsKEtlvzvEVpWOhHqFDs32wFBRKnPo/8TRTxGbfY9sO9unQ5HspWzEN5SGnE
	I5OxE5pQ96ZaBA3Vq3z+Mi06OlJ6EH8egciUTSlS90l3ATHehEiPbj9LwYEx7X+fc2bA=
X-Gm-Gg: AZFdTZewteEVVhBmgO3HYf2e7S/NbZBM/PsbE0KH/u17NY/o/NxHe00ukfJcI+HRLcC
	2o7ZxDIlDoLd9pl+VzlVvTUmv7kBa2AL7Q+tWlWUrkcPJVGoKICr/NMfJ//hOORh4BOkGcn7yHe
	0+8MKjqgVbYkxDQFH7AxAlshY0wGczM02kCYELc/gxvXBbcBLFdnpoAqINKld9CZqEIb+DfY8DF
	utHKTE5a72G4EYf+z7OkDMi+r4FYdaU2/rNt39LOpVZyJnsO5GG5D1J6NzITHS6J9QGME9LcNhP
	IMnq7VZnubUW1nniW1EdDbGX0nReSTCGLaTjllzZ3r3ZBCwYDdu/xeQMYn9oSZaopxF67SThrs0
	ziG9QK2Nu4nCpTY0fgTDGWj30oXzbBkllPKuMc9fJd+GIRbnF2iq/vf6nYkB7ZcaBUgLy2mccKL
	rvbmFVGEFCr9Vm36gxif4xc2Cdbl0h
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886550eec.12.1795449263203;
        Mon, 23 Nov 2026 07:54:23 -0800 (PST)
X-Received: by 2002:a05:693c:805a:b0:376:a6d7:8f51 with SMTP id 5a478bee46e88-3856e63bbe9mr14886518eec.12.1795449262503;
        Mon, 23 Nov 2026 07:54:22 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm40628761eec.21.2026.11.23.07.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:54:21 -0800 (PST)
Message-ID: <f2f50403-fa42-4ee2-bb22-c78309590196@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 07:54:20 -0800
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
 <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
 <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Language: en-US
In-Reply-To: <20261121-lobster-of-unearthly-variation-e75ea9@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PDWl9PLrYpOzjqv84QpSRNDrZEzWrX8s
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0461b0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=wpf9FKuRYqRxeo0qB5YA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfXxEuL5pOaGOjq
 om0a4djhq5jCgzTKDsEgfqunOb0jeD//+XWxjUGb8g4XzA1JWcFcZeeh6QnVcHXVZR28of/BvIs
 ZsAHwqtdzu1CxJaaLiZP2+vMrNPKEI0=
X-Proofpoint-ORIG-GUID: PDWl9PLrYpOzjqv84QpSRNDrZEzWrX8s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MyBTYWx0ZWRfX61m9/90R0x3t
 OfGsZaYOkTIyJQuRHczA/J/votcLVkPpGgrqHLTXZmPJcVhS+bGVWq/wIWe/mmDS8AftdigFU9B
 7X2zDSM1j8PVhR1cC4hXlWaZO3CWePwKoMboFRXuRXD/v4Lqza3v6Kg6W0CGUq2XTlo8Tt1k+td
 pAwUpusb4X8k7kQAbsrMAEcmCAzCEXAdbZ3Dp3NEbQtVsdmxiAEP6XwDt6TBTpyi6ySY7hjZ0jz
 Y3y6DRygakXHnGlt8xnZ8PUkDvibD/2zyt5VFIu9KirF7pzbAYYBdLAzedOTxej93zNxHGJvtgq
 Ndn0leZyfuhXXblLZjSQcmM0CaGII44Al9HyevW6B9NyuUpSXv7MZR8ZNtMKEZjX99H1Cik+FmD
 jCs6pQr4grP3jQGl2ROmqda36LgvZBMj1iAWPtol/H87Ie9/A0hFlbB8oePMgHbDfNwgy4+Bot5
 /49EvtrB2r0XYDmd6EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230063

On 11/21/2026 4:37 AM, Krzysztof Kozlowski wrote:
> On Wed, Nov 18, 2026 at 01:45:24PM +0530, Madhavan Ganesan wrote:
>> -  The ath12k devices (QCN9274) feature WSI support. WSI stands for
>> -  WLAN Serial Interface. It is used for the exchange of specific
>> +  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
>> +  for WLAN Serial Interface. It is used for the exchange of specific
>>    control information across radios based on the doorbell mechanism.
>>    This WSI connection is essential to exchange control information
>>    among these devices.
>> @@ -48,6 +48,7 @@ properties:
>>    compatible:
>>      enum:
>>        - pci17cb,1109  # QCN9274
>> +      - pci17cb,1113  # QCN9575
> 
> I do not see any user of this (see submitting patches in DT directory
> for explanation).

For this and the other patches you had comments on, the cover letter describes
the approach being taken. What the cover letter is missing is the scope: The
QCN9575 device support plus all of the Wi-Fi 8 functionality is roughly 160
patches which have been split into 23 reviewable patchsets with 40K+ LOC. This
is just the first patchset in the series.

This is similar to the approach taken when refactoring the original ath12k
driver to create the wifi7 folder and wifi generation abstraction. That
refactoring was also done as a series of small patchset due to the large
number of code changes (102 patches, 20K+ LOC). This was requested by members
of the community who wanted to digest the code at a reviewable rate.

One key difference in the wifi8 approach is that for the wifi7 refactor we
used a separate branch, ath12k-ng, but for wifi8 we want to directly submit to
ath-next. The reason the development team wanted to take this approach is to
avoid the pain that was encountered where there was a "big bang" merge of the
ath12k-ng feature branch with the ath-next branch at the very end of the
development cycle which resulted in a large number of merge conflicts with
parallel development and bug fixing. Some of those conflicts were
unfortunately not initially resolved correctly, leading to instability in the
driver. The hope is that introducing the feature directly into the ath-next
branch in an ongoing manner will avoid those issues since each subject matter
expert will need to resolve their individual conflicts as their pieces land.

As ath12k maintainer, this approach to incrementally introduce the pieces
directly into ath-next, but only enabling them at the end, seems like a better
approach than the ath12k-ng approach.

Specifically for the DT issue, the original version of this series vetted
internally did have a patch to add the device in the PCI registration table,
but it was decided to drop it from this patchset when posting to public. We
can also drop the DT patch until the point the PCI registration comes.

/jeff
