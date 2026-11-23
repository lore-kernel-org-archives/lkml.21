Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451513;
	b=KjvRrOIG6J9uwb7nzHZTQVV393eQUT3xBb9qINKcNVOaIQ3vhr371e6bMTocvnF/HFn7
	 lVq+MyNeRbxvUg0koy32p20uT9VrqP/vw3mEQqhBceZGyQ5OEJEzK2eBez6v3Xf3Tmv5o
	 OL3b0McoY2WzOwG8v0GvSgnagOAI2+0qxYDscq3voUf+W5s+id3NsM80kBO84O0JAZgCo
	 kpwbhhVHq24xqjVBKC9ONV4SjCn2UTQENgCXTvSOJ8m8zoT0j/b6ALpn44Jf7i1nUe/TQ
	 v0mw0hA8LTDW6ynxMN3m0vxigsPkuIMmAYjz82gTZqsIC7jK9T7DFOkRp9WB0h0Jz5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QWQfUVU2CQs5hbXBXzRNrN2vmZR+w1uUFsRo891mesg=;
	b=WHQxFNIciKibh87F9JoZh54fCAZ7oR3XZtYVcRxpGEfq5F7x89jMIPnvBV2AtcQlA4ZY
	 3WRAUEvoBJlzXFdGmPCj8WXB5S2s006/YBGRwrdDNrRObae4EtNYwjw6c467/0A6KIcGw
	 WIJFW7ewVyi/qDcNEqZGDomBUU6fbr5CVNOSW/xrKy+uGnr9vFw+z7lDfobIYL95987Or
	 ngAb6ZNEEJMOEUY4Zn5phy02DTlDjlEeuzcEEBiXpWYXArTGJvVjVFrPJzEieGyGM4oY7
	 NFXTWJyt/l3g5KfZYnrZP1QlYgGUAmx1vcl8LOhyEp+0t+4VNSUSjzZiTSutMoTxW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHbdGJab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hs0l3Bel;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E43606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E43606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eHbdGJab;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hs0l3Bel
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH0p7846680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QWQfUVU2CQs5hbXBXzRNrN2vmZR+w1uUFsRo891mesg=; b=eHbdGJabfGjqgmQf
	FBotnItY2afboOHdhIHEIwSc9c5beOFkVg40vPCDOM1A+vK6XGbAA2+yd9++dvbv
	MZa4l6zplJEiBlzznNwBmEl0x7TT8KJGkxeTYpQ4YH6M+4fk5MdrR8MvgqYTDY8X
	11jrz1rKp/SI3UZd0MyzZ2X0hT//0Cj7qUaotfgEtjSSePUDZCYCysJ83mUxXSuX
	/mylFJD7t4fq4D2dhlP843gtZa3D1iOnIHy3fCOn40Er3DsPRihFANI+eQkmC4wQ
	MjTYMiMBSJQOE/l36avjZd5kf084nrmuhu1MF7Cf6TJGFYyoldaZBow7NMKHYyVX
	ZKZQvA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742cd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:31:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so3272707eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795451511; x=1796056311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWQfUVU2CQs5hbXBXzRNrN2vmZR+w1uUFsRo891mesg=;
        b=hs0l3Belf38QDbT7aCIrJVMYIaSc59TbsJixzU3fPFGAVdAXfVRDffw3Spr4XVZ60L
         bVnAkc8LxoJSJNO6qLYqw5AA0aMuoZb+67ECQ0KM42suPNJHs71U/SQTu2JRlJ3doIX1
         9gBIj4mWIqTtTPCsiJE9vxAZ5s8sk5rnRyFrpyf4k1+RM3udirybRVINkzrBTcFq+cRp
         8+o0K2JYqqIfyVF63F8Z77iua/p2waZNzL9B8JwaMMW8J0OKR0J5IMeq1wKONJMBH3k9
         d1kwzxJB1YDff1iw+Wc9w7us22cNENSn4KncPtuo/1gj+67+7Whb5+Te4RgTNp79HIuI
         9Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451511; x=1796056311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWQfUVU2CQs5hbXBXzRNrN2vmZR+w1uUFsRo891mesg=;
        b=KWixz0HyQCbwa4YjeO7CPUQnXyYG2U655mBu6yYwBxDD+uGca3z8+gKJxrr8iW/VVF
         n5Ag895gtROPMYJ0JZ2lxKWOUwlBw0sSvXKzy7afumWWW4tfwKuWQ5GIOyqw9lRe7QU/
         qbPfbfBhdORcQ1Uvqurvwb57IZlcCjCLuOBS6UN4Eigs38w8OCvUcow7QP3alzSasYeZ
         Q156FOfqXIc6Mm5bJkfLt0pB+HEQfiJvhnWJaYxzCSRi5V/ywYNebq1iykCrN3A9sYFF
         Br03aR4YgfP5qoKtgxR6L5ZTwZYgOE1mAgH7LwwDdHQxsUzdR2FBU2ysVrQnSIQv9hGt
         6yfw==
X-Forwarded-Encrypted: i=1; AL+hErHFXZkzyiE2ZP83Yc0og5OjsRcnm+C8Gv+gx+WIdxRCHVvNFlbY3oMdueLTDxmTcytH5f19IX9TOkMKXyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6e2wbi9Wa4VKG2rHAIQb8FqSpFXx3yK6coQw5GJRtIR2uxi1p
	qcocpgHQwBJjjp0BmXxWYVki2OmzvH0tBZ/MOx1Wj2hw0ZRLJCduk4svk//OQi5SfsZs0ANQ52q
	bPWgnT1LhLFzOqBmHq4dM8xjIsuFvG6d2Ntuy1ZTIUzFmnn/m2Un/fqgsNnUdM4YzN43SSXFtUD
	s=
X-Gm-Gg: AZFdTZeDGs22aBjc2oQnJGdOmN0xvHIkyNvZyZ+a4nfKMfDGIBug6qDyP7+bcZyiflE
	BPMTOaRzfa2H5QkErKkFIls2FkF3Cae8IlX2a2JaQH1rOQ3TbqoKQRItEU9dB7TSkLUBl9eq8K9
	1NH6Z+J2JGWo/ntlJyvCy5RS8sGj36V0H+wV3B0vdzQq88vhEqAC232bRGo3iSVga44GFURzmf1
	HdsIdH87R2tZsPyBVHotuAe3S1+klX9whl2YTj4H2ip5jEsozGGdKJUrH6qWzcYhiJwh8Wd75qf
	QAjilmYtcUbb3LP6iZXLB/8f1G5uLl0iZSkTl8EEnZqdnaVW9Px5KDe9Rwh1kmPOgKr4V86Sa73
	Odzc7hTXvWl8tI4ftr9D2iWwcNLTKkfW3JHkjaGJ42TtQBUBuXxknG7W+XKP2VB48wQf6DF+mk9
	XCz+Pbu17ITjd9zqY4EVlKj6Y=
X-Received: by 2002:a05:7301:c016:b0:386:5adb:ac01 with SMTP id 5a478bee46e88-3865adbb1aemr11664038eec.24.1795451511099;
        Mon, 23 Nov 2026 08:31:51 -0800 (PST)
X-Received: by 2002:a05:7301:c016:b0:386:5adb:ac01 with SMTP id 5a478bee46e88-3865adbb1aemr11664011eec.24.1795451510520;
        Mon, 23 Nov 2026 08:31:50 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm36944061eec.23.2026.11.23.08.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:31:50 -0800 (PST)
Message-ID: <e3e03774-f066-4cfa-88dc-183fb06d80e5@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 09:31:49 -0700
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
Subject: Re: [PATCH] MAINTAINERS: Add Dawid Osuchowski as Intel VPU maintainer
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
        Dawid Osuchowski <dawid.osuchowski@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
        andrzej.kacprowski@linux.intel.com, linux-kernel@vger.kernel.org
References: <20261123122007.2580451-1-dawid.osuchowski@linux.intel.com>
 <d9b91e95-243d-4e3c-92b0-0355dca59a63@linux.intel.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d9b91e95-243d-4e3c-92b0-0355dca59a63@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0qa3H0eSTEF18Q46H-fCQf8MUkwhvrJ4
X-Proofpoint-ORIG-GUID: 0qa3H0eSTEF18Q46H-fCQf8MUkwhvrJ4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX3c0Gd4AaILfY
 DSmxg7MEiNBFEv9IFnGX+9zk8AUKtjM5sGjboPX7OgZ0tdJnDDkRr3rzcD5bcOpMpGtAFsP/om0
 Y/jQC0Io3qR4DpvVUNmJrgjeW2QKAbg=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b046a78 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=_GM5mSVEX-FjDFjjp_cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NSBTYWx0ZWRfX2pm+Cz4UhHGZ
 21y1jVmwVgT5lv7sf8gTiYTrRKEZ88jN+o/rpnmm6/5Hpv4q26K31BYOxxyBjPC+b95SL/okGyt
 LFRZJwm7nCOmS4hMfFNZnynFVxFROLDkqnlWdFryqu6iqeXZM451ZzEcoML1L523fR0efWpDZEo
 hcdDIKZMrQWFpWiQRm0Oj0Sybkj5Lfv9R2BspsoZstN9gXgq/0FugjzQfcUkCk8/f1tGcE9TT3g
 TOMLqY30zVfeOFv5gARMOP0T1cYlyK9WUEoUmFJhvoxOLvP1vr8u1cneB3k64zS6gvphRtIoYiS
 TSdYttOCTJXuUmhMcFbG7zxgoo407vCZYLYqANtn95C5Lp3fPEFEhi9QCNsqCiE72EFUakj3m30
 6QCC5qSBFvY/oSXQ2XWIogsEsyfQ7T5VPxMUuMXsGiPpvVUpCRQGsm0WGzyK8lWjdLVNNjc8H5a
 5QpE9ujwOHgB9Bz4cXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230065

On 11/23/2026 5:38 AM, Karol Wachowski wrote:
> On 23-Nov-26 13:20, Dawid Osuchowski wrote:
>> Add myself as a new accel/ivpu driver maintainer.
>>
>> Signed-off-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bcade5bfbafe..0afa391498d0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8198,6 +8198,7 @@ F:    include/linux/power/smartreflex.h
>>   DRM ACCEL DRIVERS FOR INTEL VPU
>>   M:    Karol Wachowski <karol.wachowski@linux.intel.com>
>>   M:    Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
>> +M:    Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Supported
>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
