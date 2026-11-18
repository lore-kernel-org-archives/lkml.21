Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011541;
	b=oT+J0B/OXb7ySCLs2caLCuH7xZ9nuJVD4Ppe57bevtJTHXkzndvvTMjN0FstN7pytRsE
	 tPw9/YpJdvp2C7WWGD/47lUm0ClpjLuvmIxtckNFUPne6vFCgbN1LXl1lhIDUFzux21cn
	 cUs+jgJtcfKc/2gYbYiY4KnxTqnYC3XGKmNsuZUQyW3KzxXckWqlrYvAAFAIjBKf6GPLu
	 QXYlIzMPvIq5CACcnCEzxphs44w1ahC0K2q1Z43Oa0yw0lGeQuTHUeiMPqp7OeoU2DKhG
	 xiXI1lxYjkcCnO+BMDxnfUpPcuyOM3lX7vtaja5qf33lbDFAoEa0rQx2Tjt0KbOG0Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
	b=kAgC7SrzU8tgm/pmE3+Lv6zec0brEVOsQZR86qgoKhx2bTyVRVGhnhJhwjMaiJhhfpaK
	 qSVfD0vZF5Ku5jXlGt5jt3LhAgZ5id9k348Ll9POd4YWz3zVeE/uCS6Eox56yLoYkSUpL
	 9v6G2z32e7YgoW8IRgCubEDL8ZUNM3RfEW3YNc2+w3qzhc+qPZ+kOlqHHFKNCs5bOScyD
	 0vFiDDZScLPV6fHhyOSzbvokgC4NkPXmI3GpOF9yizPTNps2J3CqHuJUgDg/0r8d6nHQd
	 qUQHDRKS854ITm3ZNmzoBZo1/3sCS18a1YejTla4uGMVj0GLwDFILELNzeUEUXi1RqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGeknb2t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=En6+awhG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB260A2629
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76DB260A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGeknb2t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=En6+awhG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIEITOc1432162
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=; b=JGeknb2tViyDvGl8
	3BCVGHNICyr2ccVqmRl7PS6+MGFn90J6095RMb1sq87/T8yVcQ3jjRMWy9Ft56hv
	3vgu7L/be2+NpVVhAVt3Hu08CdFYY3hxehxMHiypIYTnLZkDhZNoRGLsJiMdidPQ
	s/ndHwyqTKmzLOa/mxgwkd6IuVebN1WWxdpil5cQfYtYva5doOu9YV9rwD7kobPP
	quwOqtqtDTWggARhD1sCPpqVr6uaG3QQnMX0eHYjbbjqEv/IIiVzruLej/kweAPD
	mNimq5RIPOloMJRH8P0ZVg7k09zaDEA98CbGBm62LnkRS0hGrKkwgWjJzVx/haL+
	Rd1bHQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrr059-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:18:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso10135925ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795011538; x=1795616338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
        b=En6+awhGYP9GChrqlU5mtkgp67ZyxwgHlS2g3vjPK+0E1L3NQB1ok1kgDURr0V1Slg
         14oUQZuS9H8wsvkdMQZ5WB5yyY8iVCuZd2MT0FcVVbA2exiJrFrVNxyIhfwxQP/1CjEv
         BSxPU6f5XBgF0gJofpIHxssaTSn4LgnDiaKBERIbcTa81/YJQD3o/+B9T457QwBg9146
         8bJTomecJxUHZUZmaBKJuZWQrl/b9beJWFNb7kVWl2jjzNK2JmfjcL6ACnxoXbcX9MAG
         Dq6187lFtz0xfG0LDucYnoH/yhrLVtr8V5fQHgku4ytPhMySSKWvv4ImcIiPSlTBlxBd
         JhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011538; x=1795616338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQTRlWlNPA7govfbrjAsnCPFLMb47f+N5ey70lGllSA=;
        b=m85MkxNrMLi7tKMFqJvEsQs82Nvf4Wi5HzNJv9QCqeaFFSb7K5Db89pFv2LHvHPHPX
         wZbINhiZhRpsuouSW7If29rbP/yXqMEkjVpQZkPvCPvaAyWsaIm5oKynpVXsSGGFDVSd
         Rigjisc2qxw/YJbhvTLZo4hcdq7A3Gas31SYklO5cjxtmrJAUl8f8dxVnlvKJEn5nB2U
         kun9+in+W+dqE94oJrXK+MQrKV3BovO5hdUbariX/Qz1CLruRzfPQE0NFh1Ip6MhK1bH
         gWfUd4k8Aiw1AthGwXstER6ZBTd3oWS3iX2G+KfKZ6blWvVmy0wtZZJBHaH7Y7WrDPcO
         6CSA==
X-Forwarded-Encrypted: i=1; AL+hErGPWoLoz/xIC5CnZs6wrWDsDxWZUJmCeuf+cNZ3oC068pbNW9s92ihBPAtj16k04JZFZK700kDUiJ3M1zU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O+nMgZZ9QvanQSq4j21H+IdE9bPtRwjW5sMcFXgPlrX3QIu2y
	M/FrDRBW5amSShe9rv5892G5mn5d4C18mQwVU9g//DabgmEuJPpcnLKLFfIe4/SDoY5K+3HppgQ
	IUZxqLgnICFWXA9+AYASsbBuqaF4yCtCYqRInX84YbMqjDcW4otF/UBuK2xXKrIMubrBC+ygIGg
	==
X-Gm-Gg: AZFdTZc8RVInbXtOKaExIZ6jpcy7djNqj7aMO//Uh/IckTn5pKytNFYWVb9qsezg51N
	p+DkgVgAOA415TM2ayWn++vLvzUrpZb3fVSR9c8mA94fchqvURcvQidAxCVI9c0DzhpNeBuB6Pe
	UAqWPKnhbxiSPg/Z20YjZAXvhI+6tBwx1g3anbQMhTUY7f4xLPih2B5T5/5sEqOkwKGuD8myPWE
	gxQal5o0pZRfG2dFkb+J37OICJbK+jk4X3k7ehN7/lScB1ec72Cyz/sP/+1RvzK/pGfSEAiYo5Q
	CqhjYFTRBFOW2cU5qZ3weZodgnP5tckNIH0d7Ytk/ZmkRjPzELNvZYQUJ/g65CDhtcWCr6jGbZ9
	p3udKZb7pkSDDvvtOYR+k8OUPmX6Z4q8mH9YkBsKwE5bSfrBw57+lWmg9nBAMJuKcCvCJW8STfu
	8EdkN0
X-Received: by 2002:a17:903:948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eff7541990mr25026365ad.51.1795011538231;
        Wed, 18 Nov 2026 06:18:58 -0800 (PST)
X-Received: by 2002:a17:903:948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2eff7541990mr25026115ad.51.1795011537797;
        Wed, 18 Nov 2026 06:18:57 -0800 (PST)
Received: from [192.168.0.104] ([49.206.14.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622711asm14623665ad.47.2026.11.18.06.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 06:18:57 -0800 (PST)
Message-ID: <9a7c9357-29e6-4967-9e45-ee62072d8637@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:48:54 +0530
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
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
 <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
 <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
 <a31c882bce704ef51c71f16c63377a7d234d1a67.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <a31c882bce704ef51c71f16c63377a7d234d1a67.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfXxpWCEjc3ZIeh
 Y+q3dn32Qc5i4GlyHtNl20AWVVt0OQ0GgmY8j6TSHEb8fPV8aEY4ntrTLJXW/f4c4kp289/NH8o
 /DNvHCQjek1K4P5lQLs7pJnFYtaB9X4ZCcHZYvOv7HSOZK1X7pP81MSABZKowBCAMntUN6iCyTd
 r2PCFVaI7CujSqQekD9C2yQZppH4k+mhmZqa9eVxlii8sEqmNG4eg+flZogSi5h6erKsK4RSAXZ
 duwpUT0WwtEYSVSO0aCmlF89JZEmWAvDmvRXzKM3RBpGCbkLqGbSgEjMvAT3rzOlDzZ0emj+1Qu
 g5zxySVFnjsYGP/K6PGyPHgV45U3jrXcWiukSK9TK3P01wlv2EqSyaovfWikhwKnKDIElQQJGUS
 COZ9qX4AyIXPxZV4WgS7NCabl+HwIyHkIttspqmmHDHPMD1Lr5YOr5XWEcjkw+AhZoiIQoaZoch
 E7tlV83gIdI0Oek1i7w==
X-Proofpoint-GUID: Dm3cdsycnAPfwWDueKRKhNU8tPNvhKtY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NiBTYWx0ZWRfXyR+r+GAQOnRa
 p+ygCx/hwOYiaKpmxEzx7oW5mlFeKD9X3IpMasn/puAtWlpytRXOjplJXwPPbmpHrjyEKLZuYDS
 pXJ9TkxWn8x2nwCRFXwCakkWZ9E6iis=
X-Proofpoint-ORIG-GUID: Dm3cdsycnAPfwWDueKRKhNU8tPNvhKtY
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdb3d3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=S4TnAKnbd+bQPtf57r7XhQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=nI9ZkuOJysPLxIuzQA8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180056



On 11/16/2026 04:50 pm, Johannes Berg wrote:
> On Sat, 2026-11-14 at 00:03 +0530, Pooventhiran G wrote:
>>
>> The netdev reference is held to prevent invalid accesses to wdev/dev while
>> reporting the context back to userspace as there are no locks in this path and
>> another core may be servicing a DEL_INTERFACE unsynchronized with this context
>> report. Since the collated context report comes from atomic contexts, we
>> wouldn't be able to take wiphy_lock.
> 
> No, that's just not right. The driver provides a netdev (wdev)
> reference, so it's its job to not call nl80211_notify_get_smd_ctx_done()
> with a stale netdev/wdev, however it achieves that.
> 

Understood. I will clean this up.

> The address is also already provided by the driver, and cfg80211 doesn't
> need to track anything.
> 

The address was used to allow one request per STA at a time. But, as
suggested, I will let the drivers handle this to avoid the tracking.

> johannes

