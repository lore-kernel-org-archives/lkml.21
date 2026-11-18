Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001327;
	b=TZbhFps5MnpqsEPiHL6qBPc0zpagHC091NfEk3ComwmIzqfJotrCHsG91gKQIFfsA72+
	 +CBFXyHK93Km6sFVqjVooD/H6dk0CcJLxTGdLfRuAqzSXa7W02PxasKu4TirrBcjXE1qp
	 f2KWdZ1Vf5juuXHwxcyKOeSvsSVIcpLnntoyWGpb9L030RTv7MsLJ996Ucqd04dFlEvJZ
	 hOAkYS2nN2zkyLU38UIkShUAbjsqiw5qUk2sSDaJtvaJueGC3eQzohb/03qJxJLQ0JX9j
	 5fjO1XVx3HrLzr7N9Z0Th7Qinqw8fbAX/nDmSkj/cDPV4SJoQxb3NRqLVZHWDOhaHow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001327;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
	b=DChMDzKUaI7LTTOBWy6ciHrNwsD8iFJKdYk7r/Yv0Furc6B85RfHdsRurWMFuaZfDBIZ
	 5CNctst88Yh5ssIPceOpZu3eWDEzU46/HVW0yIASvIDe5GweYCZlDQR/rMbwk8jTjy9v4
	 0in9LdXsuFpIC6XQ1zcbXG1oaKqYAUpqsSVEmHOgGWPVuR8lkIpzNb8p1/N0V1PpSfECf
	 uAkY7ipHkLMs28i0Ueqs5Ap1sn/W9r1MXeUziFvrsBpj2ppUvhW1Ucyl8XP7jdFHC0GV8
	 ruLKTFPPKBRZyjFtLIhQWYkayE0nL1drIsQi/za4Gs3T7VhTxoJ/6uJSg3tCv/GSEyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ntylGciU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HekuE5EB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8A060A2602
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8A060A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ntylGciU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HekuE5EB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBKp2t3141599
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=; b=ntylGciUuJZfpWf0
	c9UM6MyqepvVZTCUP0ikndK0p570RLatJXjQ8tNCA42mvik8m09Q7kgxjCpYLS5w
	3be24pUUqP+OfFXhNIl/dv7A8fLLeH6RfrBGHOO/30xV0aBqh2ZfzKxI677TTEDd
	KcbZ5VbENV+w640ft3HbjuEvm/246WpbBNMsmpm1min/ZK1eV/GhMmmg5YZH3KU0
	zAgVZSwH03j1TilDVNNqaeyEAJ8AqtYa9gTsWf9+netIh/R8bQgtN/NKSM5Ri6RX
	MunrHSIsDg22tgIDcwR6X4XJZb2Z0OVbk665hfMAIpeETNnFmWOLuL8vK6pqqlau
	GQpvbQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jrr7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:28:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1091607eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795001326; x=1795606126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
        b=HekuE5EBj+Qy0wM5jzFMAY5F+E/QUtRvVsaCNnQnC/B+DRMSHdRFj98Sqe+4CHpKpN
         +DXNZ5nOhFqflt4+g8phxRj72FwLtUJ962jsyof006RpvnDs5CkRUSx9FIflgBkAGpfh
         INwGnZgbpPyatsRPVHKx0SWzEZBIDkYtGCWwkvSPzF50ZOzMx1/7qxubllIuN/zJ7Iwc
         tqAFaTgHO7hQBlfKBKaS70CsC3oUTyno+52Bo75zCiMSzmCiJcGE1EnjXn35jpkQsa9i
         NLZVKRCrdCnqKx8CNktzFLJamWirpM74/tIdZH+tG55G8BQcubm7PYvRO6wxVVVBCs8j
         QKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001326; x=1795606126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG1apVdiiVH5xMYZQ+1A0shEqwCnl5EZjE+Zf2il+6o=;
        b=tWfymMVMrxbOzKHsgDalzw6VfJmHyWJm2/jPCCf7s05Q1aJaBuemplG6sMqGe9bsBW
         icjqwD2E2vcVYt15lJTCFGuSPrMrrrBswS515SOh0scDBpHJcDJaeMdtXAGGLFV5Qeja
         w2uiVnp5LI81jtpJ7pCBO8NiZbIOPklzEGs58p2SGNVuq0F1XPCzLGkXI3jr1aiwAfmZ
         0JShi2rk+rFcoVUqdNvuM2NVeI8vKje9gZQqgsg3ReWkr6+eH2fuFpP3ssBSuO6V72cB
         A3zhkLf+uDJnW90ktYBgwshazv2JnHRkxR2MNr2dlE32OQpKcnl0zNKWXkFC3Z5Yb3zG
         tDdQ==
X-Forwarded-Encrypted: i=1; AL+hErEVF0CZncXIflLxQ7c/3ljOXblNXn1rQ71grJQ4t6C/mtv6eMoNMhaLzoQyhPuVKfTdhqwjG7U71eCbfWo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/06ctADed273VYQpWCOzx0x/1qP+THNznMb8gOX8yISNYzWFxz
	k58dhPyYPzu66Lh7LE1WVwk8Owxc9rwXitBJ0LmAhkkIdJUnClv4VFxmWCZyZAAeGgksJ2jSnfX
	UisIZ0EDKwgCCgypLBBMHVwPcF6PT5eMjHTB0LJefvSM0hieWlqSHHi+lUWnzR+aWK3Q=
X-Gm-Gg: AZFdTZerLYSgbR8rBDMnyTXJdexOwjWbImWRc8XoblZJiuFCdnYHJDef/JEeP39gU9A
	2LNsxETUbTInfxmgvlvHRPGM7y41EfcF3Wr5VWQt9tKBcY6oaYbeENjXOM+hiz1Iv9gHK4fwQnv
	yd9nJ//GbSrgIkdEa8RHV7QlrF+15fh3FXrstHhVADYjbpphcL1Q+Z+AYEfO/gTz5A5ZPNrmcwX
	6wrqiJ71UUtha5eB0gux5Loo4BtdDTAG3/ELl5Zse8bP18ujfTiqgwqCQPAxN/g9uZvkdstoltx
	8Kq3+htaatg138G4DpOE/PEf4AJ94fTvUywB+fXcI79kARHOFELnrEZpFOutCYAUyOEDR7X2K1F
	+DeUmAY/0kf1sEbqCumEaKB3BQD1hJbSFcO/KU32t0hDcR7ec5m7AcAgtxlGZIm/Zi//ceLjFfW
	i/SLohcA==
X-Received: by 2002:a05:7301:18aa:b0:381:e45d:be08 with SMTP id 5a478bee46e88-38280a3c1e2mr2400866eec.21.1795001323976;
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:381:e45d:be08 with SMTP id 5a478bee46e88-38280a3c1e2mr2400813eec.21.1795001323169;
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
Received: from [10.204.100.88] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm8539071eec.18.2026.11.18.03.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:28:42 -0800 (PST)
Message-ID: <1fcd89e4-feaa-4072-a5c4-56318b1d8475@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:58:32 +0530
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
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
 <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
 <dd62aee3-4f23-4904-827c-7f776c4be60a@oss.qualcomm.com>
 <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <vwg74npvbwdhepp4uownnzlj2ybpiknfktfvrpy6462rdw7snd@tj4vgnn3dtml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd8bee cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HfRq2NBFtK1Lh0_1ebIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: eQwCBq9suXwgWI4s9lMPGr47KXvqa5os
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX97nBjbx9ukNf
 1uAFHjV9KaRzCdTc1WAlQD0Hcweg1jFktiKUMq4axQz2UT6XNyAV61prUV0BCOBoWbZNQv1rpcp
 cmyKqRqiW41P0ddZN850KAIywaYTKFZFVFHuf8/WcUteIE5szMGjwnFJgsixRUVMGDL7d0vcfKT
 QoYlOADMEz6kgr8oi+EHky+ZU+QSTJLOlztLtLJ6sqI9fqbBCUmrXhjXDBoMZ1lfTFAdK64WWEQ
 93zAP3ACVMHUJr2vdU35agbYwrrNUoS3eEU/Scook3YN0sBzAvGkJUkErDXtOhAkA+Gru5fd6W0
 8o8qW1lAFd9Hexl1fPziqKrjQeHx8e8ViQVqqnu6big2hvsaC+L4q/UcwKHdiOqR3sSKJmY0vjM
 5exGX8LgzU7JD7g6o/f0og6G1kIy8S5hdkqA74LvkoWM49mEDDBzSbF2qHtf++BJ2W1bQqAkrUV
 UnYY3rfoeWEtmVIZFFA==
X-Proofpoint-GUID: eQwCBq9suXwgWI4s9lMPGr47KXvqa5os
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX8fG8uqAr+Bpg
 nzxUWuprjidhH45Stf5T3hJ+f4xvGUWZhvln96cITQ2XVwFjYYfLh8mNDD7t7fPTNIk2vM29hgp
 XhUHSPv20djfLzmts9ISctoBhkBUEq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180045



On 11/18/2026 2:32 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 12, 2026 at 07:10:38PM +0530, Vikash Garodia wrote:
>>
>> On 11/11/2026 6:33 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
>>>> The OF_IOMMU code relies on OF address parsing helpers, but the
>>>> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
>>>> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
>>>> annotation to handle configurations where OF_ADDRESS is disabled.
>>>>
>>>> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
>>>> preprocessor guards and __maybe_unused annotation.
>>>
>>> Why? What's the problem that you are solving? Why is the current code
>>> bad?
>>>
>>
>> The commit describes the problem as "The OF_IOMMU code relies on OF address
>> parsing helpers, but the dependency on OF_ADDRESS is not expressed in
>> Kconfig"...and instead the code had checks for config or __maybe_unused for
>> cases like sparc.
> 
> What is wrong with this approach? What is the problem? There is one, but
> please state it in the commit message. Something is wrong, otherwise you
> wouldn't be fixing it.
> 
>>
>> It was discussed in prior rev
>> https://lore.kernel.org/all/20261104160346.GD3951195-robh@kernel.org/
> 
> That's fine, but the reason must be capturedd
> 

Ack.

>>
>> Regards,
>> Vikash
>>>>
>>>> The only architecture supporting OF without OF_ADDRESS is SPARC, which
>>>> does not use OF_IOMMU, so no functional change is intended.
>>>>
>>>> Suggested-by: Rob Herring <robh@kernel.org>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> ---
>>>>    drivers/iommu/Kconfig    | 2 +-
>>>>    drivers/iommu/of_iommu.c | 4 +---
>>>>    2 files changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>
>>
> 

