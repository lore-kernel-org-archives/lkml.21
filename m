Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540639;
	b=IePs4RMIXbUfWi8WGXTbBmnOp2ezX44RyrrL3vr3AxpMjYcztGzc3zd6HW+DCW14+4hQ
	 Z5f/aqnbcBDPEOI7IDzY4K1UNPnoEFExe+D99J7OhnqYUTWQUb7cIuFtr9UrbaDJTuvwJ
	 z7kOUPERYEoOw8FGHVmUIkobu8DAJilYYSjoGrusjXXuoHVKEqBagFO9UtLJbkFac38O8
	 H7XpxXPwAJkgGsZMJOCoU0O0Faj/L/oYdnzxnKZqub6yOW/Li6xvMiSpHdinhybzyC7Wd
	 PkBNSKZRIHk9JaC4Mx6tx00Bc0BFfqdkLFInOAVkqc+37Xh0xCVrlVrYWmXn/1PjJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34muq4qlDs=;
	b=Q4cbugFK2V42vg6zzREnsMuX1f9PVJKMmUXtGCDzQNOjSyl+l/W4+cfcEGqnt2+uLPIU
	 3p2nTwNaQNYUnCHshlZ1icL5za5ZdiQeQQe+49DGvgypLGPt9ihfHDjq3vAS3GpuH73lM
	 g0ELacfeNk9Py6bfVlPgsv6UG4RKraCq/J3WOdKN+RPPtAbte4Ihqo7+t1FoC3L0zgxiN
	 mO9DTRuYEwhPa/83fmdjGCNqO7r88MXFzaSNM95+7Efoa8D7fgrgo1esVRJVMXmclwqUh
	 PA6MlKlCdj17kEgrpq9/CGYywdjVIL5PS6ZjA0WQ6ZM4wn6z/iurFT88SHa/J0n/YQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB38B606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB38B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=cfV0JxHv
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFKbWf080473
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:17:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=2kbZ1daghVq/jTpQQaRq8WPTs1DM1ouWO34mu
	q4qlDs=; b=cfV0JxHvo82k46xLI8NSqwXbKTnafYvccvob42Rrp5sjIEXdNM79h
	KZnuagIldyQrUun6AfcCKANqmmmRGZOh5dhPvaDBUQMvoaqjVX94SitGlSo1683v
	4KThYEGP7BrkPsXKCFh+BDkAlGolvP27bKv0lJ0MPC0Iz69tD3AXbQ/sli7KiH6o
	0ngGp9anR1fX+J+AB2WyNyzOaHkRGiPbpcxc65jAPaNYEWlc74OGk5rHOmH9Rdl1
	z6zBDxpvwO6th4xoSGKdRxdWT6hSh6Q3KFWfxdPyDxZ4H0JFoG/iAjzK9QvR/soy
	/UwWulrVPf94So43broU5PXtT+N7Mx6/g==
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j40sppvw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:17:17 -0800 (PST)
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4bb93bf724eso4612505e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:17:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540636; x=1796145436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sLybSdI5qjTND8zPaR4Rg194Q2UholF5MWi+zjXHA68=;
        b=ZsE2XdRSqK0Qq6+MFbPWtSu77QdQM6nsjXb8aTDC7yojSWDW2cd5XgN8vgBhHbUycw
         oe0Z2/ZRf7Tef1qjDjJBppbrnstUwGQNa6FpL3/U9b2l8FHO9hJ4/Ja5q+bRecy5d9r0
         4ScJmEOzaD2htNYHGyi9a1NdC4hc9pfWaE6wUa1EIGHJhxwJ6JXDqorYlA97sEsMydqU
         nlp7qPOrMqHFbRzuvAqh1XJpShGZIsBdS5viGhDDr4Y9z4eGwzhaeBqnAUcYSKF9OBI0
         gDSokhhh52RHkSx1rhhFzFxw7bJSZC4D7k5RsWhkcdj8cHVDCG8+pis36DTNd902UmfS
         wztA==
X-Forwarded-Encrypted: i=1; AL+hErHHtf3m/jHzfUZNBShrNjD7BAzHIlP8ew2LCb+CXma1440Vgycy0jNkga9Ef6wWva2wxKQVpnC4HyxfXTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cTbxV5jEm41v2f0fdn569L/VGg65O1mPzJ/K998e6teDB8uXQ
	Z5zVOPMIgHzc7ikvAXVfXq21WMS0t6cQ4Qp65LiDE+ef2TW9wekQzgtgrl3ivd0M+igHQkJc2/8
	UlHmcg85g68047SlloJ7gTgBYnH32Azrw0xRHGH6l8q5RyFGd6gkM5mHcSothb6k3
X-Gm-Gg: AZFdTZepqnfUdW67C12Zh1XeQHeUTheHS7hAfRae08uVLO2Izxb+zj4rfkr8GAAmijW
	J+x99hEJTKFdWUf/m/yCjU/mRzZGC95jK6hlOB+JjH9WzM82Wb8pKqlLqm/StyBsD9UaNKKVbxR
	QqTHvVlDaWhHGrOv9oDqpmIaIcn8+iiVjF6XIOwXCl68T2FWsNJgIp47ehXGuFDF+1oz8/KfVcx
	9bMVsl9H6Jwjb5/r3sjSeS2hxeiqyxnHbYJVqiuEzWqNvk+BxH4xAD0Q9jPqlyZyfNg+QuhMWyE
	TODKxmRQFWch/I2Geg2qKjBzNG7hCWFNFycsjC9QSn/f6dBsypTUPL4jZ5gp6PHVItwK+hg9/Bb
	1p6Y+DQf7l/8OPN02A432BDnzkDCEjwVE+wiNPYxTEJPL2JGw17dn27PErl3+GnsAjZqtpeMpEA
	/depYxiRQA4W1G
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590535e9.1.1795540636388;
        Tue, 24 Nov 2026 09:17:16 -0800 (PST)
X-Received: by 2002:a7b:c84a:0:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb887ec609mr231590225e9.1.1795540635965;
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:3f7b:7276:a343:d339? ([2a01:e0a:e17:9700:3f7b:7276:a343:d339])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm449546995e9.5.2026.11.24.09.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 09:17:15 -0800 (PST)
Message-ID: <7d6fec4b-e9d7-4d95-91b7-0319d44b25ad@meta.com>
Date: Tue, 24 Nov 2026 18:17:12 +0100
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
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: Pavel Begunkov <asml.silence@gmail.com>,
        =?UTF-8?B?5b6Q5pmX57+U?=
 <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
 <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@meta.com>
In-Reply-To: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: o6Tg2aTk1hVoljj2qKz3JntZxI0nE69k
X-Proofpoint-ORIG-GUID: o6Tg2aTk1hVoljj2qKz3JntZxI0nE69k
X-Authority-Analysis: v=2.4 cv=UbrE26SN c=1 sm=1 tr=0 ts=6b05c69d cx=c_pps
 a=IwH782EDBk/vqbJ9rM8UFw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=_1IyUuN4QrATX339ibzo:22 a=0yPqhiTJd68MZZuF_Q8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Ng9YvVcppn9CIdWre3nD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX2UyN1EZH1YiP
 ueAGv/n6ZBpomxWulrv7UmrBN/les86MVRHCm4CahGBgMb6LGN/JEaFz1QGZooN2j1QKXbkZ67Q
 15JB5gcmJ+uqFaTsJClrLlYob8S2v2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX3qwRa4eiE6+b
 v2/WGI3RGvKGZlGdrFBgVMZnXZWmmHTn0wUEkIC7loxy1/UHhEP7G1GxDbyjZUQFgxdJ3HU4eOG
 vtONZvpoiS1qN5iBGgQbwGh78HWxY/vCVb32dqbuzksbWgrAvm5+YXblTKn/LSYKxPT9Cac0Mti
 3f82zTgAtatjlS7ibP3D4tXIVKRiBUbtsTQB6QZDTwY7X3FDuaBuu6FAjK5KQYqqSWCgqBe6+Qm
 swk6rwLpwLHBgffqc1GpY+a84IhdLSryEdo19vVS36Tned4pVisy6spFBRXZyj1wUBoNkVuoZKW
 x3cAdyY1E3tHoBL62NW6IXdOE0m+b5ytJtDBrKsv5QmA7gM8h8CJtM7oiVDD7aF1QtLUTyfZLXG
 Z37oug1miWdsoA/2brF8g50eN0+YAMB+8ywKrbkQgx0zX8BtQKuj+662QCBs/pH5AnMQxg1Hwc0
 DsWl9z2wyUiuXz3ObxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01

On 11/23/26 14:50, Pavel Begunkov wrote:
> >=20
> On 11/22/26 07:39, =E5=BE=90=E6=99=97=E7=BF=94 wrote:
>> An io_uring zero-copy RX ifq can be exported by one ring and imported by
>> another.=C2=A0 Both rings then perform receive-zc on their own TCP socke=
ts,
>> but they share the same struct io_zcrx_ifq and therefore the same
>> ifq->notif_stats.=C2=A0 The statistics update is not atomic:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 static void zcrx_stat_add(__u64 *p, s64 v)
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRITE_ONCE(*p, READ_ONC=
E(*p) + v);
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> io_uring/zcrx.c:1337-1340.=C2=A0 It is called for copy_count and copy_by=
tes
>> from io_zcrx_copy_frag() at zcrx.c:1770-1771.=C2=A0 There is no ifq-level
>> lock in this path.=C2=A0 lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
>> socket, the ring's uring_lock is per ring, alloc_lock only protects
>> fallback niov allocation and is released before the copy, and
>> ctx_lock/notification is taken after the statistics update and is not
>> involved when event_desc.type_mask =3D=3D 0.=C2=A0 Two CPUs can therefor=
e read
>> the same old value, add their own increments, and write back the same
>> new value: one update is lost.
>>
>> The effect is limited to the UAPI cumulative copy statistics
>> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).=C2=A0 T=
he
>> values are user-mappable diagnostic data; the race does not control
>> buffer lifetime, DMA, reference counts, or packet contents.
> It is racy, and IIRC Clement dropped atomicity at some point, perhaps
> for performance reasons. I don't think it really matters though, the
> main purposes of the stat is to be a flag saying "something is wrong,
> setup steering rules". What's your use case? For precise statistics
> I'd rather prefer to add a trace point, which would be able to do it
> the right way (e.g. per-cpu counters).

Indeed, I used atomic first but then we dropped it. I don't remember=20
exactly but we didn't consider export/import at that time. It make sense=20
though so atomic would be fine as well although with an additional cost.=20
I'll let Pavel be the judge but agreed that we do not really care about=20
the value itself (there is nothing the userspace can really do about it
except check that "it's a lot").

Cl=C3=A9ment

