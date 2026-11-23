Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410570;
	b=kNID2kADHkEm0Q2owaGBrn4Xlq0NFC8wzl6lMmhLJ27/imXMqymaI4JJQRTvJHZ8M5fM
	 RhAEq6bXbf3Snc0oWeV9V8mtr4qtWoRmcIb0eacKkTkKTWQGR/rTl9gaPaI3K9UlHHFF9
	 t+aOEOkTWVc5PFnP7ZYFzo92OpSL3e6n9R6xipAW+CJKY0aJTD/yVaXplx9jbF5CQ7T/+
	 mRjBv1xILp4dKleipGa7jm8nf5BT3lbX4GPHBg/C96UhBuRAF77lAgBsCo8FF7mbdGG6J
	 8YnnTycEi41n//PNKpquxsTKge3yIxFDHX4moj/bdE88toEHF39hu03hYNCMmTnPIwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
	b=o92RBTDv5YyyXg+D9QieyANlbddJf/wOZgf55l186ULypM8azGiFnuvKaPnpL9eoSwQV
	 6YZeQRSRDWSeBVqx+AYnDcptrqJbaePOI7JJdem0ZTVYjDEf7UJo8zBXxgnkaM5Jd0Joc
	 i2WQf8Z2sU83gaPMFJv8f+ZlnZQRUryitvma2pXvGnfCsze6isncmhS3aVj04iWwqok1V
	 uNq7qc7J7yx+YLBeuQfx6IUlR2XTFc8zdW5ArR0uhJTyVbQ3iWIpneu2M4fI7vtB5Ad3m
	 a4uZsfhHsVLBNTHzXMFFJMEBc9hGvTKSDkibS4numbj+xh0ALLFW9OE1fHNibeHmW6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5g55VYq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eio8kaoD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D57F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D57F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d5g55VYq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eio8kaoD
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51F29864758
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=; b=d5g55VYqs66HuC6y
	TxZE1q44xGm5hVAiu7D7Xtlmgj6bmH1IcGdHXl3eKhAQLA330i0ovbiOehXyWwXJ
	QRTXhdNn0lrdOmqSaCvTz6DbKcVsIjrkpqy3X6wfYCV3mu+Z4ze18dqe4hWXIPmi
	lr4nckCk+WRX9CVkfPCAKfzsbLJK4uuHrLyA4W4vZUCjO5ggVRPv557SnVAhvC5J
	h/E4P0axW3sIdD4AcOaCuo6wgSuY0wQwoncoqx9eQI6XhRa/F8PocDm0nG6Fh5Kf
	DB6xtQ+38MfQq8PfvD5p3A0GZ+ZDENFgyIQRFyRSzAfpL/LA0d7bQPgWSfNy+s9c
	CqxNaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7w6tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:09:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efa9aea3c0so37914695ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795410567; x=1796015367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
        b=eio8kaoDpqYmnAtEXRaF9bNlp2Ii7Y3V0QNS8MUuMgmsYhoo/gJfJjupIpKh++3Xxv
         YU6owsZF+IBjUl9RFjjuwR5NbLxC7qGqd1Kht7ESJY8J1bgdHFcCa8V6EKwEimAza5GB
         iMV1zl5dZ3E+fYndYrcidiM/M+IniQwchqC6u7u2FzHQnUdOsuKnT53k+1jSWWfABhG3
         fRMfJPweL9JNDD+P4raRTmxSy4iXo7KkjhSQLEosrOZN1qO7wgy2tfB1ojuDP7krN9is
         NExIqF4R9mRD5lhWYZ9ytvh4tfmwPR4wtqg3HZwNqgXLKkimR/BVodOrSZroi8fehMlH
         Ge4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410567; x=1796015367;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOTdW7S971YtL6epLiL3wg9emPX9sP8PcsW9yaL5q3E=;
        b=wPWtItI/UcLI8yBtrD/BoiwxfCBr5nQHOOtqM4Ym+pHmTT33ryYjo/g+1+Sx/4Flal
         gfiSH1pWXIue9TtgRpu3Cid8HDPm48cC+iPTYPAYRPnzZtY0BdV4CZef9VJjHTWnuqmk
         b3JZJt3WOfRmm6AAvSCyQLlp+rv811WKuYMsE/M369U1dFzgsF51EJl4eUlf+OmG8bbC
         7rTffXZdpKoMvXCNS1I4U7C+njqb71zSXQZdXFqu77y0kYfGXONnQPDbI8EWwrA8OgCU
         wzoVrsvV3oc974xtadShgvrE71duJD47s4kd4mvPD73tgp88Vi8pO6ArKAkEffUBIufP
         Iwgw==
X-Forwarded-Encrypted: i=1; AL+hErHHrJNWUhqbvCI/wFtS+uLmmpTNcGialuvZxA5mpcRY2klnBVTPj+lJ65rnKh3zS0WFlLgY/ofgaq91Cyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E57Hs/uw8/+OS9W58UwhtR0IAa2uhsEc+jSg2J5vSJ8fKY2lP
	5Yh0WSkgDuwie4l6olZXwth3cr1deWGjfABzymkT6P7PjhhS6Azys2RM4f8T8vut6DQU67NKcd6
	2Q4d+L8jNSVVDTji5AcnhpAPGQZBK4WBopo7UywI1Srg06LVgy6l9q/slmM0MUEp0qA==
X-Gm-Gg: AZFdTZfcRp5Y6guDzsQeFYVyJVAAI0YJGJTXIrACcB+zOoWf4ixORqzBHU8zRhELqmM
	kIxR5R1eNrGWZgGDaxMbj25CCB+aZTdi3qNJ7JDPlsilv53umiDi9D+8twqmQffhswmZ73oDVmi
	H7GIpY+50JX+mAS2EbeC/l3w/f7F8O52AnnzRf6KiR1THyroZN+1PtfvgV2/EHGzcmop/kG7gWt
	rvNesEVl8JOxB2brSbq8nFL+6Q/vjm4eBJLQ9ITSUDG4Go5AcgWsolrrs3guI7s/4XXqmgJIfgj
	9Z0EbVBS8YEkn31XN8FkA3Pk/oxwtB395JWqI3N2eCOmiOXs75JdEN59pQ/ydRv6vSBo+dD+IOG
	YmlED0vNF0QerZhvKV+E4ILOBj2Q6rC7OTFfm+NbgczVEmWOULFGYYmJIl9eF+ttXZTIFvwJPFM
	qWr59b2w==
X-Received: by 2002:a17:903:1a2b:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2f03f1403acmr105120195ad.30.1795410567274;
        Sun, 22 Nov 2026 21:09:27 -0800 (PST)
X-Received: by 2002:a17:903:1a2b:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2f03f1403acmr105119995ad.30.1795410566828;
        Sun, 22 Nov 2026 21:09:26 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04913a77csm38652535ad.34.2026.11.22.21.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 21:09:26 -0800 (PST)
Message-ID: <4edb20e7-d0fe-4963-a20a-e5acbaf13f63@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:39:23 +0530
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
Subject: Re: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to
 3
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
 <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
 <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
 <00b0f4e3-e726-4537-8603-58570e79cc68@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <00b0f4e3-e726-4537-8603-58570e79cc68@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b03ca88 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mi1jIm9wWjqR4qfdRYIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX/LgRE55TwQwO
 2RxvhoQGtTvSN3ZFGMmIuApzvbaFXSdrNarnbnFvLUyLeJtseJzn7XNWSnQ4ixJ+s7gXh8tqCLW
 bnvV1mqQU/TLMxau5QI5IlIavj9/vfs=
X-Proofpoint-GUID: nHdV6zwdlZeM755yIoeKOb76sWDWujvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX2iC2T7oNvPku
 N4c4Iai8fhhjmlXOgvBToL1wGcqz6LdsgvLyHW5KQh2JuHj1WmWQ/H7MSbekiS907UvWZw7iiY8
 NyrQ6rAu39Xb7pW79RSRDKsRm9zmDtfdmFes6qv+yqXa0Ev72GhkXT162ZqLWjM5C5H92kzm7+c
 pOmIMuPEI2uZLlbe6qOi2UQfa711StCNduEmIuPaIDNr3K7XS9sE75xTodmxb0/bwhMX9Gv3UFZ
 kWY/w/vAzce1vE1353ITgy0NUL6oBSI+9DQr/I8Qx+UBSveks9IlyUB52rrNkA7qf30lWjsnkak
 dqAI/7mpSCPKKSdMnNnWW7oJAXHX/NFbdLaBLG+uyF/ep3ElsoQJYNjtK//hcyTTDvQ0KOBrbe2
 byxwrSQ1P/6TCTEWK9tTXbgD/23gfaVwkj8XMu+FyCb5FUI4XAjjfykN5vrwND92cm9Lsp1SBes
 pgxCTNCsBYWQdP8AXXw==
X-Proofpoint-ORIG-GUID: nHdV6zwdlZeM755yIoeKOb76sWDWujvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230020



On 11/20/2026 5:16 PM, Krzysztof Kozlowski wrote:
> On 20/11/2026 12:01, Pushpendra Singh wrote:
>>
>>
>> On 11/19/2026 5:37 PM, Krzysztof Kozlowski wrote:
>>> On 19/11/2026 12:44, Pushpendra Singh wrote:
>>>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>>>> vote after 3 sample windows instead of waiting for 16. The previous
>>>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>>>> causing delayed decision making and measurable power regression.
>>>>
>>>> Power and performance measurements were collected for
>>>> zone1_thres_count = 3 and 16, with the following results:
>>>>
>>>> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
>>>> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
>>>> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
>>>> Speedometer 3.1(perf)		25.8		26.5            +2.7%
>>>> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
>>>> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
>>>>
>>>> The reduced threshold therefore allows BWMON to react sooner to falling
>>>> bandwidth demand, providing measurable power savings in the tested
>>>> workloads without a meaningful performance regression.
>>>
>>> I do not see how you resolved my comment, so same comment.
>>
>> Thanks for the feedback. I had addressed the previous comment by rerunning the power and performance measurements on the latest kernel (v7.3.rc5) and shared the updated results in my previous reply[1]. I have also included these results in the commit message in this respin.
>>
>> Could you please clarify if there is any additional concern that I may have missed? I’ll be happy to address it.
> 
> OK, I missed then the part of commit msg explaining which hardware.

The hardware used for the validation is SC8480XP (Glymur).

Thanks,
Pushpendra Singh

> 
> Best regards,
> Krzysztof

