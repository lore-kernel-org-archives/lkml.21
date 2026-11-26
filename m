Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795669952;
	b=yLftUGqelElIkr1YXAuQ7r+p/40XIlDeVXN9nARgQfkddN60Jy2ZUmR2NiR6lbBXLyXe
	 tSzWNeAJBRjHSKSBSh+/IHoIehIABXoXJ5DmOx86RWfCUojPD3/ZCvsEWvEmnTVVcQZIk
	 XZAPGvRX6me8om4CGxyRsKaWhKJ5d/heKp2FYPao5I9Fn18Ih3zyG09llGglCpM+p/iC3
	 gZuvVgxigETaOSZj4EjIxx7IjJmHsY8VXWdhiUB+Nqc7vEqZ6RkZWQf9Do8wWvkMDzrS6
	 ttZNH4TruD/z2cHP4BcPsrR0v1E67iTtZJxFhBokyqQxBMg76d9zjjHFwX+VbVsasxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
	b=iVbdGMegfmeEIUg0ZZARrzma/TpfnUw4wJwtLB4FtXo2rw1aBYzEb5HPgfXD31jJvExE
	 dbmAtZFtkzn0eD9xbsREWQM7zOaH1P3KtYuLz3ZddAlFffrCy3cfM9nj0efxxhPSlVjyf
	 p4I0pJXmmhL+cqnOfz4UxI6MSV+0PNx308+yUj2/YTks/vagE8DH5gx53vZDlabtph1eR
	 jNXDZIwkTVW6PnQ4w5s2ZgWQg4mOxqKKNmfM3kEuLZxp/jy13rOxRs+yt6VvC6pFdVGdt
	 L3lpFt8QoguIy5NfNbF5uq3CSUWmbrZBDN6dGkXq1hZdj8/N0Hj4WvlUPSX0/m7BXXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYFFmg8Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E167606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E167606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WYFFmg8Z
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4cc793704so51860137b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795669951; cv=none;
        d=google.com; s=arc-20260327;
        b=W8H5mfAw0pGcAp19WwcUrzka1p9KMHMUuzG7rKA6jhyu6t7GGKzs8+J4wDdJCKSjG0
         /CPwPU/o+i9Fbwzox5SEbQMoQj5all7yLRSLL+jd0HKkuWzMrCXCAd5/KwNYsIHirT+M
         P1eCnPMDUjZaNwe8xLXORhUvhAQMcOH/WSEghWI2iRjVe3+801CveBBWDz+iwc9FaT+0
         ljwKIS2PGb0grAXSndud9ahmawstk126mdPfe3lbTOPhr3xkZc4kBwXlHPGaenPMJnu6
         QRi8OpjMtwa8aiweTDCl9qgx8dZqdN1GMy2W3UO0lQNLHKhzaKzWxCRrY1xyu1oZnvEY
         1V7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        fh=hu9lgT1xKmhFeJh/q3kHDEmZa3edOJozGIR68CSFJ18=;
        b=dGenHIrkrcxO3+8ppw5Z2UtQfKxbvT5FMPVVRnQziKj5ocsCGLD1cNPN/8MapvLita
         fSIJOala/JzHaiXr2Y3z2xux+qhM7pI3x0I9wSsv60+L65Bou58beTeu8wfrFpjcPMuz
         8Xr0cPWaeLV6f/iLL2crsgVc8AjHNbFJ8UkKmFxIT/57eg4k3p5Y/t+wqtE6hotxVqrk
         GrAP3/OceRKy9lVD52fHF4ay6NfLrThNcGBJ8khnv+HXhzrvtQzZCEm6K+gyLDu0l5HR
         WA2Cb/eK/uXkGO/o3D9K20+hhQzlvYZp2s8kV+RYTz8rDyPRW+jv+u+ZVpwDB1MWu9mX
         Bbag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669951; x=1796274751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        b=WYFFmg8ZlPKwh9PoCjEwmnqFmtfe9er9CSLFhbY4GJGreiTN8/N3BhYZHc0MyRr3KH
         E5CHeBm/mBFy7BuaPfaKQBoMcWs+d3Sv/rH/nxcu01ghMhyZOC6G9FzROsKoWAhZ7hSK
         OwWhTrzbY3fz0dfHOGe3uAQQ5WPOsVEbCJcxSrT69vOZ5PGImtNFE5aqvbcv7EnxMINX
         A2bwWSJvdYDwyaDjzsCY7SzYZNKdV8eUwkUJZbHsGbKPxNFAfY5iBIN0HkdzPKhshds7
         +rS7BlDmYj9jZANwCBKKWhkGqTmFaWRk1N94UOBbKfpZs5r4VOcekvNx1UUNPESsRDwv
         +WAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669951; x=1796274751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7THm2pFNLKmeMdeigx24KlsxpB9NcHHzxJozSi1ZjvE=;
        b=KCwXs7NtQQi8b9F1jIUHvGTGfVeepzMt3MIIGEt0SgldyZJ25dwC6sW0iu61XThix5
         jCEI4kDFr5xy0wqpHIuOARE/eBNqmNZipGt3y9KVQ6awtoirQmogMV5imbJd728e3Uh2
         Chj/A5K7x+cQx4nTfsxt5xJTp3y15UYBkeuPMuE57+v6kvTo6wolD4KnSYAshFOmuozB
         o/bQXMeGoGVmr8p7yAjDH8pbe+7V5EBuVC11MjbNyhHPMIKYpDEQLc+9t90CW8HqDWwU
         /VnPVhBGR6/lkayGHeaw37t+wc4Ltx+UNGXaQWcq3cHZV8n+EWVGFFhtnCz+trjdzBgS
         rZsQ==
X-Forwarded-Encrypted: i=1; AL+hErEAwnD5g+ImMzb7BLrxeYouTMJ10qy2YxdDyngdc4qeO5aMgaVOWbCOcVWviAodcSiT9xSLgKL8HqMvhls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fVrwcqBJlo2w0hDbR9uDo++3zwDCzIyBABqimDZdUUGvV7UV0
	MARrNLc4szejC+Q9RWLgKS87IW8fEmyuLe8xZHJUXtT3DXNmpScs4to2Hx3TN4WjNfKTgcugJD/
	jxfhp7Ji6pBvBIvpEkZ47H8mkXkWDpAA=
X-Gm-Gg: AZFdTZfteVtNgOGWrZhLdFlTRLslTTbkxutfyhEMMx4/tEh5qS97wR4gJedfBIJ2vWt
	WAXbsUuceuEXtpk0z9r9LYFCRZ7ii3DYCQSu15G0s/VJxNiZhIECBxcAuYPjqkpLFP2S9uEakJM
	8igh8Ps932Fov3DrlxfSzYjzFXP9zKGYur1yvjrgxD6n6gC9HTMXTojF6zJlo0LS3pDyMYWV37P
	kl9AnQZGfav72T0rIaemtgirnNrVDPvhOOcH33e5V7cOCXagn0iVqB1Irlfg+4g8rUzi9Ciq29u
	1f0RSHHjwPvmNlhqFf6XnBiKHNuSyMsASadljai4Ag8NeDoEj9niH90TlN7CJWpZTdgK18MZlDH
	snoAjR/o1gCDMHeaGD8Hcdi4LMSbKVR8PI9h93z/2PyrBFabosxARfls6FDAEODRWlU33siM=
X-Received: by 2002:a05:690e:1686:b0:67b:bf6b:d9d7 with SMTP id
 956f58d0204a3-67df452af7fmr7339938d50.153.1795669951183; Wed, 25 Nov 2026
 21:12:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194814.188536-1-asiyee994@gmail.com> <CAK77STANn3cS4-=mw59_G31_kFLyVp51N==K9RcikqrYzd4ELA@mail.gmail.com>
 <CAK77STD6wa_ovKONEm1DJy==q5ivEi+1wn8q4ELgyHRufgHSOw@mail.gmail.com>
In-Reply-To: <CAK77STD6wa_ovKONEm1DJy==q5ivEi+1wn8q4ELgyHRufgHSOw@mail.gmail.com>
From: =?UTF-8?B?QXNpeWUgU2FyxLF5xLFsZMSxeg==?= <asiyee994@gmail.com>
Date: Thu, 26 Nov 2026 08:12:18 +0300
X-Gm-Features: Aa3M54pSUAOzKZf6wbB3JHZS9mE1129F6tSVA1J00l6mLMutM_myMCE1DD8SuzU
Message-ID: <CAK77STDz24cPvWxePG6sZehu7ib7R9VEOLsLcVgX3JY7n_tOrw@mail.gmail.com>
Subject: Re: [PATCH] selftests/ipc: Use IPC_STAT to get queue information
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuah,

Just a gentle ping on this patch.

Thanks,
Muhammed

Asiye Sar=C4=B1y=C4=B1ld=C4=B1z <asiyee994@gmail.com>, 26 Kas 2026 Per, 08:=
03
tarihinde =C5=9Funu yazd=C4=B1:
>
> Hi Shuah,
>
> Just a gentle ping on this patch.
>
> Thanks,
> Muhammed
>
> 15 Kas 2026 Paz 09:05 tarihinde Asiye Sar=C4=B1y=C4=B1ld=C4=B1z <asiyee99=
4@gmail.com> =C5=9Funu yazd=C4=B1:
>>
>> Hi Shuah,
>>
>> Just a gentle ping on this patch.
>>
>> Thanks,
>> Muhammed
>>
>> Muhammed Sariyildiz <asiyee994@gmail.com>, 1 Kas 2026 Paz, 22:48
>> tarihinde =C5=9Funu yazd=C4=B1:
>> >
>> > dump_queue() finds the message queue's stats by brute-forcing kernel
>> > indexes 0..255 with MSG_STAT and comparing the returned identifier wit=
h
>> > msgque->msq_id. This misses queues whose index is 256 or larger, and i=
f
>> > no match is found the loop ends and the code goes on using a stale
>> > or uninitialized struct msqid_ds.
>> >
>> > The identifier is already known, so query it directly with IPC_STAT.
>> > This removes the loop and reports a failure if the queue cannot be
>> > queried.
>> >
>> > Signed-off-by: Muhammed Sariyildiz <asiyee994@gmail.com>
>> > ---
>> >  tools/testing/selftests/ipc/msgque.c | 18 +++++-------------
>> >  1 file changed, 5 insertions(+), 13 deletions(-)
>> >
>> > diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/self=
tests/ipc/msgque.c
>> > index 4b4c1ab..f4168c7 100644
>> > --- a/tools/testing/selftests/ipc/msgque.c
>> > +++ b/tools/testing/selftests/ipc/msgque.c
>> > @@ -130,21 +130,13 @@ err:
>> >  int dump_queue(struct msgque_data *msgque)
>> >  {
>> >         struct msqid_ds ds;
>> > -       int kern_id;
>> >         int i, ret;
>> >
>> > -       for (kern_id =3D 0; kern_id < 256; kern_id++) {
>> > -               ret =3D msgctl(kern_id, MSG_STAT, &ds);
>> > -               if (ret < 0) {
>> > -                       if (errno =3D=3D EINVAL)
>> > -                               continue;
>> > -                       ksft_test_result_fail("Failed to get stats for=
 IPC queue with id %d\n",
>> > -                                       kern_id);
>> > -                       return -errno;
>> > -               }
>> > -
>> > -               if (ret =3D=3D msgque->msq_id)
>> > -                       break;
>> > +       ret =3D msgctl(msgque->msq_id, IPC_STAT, &ds);
>> > +       if (ret < 0) {
>> > +               ksft_test_result_fail("Failed to get stats for IPC que=
ue with id %d\n",
>> > +                                     msgque->msq_id);
>> > +               return -errno;
>> >         }
>> >
>> >         msgque->messages =3D malloc(sizeof(struct msg1) * ds.msg_qnum)=
;
>> > --
>> > 2.47.3
>> >
