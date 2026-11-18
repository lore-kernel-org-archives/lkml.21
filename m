Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001297;
	b=4sG2jdNtrrqZi8mCB3ZdUnlHd90a8kBuwdYwpFHJ+5opkO+vijpqomzgPG2P631M7ED5
	 3LXYs5LJ7O+8n2EyQzbED1Q8nyF0e2SXhHX5NLJyBlbrjgojX/KUH5WH14tj5X6zyC4Tf
	 /JfP8x5GldAG7x0L53UgZmK8S+5z8f1fRKWQNTfvCeimq1wdZNy0LQ23GkRY1quFBoNEV
	 H1YO+1mDCdMMELafwYs3f9D14+ZdmdKJpPHiYfroXop5A/DYHhRMzcwsVrUrTzQ7AWM/s
	 fJRjPvQvSrghQx5Z++7Crk29zBS2BTJWevsb2j5sn/Ir0Ac3gM3GzCXlpSBRg0xJ7Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001297;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IJC9KJmTrnmm/LU0ScPd6lIZJgRVI3dJDnY3i1kWIT8=;
	b=eoJC5xekRGKL6rFRbbFgBiY26GgYq/ghZvgcOdUmGdzx+ZYGvC9WpPI2XQm0k/P2MB2c
	 SP3Ei5n874KOMULsFvXfKpC73nnUtcHZB/4OTC7Bmu1OQPmuw15c07aw8km4r3pof6MTe
	 WSRIiHEdAgzRFzXZJSc1oq0dBtgyoKYoFbVxio1t8cHDUv4wKvssKGl4em8TZgGLkRkSg
	 VH9D5Fc4FFPoS1q3o+59T1U/fHLh3JkDiX7vFOD/4/XZQYnECxg97PD6Suf41y7jaYWNV
	 itwRREDhyI0TWfQ6kMwlTP/E0wi2EzYo2XtQLDzZM9YG/hAaoqRGTBY6iypeyHVqvfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="MpN/ngx1";
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B94E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MpN/ngx1
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBQwmd3964612;
	Wed, 18 Nov 2026 11:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IJC9KJ
	mTrnmm/LU0ScPd6lIZJgRVI3dJDnY3i1kWIT8=; b=MpN/ngx100a1YoZ1TBmrDu
	xlZ6f7Fau81hNb5HUNS98DeChP7vzdp3K/9eU/f/rC13BRg8FpykIrJdzQfZF8ct
	/fIMsp94voegU2nH3U8M+0OsZOSt05IAVCi2lPkUdCGjxEGjD45kBA+ssBf/UPxg
	eF8H8Ch5piXt9hGwU2M0QgFhEa0DI+6wsJR6Jb4gVlU5remz91u8F2TFC+KfUOd6
	vyHHfNRAjLFpwNes2ynNrQmI8i50fcXDnBPI0SVMkqnbyyU13G0NBO8mIRUKjJu5
	geIwq3mcV+oapy1MUEdLBHJK56psqG8FRahoA1dqRms4Dmtv6b8ONV039MVmo8zg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105vt3a6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 11:28:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIBK5JX1928622;
	Wed, 18 Nov 2026 11:27:59 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j17c4rp1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 11:27:59 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AIBRvMi15991316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 11:27:58 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7FFA58064;
	Wed, 18 Nov 2026 11:27:57 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CAF958060;
	Wed, 18 Nov 2026 11:27:52 +0000 (GMT)
Received: from [9.43.57.33] (unknown [9.43.57.33])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 11:27:51 +0000 (GMT)
Message-ID: <11020f85-6e45-4a2f-bd72-b006e337623d@linux.ibm.com>
Date: Wed, 18 Nov 2026 16:57:45 +0530
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
Subject: Re: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release
 callback to secvar_ktype
To: Ian Rogers <irogers@google.com>, Nayna Jain <nayna@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar
 <zohar@linux.ibm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        driver-core@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20261108223913.3624571-1-irogers@google.com>
 <20261108223913.3624571-3-irogers@google.com>
 <CAP-5=fUQvqpny1CrYVUqg9SQo6VpOuUqfOK403BxK_vWCDU30w@mail.gmail.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <CAP-5=fUQvqpny1CrYVUqg9SQo6VpOuUqfOK403BxK_vWCDU30w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: vXKWCYIsO8QL_giJhdoQTN72NW1RHYq2
X-Authority-Analysis: v=2.4 cv=Z8x5j3RA c=1 sm=1 tr=0 ts=6afd8bc0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=1XWaLZrsAAAA:8
 a=VnNF1IyMAAAA:8 a=uPf0OYVXD692Dvb0MzEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: h-je1vqzPwGpa6iH9pk9RsytTjhUVezA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfXwTGx+Eq+qFXW
 oes0I2T049kquvdD1aytGbD+9kVmQaqjQXodSLRxTDs/5+jLgiDeQKhaWOPtQ1ei735Pc3f4ZYm
 nJ8heTk3fUENtZS74FS8VGJyVjA+bEw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0NSBTYWx0ZWRfX019265k+gXwI
 dmowQQGxK8g00xqzQJSVSiBKPXJ2DrO1kSEkITFPg3lKy67l12Gs/WL97ZOew48EaHDBvvtP8kJ
 nmhF2RXE0JTnNlQ0uJTVKTdndAAvyHJq1wKVuguvenc9GjlMDJ19QKSaJS/RP8CF11pXN0ZKjrb
 9mfgUaFvr9ZHGlmcRh4w85p8sgl6lvxwyikOeRBNipn470tyhLHCCVxa6BMvSsgaFyMpQmkL0Kp
 crNx4pIfbpwO4GzRNlHT0f2u52cDjlyJ8ytwvVI0U0DsQcdK0GXh1JZBcSOu9Fp+F6pEr+9Ij1/
 JSHqcChqck5xfbeeJdQqlvfWZXckM3EbLMkvaEltCsSxC/ql+TZ+KIdrEPoZ6URBOIkwsEkGlk3
 WxOPAptBzobfMEbJhLa0XA9mBw6AOO2+Dxb45sV42oX4Dki7S4CXajrwEW5fUXAoYSTGIrLWSAW
 IGp1pGjhM8eyEWi9mIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180045


On 11/18/26 1:55 AM, Ian Rogers wrote:
> On Sun, Nov 8, 2026 at 2:39 PM Ian Rogers <irogers@google.com> wrote:
>> In add_var(), a struct kobject is dynamically allocated with
>> kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
>> sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
>> However, secvar_ktype does not define a .release callback, which results
>> in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
>> when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).
>>
>> Provide a secvar_release() callback that calls kfree(kobj).
>>
>> Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via sysfs")
>> Signed-off-by: Ian Rogers <irogers@google.com>
> Gentle ping on this patch (moving PowerPC maintainers to To: in case
> this got buried in Cc:).
>
> Danilo offered to take the full 9-patch kobj_type::release __must_init
> series through the driver-core tree with subsystem ACKs, and this is
> one of the last two patches awaiting an Acked-by. Does this look okay
> to go via driver-core?
Sure Ian

Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com>

>
> Thanks,
> Ian
>
>> ---
>>   arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
>> index 395399bbab2c..f3f6ac25ea78 100644
>> --- a/arch/powerpc/kernel/secvar-sysfs.c
>> +++ b/arch/powerpc/kernel/secvar-sysfs.c
>> @@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_group = {
>>   };
>>   __ATTRIBUTE_GROUPS(secvar_attr);
>>
>> +static void secvar_release(struct kobject *kobj)
>> +{
>> +       kfree(kobj);
>> +}
>> +
>>   static const struct kobj_type secvar_ktype = {
>> +       .release        = secvar_release,
>>          .sysfs_ops      = &kobj_sysfs_ops,
>>          .default_groups = secvar_attr_groups,
>>   };
>> --
>> 2.56.0.455.g6c5a503b38-goog
>>
