Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197296;
	b=t6HxwobK7MucoN+qQWx2DCs349p0dGdaDnBgImXAH635lZoGxmQpPD7VRqt0UElLAODb
	 KFz0L7trbZUU1ungIJVUdIQIwBGm32WstJvMHZ1v7Y7Zl7YGqX5pakLGPWfVCIVA1ceLn
	 vSNorpWnBIJL3yEbyOMbH7bL8QWuo7nDo/lWu77WLjzcTjxFf2LTUPmRP9Rmjdm7U1ZQR
	 lpIKtjJEh2SHtrMthVc4rLR+tvaYiVavvaD5fMRRUXDfPPGOO1r7AfGV843EROPeo8L19
	 3i7bbVIUsBqsNM6QmzU3LehSptJDsH0wKL+mPfLi8583uW9S2FBdoon74Vni9JYXe7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197296;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dKrmLiXU2F487bqrAOIazBqAgREKSs8080df6vNjwXY=;
	b=y8RP+Qo4ZLLp1Oip9Mt/l+gizDevEK9IpciCjiSrme1JJ90BUt4oVmaw+dKRr2u0HqKy
	 m7gBhIVNISAY8DGH8e5AVXD1dYBd4hhjbrYyNOYeVA172H5Up9eDYwG1ONj/XpT8It/VP
	 Cpb4OeObrUTwoANR4UJNt0XbU2NVxu4aiU/xW6OONPCx5QukJ3Edo+ELBGkfg8ndVjXFO
	 1mievRuh1CEjQfHoUNGhL7hQcBVt97vlC84+Kwdxr/nDl/Kl+nafce9gPm114XaY1avUI
	 6nbEpItvrJw9Z42SU8VNSXeYXezAbgEYXXlLzpTqh/gbKn36FMkR7wSSfY5gGwz+Pwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxnrnQiV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2560A380C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HxnrnQiV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06A71F00A3C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197295;
	bh=dKrmLiXU2F487bqrAOIazBqAgREKSs8080df6vNjwXY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HxnrnQiVLW3ZnOR3uRlDYCwz9NVO84sq1aERU+XGJxa5P98Qu/z/0xWUUfPT+2+t1
	 /RfOthkV9UAX2QlcDl/j+gkqaoFvo9a18ZoQfNmMjyfMulj483u0L6J+woa213TGy9
	 ypiVv/vsyFIEYRgZKcG0uLSh2j0/QD4hecccbDnwqxbGZlW3fPDXWg11xoQcshHs9j
	 sCzr+U0Vzn5o9tBYuMvhBOGA2psdGM9Vm620SF2wh8CDeMxWjmbYM9KoFM4aOMcsOL
	 CJWkEe/wAKtl95y+M/FmEYuqm5Gkm0jv/mODu0NiBISO7VWYrPs8F8YLk8GOLJpVlc
	 7PDe2O8BP4Haw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso930162e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRuA1XC+vJZzM64/wKZky3ucI4fuc3upFSLgtIW9WvRxMH5g6pEpwwvu0WRAuSVXFI+UI9bu5fjy5189M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ml+qgIcAHXK477QyZ7XWCxFlOjF2Qg3XtFmJPNQSoLqe/Q8ID
	wVjjnAjMt1cc9vzuLmhT38DlxaHIYFTzvP8xT5+0jl++Ve1M829nYZZ904gxWh3Gi2hd2+LzUvO
	o9iBUFMzizLtLuw5++5k69c4XzlI5M5U=
X-Received: by 2002:ac2:4c4b:0:b0:5c0:a54:5d4c with SMTP id
 2adb3069b0e04-5c1bc8635bfmr1193536e87.36.1795197294018; Fri, 20 Nov 2026
 09:54:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-pm-runtime-summary-v2-0-a3d8654baf8f@kernel.org> <20261116-pm-runtime-summary-v2-1-a3d8654baf8f@kernel.org>
In-Reply-To: <20261116-pm-runtime-summary-v2-1-a3d8654baf8f@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 18:54:39 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g+7zxWmUNt4b6NXQnWML-coCBDCqrZnVpD+7s=SmCAcw@mail.gmail.com>
X-Gm-Features: Aa3M54rjIr-lP8MdASeLxH5QB5e_sHkRORN5DH92yPw3YktljUsuSRiXGkY7deM
Message-ID: <CAJZ5v0g+7zxWmUNt4b6NXQnWML-coCBDCqrZnVpD+7s=SmCAcw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PM: runtime: add additional suspend/resume metrics
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Samuel Wu <wusamuel@google.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:36=E2=80=AFAM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> The current implementation only logs the total accumulated time a device
> spends in suspended or active states.
>
> Add tracking for:
> - resume_count : number of successful transitions to active
> - suspend_count: number of successful transitions to suspended
> - last_suspended_time: duration of the most recent sleep cycle (ns)
> - min_suspended_time / max_suspended_time: shortest and longest sleep
>   cycle durations to help detect power thrashing (ns)
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/base/power/runtime.c | 76 ++++++++++++++++++++++++++++++++++++++=
+++---
>  include/linux/pm.h           | 12 +++++++
>  2 files changed, 83 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 304a2b12342082ffacce32aa9c2e863466b0d4ae..3085318e9c32fce892def5a90=
1aae300f473ea2d 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -5,6 +5,8 @@
>   * Copyright (c) 2009 Rafael J. Wysocki <rjw@sisk.pl>, Novell Inc.
>   * Copyright (C) 2010 Alan Stern <stern@rowland.harvard.edu>
>   */
> +#include <linux/pm.h>
> +#include <linux/timekeeping.h>
>  #include <linux/sched/mm.h>
>  #include <linux/ktime.h>
>  #include <linux/hrtimer.h>
> @@ -103,11 +105,58 @@ static void update_pm_runtime_accounting(struct dev=
ice *dev)
>                 dev->power.active_time +=3D delta;
>  }
>
> +static void rpm_account_suspend(struct device *dev)
> +{
> +       dev->power.suspend_time =3D dev->power.accounting_timestamp;
> +       dev->power.suspend_count++;
> +}
> +
> +static void rpm_account_sleep_end(struct device *dev)
> +{
> +       u64 duration;
> +
> +       if (!dev->power.suspend_time)
> +               return;
> +
> +       if (dev->power.accounting_timestamp <=3D dev->power.suspend_time)
> +               return;
> +
> +       duration =3D dev->power.accounting_timestamp - dev->power.suspend=
_time;
> +       dev->power.last_suspended_time =3D duration;
> +
> +       /* Update min/max extrema at the exact same moment as last_suspen=
ded_time */
> +       if (!dev->power.min_suspended_time || duration < dev->power.min_s=
uspended_time)
> +               dev->power.min_suspended_time =3D duration;
> +
> +       if (duration > dev->power.max_suspended_time)
> +               dev->power.max_suspended_time =3D duration;
> +}
> +
> +static void rpm_account_resume_complete(struct device *dev)
> +{
> +       dev->power.resume_count++;
> +       dev->power.suspend_time =3D 0;
> +}
> +
>  static void __update_runtime_status(struct device *dev, enum rpm_status =
status)
>  {
> +       enum rpm_status old_status =3D dev->power.runtime_status;
> +
>         update_pm_runtime_accounting(dev);
>         trace_rpm_status(dev, status);
>         dev->power.runtime_status =3D status;
> +
> +       if ((old_status =3D=3D RPM_SUSPENDING || old_status =3D=3D RPM_AC=
TIVE) &&
> +           status =3D=3D RPM_SUSPENDED)
> +               rpm_account_suspend(dev);
> +       else if (old_status =3D=3D RPM_RESUMING && status =3D=3D RPM_SUSP=
ENDED)
> +               dev->power.suspend_time =3D dev->power.accounting_timesta=
mp;
> +       else if (old_status =3D=3D RPM_SUSPENDED && status !=3D RPM_SUSPE=
NDED)
> +               rpm_account_sleep_end(dev);
> +
> +       if ((old_status =3D=3D RPM_RESUMING || old_status =3D=3D RPM_SUSP=
ENDED) &&
> +           status =3D=3D RPM_ACTIVE)
> +               rpm_account_resume_complete(dev);
>  }
>
>  static u64 rpm_get_accounted_time(struct device *dev, bool suspended)
> @@ -1571,6 +1620,7 @@ EXPORT_SYMBOL_GPL(__pm_runtime_disable);
>  void pm_runtime_enable(struct device *dev)
>  {
>         unsigned long flags;
> +       u64 now;
>
>         spin_lock_irqsave(&dev->power.lock, flags);
>
> @@ -1587,12 +1637,21 @@ void pm_runtime_enable(struct device *dev)
>                 dump_stack();
>         }
>         dev->power.last_status =3D RPM_INVALID;
> -       dev->power.accounting_timestamp =3D ktime_get_mono_fast_ns();
> +       now =3D ktime_get_mono_fast_ns();
>
> -       if (dev->power.runtime_status =3D=3D RPM_SUSPENDED &&
> -           !dev->power.ignore_children &&
> -           atomic_read(&dev->power.child_count) > 0)
> -               dev_warn(dev, "Enabling runtime PM for inactive device wi=
th active children\n");
> +       if (dev->power.runtime_status =3D=3D RPM_SUSPENDED) {
> +               if (dev->power.suspend_time && dev->power.accounting_time=
stamp
> +                   && now > dev->power.accounting_timestamp)
> +                       dev->power.suspend_time +=3D now - dev->power.acc=
ounting_timestamp;
> +               else
> +                       dev->power.suspend_time =3D now;
> +
> +               if (!dev->power.ignore_children &&
> +                   atomic_read(&dev->power.child_count) > 0)
> +                       dev_warn(dev, "Enabling runtime PM for inactive d=
evice with active children\n");
> +       }
> +
> +       dev->power.accounting_timestamp =3D now;
>
>  out:
>         spin_unlock_irqrestore(&dev->power.lock, flags);
> @@ -1861,6 +1920,13 @@ void pm_runtime_init(struct device *dev)
>         pm_suspend_ignore_children(dev, false);
>         dev->power.runtime_auto =3D true;
>
> +       dev->power.resume_count =3D 0;
> +       dev->power.suspend_count =3D 0;
> +       dev->power.suspend_time =3D 0;
> +       dev->power.last_suspended_time =3D 0;
> +       dev->power.min_suspended_time =3D 0;
> +       dev->power.max_suspended_time =3D 0;
> +
>         dev->power.request_pending =3D false;
>         dev->power.request =3D RPM_REQ_NONE;
>         dev->power.deferred_resume =3D false;
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index ef3f1310e749c34d4aff75a2fd7e95b9f2ef3a10..7cd1350ea327be4e800175c2f=
c0e3b3e35c3ea57 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -747,6 +747,12 @@ struct pm_subsys_data {
>   *   state.
>   * @accounting_timestamp: Timestamp in nanoseconds of the last runtime P=
M state
>   *   accounting update.
> + * @resume_count: Number of transitions from suspended -> active
> + * @suspend_count: Number of transitions from active -> suspended
> + * @suspend_time: Timestamp when device entered RPM_SUSPENDED
> + * @last_suspended_time: Residency of the last sleep period (ns)
> + * @min_suspended_time: Shortest sleep duration
> + * @max_suspended_time: Longest sleep duration
>   * @subsys_data: Subsystem-specific power management data.
>   * @set_latency_tolerance: Callback for setting latency tolerance.
>   * @qos: Per-device PM Quality of Service (QoS) constraints.
> @@ -816,6 +822,12 @@ struct dev_pm_info {
>         u64                     active_time;
>         u64                     suspended_time;
>         u64                     accounting_timestamp;
> +       u64                     resume_count;
> +       u64                     suspend_count;
> +       u64                     suspend_time;
> +       u64                     last_suspended_time;
> +       u64                     min_suspended_time;
> +       u64                     max_suspended_time;

Can we please put those new fields behind CONFIG_DEBUGFS?

They would just be pure useless overhead without it AFAICS.

>  #endif
>         struct pm_subsys_data   *subsys_data;  /* Owned by the subsystem.=
 */
>         void (*set_latency_tolerance)(struct device *, s32);
>
> --
