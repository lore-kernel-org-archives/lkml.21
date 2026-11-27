Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773282;
	b=zf1lyfV0B45f7mKWaVCD+wEvOvUkbl0dKIawcLtVOWy+t/incl2Np3kwcE2vUTml9s34
	 aliDzxJet5NeaFNWnR7a7fpEgRBmnR7DyaKAbySoQzYhInn52j4nd5ZWqFUer1BnBbait
	 SCGOsyy7cNsNwz8ytbTCMQDRWpm1ECOVNV1uUe2gbWaUSDYY73bDq7zYvxIEXkK2qofRd
	 ME2Eub79zyOT3oRUU4Ltc6yH9zskPExLWp8uzObw9Y26Ol1gPPLw/ICZBDY3abQ0gXjUR
	 ms4j6Q67X+iKbPGLnE/BScX1so3kUhCJinNbVqsE/ILd7Xs9ORRVPDeZEMAqna6IhFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773282;
	h=DMARC-Filter:DKIM-Signature:Subject:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:In-Reply-To:To:User-Agent:
	 Cc:Content-Language:Date:Message-Id:X-Lms-Return-Path:Content-Type:
	 References:Received:From;
	bh=wcn0BvnwSVtfxMoaDYosdyIR7/+NzVQV83BDR502XN8=;
	b=SoMhUzlWAR9MrMxaY9/56g+UjPIr+G35xmrebMB3aVNgN7noRg24Wy7AmKc9snbvoVrs
	 fRvQ9U7mi1qmgHM9/UmwI9TP2wCMx2uaFh69PsP0HD3JYpnVvY/hl5Y5vClzCJHRYEZLY
	 9iKyTykhAqnih72MSCsWDqZQsqgCq0Eq3Dptd3SZJVEc1Nu5Aiv+Yk82Us5F7KuHXd9Ol
	 oxLB8NVWwXQtYw4qW++sXHS7OwogM3cssvTCWJ5pK6Vakf7gCNOQu19bCeTky4mejZQ5q
	 vRaHnNqFIjOILu9ZB7mmE+wfwVzou3HSf5cmBQk9vhy85PYGXDYnMLrTr4W8m+BGhBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=ERo6RsDG;
	arc=none smtp.remote-ip=209.127.231.44
Received: from va-2-44.ptr.blmpb.com (va-2-44.ptr.blmpb.com [209.127.231.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763D8606A339
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763D8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=ERo6RsDG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795773274;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=wcn0BvnwSVtfxMoaDYosdyIR7/+NzVQV83BDR502XN8=;
 b=ERo6RsDGJti1f8O7d3GyktjeqWjblUtI/MkV8528ZulLGNNCTkEAHydZrvSeL/xzbrBuBi
 vcHNZ8sNcfB0psbETUU2PCiMhGsPoUQ4jj+oMHo5+yuNP1hXVZQi7mL51VBlfgC9bOnJpY
 csAKnaBGzwf1fVAl63bZER3J69dWgPP8wGqqG6A5bJ+rZfl7VNjfHKC9x0e4SR+pNy0RaJ
 +KlpaYMN7HPE5p7uLWOQfxCg/IgMW23VIVuWs52x/otrhCI7nmbHD1GTO2J1rg4o2QIQHJ
 k4MmdZmuw7ZE3W9MriecDV4D08WBhtAfrXebOHUvJWL5nljLHYil2ie1GZzhyg==
Subject: Re: [PATCH 1/1] MAINTAINERS: Change email address
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Original-From: Ni Xiao <nixiao@fygo.io>
In-Reply-To: <39caa86d-91ef-41be-ab28-38e9c5bc8436@molgen.mpg.de>
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
User-Agent: Mozilla Thunderbird
Cc: <yukuai@fygo.io>, <linux-raid@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <song@kernel.org>
Content-Language: en-US
Date: Fri, 27 Nov 2026 17:54:30 +0800
Message-Id: <92d54cb9-6cf3-418d-94a9-bfacaf578acf@fygo.io>
X-Lms-Return-Path: <lba+26b09535a+6a2fc6+vger.kernel.org+nixiao@fygo.io>
Content-Type: text/plain; charset=UTF-8
References: <20261127092024.79116-1-nixiao@fygo.io> <39caa86d-91ef-41be-ab28-38e9c5bc8436@molgen.mpg.de>
Received: from [192.168.8.23] ([183.34.163.136]) by smtp.larksuite.com with ESMTPS; Fri, 27 Nov 2026 09:54:33 +0000
From: "Ni Xiao" <nixiao@fygo.io>

On 2026/11/27 17:23, Paul Menzel wrote:
> Dear Ni,
>
>
> Am 27.11.26 um 10:19 schrieb Ni Xiao:
>> Use new email address.
>
> For the short log, I=E2=80=99d add your name to the summary/title:
>
> MAINTAINERS: Update Ni Xiao=E2=80=99s email address

Hi Paul

Thanks.

>
>> Signed-off-by: Ni Xiao <nixiao@fygo.io>
>> ---
>> =C2=A0 MAINTAINERS | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c72a281a8167..6bbee57334b1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -26061,7 +26061,7 @@ SOFTWARE RAID (Multiple Disks) SUPPORT
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Song Liu <song@kernel.org>
>> =C2=A0 M:=C2=A0=C2=A0=C2=A0 Yu Kuai <yukuai@fygo.io>
>> =C2=A0 R:=C2=A0=C2=A0=C2=A0 Li Nan <magiclinan@didiglobal.com>
>> -R:=C2=A0=C2=A0=C2=A0 Xiao Ni <xiao@kernel.org>
>> +R:=C2=A0=C2=A0=C2=A0 Ni Xiao <nixiao@fygo.io>
>> =C2=A0 L:=C2=A0=C2=A0=C2=A0 linux-raid@vger.kernel.org
>> =C2=A0 S:=C2=A0=C2=A0=C2=A0 Supported
>> =C2=A0 Q:=C2=A0=C2=A0=C2=A0 https://patchwork.kernel.org/project/linux-r=
aid/list/
>
> Either way:
>
> Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
>
> Kind regards,
>
> Paul
