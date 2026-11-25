Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604246;
	b=l3ZfsVH2QgGdNQCPPutppLIcJICwP/gXzHKrh7sQSuYoHpAOMbM4P09vb27bnimT+FdU
	 MZ0qkCGQiii6j7bL84oVnXACKgbxEqL8V2Amf1q2yoGmmTJRq/yOmLdWlWNY/a8MRl21h
	 eNNIWCeFKqbYczunFiXtIu7mXVRDOmzLQhcFBmX0nTtY9REXxpOYuZpE29jG9necShdlq
	 UL04mofVhwA+Qzk+GMURaJIRlh0oWnVIzLCZvsQbZMHq+n71+pHss1T5rSDY3EVoEjP2f
	 eO+LMNx1UAVLdZW+7viPO4Wf9R0TrGE2U1Fh3WsTkIu9RUthxFL1Gk4/TWqGtBKpU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604246;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
	b=CxDawvo9aOdFk+DUlZ8qBDk7x8o2+Fup+LZO4HApZItZvXNZi8nY8CJ0nscBgrUUJ4/z
	 uhWe8LxHafwSwQtbmAKF/AHHQpI6P7LO71ZFI7LSfBJV1uzASiYLQn6nRbP35Oim2zya9
	 hMYtPfh8pL+ZcbDCmzvYANAjmPbhT2kt/DeDpf8qDz8quxR3T0E5R+zKJ151RKBmf1MbX
	 zwFvTVUXg3Z7t+x7BLBp1f5MqbrRkdQnNj9TaKZej9kWbRRqxdDXniE4tQcoYyu/ridKx
	 YhB7Akh+v6yqLIry0qrnpMnsU7rBh/414ol5C2hJdhH9oEArKBbyHrga9CNzcBTTpXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="U3/9eESd";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABBF606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CABBF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3/9eESd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifzydRbO
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mD3V3763935
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=; b=U3/9eESd1EiDqFmu
	Htw1EFqHz3dcSU9MlAw8eNl/xqnRwlg5yGQO7QZqbYbMyHec6YzyV7vP/Hrlgeei
	+/sU16/4ewe+HKVwdjWstxny5JbHnUFzBB8AyDuTkOc0U9IRp/JLtGDTgMoTAZPF
	aCXY2hB4Y00wSQUq3e68zW5ttLtniHmj+5DXXZ5/qAOyoOkkPEJE/aogmnHWiEsh
	WL+hWwredsAC5CWuSEJUjhRwLKSyT7ocd+5kPLBzwhJcc7lk2nS5k4xPw6Quqkjg
	+u9f1HocgqWDKM2eLceENQrpwn8TaSR4VNuJLOnYNOHvUIUX37aY4wtUViZyg3yU
	VkCCDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2reh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:57:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94993a54a73so51033285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795604244; x=1796209044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=ifzydRbOJO0fEF184DfHUFE9gWc3Bq6FoZCg5CoUDP2SYj6vpn9cBB1m40xy5sDfUZ
         3/g9CvAcOzafwpaZzptJfAgS7o9vyDme1areiettQOc1jfb1/BangZ0LdtZCmE6ahGXL
         IToFNN/2h+yVq25EHBSPY7riBA0XeSyPCMKEwO3biSKcTb9Tp9QFAJwHsQfGIPAgYYOx
         lAnvpyJKZ6VtGX2L6JXkoeL9JJ3qYwEtI2WCOwXjl51R6SSSU2mxJcGSE0HCqNkZWA5t
         pAxmxOJlo1RIammECTLNKwSOjy+5lsw2fmeCoZvfqEgel8wPqbBFYchiVNkL1VKvMWaT
         3g7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604244; x=1796209044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DzF8BpUesnkTDGC3vGLBqxidELpfvE698aw+tvKd3E=;
        b=nRXlC2q4wPASRIKe+4/G5q1zTnTLwUeA0GRAaOliLjZMdAabrPdOLnYuMxJGDPDgRS
         lEYW0ZEdg/zUbKyMhsF4g9NhIrLcLmXPmXV4zXky9Y9VKZGgsATkLFxslpUuNcwJV+UV
         8uzFwMSlM0RugeWXvDBzF3cdoBtB3ZBajhAuX5qwtD1uvxQS61HtZP0Qo/pBb5ioaF+e
         s8XHxGhzzhjOFWKZVdF/XJPzF6Ez8KC0oh1oilkoqk5hbxH2GZZuO4s19a9ae/e8UoC5
         bBAtYeurMffD3+O8E2a/Q5wHl7PBV1AjAJfeptP30SNwpAAzhQwVPueKQ1kTPvbNl6ir
         i3wg==
X-Forwarded-Encrypted: i=1; AL+hErGjJHpfW8FxvQ2OkOo/LCRRxLYqwOytimpGtca1TFTwcWJzCL8gMBHtVMke7Prjrd1LqLKwrhi7UVugeII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OH7WeSiobZXsOcSzEbqNotv+VzNuYHrR3bZBqcHTEau6ek8C/
	UHRbZXjGQgQsKuqxpNgHhsVDHZRWIXsoM4Fs/0emiJDaG3BK83FWxjfOLkZMOXXOKszB3ptEGLp
	2WQnEwGPOS6mv2R7XPecsD8VjPjwJbaVedoBXas55Cw6zJZUzGHy0/glmJA+EaKzTtqM=
X-Gm-Gg: AZFdTZexLH57WlPsX/w/VBXjyPLV//HFDVGOhUprhfhO0cSuo7Jgr84iTyV1PVH9ZEv
	3wUF/dohd0W4n3SG3jY/lm7cjd2Xph5dB70XxuSgccnjLTLXLR1Yd5C97aWiv567L2v8FBcaDPo
	iSNvCGBJN1ERIwmSN2NkgIEorcGAn5T4PeqpfJPHH0fyFSimJpZr7Y4WWTOfXdiSGevTkNUW6nO
	ja22z/JCShTyOcMCeiub0oJ+09LjaMWyKlSKxGacLQSZ7vhts11VNhNVVS52kt1qgLGsnpL9UsL
	WZ8nSvXtp6PB+oKdO8He7OXRKPRyl4O8XoqldJwT2G57NaHU4KgQ22Mc02incwoSkPvRlNRii62
	eirJVg50/suHK2auTvgBqamBtXO0fxaGVTGD/GszJ0fTRAxiHEaXRB2F3FkC+yt8aw063oN0=
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901803985a.1.1795604243973;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
X-Received: by 2002:a05:620a:5399:10b0:949:6fa5:1edf with SMTP id af79cd13be357-949ba7f2491mr2901802585a.1.1795604243589;
        Wed, 25 Nov 2026 02:57:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37108c8esm8206482a12.31.2026.11.25.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:57:22 -0800 (PST)
Message-ID: <e70f9afb-339a-429d-a569-fc9c452b1cdf@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:57:20 +0100
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
Subject: Re: [PATCH 1/4] firmware: qcom: scm: Add QSEE app start, shutdown and
 services image load
To: armandas.kvietkus@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
 <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX000KaiBjK+Hc
 cTSwwpMcjGp8rvuqcc6zJjowE9qsSTzWSCleXQ7j7N4eQYqdV8zy9IlvFvSfPaHP2mr3fp7KEvC
 L3Mlxqiqrr1HFKUs1hVz1veA0XbHnxk=
X-Proofpoint-GUID: pIbXrgWYFCffiUeYQqMemMPmyHuZXj-x
X-Proofpoint-ORIG-GUID: pIbXrgWYFCffiUeYQqMemMPmyHuZXj-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX/rBLiUTPv9LN
 G38Il2DW3jaCbIN6bWd45tGLNlqKJHJwGBfYD52biJk6aVvcVBy7UnXp+CytHzeHPLeo+yCrL2T
 7wwZj5E+mF00Uo1rooCcb678sNviKlhoe01ov5oFcyHshr/fPiEpxjapyQ5JlEmEVyFGrPr5wwH
 eUSYOlIJyKMRvnjWwN6gWECRx8aGf2/I+9dwxF6UNY3QUSMKF3Z3RmWwWYfV0aMibHAwaGTzmwJ
 KuQMjQSv7hf8RW3073xYIuE06Kc0ZzzVKWtTNp4MMAuMCKbmLhXnt4LwKewwMi/rCdwolXFFdCA
 z2EwwtCJaX/sgimxB60VL6cFfme135Yr33vvwhpUiXdV3iCWMFU8zKY9yzUbGljn/38dIBnrIOL
 ULVCbYsVoWa/yvSKI3NExOlKE/YyYX0s4dm6A9IdqCuZis2x/RVVQ8Sjbt9FeJAXzdeI4X7w4c+
 N2687M4t7rgE0PL3gow==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06bf14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=br21HGidAAAA:8 a=6imIkYERwPMp48qjzFQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250043

On 11/24/26 6:43 PM, Armandas Kvietkus via B4 Relay wrote:
> From: Armandas Kvietkus <armandas.kvietkus@proton.me>
> 
> qseecom can only talk to apps that are already running in QSEE. Add
> the app manager calls to start an app from an image, shut it down and
> load a services image such as cmnlib64.
> 
> Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
> ---

I see there's a lot of interest here. Please coordinate with the
other efforts from Dawid:

https://lore.kernel.org/linux-arm-msm/6b1853f3-4315-49cb-9b7e-83f967720a2f@dawidwrobel.com/

Konrad

