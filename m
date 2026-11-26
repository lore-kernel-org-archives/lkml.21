Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669896;
	b=GtCkAfJ9xURhNHUBJ23IAEAg0Bt1xi/YkYeWSieJ4CBpcxlrSiJASn0I8pUOQMUQKt3k
	 fHVSBtZkeq8am+FY4sYtuxELLsqvi2Khe3tzresVwOp+bqTLdC8wiReHeyhP67hcw8jO4
	 zb+hLQRy/W5D+5vAYpYia2NTFEdPPnCdF4h5UBwPgM4IRCzUQr4bKlHeAbFTUgeIX8n/I
	 NRFvA0xSZ7KhX3eE658jeCmUrlADs0tEf5QaqD+LX6ex2Rafcb6Jd9Acs9Ok3u3Ulb1eg
	 rZuceX6FWGOUvTP7Ix+YLsJCaZz2sqMR4tjETIfZRKCrawCw7De62lVDfTlgLKi70sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669896;
	h=DMARC-Filter:DKIM-Signature:Message-Id:From:Subject:Date:To:
	 Mime-Version:In-Reply-To:X-Lms-Return-Path:Content-Transfer-Encoding:
	 Content-Type:References:Cc:X-Original-From:User-Agent;
	bh=7u8kt26tBIC+U3X2XBxGpGn8cd+TEyqhtjuFzhRX8CA=;
	b=PSSTydbtiwk+wEJ845e3Nhf+82Yl52jvchWZ4k8UIP4e7WeTfx3GuTkhjqMBhXzBo7xA
	 ZXCSJX365JKCSENK0Mb9RqIbn0LRhetwb3zvGquCaZnPxP09BqCdRyyh1UL+AvjGgPimD
	 /sOiK/Eag3QQMTMjFkU82JSbD1UcoLEtWiuLHphWYtRu34jLUJA+wfXt4Soc8p6lhQxwh
	 mWLfBub772PrUX3O3e1v4fiGzrYLIuPQ+eT+nJXHtdzFpwXG63oDSLsbagj8WEprLBXbf
	 P43d0/DkUws+7a1+8vb50QDI/FQPBNpsx3BJVYwbkv+d0MK3K1Eru3hrPvsZqNtJ8HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=cJPIy5hy;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B26B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=cJPIy5hy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795669889; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=7u8kt26tBIC+U3X2XBxGpGn8cd+TEyqhtjuFzhRX8CA=;
 b=cJPIy5hyuQs0KbjSGTE9CvxH/xNnRmmx/pO8RKgrXkQWNCkSOh4dOpxpsJibVunWDFAtX8
 ryy+Bcq1akXKGLdFwoK0tFbcbxBRIDIC82YV1uI2rFYFjrYFwVZYJFZwhCWhuenU4nHxSd
 vn8a8tIjcJ3hbXx+zFikYsFz6XPAqO2YKLp1/jiM0VWiauAtfPuddoLYTEyTGFgufhm22L
 DZ52yRLq+lXozgkcr4WV4Do+THfSN3A5wgVNfcTozHKdh9S2onsDP3bIAmfgqeV4pUbepJ
 mz3MpybzqtaNK5spZs5QO5+aiI7WcWBAnmIfolJwK5eRxhUEDq98IdB94pT0LA==
Message-Id: <662116f4-8359-49c9-a78d-5635c2458cab@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
Subject: Re: [PATCH 1/3] cgroup/cpuset: Skip the sched domain attribute allocation on v2
Date: Thu, 26 Nov 2026 13:11:12 +0800
To: "Ridong Chen" <ridong.chen@linux.dev>, <longman@redhat.com>, 
	<tj@kernel.org>, <hannes@cmpxchg.org>, <mkoutny@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <4d70562b-6604-456f-9175-5b6b17f46f26@linux.dev>
X-Lms-Return-Path: <lba+26b07bf7f+cef7e5+vger.kernel.org+zhouchuyi@bytedance.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
References: <cover.1795436486.git.zhouchuyi@bytedance.com> <b32bbb1feb9721cb58f756b43c7d53698b7fa03a.1795436486.git.zhouchuyi@bytedance.com> <4d70562b-6604-456f-9175-5b6b17f46f26@linux.dev>
Cc: <linux-kernel@vger.kernel.org>
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
User-Agent: Mozilla Thunderbird

On 2026-11-26 10:49 a.m., Ridong Chen wrote:
>=20
>=20
> On 11/23/2026 8:45 PM, Chuyi Zhou wrote:
>> Cgroup v2 cpusets use the default scheduling domain attributes for every
>> partition. The scheduler treats a NULL attribute pointer as the default
>> both when matching existing domains and when building new ones.
>>
>> generate_sched_domains() allocates an attribute array for v2 and fills
>> each entry with SD_ATTR_INIT, even in the single-partition case.
>>
>> Return NULL for the v2 attributes. For N > 0 partitions, this saves one
>> memory allocation and N attribute initializations per rebuild.
>>
>> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
>> ---
>> =C2=A0 kernel/cgroup/cpuset.c | 21 +++++++--------------
>> =C2=A0 1 file changed, 7 insertions(+), 14 deletions(-)
>>
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index c7b3a734cda8..633fd05f513e 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
>> @@ -867,7 +867,6 @@ static int generate_sched_domains(cpumask_var_t=20
>> **domains,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cpuset **csa;=C2=A0=C2=A0=C2=A0 /*=
 array of all cpuset ptrs */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i, j;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* indices for partition finding loops */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpumask_var_t *doms;=C2=A0=C2=A0=C2=A0 /*=
 resulting partition; i.e. sched=20
>> domains */
>> -=C2=A0=C2=A0=C2=A0 struct sched_domain_attr *dattr;=C2=A0 /* attributes=
 for custom=20
>> domains */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ndoms =3D 0;=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /* number of sched domains in result */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cgroup_subsys_state *pos_css;
>> @@ -875,7 +874,6 @@ static int generate_sched_domains(cpumask_var_t=20
>> **domains,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return cpuset1_ge=
nerate_sched_domains(domains, attributes);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 doms =3D NULL;
>> -=C2=A0=C2=A0=C2=A0 dattr =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 csa =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Special case for the 99% of systems wi=
th one, full, sched=20
>> domain */
>> @@ -926,15 +924,8 @@ generate_doms:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * The rest of the code, including the schedule=
r, can deal with
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * dattr=3D=3DNULL case. No need to abort if al=
loc fails.
>> -=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0 dattr =3D kmalloc_objs(struct sched_domain_attr, ndo=
ms);
>> -
>> -=C2=A0=C2=A0=C2=A0 /*
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * Cgroup v2 doesn't support domain attributes,=
 just set all of them
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * to SD_ATTR_INIT. Also non-isolating partitio=
n root CPUs are a
>> -=C2=A0=C2=A0=C2=A0=C2=A0 * subset of HK_TYPE_DOMAIN_BOOT housekeeping C=
PUs.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Non-isolating child partition root CPUs are =
a subset of
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * HK_TYPE_DOMAIN_BOOT housekeeping CPUs.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ndoms; i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> @@ -946,8 +937,6 @@ generate_doms:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 housekeeping_cpumask=
(HK_TYPE_DOMAIN_BOOT));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cpumask_copy(doms[i], csa[i]->effective_cpus);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dattr)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 datt=
r[i] =3D SD_ATTR_INIT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 done:
>> @@ -960,8 +949,12 @@ done:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (doms =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ndoms =3D 1;
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Cgroup v2 uses the default domain attributes=
. The scheduler=20
>> treats
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * a NULL attribute array as SD_ATTR_INIT for e=
very partition.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *domains=C2=A0=C2=A0=C2=A0 =3D doms;
>> -=C2=A0=C2=A0=C2=A0 *attributes =3D dattr;
>> +=C2=A0=C2=A0=C2=A0 *attributes =3D NULL;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ndoms;
>> =C2=A0 }
>=20
> LGTM.
>=20
> Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
> Thanks.
>=20

Thanks for the review!
I'll add Reviewed-by tag if I need to send v2.
