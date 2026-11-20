Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158320;
	b=sUw7eCV1yE0ErJE+SicWGan8mA2SwPAOYtXajq6ulGyRr83EBx/gtQXn44Ff+UuOO+I1
	 Gzuh+tvyYIhds/pMgDchbnw/ea8GiUGXGhvzEzvmz+L1PAG2N40nD+cZZEsKVq6lnEqUQ
	 uVEWjCTk66pD9D2bx4p6fbDa9fNXc3UmzAiLa+RIHZwOuiA9mcFAhHpMThzh1daZFwMqS
	 2yw50kxgXIx9hyCkVg6Rog+b8STECYTzz+fzdxHE8skD9lvJmzEUrGB22gRMlDAnxUKwV
	 UA3BPi4HsRtrJDWRloXsBiPk3pdktDc/FJFWEOR4+kZSSFJGnJvErDf9i9uSrNTrfQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158320;
	h=DMARC-Filter:DKIM-Signature:From:Reply-To:Date:Content-Type:
	 X-Lms-Return-Path:Cc:Subject:Mime-Version:References:To:Message-Id:
	 In-Reply-To:X-Original-From:Content-Transfer-Encoding:User-Agent:
	 Received;
	bh=5zP5q72DWvQvijg0sSGdzorkS5oZvfpTf7vMW3JaQss=;
	b=cvtdGjx/UlZxYX8VRgXTdq7P9e+PQeuBLliCwEdFYuYDksVTiENrldhKbQdPxiK9fin2
	 B7kKaPnxKS79GwpYMWy13S83jMkSJQyIc+QcOD34oT3HIF6tUcQ4WGMx/T96SOqjbL0Pm
	 T+yCeNIVE+evj1IsOXd43bkDgYQhl7tx66LAjNVw0/7ThrgHptHNE9PGV1QrCXUfr0dBs
	 OMT3cP5Xx3VTATSu0udgcqN+0nyclZVt9JotO/yA/0kWaUtPWLGpPogrUnWZwLEJYhq1z
	 xcsKHBSgvQQYG/twjkyk8nVxk+Qv/W4HWG3PvZO2t7TDk4rNxNfI3arUNbBTLRupT2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=Lg0IYPHg;
	arc=none smtp.remote-ip=209.127.231.44
Received: from va-2-44.ptr.blmpb.com (va-2-44.ptr.blmpb.com [209.127.231.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DD7606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5DD7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=Lg0IYPHg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795158308;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=5zP5q72DWvQvijg0sSGdzorkS5oZvfpTf7vMW3JaQss=;
 b=Lg0IYPHgFx+kU2N9jssukYNSqs/+hPjqBHd0DO6ksRqZE42xJmdoxJU6USg93Hce0cRKlR
 kW0pCp/9XnFXvUfwqzQ2wmEv+i4yt0QZOTNE8Z0VOibjGRvWV+IhkD3sp9XoL0lRBexTFP
 wHlQvGBqjYl4v0WslxWqL1Bot2/cIIlsx5oeRbTTi52TJZm5iejF2athkFHdE7vW8bGIcR
 e2AiF1x5jom/u9fJMWYeQ+E9QVKRUV5ykdS+k29t7z8mJ9b7ZYacdCNWaGDL4gstDUjjy+
 IEd56f3poNIpF9LLGHNLahx57rP5reWllIfSXl9UozCXiqbjUAzNXPFSlqCH5g==
From: "yu kuai" <yukuai@fygo.io>
Reply-To: yukuai@fygo.io
Date: Fri, 20 Nov 2026 15:05:00 +0800
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26afff122+aeff87+vger.kernel.org+yukuai@fygo.io>
Cc: "Li Nan" <magiclinan@didiglobal.com>, "Xiao Ni" <xiao@kernel.org>, 
	"NeilBrown" <neil@brown.name>, <dm-devel@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, "Alasdair Kergon" <agk@redhat.com>, 
	"Mike Snitzer" <snitzer@kernel.org>, 
	"Mikulas Patocka" <mpatocka@redhat.com>, 
	"Benjamin Marzinski" <bmarzins@redhat.com>, 
	<syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com>
Subject: Re: [PATCH] md/raid10: preserve recovery flags on reshape abort
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <6aec6738.059f5055.2712e4.0005.GAE@google.com> <20261110054456.625-1-nenkov2004@gmail.com>
To: "Hristos Nenkov" <nenkov2004@gmail.com>, "Song Liu" <song@kernel.org>, 
	<linux-raid@vger.kernel.org>, "yu kuai" <yukuai@fygo.io>
Message-Id: <4d13edef-f454-437b-8910-3a905697303e@fygo.io>
In-Reply-To: <20261110054456.625-1-nenkov2004@gmail.com>
X-Original-From: yu kuai <yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
User-Agent: Mozilla Thunderbird
Received: from [192.168.1.104] ([39.182.0.159]) by smtp.larksuite.com with ESMTPS; Fri, 20 Nov 2026 07:05:05 +0000

Hi,

=E5=9C=A8 2026/11/10 13:44, Hristos Nenkov =E5=86=99=E9=81=93:
> raid10_start_reshape() can fail while resizing a bitmap before it
> changes any recovery bits on its success path. Its abort path nevertheles=
s
> clears the entire mddev->recovery bitmap.
>
> dm-raid keeps MD_RECOVERY_FROZEN set across suspend and resume. If RAID10
> reshape setup fails, raid_preresume() logs the failure and continues with
> resume. Clearing the bitmap removes MD_RECOVERY_FROZEN and makes
> raid_resume() hit its invariant warning.
>
> Do not clear mddev->recovery from the RAID10 abort path. The error paths
> reach abort before raid10_start_reshape() modifies the recovery bits, so
> there is no personality-owned recovery state to roll back there.
>
> Fixes: bb63a7019df9 ("md/raid10: resize bitmap when required during resha=
pe.")
> Reported-by: syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D8b22a0459202f76b4096
> Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
> ---
>   drivers/md/raid10.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index 066c43154..1fd3f5f4f 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -4490,7 +4490,6 @@ static int raid10_start_reshape(struct mddev *mddev=
)
>   	return 0;
>  =20
>   abort:
> -	mddev->recovery =3D 0;

This is not quite related to this patch, but take a look at rs_start_reshap=
e(),
MD_RECOVERY_WAIT is set before calling pers->start_reshape(), and it's neve=
r
cleared from error path.

This should probably be fixed first, and then it's safe to remove the above=
 line.

>   	spin_lock_irq(&conf->device_lock);
>   	conf->geo =3D conf->prev;
>   	mddev->raid_disks =3D conf->geo.raid_disks;
>
> base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9

--=20
Thanks,
Kuai
