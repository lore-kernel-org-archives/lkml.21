Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181258;
	b=kfBYH7QvuNsVMToIcJqaEoHVDx51004u6prOn3C8K/m+CAHI90k9ZBWtCZbee7JQXdvq
	 fA7A/4z/ha6+NzG80EJuv9LflqmMG5aqKpLDE6C2vkQ+rqh3d8mQ1E4TqiPOnnsCvRAuA
	 q/bfyWF63035meF3VBIsxd4u8MaJcxMU30amBR+lea7L2EQ1ylH3drFb6ZM6xFwopgMmF
	 ZNKiNLcNV1tMBNJXDSlmeFvJKyv6qsqEbF0d8+XMG2TctMnNbXDPQg8ljHFYyxIy4aMDo
	 jVQkJgqmtH4ZF6o1xtdEIiEmiyWpUUBfZoRR6M698ykz6kR0noc9ex93C3HJJ4XsGAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181258;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hc105Xifh5fHRxAJ8VF5XEpNBykHa30H+JiDrPl/g04=;
	b=EQmAf1H4cktabGDCPp1cBRb7uKAz8efvtx6k7L7zPKz2avgTgXQ6VSe4otF/lIOvsqWy
	 y5hdON2wXnZhxsFwouHyQahrByO59mdzMar5tDvatZOuu98/rqpLnXtY2qeG54nuUnV+3
	 9fvVFjnR1BB67FeqLkedw3veBGeCEwcMsUIEpUwcvjEGcifwddwsx3L3iApszi0Gz+Iei
	 ory4+NRbjDWA1PNUsCNCL/igMC/VwhcxrewOD3bLdw7tY0E+mnWsVysNFDifQXm6ZKacT
	 /PP8scomrC3PcwRSZRqztDqGM37JS4eQUGaCFK4B9nl72h/m7EUbPZzymsif0T+hXmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpBnBMyf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA124606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VpBnBMyf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DD31F000C4
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795181258;
	bh=Hc105Xifh5fHRxAJ8VF5XEpNBykHa30H+JiDrPl/g04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VpBnBMyfHfKRbyF3Rsa+lAtgbMyp82V4e1bqVlg5BXhZsXOqKRRSG1+XHzNZDNgle
	 f+qxPA7XsSNLcHycL1e3G6y1LRpvGhmZtynvyp3yuiUENpzPKXi03xbkdexNRmkLg0
	 K5qfx6GO4GELYKxvCiQpUK7DjQ0eL7GpeSCBxcGjDfH2cfZMCHoAu/yUpKpOcxSDpv
	 rpixGWgpc6P8wzLAPeDWyKGoGnF4DCPaYKSmXneFDQnzENTNY5K+yJ/9L7pyjRgto9
	 vTNp+d6+qNYPCuV5z3oYvPJI3+6yVehpt0hLAmWBMpMBBQZRZ0nX+HVoroyTVDWDkX
	 iHF9Y7Mk6mMaQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso585176e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:27:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEVvAIJ5SgxorYNfaIWrk80V9YJ4jcdFkRvB6Dhfi3cUJewO/sqCM3pMM258z3xIyEySEIlUvhRJGXLiYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91zK9aZs5WU/nGxF18TXOhwLN/rGuD1wV0oNpLp7/6piPD7kKp
	x3XUEVfFY3s7vL4HR6k8jtEiDN8+W/YoTg2J4ibHgaGsRr8AwaM1VaLD97LLP0Y55Cclq2Y8qfh
	XbJpmHPoAtIqgyD8MmePNDG6QAhcFUCg=
X-Received: by 2002:a05:6512:3a86:b0:5bf:cfc4:19ea with SMTP id
 2adb3069b0e04-5c1bc89a85bmr1001039e87.41.1795181256500; Fri, 20 Nov 2026
 05:27:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114002612.219894-2-pmenzel@molgen.mpg.de>
In-Reply-To: <20261114002612.219894-2-pmenzel@molgen.mpg.de>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 14:27:23 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hqQzn6qpqtKi5QmTGcsG5hk9Np9ih68_vDksYcHQv6+A@mail.gmail.com>
X-Gm-Features: Aa3M54q2N71T0UGv3AEK-_9xZnoqZ-S4CdjQSFsNKpVqK6SjIlxN2LRyQPy1yjA
Message-ID: <CAJZ5v0hqQzn6qpqtKi5QmTGcsG5hk9Np9ih68_vDksYcHQv6+A@mail.gmail.com>
Subject: Re: [PATCH] ACPI: battery: Refresh the battery asynchronously after
 system resume
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 1:26=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> The PM_POST_SUSPEND notifier evaluates _BIX, _BTP and _BST synchronously,
> and the notifier chain is the last step of the system resume: the write t=
o
> /sys/power/state, and so systemd-sleep and everything waiting for it, onl=
y
> returns after it.
>
> On a Dell XPS 13 9310 nearly all of the PM_POST_SUSPEND notifier chain is
> battery_notify() (143 ms with the function_graph tracer):
>
>     @ 143043.5 us |        } /* battery_notify [battery] */
>     @ 143513.1 us |      } /* notifier_call_chain */
>     @ 143536.0 us |  } /* pm_notifier_call_chain */
>
> Queue the refresh on system_freezable_wq instead.
>
> Time from "Restarting tasks: Done" (end of thaw_processes) to "PM: suspen=
d
> exit" for suspend-to-idle cycles of 8 s with sleepgraph, in ms, on Linux
> 7.4-rc1 with other resume changes, which do not run in this phase:
>
>                   panel lit at suspend       panel off at suspend
>     before        24.5  26.7  27.3  29.4     58.8  60.4  85.2
>     after         10.7  10.8  15.9  17.7      5.7   8.3   9.3
>     median        27.0 -> 13.4               60.4 -> 8.3
>
> After the change, pm_notifier_call_chain(PM_POST_SUSPEND) takes
> 0.7-0.9 ms (function_graph, three cycles, hwrng_pm_notifier() being the
> largest), so the rest of the phase is outside the notifier chain.  The
> refresh still runs after each resume (kprobes, three cycles):
> battery_notify() returns after 4-8 us, acpi_battery_pm_worker() starts
> 0.02-0.2 ms later and takes 17.8-18.6 ms, and it ends after rtcwake has
> already returned.
>
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>

Applied as 7.5 material, thanks!

> ---
>
> Notes:
>     Assisted-by: claude-opus-5.5 (Claude Code), analysis and patch
>     draft; I reviewed it.
>
>  drivers/acpi/battery.c | 63 +++++++++++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
> index 6edea559a5bce..4e2a79d356ef9 100644
> --- a/drivers/acpi/battery.c
> +++ b/drivers/acpi/battery.c
> @@ -105,6 +105,7 @@ struct acpi_battery {
>         struct kfifo acpi_notif_fifo;
>         struct delayed_work acpi_notif_dwork;
>         struct notifier_block pm_nb;
> +       struct work_struct pm_work;
>         struct list_head list;
>         unsigned long flags;
>
> @@ -1293,40 +1294,48 @@ static void acpi_battery_notify(acpi_handle handl=
e, u32 event, void *data)
>         pr_err_ratelimited("too many battery notifications within %dms\n"=
, NOTIF_MERGING_MS);
>  }
>
> -static int battery_notify(struct notifier_block *nb,
> -                         unsigned long mode, void *_unused)
> +static void acpi_battery_pm_worker(struct work_struct *work)
>  {
> -       struct acpi_battery *battery =3D container_of(nb, struct acpi_bat=
tery,
> -                                                   pm_nb);
> -
> -       if (mode =3D=3D PM_POST_SUSPEND || mode =3D=3D PM_POST_HIBERNATIO=
N) {
> -               guard(mutex)(&battery->update_lock);
> -
> -               if (!acpi_battery_present(battery))
> -                       return 0;
> -
> -               if (battery->bat) {
> -                       acpi_battery_refresh(battery);
> -               } else {
> -                       int result;
> +       struct acpi_battery *battery =3D container_of(work, struct acpi_b=
attery,
> +                                                   pm_work);
>
> -                       scoped_guard(mutex, &battery->property_lock) {
> -                               result =3D acpi_battery_get_info(battery)=
;
> -                               if (result)
> -                                       return result;
> -                       }
> +       guard(mutex)(&battery->update_lock);
>
> -                       result =3D sysfs_add_battery(battery);
> -                       if (result)
> -                               return result;
> -               }
> +       if (!acpi_battery_present(battery))
> +               return;
>
> +       if (battery->bat) {
> +               acpi_battery_refresh(battery);
> +       } else {
>                 scoped_guard(mutex, &battery->property_lock) {
> -                       acpi_battery_init_alarm(battery);
> -                       acpi_battery_get_state(battery);
> +                       if (acpi_battery_get_info(battery))
> +                               return;
>                 }
> +
> +               if (sysfs_add_battery(battery))
> +                       return;
>         }
>
> +       scoped_guard(mutex, &battery->property_lock) {
> +               acpi_battery_init_alarm(battery);
> +               acpi_battery_get_state(battery);
> +       }
> +}
> +
> +static int battery_notify(struct notifier_block *nb,
> +                         unsigned long mode, void *_unused)
> +{
> +       struct acpi_battery *battery =3D container_of(nb, struct acpi_bat=
tery,
> +                                                   pm_nb);
> +
> +       /*
> +        * Evaluating _BIX, _BTP and _BST takes tens of milliseconds on s=
ome
> +        * systems, and the PM notifier chain delays the end of the syste=
m
> +        * resume, so do it asynchronously.
> +        */
> +       if (mode =3D=3D PM_POST_SUSPEND || mode =3D=3D PM_POST_HIBERNATIO=
N)
> +               queue_work(system_freezable_wq, &battery->pm_work);
> +
>         return 0;
>  }
>
> @@ -1516,6 +1525,7 @@ static int acpi_battery_probe(struct platform_devic=
e *pdev)
>         if (result)
>                 return result;
>
> +       INIT_WORK(&battery->pm_work, acpi_battery_pm_worker);
>         battery->pm_nb.notifier_call =3D battery_notify;
>         return register_pm_notifier(&battery->pm_nb);
>  }
> @@ -1525,6 +1535,7 @@ static void acpi_battery_remove(struct platform_dev=
ice *pdev)
>         struct acpi_battery *battery =3D platform_get_drvdata(pdev);
>
>         unregister_pm_notifier(&battery->pm_nb);
> +       cancel_work_sync(&battery->pm_work);
>  }
>
>  /* this is needed to learn about changes made in suspended state */
> --
> 2.54.0
>
