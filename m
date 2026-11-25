Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606508;
	b=C5eLocFKXvbnWThiP8bfwudF8rvqo3T8rQjL382xJngEcA/8mm3pKuTmc3qYKWMBR21b
	 74hcL06qFtyPyr+yG7RDsuDd7PnlfxRlWKWhbd73j0QS7FLfTpdWHYwCx1jOkqRtaLDd1
	 YSlgkLVzDH+zmCLG6ooejs6A71E5qMq/gawuR41pXsDIwL8Dk7XeF4MYtpDTrfBN3dmRG
	 X7j8dHyWQ5APFtTrAarJimeZ5ELaNMb71ll6Is47U9JH1ZuONtMz2Qkrl+ePyQEcokRSp
	 UtFST1bvqTlKxqndjtOBGa4iav1j88qEm3u6rLN5WhCscIl4EMGMFwWbxU40jIXV9Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
	b=UyzOIS3UvZUlzi0sF3ArA2s+iYsVw6I4SZz0o7zbb9oUIkM9HXV8p3AV5GEh0FtkT/dh
	 UGTZq+FOpE0UsXyuCJJ1shndZfTP5/+OGvYvjc7BC/fehhuaidYbD5DCg/EzEnq+/5ckN
	 n19G+6S/C5FfYHBhMieIBc7q+M3+Jt5e7QNzU+PqLnDK228XHFN3MRs4fupKEIwq9mZDC
	 8MykMA8q3ZndT5YEf1NxZ1sMA8za8tdoTeQRuBuluLnt1K8zGVL4Bev8F5BG0pE9Dqod6
	 zlkE+oKYWfcxKjSxNOfMrCDaOsT5e579wLaQZVnng+JjdQbczaYjOhztiplgVa2Y5cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mYER4034310
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=; b=MYzmxXgKtuRtdvoM
	2/jIcmBxMyMhwy6zWv5SbPxLcF4LOzA7R7UcO91F01sgan1ZspmnsmkGA+cOm2Dy
	HQx70G7HiSMMYB+43HbQqY8a8U/POeTe31+pJFGHQ+uMQBzvvqy9OvDk2MOq0rka
	65OhKXLYAES9TesJTJm8ZfW37louGstDu1WoOZIgDDRmRawcpZi71Z38KBqx0/bV
	C5SAKD4MrZOT12H+5NKrOfD5epxhWZWJI/VXplb3G/Fl1WUl7jbKW6L2mjnPmBZ2
	n2gnNMebn2gHiHx4DxljHsWZlQZSNJ7aGudIie9I6CFahZIJFnnqPdmLefNMs95p
	awZA6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjj77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so7801572a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606506; x=1796211306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=Qu6monxUigO1xiKQfsBrY9HiaaLURfxH4xzis3QCVarNtpaNv1KtcdiIMyx3f4SMLe
         OPuoBEQEQmuDPdNLny2rHBYiy9WF3/JyK2hkQO/Z2R8qaZN3+N3Nzq3WBX2g+Aw2zzmQ
         b6Hp+0uffZWhvCfJTjWBY/a5xd4vUVE1FkRM83Ibjez5lWlh2822wD0N6CQk7B6RmfPo
         DfT6Lxx+D3NS4j2w9kaN/l4KcNH/v+5L6j2f3ag85BIt5YOb89y96PmT+r8R2PsWNO1+
         5RzCSLNP0qRIwmrzpIuTY+ORPpXOxXU4Cug4/qaQ5cbWgDt4F9VP3qKdFjN1yx4ejbhy
         fTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606506; x=1796211306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=GcIn2S2o/vENs7saXI0exF50i8sNjoRozwQvbLuKvImG9ND8zBWhybv/zUsi0gsv3u
         acugXtIPlS/erkZkGjWn1BBX5+eo6jeoTKs73F9rqh7rNJ5yYZq8ugzCK8U91I4Lsf8L
         I/NUdRybdxQN3Eas75p+p78ltA1nRZedEMzd/11hwqX4O+SZfl5Yjnh1ctdeMeD+FiNK
         H8aLCzwbNxwQBYotTgQWMBUnu7+NzbVBWHjrpVucMyMLewKtX+UD2ajVxxC0mjgV4SR3
         KxLVfKJHKozqp+Sx0um4AyWYxgJHLD0BamP0Pon6o/eb5F96oMchNbTIA6rM6xbISuxi
         Zmbw==
X-Forwarded-Encrypted: i=1; AL+hErE3UQ+AV7PGx60eJHbKqkUx5jZr+I3uMhfEm9gIWt7u83uC5S4Q3FTI+U+5cpuUX/yuNRzgJDzWXpVdQ3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Wk/gVNZW3r04CHI0GKzWhvx6/XKMvhkPDyOmq1919rkzL0Exb
	k43lJxCm9do8pjSg1Pp/gGxguqpwis0TQX7KJE5p2i6jDIfmhLedj3CeWXLOyoVZQlTeH0lMdxo
	f08YEZJN8HG18k+Is19rMZed+8v5AyXGBiS4AUugkxsOGv+OWI1f68laB5JN86/Jti+c=
X-Gm-Gg: AZFdTZf4JrfQUm/ls7RwFTjGLRjE5CNEHQbD53XkEfCcxffMY2zbBqaX178jdvkB8PG
	rpCzXtHAzMuDURIVFGkGp+2ehQonB5Sc2WYti+RRkpXYF69LdgoOH62/B0+XGC8hSZDwsXBem+Q
	7eem+THeu/qi31gDeYf6z7Ntj8TbtxEGzezasb0YE5h57m/Jsr+8J43b2BksbNISlsP1DcWJrpk
	PtziwFipZiXqZ8b/uD1OVKaaRM19jF4eE16xuSI5/wyGWmPn4vKSMh9LBd7TuZnGRn5q4CiskCq
	Ri4TAZGUX0QxhLa/jrvDkKL9uG5gdte1owEITtbrxtrEyCIp13NoN9AacjRlpJ1pxMV/auZS7e4
	7Fj4QlqkPyFUVBe7YLW60HBbBxy6XJ1kcWt1/H4+FWCqDwxqwbxxvh0/kQK2l+TIUFizo+8p3lA
	cKuMwE6DYf3051KqmTl1tWRlCWrwHU+zLdUVfeSPQkoMdIysdaqD4SkNLPPc5ibcN2Ag==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883184a91.22.1795606506452;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883157a91.22.1795606506045;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm6347749a91.17.2026.11.25.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:35:05 -0800 (PST)
Message-ID: <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:05:00 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX3StwEPrce3TK
 v25F3E8uEwx7HQ9Vy2lBrCv4c06bgYII5MHizL2Rpt67SI+NYzMX18/to8ocJTB+v+BM+gykjBc
 wSIEW+OIEfWaI9NKJCc9SdUx7YBMbMI=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c7eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=o-GtmX4WOUCOVLFp2qcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX/RXArw1/QrJ9
 lQaNgUxz1M6V7CLFqVG5WECtfJ/yrFQV3+Hdeabx2SyQdqwfr4e8DZKruHf5Ad9it+L7iY4sRTf
 3soqgnnHjaREn327xhF/b8KYW+N4XhOIIM7c6R56M+HNm6Ske6qSZNXTbpnKsgZn+BkZgO8vIAG
 /cViXdAZ3YVBIWq4tqMZwlo/5Zi5gscj5eHJovGCoIjDU8YaGFORW3XOOPXzOt5jdeyypcMlNYL
 CdWcn4ExE9S2KXOCcaTB8paDoNYk13WKryq0edQQr5V/BXwW8zzhamTaygafWa9XzsobMFZvlpu
 civixXW5UsnyeBW2rF96US4rZEklFLuFWuMaDm4pfAv3p5D84rGppgiTcv7008d00oeL7U7Ewuh
 r0/VYX5XIx70N8cSd+qu+RVirH3bCJRcpNZfUx8LHQWFkT5b0Om1xWflbqd0pStGXIr5WkaweZv
 78hfwhF9e3RwrdDCkUg==
X-Proofpoint-ORIG-GUID: 2imZOrgKzHM2c8d3xC8pUG2c5iMxVUY2
X-Proofpoint-GUID: 2imZOrgKzHM2c8d3xC8pUG2c5iMxVUY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/10/2026 6:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>> be owned by remote island io independently of the selected mux function
>> even if function is non-egpio.
>>
>> Presently egpio is treated as a mux function level decision where as
>> hardware programming guide(hpg) specifies it as pin conf level decision
>> i.e setting egpio bit is independent of selected mux function, the
>> driver/apps claims the ownership of the pin if it's egpio capable in
>> case of mux function being specified as anything other than egpio.
> 
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?
> 
> Best regards,
> Krzysztof
> 

The pin is not owned by linux but is still being used and driven by
linux for it's intended function specified via function= property, which
would mean the required mux config for the function selection has to be
executed in Linux
This property simply allows a second driver/peripheral to use the same
gpio since it's allowed by hardware
