Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993412;
	b=eg1tQROIKpbtPA5q2tooJ1I5MJdAqRZKujXiLJtr7dizGAN65ConGRy8Vy4gF0pD/Ud1
	 hhqjNxZM7tFxCdl9DXhQ9DJPUDvteGq5d15cdithHL8NZp5qNvYCiavLRt5SDfTKYv8/i
	 1jRyHL2L3YHw/5BgrFj86CBbboEgvBPue8uDYOlGDOLPBXhdqtJtfK2hqykoPRGeRd3Zv
	 1gC+AwfRVTZsDVrI6+NNRrMO3tbUT4avNARZD0eZf7ar+iuk825rQYxozpuB6PHNDpsEh
	 AIOQZiPgsg4wHqmysVX5GQJPjtanx8UAD2l8fIYsFz6lC/ISjea8w6rWDr3+SJjEqVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993412;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=apR53IOQH60vn9qJWC1gXp3NUHxW1Uh264U+zqseRBI=;
	b=jOddm56mrB9RAiKMtJd/4UPeFI//UwP7ykHhM8WJBaDBj7rnUMT4ej3WEZn2PtQsM6UQ
	 Gdx+AOiFFFheldShwp071AusTJ34TuuWDLLac5vKVtAPvcEDKg2UTd2h8hCMFa7Eb+GeH
	 jWWuzNzu+yYnJP7Am5I6/OhZOWne00z6pk0gv1ArljxixrMeF0grP1/LrE4Nc4k4CSrNg
	 E9iIML5RXL9XT2OnlU2WuVkNV9eiwi2988FiUFdEofU8aLl+BlU33Hk3s7MRn5HZM96hW
	 ZeepPG24KppZTM074frHoYs1FFoTuWuPR1CQtVN9tbNjsSKq5H4QUMNTsLTfVlb0AKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ePEvyjSM;
	arc=none smtp.remote-ip=91.218.175.136
Received: from mta0.migadu.com (out-136.mta0.migadu.com [91.218.175.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995D3606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ePEvyjSM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BOKlIQLDcz6zGHywmJoxOKp3iaVh9FJDWuX8RgKkZU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794993409; v=1; x=1795598209;
 b=ePEvyjSM7RAyOfnbS/a1tOor4hMXPmEXhn0jCdUhng/eZawAc6nCq6MH7YQl6gBt4vCXhVcq
 W+G8AHlRWaMJvAtwJGFQNn+pXw9c6q1uM+EHRmDWVFZpfUvek4VBbLfFZmbwOa0PfbHP1G1f/Pq
 1aTXOlBQhRBScU4UKcOC1chk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 954c0063ab82b239;
	Wed, 18 Nov 2026 09:16:49 +0000
X-Mizu-Trace-ID: 954c0063ab82b239
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 09:16:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: fushuai.wang@linux.dev
Message-ID: <eaf4e2e54026b8f8840751d66288a352d9ba180f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] virt/steal_governor: Remove redundant delay filed
To: "Shrikanth Hegde" <sshegde@linux.ibm.com>, yury.norov@gmail.com
Cc: wangfushuai@baidu.com, linux-kernel@vger.kernel.org
In-Reply-To: <c40ca6b2-a620-46ee-89e2-84a6a5313776@linux.ibm.com>
References: <20261118072722.1052-1-fushuai.wang@linux.dev>
 <c40ca6b2-a620-46ee-89e2-84a6a5313776@linux.ibm.com>

2026=E5=B9=B411=E6=9C=8818=E6=97=A5 17:04, "Shrikanth Hegde" <sshegde@lin=
ux.ibm.com mailto:sshegde@linux.ibm.com?to=3D%22Shrikanth%20Hegde%22%20%3=
Csshegde%40linux.ibm.com%3E > =E5=86=99=E5=88=B0:

>=20
>=20Hi.
>=20
>=20On 11/18/26 12:57 PM, Fushuai Wang wrote:
>=20
>=20>=20
>=20> From: Fushuai Wang <wangfushuai@baidu.com>
> >  The 'delay' member in struct steal_governor is just a cache for
> >  msecs_to_jiffies(interval_ms). The duplicate state is confusing
> >  and adds no value. Use msecs_to_jiffies() directly at the schedule
> >  site and remove the 'delay' field.
> >=20
>=20I guess you haven't seen the below change which is in tip tree.
> https://lore.kernel.org/all/179421651800.2093942.14148413791803216183.t=
ip-bot2@tip-bot2/
>=20
>=20With that, we don't need the below change, since there is no more red=
undant field.
>=20

Sorry I missed this, please ignore this mail.

Regards,
Fushuai.
