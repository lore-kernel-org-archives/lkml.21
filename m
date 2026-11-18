Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794992310;
	b=okRFP3LWVfJVaf3IOiWE8up0hymMhn6lwyzw4dQwTw3ZDiF4th3x/Dl/ykvYZVR6jL+4
	 Txw26ySCNKM6KtKbpZ+vLb7a1oFzMIQJCHt/Cs5cqPdK2qzbPlpb3kxbgbi5oDJPqq19c
	 i5LzZtm5KNRJBM8bf/V3bIC1A/wWM4ycE/djWEruzqgfoH7bkcK9dZArqMmEP9tb7pgkt
	 RqnWqmKsDfEB6FDeCNM2B0N+cWAZv0llvWA4ciM7IVNmhGC20kbTBIi18rUaVH+tGImNh
	 JOeqjg/IvY0ibZb/P6OAmTu2N/g/nONGZ69q92IsHd4D3tsAJ8rWlnR1sA2C22NrqZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992310;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
	b=lrY7Lf1FhL2NSp8M/rNo4uujpmBzbOtTG3A2sh6FqtXix3dvpzvXPVYCpamuRxbda6gh
	 Ams6PtpdVZPb+2GaQLTXq3wFd4M896loLsMQhWa90NUY8z14KrX1Iwcd1iWZHgy3gTNH/
	 eRJ8mDyk2QgpEC528LXOxIhaBqJ7vUWvllxquO2fWNfcCIIw+asesJxEC/7fMTFR4ytRj
	 lCXIcrewKRspLVLlw1QZkDsYWgAvEPfXsli3BqhWhDJWtDGjHqxMDk4d7/7+f2Uih3ssR
	 WBRFZXP1SAs9PDdcdsrD67n28BGn15/syLKrfAhiVx8cy7eYWy/nV/fPcqqbVY90UYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sJWHZPJF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5F606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEB5F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=sJWHZPJF
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f2f2edb19so73096885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:58:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992309; cv=none;
        d=google.com; s=arc-20260327;
        b=d/RZdUvA8sc6wzqN3f+FC1mxUcYI4ptFe7Qdlt+LwFHPbLKEAjPL0+Sw98AXQX+i6c
         +pk+dxq/2k/L/iUIYqiw5EjUJloDTf59iS1+5IcwOkpkWQZfaRc9n5UvRG/czxOUe2c8
         DOOBwMzzA7v0Mb8Xp2C+J8ydT+z/woMRc0wEZ4Rub4PqaPWTsJRvr6B4DOIT+QWAVgOV
         QVZZwrma3zwHnwBJ5irdBpY9W5go18xK8reRAsEioC+wtX8Xk/1ND1wu7Gmsw5vU33l/
         +xvUr74/mMUtGVMXE+fuEoq77ca1kBRe1FxwUKTVLGOKosY8/MSE1lyh6PGnnsUUyhTT
         GbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        fh=M0cfZuNYAM7Fiu8FATb9EhFt+iTiwut9T4TGhPFUaYk=;
        b=r6mjZS17CGmr1MctNOz4oodFzSfghP/wMlzaLn2oOTalbnDWDZo8/mbEkVGOYqT0ZG
         RJmgT+TsEwMDv0sRiqwosrN5jifBcl6LeH2Itlo42JE3Km3lWPumHw8De5WoJ1LAyu0n
         l7Ad2Yivju2h5HCl5y1Vyjd6C5WTL4MeqTztE1TV9qOTNzhECuDoAhV+OdcCQQqafhPB
         F5ZdcXxjP5i9AVBZZKrJFf9iHcUIOCNHL7N2kzscqBqvtfqKfNQ1fkUpFsAV07rZV2HC
         oW3MP8hW+Q9IBIeWjc1Hy9f5LiF6M0XxADQ1eoVoSW6qALeapqz7YMbBSWup739II/9d
         SDzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1794992309; x=1795597109; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        b=sJWHZPJFE2rSzqIvvMx7KxMVV517ql3yaztG3IBiOKu8y82E5euIxx07QqBAYNkVXz
         pZ7peo+1lFMCVXL+k0H+mOYXOQ5ZiyLLBuFcOmAsAth0RtYbRG6Oa8hWYdy2zYK9o1YC
         ZhrYSyEI6Hxbz2zVYiVVPVu119QEz1CbdeGeBCANhcy7O+zjcuFcvo2n6Ew4P7SqQ4Ve
         BZEGg7hC2vDnPfIO0IqgYalfSHkK9/46aW+3LtR8q/WcBuKqeIxOfE88sDb0uBzTUQCm
         jl/Zqwgvq+phErVcRHjB3husXeJ0wQKqrPrZ8ykdFgC45iRyR75ehJ6zmb4WN3P+t2+5
         ujYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992309; x=1795597109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        b=BjwJNnwfDxeahMnUtMXChg1Ij3IXbYWLcX6StZoiVaY1J2SOk29Sknfpv7wkTxzKsC
         C4wHjYRieiGLfMB2fmhWztS1/iYVZyvtjdLaBdeFSB5aznfl1CK8odHH5GoCOrhTufnB
         g2eb3MbpNJpTe9Zp2fDaS4zUDGEK6iSg34J2/mEn9TmA8xIakPAKFpV2bCxxJObPjMwV
         iUpMGYHYh7b3x44TmKU5EqXMIZl6GofI9A6+koCaYJE4kbIlr7w9Da2urofoQXX7J5Rg
         RjNgIeQ33QO7sk92SKlDlcjRrBNxflZUTgOrxYyCbYxCUvYCMezl2k/f0Cba3kr19z3E
         5u9A==
X-Forwarded-Encrypted: i=1; AL+hErGtnbcha9umskLmy2UFbY/kp2muiSkwXflxQmSBRdAqIDm8ioTHVgh2BJZWdg602D75KPpvOXDKtxExbWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1b5m7wVEttr2bbh5JpOUy4B0VYtbDMHiA4oggOOs0wCeafaBQ
	LuuLvDjwcPHcSoEqttuOFbInuDqFJXx2ZQ9KViusN5iz13sGdypOtfRm2nlbL+5K3xcHBy+YXEJ
	7PnGeZ0CbSVx/EqwVLaGMrjo3i0oYHFQx6OpZdTizTQ==
X-Gm-Gg: AYBFou0lo5KcOjdC2lfDV2kS6Iks62w2uDMEjelcuOIGgN0g5r8XUmCQntVVj327cVp
	eD4nYyj73UjdWOddlx9MIL8yr1BhJOWdHad15GzvoVcxgKxjNkkQchPXhcWFh6I9uzMHDfj4B7Y
	FDbp+xnr15sPBvyIFSwjwCWl3baxgQcTH0ckUc2HvMMc91DaEG17Fquv2cSCbIHBdEGTf82XBJs
	YHe/ZsCr9ln3wARk4cSO/xbGnM/xyN5tHrHbT+3c5lv9pKUAJv1pGafsr6IHjGqhzi5rc0GVHjd
	5uaP70h6ZBe6n96ZXGOHiS4Nkp0r6yytR5dEx8u2Fr5gFeSyorCyyxuFTk+MEmpoXdXeSjP41c2
	0xftY1HdQSl1ySgYSyEtCKwWD0ldvaV3QwAq3vxvBHC6sUZVwklezHc/QaKRCS0lPAnP1kFY3OR
	v0ZMIv/S9AjaTHBbU3dqA=
X-Received: by 2002:a05:620a:8086:b0:949:8119:6702 with SMTP id
 af79cd13be357-9499948e137mr355118385a.10.1794992308643; Wed, 18 Nov 2026
 00:58:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260814022453.437-1-kernel@airkyi.com> <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com> <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
In-Reply-To: <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 18 Nov 2026 09:58:16 +0100
X-Gm-Features: AclHuK909rrF_qXtOz1nnqKagNl32jQy-qVgmtzBVAZUdG_WOuXBZplBLfDYBaA
Message-ID: <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in rocket_job_handle_irq
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Daniel Drake <ddrake@baylibre.com>, Chaoyi Chen <kernel@airkyi.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, LKML <linux-kernel@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chaoyi and Daniel,

On Wed, Nov 18, 2026 at 3:29=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Daniel,
>
> On 11/18/2026 5:53 AM, Daniel Drake wrote:
> > On 14/08/2026 03:24, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> The rocket attaches the IOMMU group in rocket_job_run() and detaches i=
t
> >> in rocket_job_handle_irq(). Calling  iommu_group_get() in
> >> rocket_job_handle_irq() causes the reference count to increase
> >> unexpectedly. And this causes rocket_core_fini() to fail to release th=
e
> >> IOMMU group, leading to a resource leak.
> >
> >
> > While there is a leak here, I think sashiko correct in saying this chan=
ge would introduce a crash because core->iommu_group can be set to NULL bef=
ore this codepath is reached.  That might be a simple fix.
> >
> >> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> >
> >
> > Wrong commit mentioned here.

I fixed this one when applying.

> Thanks for you review. This is indeed a problem.

I'm sorry but I had already applied this patch to drm-misc-fixes and
pushed when I read this. I have looked at fixing just this crash, but
have decided against it because we anyway crash in drm_sched on core
unbind whenever a client is active (no need to have a job in flight),
due to the sched entities keeping a reference to the stale scheduler.

> And it has been a long time since I sent this series. :)
>
> During this time, I have seen a lot of similar work. For example, work
> similar to patch1 is here[0]. And some of the issues mentioned by
> Sashikoare also being fixed by in-flight patches like[1].

Core removal needs to be fixed as a whole: detach the open files'
entities from the scheduler that goes away, complete or cancel the job
in flight, and quiesce the job interrupt before the resources it uses
are released.

> I'm not sure whether I should slow down the submission, since it seems
> Tomeu is quite busy and hasn't gotten to some of the backlogged patches.

I'm sorry about the big backlog of patches. With Heiko and Daniel's
help I expect to get it cleared soon and be more responsive.

Regards,

Tomeu

> [0]: https://lore.kernel.org/all/20260915041152.1725014-1-vulab@iscas.ac.=
cn/
> [1]: https://lore.kernel.org/all/18667b2afdcaae217fa1038f5348ab23ed756bdc=
.1794615323.git.gahing@gahingwoo.com/
>
> --
> Best,
> Chaoyi
