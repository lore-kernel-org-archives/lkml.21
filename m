Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424525;
	b=HSMgATrcTcckX/8ZsPw6rMg7ow3T67Qzq/WYvQ7K1Or6I7T3Do3X681kWlkgwuvtPvEZ
	 MJBqRBqVVqbeORHwVIyHuyMegqNtmg4VDwVLVxAkHW9a3KiFepyHN29UtZOLl+5HRZM4x
	 BOs4IxA5+SRbpncllF4fZ+dOuMX14qfj/dDKa7OB+cEIij1wnC1jNC7MZ/1vqsJB549DZ
	 4NCrg1xIIxVMuIM0EP7nQ/UDOzKWisBGVyPaPluc7znlFgxONajbb7Qn/+1Grh+xIN94W
	 7O1gO7RVJNYMAzD0BqMAj5kDM/pEuFy6a6pOTZ4SPJWSDO56jHueAxDUYUcMeUVDijg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
	b=3C0vLYI0r/c6MJF/RU4MQlEj7tCP2xuUFjMlk5fk8A7YOdKXCkShVf1mnQcJmhsi2SD6
	 ja2mCACoHxBWO4Gmjp9MyrxNrpFznvaliCmt7XdCVkYcnqr1F9kEqHSllM8a7swqSDmJ4
	 Jg/YdB3wn2cKOSUmujnoQmUxTCztDml04ZY05hj+ogrsSky9InEMJKMBKONIUmTSU0jN+
	 b+e6Z4HBRex8ad2VJiZfSo4t8bjXvpk2IhzgRpGzrQdWQpbIuDpVWCtNi2OQ9hw1eD11v
	 zkbM+OyCnMUmEdFWDm2dQjIgqdsB5NMPMIEs0EK1Q/QkoHZjsZYcQm14lPMF7kDo75Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F07606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6F07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MWgfoC5l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FyK316T8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50sfr831184
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=; b=MWgfoC5lSh/4ndNX
	TV4zc27Ncqju6gqjCxzGB+eObjVZar16/cqqP5u4PeErJ8dvVK1ZHX8RY+IS1Jzu
	InN+7M1y/f/xG05MbpuknMbok8YjAgBfa52sGJIdysRsOKlfG7bB5ItSmbGAwKX7
	6gG/fZabpKwZeTwQsEyMpxI744QUiXK/zCW26KcVx6h3mVNprCQ+SVBudmUBoFAV
	cr+PcCETXXPKKkp/rXf6tDpx+WMlWjRr0AGLy5PH9aWzm5icdQfRXd1Y4N8jtJtD
	OGjNNRUNdXHFYspXlsMj4N+nA7Um12b/fggX3C3uwfWWh7sPS/fGf+AkTerGt5w3
	X4fSAQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx0tbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f04e19d945so20936425ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795424523; x=1796029323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=FyK316T8niyh6gOP4Dl9EnF4boMi6mUx9eSSoiwcTN2O771S4d8kgbUAj6lkKP9fMl
         ATRd/c81q9gm/0MFJQINgSKqWXTgp1aNJ7LZeDrjNwY6gPkfsvEe5b+tXE+iw8S4dRni
         7fEOFkCIPgSjmWf94KIq5HeV4qrNfnfyGqcUjDEv7B6w36zsK57pXyk7laHw7j4czX87
         DCcj+pPey/VbLJ4UN1DVcLsipEmncJDYKtm6D1OcyiAyeDFK/LB80Eu5mhryu/AgiIe+
         6L7ppSVZzrd1eHiIOWNs12g02begytDPu3Y2DkjtFTec30TpEXha89YmuD7LELfBVNwG
         1e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424523; x=1796029323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwYZ7zRNtm83qC/69uLzzi7Kh/KxYHy7yWJjXzboOaU=;
        b=V049vSptUenBYNjxgdadC3Vf56f0EUF8kfOn3pK6T6PoN6LRXG6r4fMeVWL6QOGoci
         QeXgu/k/2q+PULPIuzetorSImQYRVR/rkYcrLhQhefxR3Od08770qD/BcEhx2PLqzzWZ
         pC5XCnDIhyHqzRn768FG17ftKe83WuJRlIAP92ZhhxGXLig7fOrY3adGygPGPYAUXuqs
         YFQlM3KXL4FrPwykOyOquKjVqJyGitWAttP2tcRTJgI5kogw2bGzC6WJvRf3yJpfmj05
         DX2roP6AFeDvtt8g7im/bN9p0opzlJLzi4MLxmaQSPjIrX0xPKpKFyivXOiii7bg17WW
         jxvw==
X-Forwarded-Encrypted: i=1; AL+hErGXz7wehx7kCqtATg/to0ulVHU1W0S7FBkGg1/WyFxuUD2MExqnvpqcoB4aOf9b0tyFeOxPsC+lwKPDwxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gWtNA6Kq7BPjniHE+W7FsOx7ckUpWUciermsE0KSTCKSHf+S+
	vpE/Fx7DX360zC42t0RIOh3EwpvaKd0M8u4sxtnhwCnQhDSOqqNgvEFpLysBWHeQB6cAaZs8XES
	wAL+gigMwA5HI8ektrSgfucWxKBhWv+nbWNM1DrLJo0VIr5gyUTUMHGR3OCFAJDhNKtk=
X-Gm-Gg: AZFdTZfat25QO98r3PI94uRn01S7fkYVKU8nSgN1u81YbO1yqdnziD5sInPPJsAILAN
	1KQD84dsH9bzEuafqmNK9zee/lLuL4Y/UttRuEncvxtVK3jMEgHKY36mF6YOxLZ+Vd5XFHI83T/
	9Pbx4Tsnurx6QybR+N/MN272AyueHo6N4zqEK/4D+ATCDNUrJ6Hl7WVEhrW82LgNlKZQ76F4lba
	9LwO/cge3ny17gaYN2nbEIja1FU1YWSH63cydWRkU3IC9vrzyM6H6ac9ChvYaoIH+W0fjvvFSl0
	6fg4ySpffHKIT4DotxIQYN3eWdkij+BSAKNVeH2wraIpYvM/CTwMnqYNAMVgWg/rmnIJ1vcZjcc
	AFDtWWcP82kE60AtXUKLJu6VeeFanTg9DnbkZVtlwKkTICnyCd7bTzO6mwsto51AiLJ8HpksitE
	Pwmg==
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386915ad.11.1795424523468;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
X-Received: by 2002:a17:903:b4f:b0:2ed:4b23:c417 with SMTP id d9443c01a7336-2f03f1d85a3mr95386675ad.11.1795424523035;
        Mon, 23 Nov 2026 01:02:03 -0800 (PST)
Received: from [10.217.219.74] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0667679d8sm30774935ad.48.2026.11.23.01.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:02:02 -0800 (PST)
Message-ID: <7830e840-d0c8-44b1-b3dc-185560fe9fba@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:31:58 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com>
 <20261117-ucsi-ccg-cc-orientation-v2-1-2e3576a11eb7@qti.qualcomm.com>
 <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Language: en-US
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <awBeRhkkKwWGYxm1@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04010c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NqQFgKtdHuj9WFOUiwsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: brifav6rQYTW58yAGXd4NJiRkGSFIGCL
X-Proofpoint-GUID: brifav6rQYTW58yAGXd4NJiRkGSFIGCL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfXyIJ3YDwmBQ1X
 NwrjOSPL17FDjZLyIOt5/Qii5NXSrfFXds4X3BHKPyfHKaMauPWtbcN0dwiUlqi3OsrREh496Di
 dZdIsSzULSB/ChQEEUdsVZJIKpoUhGw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNSBTYWx0ZWRfX74CLlC0Hc+h/
 mmWmwo118adpLXVQVeNN780Bc6jmpdLl0x5rlymMm1JqBVOqEmeoOgR6kmNe20Q8ICN4qTkoRGD
 ev9WFr3cxCxI3vEqn0O601ArM3eUlXP5EskQ7+U4bK97LqKAabxVEPQbXgL5SDKVEXigHaWIQjQ
 JVM10+szQMkDhgUkejGc51tmndGIhKw3tGYbsAP+C2dfRy4mrwx/x493wnPX7uTeml0d2QpN3nQ
 5wcgMUdfrQGhRiHmWjPUKnkYw3xvhiw4kUfwC4//BUC1LGYInUe+fytAFQTJ/LRMtr5/6I5FSvW
 GtybQwM+AI+eOTK8I6fkGOZApSTLMt4kS6qQ33rM8biBPMagPT3jxXqAWSocMVeMmJIRbCB9ywy
 nevhxQh1otPfddttnpcJRg0opG2FekJxfw464pbhZM4EPdgqS+Y6vE2YAhf1//Ccde9UFnOIgKX
 3hRW9z0SOA2s31agfBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230035


On 20-11-2026 20:20, Heikki Krogerus wrote:
> On Tue, Nov 17, 2026 at 07:39:47PM +0530, Akash Kumar wrote:
>> Add the optional orientation-gpios property, used to sense the CC
>> orientation of each Type-C connector on boards where the CCGx chip
>> has no HPI register exposing CC polarity. Entries are ordered by
>> connector number; an entry may be left as <0> for connectors with no
>> sense line.
>>
>> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> This one did not apply on top of Greg's latest usb-next. I tried also
> linux-next.
>
> Thanks,
>
> Hi Heikki,
>
> Sorry for the churn - this series isn't self-contained. It builds on
> top of an earlier series that adds cypd6129/cypd6229 support to the
> same binding and driver:
>
> https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
>
> That series hasn't landed in usb-next yet, which is why this one
> doesn't apply cleanly against Greg's tree or linux-next - the
> orientation-gpios patch edits the cypd6129 example block that series
> adds. For reference, the trailers are:
>
> base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
> prerequisite-patch-id: 0ffa67d7d9ce66074ffa2e070249ee5b0cbedb2e
> prerequisite-patch-id: 65ba14bc52b50cdf47ecdce1f4b3fe678704955e
>
> Could you apply that series first (`b4 am` on the lore link, or
> `git am` the raw mboxes) and then this one on top? I'll call out the
> dependency explicitly in the cover letter when I send v2.
>
> Thanks,
> Akash
