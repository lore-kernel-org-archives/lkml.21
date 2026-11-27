Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779180;
	b=kfr8PhHtHSWYQltybLssSsM1kJXNugJPc/G+vgtR0k1N3ZibqxCWMCLaJLH4DxNdGgYY
	 YW/q9mV4dLpWoL2TiXe7I/53mcBJIn3lSC+uquBjZHQ3bkWm3Fhk7mnB5YtXikAr/R9kW
	 VJuCvdf/tNjbQ92pALH01NoJ2hVGyuoG96BHeyKkkfMHcFs40RitSQ5T3MKXEN79vPE1f
	 fRXvsNp3W4R93wZl2hY9/74mlOyCSJ2/dtkY0VlSTLqVFcXGGrKjGXbyDFwjeK5wiad85
	 jhbJugvw50kuHHo0YjEw86uYpJkgxYZiB7tIFHVi5602ukPovDsuHi5m7wR57Lqs9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
	b=Qk/HQQq6ahU6tXX3Xeiy0uw0ZIFIwdLj6O3aup2JqP7q1z7L1R+/tt4S5aUoU0F5NqWw
	 XbiIiUkuDZdaDj1zHcvIQPtDhebEmEk4EJwtSGc1Ejp0kePCNCpbvjv3MRCR82G0q7iyZ
	 7w/0qVGc1FzkLyPHtPxhoBK4VgTonq5uPrTAm07R8qbsHjF3zYnBf/ujYDguaG4hMiVoo
	 4cMlyA9dqvwnxapwHRwNl0szBkFxM6VlB5aUHliALkYL40hWMlVR3YpdLsFdoGLYDRWLb
	 zAh2W4kRFNDtGq77nT7K/H+BuaIERiPBqr2zyMSHCeYnYpN595odW5h6vge0oOqIunA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgQqT0Of;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci0dYSx6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363B0606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgQqT0Of;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ci0dYSx6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApPKV1560707
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=; b=NgQqT0OfSwQ16avX
	XOjIkHa9BL3SX0I6D5+RIXi+i5JopNpxjhTFuA2lwH/XlP0KnpXnb9aVqMK4xCDV
	sks2DpEe1DCToBCrPEBNJYN8wtdE5HTHN+MIpRkOGJlhLkoNbffO/YaGzEbJJr2o
	6cLNURN2IGTInyvUt7ydW2pFFIkTGoGCsZtiO+vwyNjFSqtvTq5AJS1OxMAvpoZb
	Iqjl80oC5Eo7/Iq6tTdKwtCJfhjAof2oGYbVNp1xywvY/MBXc9M+dgVYVhV1uqtH
	FTK+aMwMDBK2IdA94GubnReqNLimTigyxLFbdX6tiG0Maj4llYnxt1a6zIiu8ftN
	rXg0tQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55tquv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:32:57 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b0cfe694c3so109906837b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779177; x=1796383977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
        b=Ci0dYSx6fhtgCIGnA3Dh9XkjaxuHkgDbjfqyoVED2rGE1EqHYaSQqLO5kKiHf4hJEH
         3Gr8J2FXo17JQiZxRyMArgCQIukpV2TWJ+3QabjqHuZ7iGITIVmS3NKxs+iua9LQR3c0
         VY7JwRcKMnycTWuhJjx3a2suEMJILsq2vruZpizFncZBdKhpS181pIml3RsIUorpldOz
         sAdnxfXVopTF0JeFZCNCYZVzeo0/l45Y+cSphir2BozXsPb4VmA4AyOSlUM75BAQVt71
         qeTQbBIg7IZqSUQF4P1JOXsJgN77RoxVnHPGTaa49rUYxbVfQ8TDmmWWlkE0t05Na4mU
         wmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779177; x=1796383977;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MK3jwXB2Bun651Eq7hrE3tVpshhgoIY3bQIF1bdlN4=;
        b=owhsWMmT8pAUEtnvCTdl+JlUyU+vlLVnViuITR8NgckqRJG8zXT9EiVDTaXCgpefpK
         wHiQbqi0BAbhZI6WM0pv5MB/AzeIg0TSalKWAvIj3rKLN/5IjPcLkv1YJdw4ePPIXYIr
         8IMnKlaPSDI7zMYU98wZxt6TvN3sxeyk8gYKJqAGMrPBsvkk9zZNSml72vwPXSVYFdoM
         ayTT7q0ELkWoq4j8wY4ZldEHtvgOLj5RAm9S64D2vjBgGMeVXAStflmfZct1pIkEBeKL
         83UH6IDwH45RbAJbkAAR+PJJqDzM2Yc3hBc4m9x4sZhQ0tSgaLkM5K2ZyAc0xZ2Y7Num
         sZIA==
X-Gm-Message-State: APuU4Z8F3tARqDv3cKYFT6hH/TGmidUdp9duDQXRqx9nQOM+107Dkm6S
	eZfTfRfgqAmJlHxo6D+zLtiADgCAc5dntet96QyiunjUMiMYbEeNw6QWosycda75pqDil45X2L5
	wp3Gvvi18lGRb0bPoRxKza4+RWENbz6HErgmP0sbUcBAfQKy8ZUNq5h1C9BPcYlrbSd4=
X-Gm-Gg: AZFdTZdGG2aji0ZeAcPTfZBSsRK541oh5mFGQ1x69Zaz/5yP6Y83pOwNALk+uVq+nJ8
	gqEMuGYI88xjZ/5xaUpiJ3vMcNfLPyXH/kfhc/j8IEQMUM0pDBRFZwBGE/C9z5Bor221gM9wfRx
	heJiVuL6Q96JVO5pzlt167TxrP57QdlY9j3ZbdqJmFf4ezcuuwFAwxTdH+5ppltZgwPrBD0ALeD
	5Na1yoCDfb+TuodVdcPxmTwMCrLMKPsp4iTJoAXcLuwy3wk0O+dMOYTkA/rz36JsiZ0vMVCtF3Y
	XHmUZoKcP4ydB8l6fu6Z3CFVz5utpspvpFlLON7V6iPK6tEBDfdWL71gX04EtZMhT3oxj7DYFSy
	Em2ADNRpNm0GUbkmdOuAwohJd45GbD1LVlr/8uPJnBQPXvhAJq7zi6S1+BFkpy7O3m3w3WTgRw0
	Cu4LE0c/Xhirj940osJ2fgSFE3kY7TqHjrkKI=
X-Received: by 2002:a05:690e:4846:b0:67a:184d:3a59 with SMTP id 956f58d0204a3-67df4494d13mr6976137d50.91.1795779177471;
        Fri, 27 Nov 2026 03:32:57 -0800 (PST)
X-Received: by 2002:a05:690e:4846:b0:67a:184d:3a59 with SMTP id 956f58d0204a3-67df4494d13mr6976132d50.91.1795779176927;
        Fri, 27 Nov 2026 03:32:56 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:32e6:6e2f:3645:b017? ([2a05:6e02:1041:c10:32e6:6e2f:3645:b017])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm38627061f8f.45.2026.11.27.03.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:32:56 -0800 (PST)
Message-ID: <bb32fe8f-0fa1-464e-9818-b71799a4db90@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:32:55 +0100
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
Subject: Re: [PATCH] dt-bindings: timer: arm,twd-timer: Allow power domains
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20261116-ux500-timer-twd-binding-v1-1-58099a54a440@kernel.org>
 <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAD++jLma2AZstGAAmCHRFouwC7fNQB5d3=LTjx42fSQBKsHDOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX1bf35O8VDIB4
 WfcH6H4pIDXBpUWK8rtxAwbeu3FsxMqpQ72ahbiCyPayZ8dtLXQ4xtaWoDZ/YDCCutASEnxhlSl
 nfUNxHQOzJvKKwuV1iebH0TmTzTUWns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NSBTYWx0ZWRfX4pUpkbgkzrOv
 E05cL4eToONbVJCwp5C8nwJBDRbR2e67j6FRgllYS8p7FmluN7LMOAt3huUOu81tQGfR1ADsKZc
 OIt5rprwIHHyDzhXW3d1g01IKSDncIpWu8S9L3f/E4jRfEcnvpxv+F0Xd3SrfUOYyWhcWcrHVru
 zDZT9mglS41LrrK5QDFoLIHYtAMTxN+/THl2z+50947/+6iDss8cPhu1EAxT+Bt4ZnV/LnFSih7
 rKk+zVNgzMDe4orT6dSCzHxhHw7tEMFkV3mNjlJEAAjjhQeAsqwi75HT4mgwwEBTO0HkaPYUA7n
 ddwYiaTgA9gous6KzNbaHdvHYYX+IgADKAjaVP6Ha7TnjiIx2aXA4VCktVTaSndibXIOfu0uV80
 EEMzkBbgzTYdCZ9IRXprAqfECn78ei8ry1m6JqlhU1L2geSUlZpEjDFesMOhWJ9rVOxmPj7ZmD9
 s3i+BWTcfgT41MeSnPw==
X-Proofpoint-ORIG-GUID: vFB8LsMKlT0KevKaql7BX8by52evxdzN
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b096a69 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=rBar0XDY8gZIIZe4CYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: vFB8LsMKlT0KevKaql7BX8by52evxdzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270045

On 11/22/26 10:26, Linus Walleij wrote:
> Hi Rob,
> 
> On Mon, Nov 16, 2026 at 10:48 AM Linus Walleij <linusw@kernel.org> wrote:
> 
>> Allow TWD timer nodes to reference their power domain.
>>
>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Linus Walleij <linusw@kernel.org>
>> ---
>> Allow ARM TWD timer nodes to reference their power domain.
> 
> Is this something you could take through the bindings tree?
> 
> I don't think the timer people would mind. (Or else they can
> say so...)
I can pick it

