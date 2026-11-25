Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601092;
	b=is9sernYn2wrb1aQamzQ6U2q1TJ8mDSoePy0Ze0HBakV2eXZM6piHNps2oKdKc5v65vH
	 7ra9pJv0ktX8BbGQ1dG+gVaUd9IrnbzRoP1ZnpzQKPiB5tgM27coYP565YCoqiaM/vOzP
	 TeHnCoOnM32sqv/Eu//uWQ2oGIDVmZhyUwQrq2dVh8hdcBVBX6X39Fii/e0cQu6pdMRQf
	 2Mhcx913tiadEW0ggBTDsLoGQvT4udrVhOeRV8+CZLgb1tVQwujbaJjlZ+eqBsnB03AsH
	 JCjXLgktQBuyyIaS6gkspBKcDjjyzhxaHj1NzQXgwBjJoCgHkyZQZKHpjtBTRBrrLfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
	b=MSyrB06SVBMbSxiS3suHU3aO1DQl8j7gRBN6j193aShL1TjqWgUpbRITnRbUPK9rDz+Y
	 rnMkq0V0te80COUHjqe6uFtBeG3xwU5ue+sPzaDfaTUvl8A5IwI9ZVQMqmaRiXXsPjUDr
	 Ls734Sc/eBXcgKyHozZfLRcF0JDMEJ+ePM+9w73VOaGSqefBTdKNBk3h2h+8RzLNpt5Zv
	 WM5WIHQEi6zlw/NMeQ8GmUCnPn3Jjcysov0f+MumgqXZPuIPkaVywT4Z/93kzxFoYzLHH
	 Uv+5hQXCVJ1ykuFEkdhsogUBFARNC0QNoaXzZP3IA5yZqSbQteo/QmmjbG6YAjqvEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770A606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9770A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AWyHI9ZB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cTPPO0Nn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mdZY3127767
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=; b=AWyHI9ZBVqSnO/8k
	s3R6QLL3aKZGyrRk5UlNvJVHYDWxafTzttqw4QBV1iA96nd3BLw9fVK8FAJnZcqi
	axca9mszpX78SmLVrir0fVI+BBcl2NQeGrU+p4L5oPGPF7pWuS/qY1/dYpP69V8p
	9PUYs8SlGoiIgkE89vJ8aBQao+xjY0ntcNR0lB1uld1LyrFImjgg0JZHR1JKJY79
	/VJlLk88S7JXR72o6q2DPQ9YlPOTdAlNoLd/Vr7CJJhvJI6S/eqHVrVfU+5qXapw
	t+OcWzfEPAm/poP3YnUOt/OjeoQ01UaXQ5z3nS4xN0lEV9ejPKqfZHCLOVX+7hom
	Vjs3lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbk7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:04:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94964828890so70503285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601090; x=1796205890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=cTPPO0NnqHqKUDwYrHMKGsGrVX6rwWQOmjw7+9iRvAkrri1q+4LN0bAsBxYseoeE1L
         JhnYcHJbaBB/lg0+1NfB7oeHRT7SjOG6whF/HvRRT1vBm3rF9fVblrCHZNJ14ZdU+NqX
         K//NQguJvyebTmGacZjGFSKlJgLT6UXKOo279PMAMOqS7Ut/JkYbJJDN61RZomwwZ2ah
         bZBsrvzjMZENE5e2wKVbcFLuaghCEAD26Aq+0iZafiPjJeF06cnyL1ZGRBHEpKPi4kaJ
         5P6rcKFC0g87f5CVEklIIJa/oN57yskH90hfVoGnzFqQqoe62zF6tDOyq6Zagvpn3whX
         8eiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601090; x=1796205890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etGgwq6UQispo3f+AA3xA57FPijjtc6+G4aS1BXg2q0=;
        b=SD7QkSgi4Xb3dlNGroHfT6ldZe+VKFri2eNWk+Y+b9E/owD6UGPSVvYdfgzEVmW7iN
         a56ihHokVC5YziDpgwlWjhOuGGpg5wM873uC2nQGM34Q8qnBKpgZuVJR7WbvmG0cpC7o
         O0EvNHNezAsgOci9bxb5Hua3D9KcqreA9CspE4xA2FU8hNgXATvE2GBoTY1X0bYzq4jl
         zQ866epXLW+5rcsDb62w8PFbxjwmhWtzeUD4rcRblbHrCqDDkIbmhkztUFRakou02V0R
         AMvszV69hWTWIDI2MVXgvTE8S2MTs+soGlkvsDZsZpKNVsihfCmUtuJ63Vfoh6yCloU5
         XOwg==
X-Forwarded-Encrypted: i=1; AL+hErEFLkmlTqMA6OGGbvFdU6kHl4+CTGLR64gcH9/TltIUEIbOFKq9DnbqF2gUBXM601rvVpaULSRR2NQwCW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mK2gRst/CXldtLQu+50hP0CPbaru51TzE5u8HCke+K8gqfHxL
	8xgpcUxOtBPpKSe2sGLHKj2nyiMnOLizzhF9ExINikLqU3lpbvCE9j77M4j1czXmlL4w++zHa/B
	ZYISmOn8lQ02UpVeP7twYgiTzAMu9xoewZhtAAandiID4CTUx/kE+fcE47hrY0PapDgw=
X-Gm-Gg: AZFdTZfSfW/IB8VnFx7MiC83oBJdEaOi8HTSK70sBuwX1+mBwWBJLik+Y2+Zgh4pphF
	S5jWJv6YnaZbydVF9HxgFJ2hmESwG6syLccPXE7EJLG0tPzaaq44S6SscBb9jMcKCy0NDdCJ/Y4
	bIMgXG/OEHHPBIU7RTnllU7XijlizwVCtJn4lWgcdNtd/OocXp24X+Mk8S5deoUUCFjMiebUoWw
	vYsU3PUlSmGTRPUEl4XW0NeK+O1VLBy8CX6mQnGmdyppYRK9JA4Tf49L7LAU1n6sumya+GIHaHJ
	oU+Ah2QGq18x7w4REDTyPbFtDtxEHNENm+p7g3nDtcG2JcNxT769/GTS7M5vDOvieOrNTilE1tf
	KwcIE1EVpSFwaIaV9jv3FLt49wsv+7jcrFn+lWmOmfQ1gB97Jdg3v/LvU1GlyyXQIqf78Z9Q=
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862182385a.6.1795601089712;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
X-Received: by 2002:a05:620a:864c:20b0:949:728b:51f with SMTP id af79cd13be357-949bab797a6mr2862177785a.6.1795601089242;
        Wed, 25 Nov 2026 02:04:49 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01b0bsm614267866b.10.2026.11.25.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:04:48 -0800 (PST)
Message-ID: <439e3917-3125-4602-a81b-26aae8233595@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:04:46 +0100
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
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Save the need_pas_mem_setup
 into qproc
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX/KQeZL80TctL
 toRYyaVjboj7rv69SujTkHJbWHEjcQCdd/3YZZHGF0F4y7we3XviYi6eUBQSB0/exZ5NJkckWrl
 65d8LXEm+CBd99OHRBlc9o/b1SeVJY8=
X-Proofpoint-ORIG-GUID: _C3WXoivsS7h75K28C2WUVa79k21lRPx
X-Proofpoint-GUID: _C3WXoivsS7h75K28C2WUVa79k21lRPx
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06b2c2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LNBVZBixs3kL4_gL8vEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX1WE0e4rmwiJq
 lWq6OWn7mi1Of2TytYgCexs1bUc9iNGFH49J2+BkaNtbeJlGwjH2ZUkkZKeBCbAGsMarFD7mHzn
 72MUbUrgKEQUbJkJ8hY1JdhsgLEhUQMVKwMyMX993eyqEFaiH9wFieRJc+IMnieRu2tl1LYv65b
 CX1jWUmfFPQR4Cyi79i8Yx++CRDI+oo6fvuBh9V/Un+/Rl6G9XKMGAdKvfzfdSNxKi+ASnl6AsV
 PzX0IUD13vBvDvt57KXmPDpGnCshpXYF5fGUBBichiv177wU9HG1wahyqsy0lpv7DGroZnNKgEq
 bt3cdEZjN9rADluwOpESDL250oHgvN1IG2NIZZJ5DH4rwW18aUBr5LyDvQi/NxhzJM2WYEu4nNT
 Cw31FJU+3AreX2Ml2BkOgenaOJTlvVwPaLDoCDL4uQCHjq13p/xfWXb2mFG83h41wXTlS+W0AnS
 +JdGMb2lQQ5iI0Wfb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 8:51 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> On hardware requiring Peripheral Authentication Service (PAS) for modem
> memory setup (e.g., SDM632), the remoteproc subsystem skips hardware memory
> authentication because q6v5_probe() fails to copy the need_pas_mem_setup
> flag to the allocated device instance.
> 
> Original commit didn't save the value into the structure thus quietly
> skipping if (qproc->need_pas_mem_setup) condition.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae
> Fixes: f56052f4d87c ("remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
