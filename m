Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364307;
	b=t210/YN0AuKIOUIEAbD5t+vwj+HZd5WwU03htq8XvVSwUcRVMeMD2c0JOzbwC646hg8d
	 HbFz6veVvh1gA2HQgD/GybeNO/T9+VUFMSrN/FBVfEySIJC8rJYXQ/ADnMO4pYdGl6Qg4
	 LdqlqHEV1U6Q/b7Lapa3XA/JyhpaO8VD7L58xeSk9QQeVf+VYgIoih2i72ikwJWfuc6wA
	 ahbW1sQFSV0V9NzndPEW8GPg6cfoVjL/1cHLTYiOGtH6O7x46GC0Fja+JgmV9qx5Pg2Ce
	 5hPFaF9qvbL3b4ucYCSK6RIP7FZFlpHtLlG/ug0lrnxuIxpM+OuLbQ86UtRI+pZPqbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Content-Type:Mime-Version:Subject:
	 From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C5recf4vUo/1oHk9RJx2VG4RciQ400WNrXI6B/zOGMA=;
	b=m8rSs6FlH6qikpORiEKs5aeAik5xfySGmef+2nkOdCrvP3R6TBm9XJG09C2x2Vmw62bL
	 902mvHHD2Q0lBxf6ej/UJulrPWCGTlMU/3UKWO38XUZ6vBNGNScBdsbEP3YDND8TTtb9T
	 EpyRXiN2Dn0PU/h7313sjTQoEcOYzlX3cuQdyC0cGpAgFmZ8Pg1itD0rxdNhi73aKDmGI
	 pD6TaCvdXsY+FyDsYlxOMHVBIcA5EICoRSba3pQCGM6I6lfqtrFLjdP5J/yS9ypsEWI6z
	 +98sl/Zaqt3U0cV46aUhhiX/X6pd16ELuDER1rs6sOP0kDzcHIEFuFcQTfCu6KPSWiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QdAgQy+x;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CCC606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68CCC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QdAgQy+x
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFYgab3877856;
	Sun, 22 Nov 2026 16:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=C5recf
	4vUo/1oHk9RJx2VG4RciQ400WNrXI6B/zOGMA=; b=QdAgQy+xiDDpiwKJGws/pj
	OSxAfYjWq7fyF5matrlO0xUhz4wMElZv9vRxqSySeOG2m+UGWDUfs331mUJGbaeB
	2ti0Ie/q8RbvtZFU0I3S9Lmda7QPtAwn+oRwrubfsFjRE7Hh5aSre50Z54tB9DzB
	IUY6xEvpkDGmFtYIP+UisTvmrICTCHZbo2kjcz1s5R+MfvNoyILISloR1aaTh6xN
	IWiAeNoSHGvmYck4MEK4kfI5KX9tp8rAHOsYHSlV5NvnZ5HvIenNsEPym4Sziwwa
	2tlw8t3e+ehl+u4xCIdXDepZJTiclPdgm5GI74AIkS4i4EKaDIBequZj8ZehGYpQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p471jd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 16:18:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFYOYb457508;
	Sun, 22 Nov 2026 16:18:02 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3nmqb7xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Nov 2026 16:18:02 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AMGHwA950397482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Nov 2026 16:17:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 972B720043;
	Sun, 22 Nov 2026 16:17:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 219C420040;
	Sun, 22 Nov 2026 16:17:56 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.124.222.247])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sun, 22 Nov 2026 16:17:55 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] powerpc/perf: vpa-dtl: fix resource leak on allocation
 failure
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <ld6q74um.ritesh.list@gmail.com>
Date: Sun, 22 Nov 2026 21:47:43 +0530
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, sshegde@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Tanushree Shah <tshah@linux.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <60D6C3C4-BEC7-47CD-BD12-A3C3A426CDA3@linux.ibm.com>
References: <20261112134455.6880-1-mdshahid03@gmail.com>
 <ld6q74um.ritesh.list@gmail.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, mdshahid03@gmail.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXxWzeTLMOD2fp
 MvC4MnhZUR/UtG3ce4BccxSE1qTIvOt2Y5irph+vDytCPOCMmiRTSPFJjiVWYgE+9ay7WEuVlDU
 kqpVEIMC29iCZN62f0er8kJQkviMAuk=
X-Proofpoint-GUID: pQFAk-A-y6jqJJguBkQDQFciLC8YDgTz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX1MT5BLrKe4TX
 ch7ZRCiH9FDfiNCsvyWglW3zDhjBIqXquDwlLC92GUVVeyJx9QZ3Cz+FCbWmewaWiITICWdTFZv
 L9vnpFL34vpGRtA4lh/ZT+lmEmtxsXpp1PBlIRlXU2uSDht5150ITvAG8ZOVlwdXCgmjRVlMzXk
 Fq0rHRz+od3DAkp7BtaIs5tW6Nbm4N3VH/YfJV+L1sh9nJm0i26XxCebhN2ze1jh+ZUreQfNg7u
 0QGOQjVGccZAqUGA2kt4xS24+I2OH5OxlSpdled8LYqLER+yeGPc7QuCU52IKvEMupv0OgnTL3K
 F4uaA7jkjFQitw6yMKRG+HCCDHa2+JCqeZnAY++C8DewSx2k516qbY0vOL5TyQXoo0Vt9D2AMNh
 9BpBgoS++i/mtdzQvWYH1rxnbPEXGXWZMQDw47nbTX9H38r//ROgk7CJ29bao6wCoL+La26WjVs
 XK+iidvW4rMMi6Dnh/w==
X-Proofpoint-ORIG-GUID: D7VHvyVP49gIcmjljdBhTK369MM9n1Ky
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b0315bb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=pGLkceISAAAA:8
 a=ppPZUPuCrH4tdB-qaO4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064



> On 18 Nov 2026, at 5:02=E2=80=AFPM, Ritesh Harjani (IBM) =
<ritesh.list@gmail.com> wrote:
>=20
>=20
> mdshahid03@gmail.com writes:
>=20
>> From: Mohammad Shahid <mdshahid03@gmail.com>
>>=20
>> vpa_dtl_event_init acquires dtl_access_lock when initializing the
>> first vpa_dtl PMU event.
>>=20
>> If vpa_dtl_mem_alloc() fails,the function returns -ENOMEM without
>> releasing the semaphore.
>>=20
>> Release the semaphore when buffer allocation fails and no other
>> PMU events are active.
>>=20
>> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
>> ---
>> arch/powerpc/perf/vpa-dtl.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/powerpc/perf/vpa-dtl.c =
b/arch/powerpc/perf/vpa-dtl.c
>> index 3e3d65b6c796..20eafeaffa6b 100644
>> --- a/arch/powerpc/perf/vpa-dtl.c
>> +++ b/arch/powerpc/perf/vpa-dtl.c
>> @@ -396,6 +396,8 @@ static int vpa_dtl_event_init(struct perf_event =
*event)
>>=20
>> /* Allocate dtl buffer memory */
>> if (vpa_dtl_mem_alloc(event->cpu)) {
>> + if (dtl_global_refc =3D=3D 0)
>> + up_write(&dtl_access_lock);
>> spin_unlock(&dtl_global_lock);
>> return -ENOMEM;
>> }
>=20
>=20
> I looked at this code and I am unable to wrap my head around it. We =
have
> dtl_access_lock and dtl_global_lock. Then we have vpa_dtl, which is a
> per-cpu variable anyway.
>=20
> So I am not sure why we need both locks held while doing
> vpa_dtl_mem_alloc(). What exactly are they protecting?  Can we move =
the
> allocation out of the lock and just assign dtl->buf later within the
> lock?  In one other place I see dtl->buf =3D NULL without any lock.  =
Also,
> do we need a spinlock to protect dtl_global_refc? Would an atomic
> variable not work here?
>=20
> The above fix is not wrong per se, based on today's code, but it would
> be better if someone who owns this code takes another look and fixes =
its
> design while we are at it.

Thanks Mohammad for the patch and Ritesh for sharing your comments.

Reasons for having the different locks:
dtl_access_lock with down_write_trylock : There are other dtl users, =
example: debugfs dtl=20
 or /proc/powerpc/vcpudispatch_stats. These locks are used to ensure at =
same time these
interfaces are not used, ie to exclude the debugfs dtl and =
vcpudispatch_stats users.

dtl_global_refc :  global reference count variable. One perf record =
opens one event per CPU,=20
and all of them share one acquisition of the lock. The count says when =
the last CPU event is gone=20
and the lock can be released. And dtl_global_lock is used to prevent =
race condition on this.=20

But the allocation observation which Ritesh pointed out seems valid to =
me.=20
It can be moved out of dtl_global_lock.

I am looking closer at the other points raised here, including the =
buffer
lifetime and whether the spinlock/refcount can be simplified, and will
respond back soon.

Thanks
Athira

>=20
> Another motivation for doing this work now is to bring in clang's
> context analysis for arch/powerpc/perf/, which can statically check
> that such locking rules are followed, provided there are proper
> annotations for every lock and the data it protects.
>=20
> -ritesh
>=20

