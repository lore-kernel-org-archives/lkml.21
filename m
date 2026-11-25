Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611675;
	b=e8+HZpSkW/k9za3Ed3+GlFn0+75bzqzrcD2YjoGtLb1pbaCoVsu6yxUidNw5ELMltrxu
	 NuRKA8VlrmjXA/twnR9UVYELeBVFWxblLTOSCcdtVkMTkwT77vopvBVCk2ERzDJOqqZ2M
	 +ZN0DhjYKVD4CpeFGUz8S3GKIBV7uUthGPUS7qppwvDkFsXRlpRUIe0gjUqPdBpaKXERx
	 l07ywEO2223YpjnrP/ffWUnyi4rhAaP/JB4E4aeTTHAvbdEBtQOsLtMN9wL93YI9hJ/3c
	 Ak/u3nfyN+wLDIP0U7xGPmV8Xmb1wGEIKdP8OvDUISTT91Ip+TcFfnxFAl2MkJ60WZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611675;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s4z1Ffojaf9vgBuZCxjV4xyWv+c033IP30jHE3CryFk=;
	b=z8kBVIHuTlOFcRKf7FeKClveUP9SKSgv5yoj/r+x+AoyQ4hMxJ5n7oq+be+aSeTuims6
	 xpVw9GbGlNx1Vym4pyHWt+WpQET1dcvZXMC4J5tQg/zYzGcZ8EYMq+KQceF+LkqfouMDK
	 h0gMmDWw15pQe60eYgkpQDTvQ1L/GN0C/fuz5Y7FUm65VonRJwnVxsd4V0PNtRvRo0ttZ
	 ocC4ubVnxmbvxvZ1Lz17armpK2BxbzFpijntroX+QS+FzIsdOE0ByEgEKXjuWI0bRwuLm
	 llNWV6aPi71WThPs07zw6vkPa0cpqZlDIYj0aK32yAC9IaVU+B6YONNTbuuoV9wJJrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj7v6ZK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB06606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj7v6ZK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1391F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611675;
	bh=s4z1Ffojaf9vgBuZCxjV4xyWv+c033IP30jHE3CryFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jj7v6ZK8vjVARoMeNQWH3qgat+zbzdL2pRP0vCtAl8RWHd1H7iwPpNQN2VXsPeB3G
	 ovpgOR1oV86Z+F49E/KBXC75/w1XNIRD6RlMtKUMyBrsKfARecjT9r9Ei4Dkau4Fds
	 /YPJ1K5+VZgnAoAHW6gN/7Xc3qkb+L0+oVsmtejwCkEbICSMr/u0yRp01t2A3A3LIS
	 QfUwT98gLI1P2BvCCn4GNAuApewXZ9mYCpsNzo+/PD6FnS5ejADDEFgRAPXTq0pb0T
	 NxForsRI95MY6m2RsZ6fMYojL0JRlVuCbPt/hn3qkAljdvW+ttZaAO3Y4S8q3/pGhG
	 wxHCSiK65G69w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so51640801fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHNacd2WpIwOPF7/EGYFxO7VG76AwM8SbHXEiJQso924SdDFyqnRlPG4btMzDQvVBFPF9Oa6UVO7+Hj16U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NE6knH5+iQru+IJRcNCBmYUUkQ9jEMfdFcCzv4IWzpy3eDuRs
	k1hfPrFXPBc6OH2eQ1kLQINM3GJj34/ruJZG58LscectmwuPwkUnqp7LAhP1LgPUSHRCRKULqkl
	mV8HlWdW4PSeJFoVX3htS35HSYhETADE=
X-Received: by 2002:a05:6512:10cd:b0:5c1:ae60:9b12 with SMTP id
 2adb3069b0e04-5c1bc89ee76mr4870782e87.60.1795611673387; Wed, 25 Nov 2026
 05:01:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-pm-runtime-summary-v3-0-81a966953a81@kernel.org> <20261123-pm-runtime-summary-v3-2-81a966953a81@kernel.org>
In-Reply-To: <20261123-pm-runtime-summary-v3-2-81a966953a81@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 14:01:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iJ2ytkT2-JJTONCvYx3s-kOOtxopFkdbtGzHNQWOwJgg@mail.gmail.com>
X-Gm-Features: Aa3M54rBrqs5vJZYDvCdW7zNfFxUBVdg8rbR2V3HBHj6z7GBr6vpKn8rCF1Z5qc
Message-ID: <CAJZ5v0iJ2ytkT2-JJTONCvYx3s-kOOtxopFkdbtGzHNQWOwJgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PM: runtime: add debugfs entry for pm_runtime_summary
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Samuel Wu <wusamuel@google.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:07=E2=80=AFAM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> Add a debugfs entry for showing the runtime statistics for devices with
> PM runtime enabled.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/base/power/runtime.c | 86 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 17aee68366cf..cf657251633e 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -14,6 +14,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_wakeirq.h>
>  #include <linux/rculist.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
>  #include <trace/events/rpm.h>
>
>  #include "../base.h"
> @@ -2223,3 +2225,87 @@ bool pm_runtime_need_not_resume(struct device *dev=
)
>  }
>
>  #endif /* CONFIG_PM_SLEEP */
> +
> +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_PM_SLEEP)

Why do you want to make it depend on CONFIG_PM_SLEEP?

There's nothing related to system sleep in it AFAICS.

> +static void rpm_summary_show_dev(struct device *dev, void *data)
> +{
> +       struct seq_file *s =3D data;
> +       unsigned long flags;
> +       u64 active_time, suspended_time;
> +       u64 last_sleep, min_sleep, max_sleep;
> +       u64 resumes, suspends;
> +       const char *status_str;
> +       bool enabled;
> +
> +       spin_lock_irqsave(&dev->power.lock, flags);
> +
> +       enabled =3D pm_runtime_enabled(dev);
> +       if (!enabled && !dev->power.resume_count && !dev->power.suspend_c=
ount) {
> +               spin_unlock_irqrestore(&dev->power.lock, flags);
> +               return;
> +       }
> +
> +       update_pm_runtime_accounting(dev);
> +
> +       switch (dev->power.runtime_status) {
> +       case RPM_ACTIVE:
> +               status_str =3D "active";
> +               break;
> +       case RPM_SUSPENDED:
> +               status_str =3D "suspended";
> +               break;
> +       case RPM_SUSPENDING:
> +               status_str =3D "suspending";
> +               break;
> +       case RPM_RESUMING:
> +               status_str =3D "resuming";
> +               break;
> +       default:
> +               status_str =3D "unknown";
> +               break;
> +       }
> +
> +       active_time =3D dev->power.active_time;
> +       suspended_time =3D dev->power.suspended_time;
> +       resumes =3D dev->power.resume_count;
> +       suspends =3D dev->power.suspend_count;
> +       last_sleep =3D dev->power.last_suspended_time;
> +       min_sleep =3D dev->power.min_suspended_time;
> +       max_sleep =3D dev->power.max_suspended_time;
> +
> +       spin_unlock_irqrestore(&dev->power.lock, flags);
> +
> +       do_div(active_time, NSEC_PER_MSEC);
> +       do_div(suspended_time, NSEC_PER_MSEC);
> +       do_div(last_sleep, NSEC_PER_MSEC);
> +       do_div(min_sleep, NSEC_PER_MSEC);
> +       do_div(max_sleep, NSEC_PER_MSEC);
> +
> +       seq_printf(s, "%-32s %-12s %8llu %8llu %12llu %12llu %10llu %10ll=
u %10llu\n",
> +                  dev_name(dev), enabled ? status_str : "disabled",
> +                  resumes, suspends, active_time, suspended_time,
> +                  last_sleep, min_sleep, max_sleep);
> +}
> +
> +static int pm_runtime_summary_show(struct seq_file *s, void *unused)
> +{
> +       seq_printf(s, "%-32s %-12s %8s %8s %12s %12s %10s %10s %10s\n",
> +                  "Device", "Status", "Resumes", "Suspends",
> +                  "Active(ms)", "Suspend(ms)", "Last(ms)", "Min(ms)", "M=
ax(ms)");
> +       seq_puts(s, "----------------------------------------------------=
----------------------------------------------------------------------\n");
> +
> +       dpm_for_each_dev(s, rpm_summary_show_dev);
> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(pm_runtime_summary);
> +
> +static int __init pm_runtime_debugfs_init(void)
> +{
> +       debugfs_create_file("pm_runtime_summary", 0444, NULL, NULL,
> +                           &pm_runtime_summary_fops);
> +
> +       return 0;
> +}
> +late_initcall(pm_runtime_debugfs_init);
> +#endif /* defined(CONFIG_DEBUG_FS) && defined(CONFIG_PM_SLEEP) */
>
> --
> 2.47.3
>
