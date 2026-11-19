Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795098937;
	b=pt/fP+f3M4csoH78/8hzrWNM9Q32aNyVLpF6JdznsxjOfZrizYC+7cqLE9QJDtcu0rI0
	 ZOvoPc93gU8hjHznbv2nhzLcNw1sjQg5u+YgxQYxQPyiA//d6fBoGxqMmo7qRE7DJLhSG
	 bpNVkwkuFJ1NGBf9rHKoJy0t/FTzqQUCSN8lUcwdlcBWgtBWUzJs95aeyQTeKwmIyDQSr
	 TjhMmuSdcp3asbaK+ZNe5QQkxxMq/TjLdYoXKxk3oNN1CW3sRYeJNP3/lK0w2HYKlT7EM
	 LH+nvFIJpseauPYe/2RK4ICjJaoV2AhEf4sAV7ShaZAy5vPM4oJsOxwvMhboLDjy9Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fwc9Vs0eCwtckZGOJ96a7MsJ3RS29UxqFWSheZDmdJQ=;
	b=geRmi52ZIZpFKhbrhhY1ikgBgfJc4R2mAjwbsE5zMr4UvJQF77Ttn+RHrFbof5kbu1Kz
	 9OYZg/geOlgbQuJwOjo81pVsfyOikg7K8NnR2POnkktyEcglSqb+UCxvKIhgUrOCvT2tF
	 gsHa03M0Km2pr93I5F3s7/UA6+huZVC7yxnUjSlonzpPof5t6Y386AiXGbsfqjAWEVA8Y
	 9HSJkTV6f4Z9qsBrGB3R0uVUr5yOK+5HwryA7eLwgjEc0Xzrb0wCiD2wut5MnXoRCjFo9
	 u4Xsro252V48SjQu55E4StYfvcHQY6Fu8YCSnPtfSL5p18gukph7MW1BDRSF3nAi7bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=NhOZekIj;
	arc=fail smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD815606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD815606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=NhOZekIj
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so3975982a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:35:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795098935; cv=none;
        d=google.com; s=arc-20260327;
        b=a6OLzVnVBhULdGmwQdl3kCQ9/pdlVufAl+FswlJ2c0QbktW6hEf2Pst4+iZpk8jDYT
         Oo+5mdQhA9W6Mtn0Io0G3PFdt2S6o2CfnTyW2LHS2ebTBqik/LLvQbXRvzTePlu5C1kw
         8NDSaa2n4QUs0uHCtbsLCcYqH+RoS5yy7WGffVtxvMUZ9i5U5lG81n89i3Ss8hr7KCui
         WAelckRoMBi5Wq5Ow4eVlAeceqtbgn2WSw+wDUOcMHIEgRliN/LdFj1O7YQ2mXSvEHdK
         HrRgELB9AAEjwRgmT2XTnC1GP2qn7wibzGXQr15X9uAulUAQVVc5xKWCJSEwXDLEbqMt
         Ispg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwc9Vs0eCwtckZGOJ96a7MsJ3RS29UxqFWSheZDmdJQ=;
        fh=p+4KqcyuZla4FMuuX+7GJks8P7bfxROU97lF/E0OjxI=;
        b=gI7/eqcEd8sOuC/y0MmCDSV5Fqp0XYSAZC673wyUHVCVYjEGcj3W50DSTsnPP4NyV1
         BAARE6JHKf0t71lXLCii9Qp4ThzKPVwiYhX2BxGS2ghhMJjwln2IxPcgs2BPMJktV37S
         mzbRO3H5tP6kJOsyS5ryCVGkjyo3OeMWmV6dHAsRDLePaXZ5aXikGcg5zHb0COQtEsN+
         Yt3gs7RSEDyV4tN+fZwIgOQIm698duX207dinxa0K/bVQ8eL6Pi3fwhbs/IRXRyL5VM+
         9ZW3Yoojx4VJdNRBleFfpJnZURkKYej/Dl41pE95ZP+IziPClMv8G+SoXDtwS/xxYDtO
         TW6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1795098935; x=1795703735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwc9Vs0eCwtckZGOJ96a7MsJ3RS29UxqFWSheZDmdJQ=;
        b=NhOZekIjKl+gZPOJkVw1+HzMbctt5GPFnFQMSIHry8p29Xw5DKPG2gE/PmTV7ECZrH
         /oXFDRFf/BW+XNp33vjHJo9ZshhlcZAq+fVT1pn5tWXzptpfVkqALva3cBnpL0JcQn8u
         n+CW1+z448/pzfdgYk6qjSbSLzZsGNUAnAs+wZbUZg8t7zVhKjjTFyBsB2oODMGLvFxq
         EQ9ir4URj/VNwkx8yAMbiddJPiXEIqgU94LSVZBqxSJZKMbz7kEIzZPnnF5E4mxQ6mGa
         TTqAXnW09x1CIO3BIKsguu2CTx2p1NJzioujg0nAc4Bqp4tk17RkD0iwxmmUUHd2OHSB
         /GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098935; x=1795703735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwc9Vs0eCwtckZGOJ96a7MsJ3RS29UxqFWSheZDmdJQ=;
        b=XiXjCHr9VWpjnRpXM6nyEPJF3HfLjbpAWodI7yu/w61awCi6Jvfs1O3XWJ48f3TYg/
         oH2HdkzMknQK1NlK1Tpklg+LzghYe8N1MNMblDT1sPZGSpAKJLCm+ezUJ7snATTctvpa
         hLqYSoUYvwO+ybzj7GTq6wkNPwVH1xbKSVYHmwJ5U3fif/c2l9QwCJzoX3i9E6aiRR7Q
         LoBIkJTU4G+aiJO3csYJ9ZuQmizJ8z1sofKiv/3dBh2Rn+kT4s9wDGJqkNWdT8J9C3OU
         fG28MtsxxG6UkNOxuPh6DGpF3Dv6AW8hF+jNRnSTG3W+MQL/p+2Elik7FPH92PUYVIB4
         WCVw==
X-Forwarded-Encrypted: i=1; AL+hErGJTK6LkE0ao/2GGcYQcRFDEiqyiSzlmfCE8IOAKgUdCXGNOkmHE8fYrr3UlDrN7Rb312aWvdjoHbVvKzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dh+Bo/u7WU03ut/IxfvmQu0NwwJfKbS07WoEmQErlDR1rjUjW
	KWlmdjf6pkKH5w/4tHo9dNtymagY2nOMX8QYPI1w0s2H+/NpJQfQRt3IB5txyCxIynvk3Rzdz+c
	ImBcfqrbPwMyK4aLCP0DroAwptjCIyutKiF/9JUUkUQ==
X-Gm-Gg: AYBFou1/n4atzxPLTYTJAgzO3nZhuSNvac2bAXC7+7N6GPFMJ/Qc/6Fb2yBeCS7PiuX
	WTK/VpVXLoJpp/B8JUKM69zE1uf8PnonuITEMZEU/KGXX77jVycR4x5mBx6xkZNXoKdtSsfSA3w
	ltPOUI5t+IHvW9xqszLrPWq4FvoIF77Sa6n1MSbpIkzt5DY+ropxNnNDfZZ/TvfHXpvRqgJK5gr
	5pIAJLnmoSoJ58koexz6nOTQE1YWgHxEwfNuBUWzJ+s7cc/RNBkJxL3xHlzcBMKi0z9lJ2J2UBC
	Gg4uqMvBZifeHZpzReZvj+vRiLNjHx97yl6umLx4txWEK10g9ZTbejkgoqYKeaunOMwdNSSXSdk
	URbRhZ2dXAzTgCt1qshq99jdSpgyUcDDo/KmGj8EF2hr+acTpKhw9KHAmEunZzWFk7hUidsUJbA
	1OcqkiDI2VS6QFuYJDPqmi/mUelPzeHTkIuDxWcbS7V3mLaE5cDm1ePfQrmGlCNAQf7s9K3oaxS
	dcVfKuUYDHlvSe9ats1FrQw
X-Received: by 2002:a05:6402:321f:b0:6ba:12e2:4701 with SMTP id
 4fb4d7f45d1cf-6ba12e24bb7mr1989016a12.14.1795098935183; Thu, 19 Nov 2026
 06:35:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ddd08640709b149408b616c3eec8fee847af757e.1793455791.git.liguangshuo@mail.sdu.edu.cn>
 <20261109111652.GD8635@unreal> <APEA3wD5LFuJxkDei2Ikqqq4.3.1794229006784.Hmail.202321181@mail.sdu.edu.cn>
 <20261112190948.GV8635@unreal> <AJcAXwCpLMe4Pb1NjRYKDqpi.3.1795092059235.Hmail.202321181@mail.sdu.edu.cn>
In-Reply-To: <AJcAXwCpLMe4Pb1NjRYKDqpi.3.1795092059235.Hmail.202321181@mail.sdu.edu.cn>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Thu, 19 Nov 2026 15:35:23 +0100
X-Gm-Features: AclHuK-dPTcWt0IIuZ2rE6NHM7-T7hU0j5p8pba_SiQNJGR2-xv8Hf6i-TIdF0w
Message-ID: <CAJpMwyg1iPJUzMYRz-3rWjnRr=9n=rQrii7x-FMmFMS7Wn5OZA@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] RDMA/rtrs: Fix potential use-after-free on client
 sysfs setup failure
To: =?UTF-8?B?5p2O5bm/56GV?= <liguangshuo@mail.sdu.edu.cn>
Cc: Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, stable@vger.kernel.org, 
	Jack Wang <jinpu.wang@ionos.com>, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:41=E2=80=AFPM =E6=9D=8E=E5=B9=BF=E7=A1=95 <liguan=
gshuo@mail.sdu.edu.cn> wrote:
>
>
> Hi Leon,
>
> Thanks for the review.
>
> =E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9ALeon Romanovsky <leon@kernel.org>
> =E5=8F=91=E9=80=81=E6=97=A5=E6=9C=9F=EF=BC=9A2026-11-13 03:09:48
> =E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A"=E6=9D=8E=E5=B9=BF=E7=A1=95" <liguan=
gshuo@mail.sdu.edu.cn>
> =E6=8A=84=E9=80=81=E4=BA=BA=EF=BC=9AJason Gunthorpe <jgg@ziepe.ca>,stable=
@vger.kernel.org,"Md. Haris Iqbal" <haris.iqbal@ionos.com>,Jack Wang <jinpu=
.wang@ionos.com>,linux-rdma@vger.kernel.org,linux-kernel@vger.kernel.org
> =E4=B8=BB=E9=A2=98=EF=BC=9ARe: Re: [PATCH] RDMA/rtrs: Fix potential use-a=
fter-free on client sysfs setup failure>On Mon, Nov 09, 2026 at 08:56:46PM =
+0800, =E6=9D=8E=E5=B9=BF=E7=A1=95 wrote:
> >> Hi Leon,
> >>
> >> Thanks for reviewing.
> >>
> >> From: Leon Romanovsky <leon@kernel.org>
> >> Date: 2026-11-09 19:16:52
> >> To:  Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> >> Cc:  Jason Gunthorpe <jgg@ziepe.ca>,stable@vger.kernel.org,"Md. Haris =
Iqbal" <haris.iqbal@ionos.com>,Jack Wang <jinpu.wang@ionos.com>,linux-rdma@=
vger.kernel.org,linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH] RDMA/rtrs: Fix potential use-after-free on client=
 sysfs setup failure>On Sat, Oct 31, 2026 at 10:14:46PM +0800, Guangshuo Li=
 wrote:
> >> >> rtrs_clt_create_path_files() drops the path reference on failure, b=
ut
> >> >> its callers still close connections and free the path. This can acc=
ess
> >> >> freed memory and free the path twice.
> >> >
> >> >Sorry, but how?
> >> >
> >> Consider an allocation failure while setting the name of the path
> >> kobject in rtrs_clt_create_path_files(). kobject_init_and_add() has
> >> already initialized the reference count to one when setting the name
> >> fails with -ENOMEM. The stats kobject has not been created yet, and
> >> adding the path to clt->paths_list did not take a kobject reference.
> >>
> >> The error branch then calls kobject_put(&clt_path->kobj). This drops
> >> the only reference. With CONFIG_DEBUG_KOBJECT_RELEASE=3Dn,
> >> rtrs_clt_path_release() runs synchronously and calls free_path(), whic=
h
> >> does kfree(clt_path).
> >>
> >> Back in rtrs_clt_open(), the first statement on that error path is:
> >>
> >>         list_del_rcu(&clt_path->s.entry);
> >>
> >> That accesses the list node embedded in the path that was just freed.
> >> This is the use-after-free I meant.
> >
> >The error handling appears to be incorrect. rtrs_clt_create_path_files()
> >should undo only the changes it made internally and error handling of
> >call to rtrs_clt_create_path_files() should undo what was done in
> >rtrs_clt_open().
> >
> >Thanks
> >
> >>
> >> Thanks,
> >> Guangshuo
> >
>
> My understanding is that rtrs_clt_create_path_files() should undo its
> own sysfs setup on failure. The caller still needs the path to unlink
> it and close the connections, so it should hold its reference until
> both are done.
>
> Is that the split you meant? If so, I'll send a v2 using it in both
> rtrs_clt_open() and rtrs_clt_create_path_from_sysfs().

Thank you Guangshuo for the patch and Leon for the review.
The bug is real. We verified it internally, and somewhere between this
patch and the first one Guangshuo sent in May, we solved this
internally but missed sending it upstream. It was a miss from us,
apologies for that.

We will send the version we have soon, alongside with other fixes.

>
> Thanks,
> Guangshuo



--=20

Regards
-Haris
