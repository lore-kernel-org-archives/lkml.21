Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010088;
	b=jF+gwb2u4BHg2HWgKYa4486F68pGkBXOWOmD7Sq6xjJyA8fwo4x86ltR/bHICS9ZUatw
	 LNFFF5L+dPOmHvvuJ+C3Ro7QRg8fXfEilWhNeiMzbauyvlN3YZe7KKAhPYe3dDiVfQ++H
	 QO/V2ecd/m11KAmXPXrVUgf6UVMVbxSAdnqZ2ayYtOEZi0igHuPUUtbgdPMzUnKDcgphz
	 mHJ2IQb0/EzQIPJGwdVmE2AkbGapjpKOsMM7QZlL8wuSedkAN98ktz5RPw3Ma9BfIg9Qc
	 r7ZnQ8ktHIXSE97nya8+6B0G/2D3U8xtW6OopjwTmDB6YbEo//fsg+j0xVfth8FPNtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
	b=X/UZWP9ZXhG9ENyrj59SpxdfGe+XxhN4TSAqliBFVvwRm+4Jl+sw672Ys6Hzk86B+q7a
	 G6ECiuquJ6TpQC+dXtH+GTPdaMwAZk3jR4c95yyJJ8p8DkZ42airjB3OEtro0IHMFAxMl
	 ekjlbXzHylOXg1b8nsPE3X+FB1yc/GYKiSmySzAEv2Uf1RWc2BULHJwHq98XsKKu3mI8X
	 rErR7anfE4ae/fJKMqA7D6oY2U6CXnw0Fvn2mgsgpbqau7zyHvzSzAptUzTLsjXHuWGJo
	 3Vt0d75VifRSY6KiacYiYJuqQBjK3o6PMg6Uk8aodlQ9VEpCpQYARYjxmFVMGxO3Wyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9gtfsr+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWhH5ipz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD7606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADD7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9gtfsr+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWhH5ipz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQOIh4072998
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=; b=H9gtfsr+T002BAHs
	oQE+BdYtXoFkNfZlCjkr+DeqLmm2GOWkU6+ClrSXrETTdX71As5ucDMBLUs4rsuw
	WDTgOQ5aJqUqFnRerufwoJTLGDlF2dxwsLr9MANhZPvb4cjfAhc0NtLYZIk7Qcu+
	ld+ynrPV6Xfas42bX4mN42MYXIJvDtFHgc+cpbdrmCxZ2veywI1eeoHd7Va1qL+t
	Chn0xurxDp+x2exAC6z73ln4wp5Kjt4Rs3mT95CyjxZN7NupcYvo4+lfyoxnCdfA
	XfAmyVI9bOvhGcO/M9Ek9eG3e5uwUKCqPNXJOCQuOzPQjfx/az39HpsQoaknq0tY
	SrGAcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv73bdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:54:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08be1c84so14528965ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795010086; x=1795614886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
        b=VWhH5ipzF2TpRWW1p8XjQKbN7ZNAgLpSCshxhFq/PmqSS7B09Ujny8rCtunVfNQdYP
         85fimqTY+I5PCHjls47xUTICjPOOfynnTvrEPrj8Ii9KlFTeWuOu4XRUF8dol1SdbGjZ
         fRWuoM11SG1UJ+ky5YBMSCWZaMy8SaOTfgfrfDLzRpmYP277J+txsEMMIytpugguJE9T
         s6gTH+/+Brn17cZ3v4VfSuyHrg9zpSBOItVplEPKAX3eI4SjXby1FCmLD7SZDCubGZxl
         qv3ma6r0kw2uagauVeqBD+LPpnqx6KDQtjS3eeqTNG2Fouozb3TDp4RZWQNjDrK/N6ce
         scMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010086; x=1795614886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcHLDTMuSspEhVa8CcCcNAJiFwogZdDKAZ1XOR3Vd0U=;
        b=nCt23L8ojmDZSEc7TW3n0vJ06HYlMzYoXOES1fZJZkUEgEo5z3DSTuifqI5oEj3ad7
         77RTjPR393QbeTsXz6sJI6hkRvt6gYpov/vgB+6sMlJacPx1/ED8/UdDu4dQAvlFyXs5
         ROB1M2wPKTJf/uaZtOjQW0puoLCev5j02391lMQMtSA26YDLTOSIZCneEBK6Jb4abvAf
         WO0+uSt9UA3wkN6d/83+zsZwxBbLCXHDJm9JX9jpDNbaW0q8+skG6iSE4Aj8thb+iFvk
         s9R/n3wQ7vXRrpd3xciNoUAGNsbF85r0SlCN6VgzNuwSw0rNYCu2rj0UpicuprCl2T8g
         95Pg==
X-Forwarded-Encrypted: i=1; AL+hErFvnZDCDg/MeZx68QcJwldTi9wqedWtVijlr5kFNe/PbiEz8mPSkzUZ/vE0O70vvKByS8tu4xyQLMBVJMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PgKUzdqlTJz9quRm2Uq1akxAz14YG5547pugPuH6F86fjjKwc
	OaCkFSfjt5p5NBZP3wWNmn/oagNbSb8pecA/KUkjVbYdb78agr3/vQmcfvweRMGTljsg37JxA7t
	4jhNVu9NywbfNFj8/LLcltbx2kCKcg4bq3C0qDDBcAVvBT4zI1ful/5E7CbQWGUg3C5hcTAAr0w
	==
X-Gm-Gg: AZFdTZfaAOqzwhuFfpIxJYN0nsaC/6D2Sg3i5No1/hlrafBCs8tOdDQhY0aYg+3ddi1
	0wKAQKkDYcDaeLgG7L3Thkkhld+4T3tRPwgSkHRA2cKKsr47h4lgxXOVfu6hNKV3q1K4My1oeIo
	qzccf0vlO1gm05ARUFYrhraw0n2akY+7DffjDn2bVVUkfk81R2Z37eVwoerEN3yrrNpXnXRm88e
	YJeij7UgmqI8L9WHYngX5CgCvio2ZA5Ks5+x167iX5o++o4wAUKSpQZdmJ9mJlJvrSv/IMnnRe8
	JdY0l50SKrj0shJ0Co6/D9Qq81Fr6WPQudaYgAVPl/Bq/mZJByU4UR15XcheEI0AeGhnOsNfcj+
	K+jkK0dendxTAwcMYVi8eHHQ89YFqRS7neyw9mgvVgaaDaLBr5bLGwPPGlQuiMoCmAzhjFZ5vIO
	3QteoG
X-Received: by 2002:a17:903:26cb:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eff72f34d6mr24752275ad.13.1795010086226;
        Wed, 18 Nov 2026 05:54:46 -0800 (PST)
X-Received: by 2002:a17:903:26cb:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2eff72f34d6mr24752135ad.13.1795010085779;
        Wed, 18 Nov 2026 05:54:45 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e1295sm14477015ad.71.2026.11.18.05.54.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 05:54:45 -0800 (PST)
Message-ID: <204b3133-bbad-49cf-9290-9c334509297a@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:24:42 +0530
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
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
 <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
 <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
 <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
 <61c6b777341edd1343ad1959abc9e2313a05ef25.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <61c6b777341edd1343ad1959abc9e2313a05ef25.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5v28SVCG6CSghxxhQJn46NLYl2gAwunC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfX9fEr+JjThySn
 OjBdJDxGVYIDioRdFbZaG+xfBcYdOR8mkNLpD+oQEhxIZ15ziu8EKVEfjDx3YfYpcgJAAtKGkbv
 XvNhbUq5A9Ff+00tBLncQToOqsDAyGjDDEbVLDwyZEhEH8oaNrIBvpKbt3aGry+1vHYG9mImlxs
 T9XFAV9pcWuW+bRRRbJ9ldwLgivUiJH6/DTVooZyeOxQqy4qEhxybb9mVNocNHhJ1/xweFnioYD
 PRxcTkwJMSoUijGToIio800VVdYCa1cKxOwQkW2bfd2CSbGQs8imB5WqI2gV0cEIcgAtWk9y9Xh
 Bxeqk1hLMWZz3erYKvKEAqtsLjR90r9pQPwAtypNJgdvPNYLRqwERTjhVcny9yct/l55jwNBb9R
 chBjjNBDf5Lx1xU6jbZ2xZ1xt3PUqeGEn/nSKygmoqzCg1Na+Ix9WRTq6xnB2DtYwRzwkXAiJeN
 dGFqQZ16rXEyfgnkYpw==
X-Proofpoint-ORIG-GUID: 5v28SVCG6CSghxxhQJn46NLYl2gAwunC
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afdae26 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bpt8X80078Pt-H13CuEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NSBTYWx0ZWRfXwldAotvk4JcD
 fkapFDKMc8RLZ4WziKQf6k6hN627PfXoaT2cv1MGbRmrOWAiK8vb/3FM3v+zNAmaM7ean5QSHJR
 gxPNZ57LUPFZ5dYJFyoHk9ufzm6/Kh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180055



On 11/16/2026 04:10 pm, Johannes Berg wrote:
> On Fri, 2026-11-13 at 20:53 +0530, Pooventhiran G wrote:
>>
>> On 11/10/2026 07:56 pm, Johannes Berg wrote:
>>> On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
>>>>> + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Used with
>>>>> + *	multiple commands to indicate appropriate SMD support (refer DOC).
>>>>
>>>> This (with the wiphy flag) is the wrong way to do this, we have extended
>>>> flags that don't need the double enum value and pass through to
>>>> userspace directly.
>>
>> I changed the EXT_FEATURE flag to WIPHY_FLAG based on the comments in v2 and
>> NL80211_ATTR_MLO_SUPPORT implementation.
>>
> 
> Yes, but I think then you had more intricate feature advertisement and
> that went away entirely?
> 

Start-ap had many SMD config params which are now cleaned up.

>>  I will change this back to
>> EXT_FEATURE flag to indicate driver support.
> 
> Sounds good.
> 
>> NL80211_ATTR_SMD_SUPPORT passed to ieee80211_start_ap is parsed into link_conf
>> and (will be) read by the driver in assign_vif_chanctx drv-op. ath12k
>> implementation needs this indication to instantiate vifs and workflows in both
>> the driver and firmware.
> 
> I guess that'll be one of those "trust me FW needs it" cases, but...
> why? I don't see how it has any impact on anything?
> 

I will clean this up from start-ap as driver/firmware can manage without this.

> johannes

