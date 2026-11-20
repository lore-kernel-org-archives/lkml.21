Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184330;
	b=IJwDOLCGsR2h8IAK+OOrsTCOF4XfzTKzccuitPOtraZ9yuFVfEsuPTL6cMgv4ZYIFaUJ
	 nue6D4DoOy8bF2ID2/A/F/Vb3fBTY+3Oos8EjMDUsHtPpJJdwP9Rb5gacVMPWqO8NujjT
	 SKTKX88pbVaICXA9LiIOLSs5pLIm7PG93jBK3/6gsYiKR7mex7biFjC+4efnt7rpRnLbG
	 HXsGIqkI71b0J860ht/if2YwigFRYt/X7evGyPYQHYFQ1g+0qOQ35Z5twytdg/mEzkbGs
	 w8kZxPhiWx4Kqfy/yER5Cyz/h52+74dHAdkoTVuZppSWQPRK6/Rj9j/z1O9GlkGe5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184330;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xpUqRl4Aaxj/WCLeF5DrO15MLO1zcVeuU/w4H9c77r4=;
	b=qxulgdhkCP+oXUuV31uU8+dxLu/9ZFFM58s4JNi8D1axubF0GaMztf0BYnekQdpd6BIb
	 d5em/cDBdH0jrTJi4UKpEB9LrVf2+tmpmQAE4YtQNQHNrbFcLJnOfr+Dx0eBwqwZ3UTbz
	 JGoKDaRdRJBLogyZ5ayOeIaAb52xnbaAtUYXxJgzEDH7+Hg4IwHHOkoL9AMgqSYt9EdB2
	 QeZck0LW+deIG/CyVhk7GZJ0JllQb+593kzp0tZ6uAmFkw8/vMv/LUqiXe8jiTsGuOhGF
	 hLzpZcDmjQPFIcoKNI47pW2nQpOYqFZRYGVLPT3XSvitvumUfXPFMBJt12nSPcK87zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLiPT9Sp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78F606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cLiPT9Sp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8111F000D2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184329;
	bh=xpUqRl4Aaxj/WCLeF5DrO15MLO1zcVeuU/w4H9c77r4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cLiPT9SpvmSxjr4RX1ir2r5a90WNDeEsjdLJWTlHdW8EBaKukBG0Ken4FCWU3yb3c
	 0PCyigfNl2Nsdvv20baVHmFZI3hiANuTVhxZZ/j8DF6nf9cOhIR//X/nFOeVYyaRIt
	 +lRwTzap4WkxhB62nHvKxxPJa9LbgJoP5m/AVEmb7tVYVcPSD5MX93Wbq42m0NHiRr
	 hU3zzrPnXCyXyDStA4gvp8Ub4izDEj+T618psY0UB/MPr+SlTmfD+VinpbyQ/7jKOg
	 hlBdkUqVYtdMyhD8wTP0PuJcWZ9TMc3DThZpjyWzFqHV3dRJE3A8iWjfznWLx7RFNV
	 bVO8oHIgqc5lw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so777875e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:18:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHzqWJIm7bCAFZWP7UFAPvX5YDCx+RtGk6dkXSk21zqABr6m5sYPziuqLBXYQnZR6RWcUZen3Ylw3SlwhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z91iHwWepU6FHo+nL8J7H6G+dZOzDIK1d+FY/9P9FvfgdJpOLGp
	Bn1KoCRevzUpXjbfukmQ4w8ID44MD5OPOzP4cIlaM4VaTdgZhSj4ap15vUepckwpZvLwrssR8+B
	ihJ+VmzQBOZakS/HMByMGiTYnX14wefc=
X-Received: by 2002:a05:6512:1193:b0:5c1:57d3:efd0 with SMTP id
 2adb3069b0e04-5c1bc80fd63mr983187e87.35.1795184328215; Fri, 20 Nov 2026
 06:18:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119022330.2875110-1-qirui.001@bytedance.com>
In-Reply-To: <20261119022330.2875110-1-qirui.001@bytedance.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 15:18:35 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jV3N+BxXu2nE26O=kgkOjEWcLqV6h81oFjRGafssjDMQ@mail.gmail.com>
X-Gm-Features: Aa3M54q8hZTHxKC-3Usl98hv5e9Z_S2OsNHlXYHuKOTkUKHuqkb4kZljuwGrHUk
Message-ID: <CAJZ5v0jV3N+BxXu2nE26O=kgkOjEWcLqV6h81oFjRGafssjDMQ@mail.gmail.com>
Subject: Re: [PATCH] ACPI: GED: Add wake support for wake-capable interrupts
To: Rui Qi <qirui.001@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, okaya@codeaurora.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 3:23=E2=80=AFAM Rui Qi <qirui.001@bytedance.com> wr=
ote:
>
> GED interrupt resources can be marked wake-capable by firmware, but the
> GED driver does not enable IRQ wake for them. Consequently, the generic
> IRQ suspend code disables those interrupts along with ordinary device
> IRQs, preventing them from waking a system in suspend-to-idle.
>
> Enable IRQ wake after registering each interrupt whose resource has
> IORESOURCE_IRQ_WAKECAPABLE set. Remember successful enables per event
> so that releasing the event disables IRQ wake before freeing the IRQ.
> This supports multiple wake interrupts on one GED without relying on
> the single wake IRQ slot in struct device.
>
> Keep runtime event handling available if enabling IRQ wake fails, and
> warn about the missing wake functionality. Release previously registered
> events when walking _CRS fails, balancing both IRQ registrations and wake
> references before device-managed event storage is released.
>
> This does not implement device _PRW-to-GED mappings or infer wake
> capability for interrupt resources not marked wake-capable by firmware.
>
> Fixes: 3db80c230da1 ("ACPI: implement Generic Event Device")
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  drivers/acpi/evged.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/acpi/evged.c b/drivers/acpi/evged.c
> index 189dc68b8875..8afae44ac2b3 100644
> --- a/drivers/acpi/evged.c
> +++ b/drivers/acpi/evged.c
> @@ -51,6 +51,7 @@ struct acpi_ged_event {
>         unsigned int gsi;
>         unsigned int irq;
>         acpi_handle handle;
> +       bool wake_enabled;
>  };
>
>  static irqreturn_t acpi_ged_irq_handler(int irq, void *data)
> @@ -81,6 +82,7 @@ static acpi_status acpi_ged_request_interrupt(struct ac=
pi_resource *ares,
>         struct acpi_resource_extended_irq *pext =3D &ares->data.extended_=
irq;
>         char ev_name[5];
>         u8 trigger;
> +       int ret;
>
>         if (ares->type =3D=3D ACPI_RESOURCE_TYPE_END_TAG)
>                 return AE_OK;
> @@ -133,11 +135,34 @@ static acpi_status acpi_ged_request_interrupt(struc=
t acpi_resource *ares,
>                 return AE_ERROR;
>         }
>
> +       if (r.flags & IORESOURCE_IRQ_WAKECAPABLE) {
> +               ret =3D enable_irq_wake(irq);
> +               if (ret)
> +                       dev_warn(dev, "failed to enable wakeup for irq %u=
: %d\n",
> +                                irq, ret);
> +               else
> +                       event->wake_enabled =3D true;
> +       }
> +
>         dev_dbg(dev, "GED listening GSI %u @ IRQ %u\n", gsi, irq);
>         list_add_tail(&event->node, &geddev->event_list);
>         return AE_OK;
>  }
>
> +static void ged_release_events(struct acpi_ged_device *geddev)
> +{
> +       struct acpi_ged_event *event, *next;
> +
> +       list_for_each_entry_safe(event, next, &geddev->event_list, node) =
{
> +               if (event->wake_enabled)
> +                       disable_irq_wake(event->irq);
> +               free_irq(event->irq, event);
> +               list_del(&event->node);
> +               dev_dbg(geddev->dev, "GED releasing GSI %u @ IRQ %u\n",
> +                       event->gsi, event->irq);
> +       }
> +}
> +
>  static int ged_probe(struct platform_device *pdev)
>  {
>         struct acpi_ged_device *geddev;
> @@ -153,6 +178,7 @@ static int ged_probe(struct platform_device *pdev)
>                                        acpi_ged_request_interrupt, geddev=
);
>         if (ACPI_FAILURE(acpi_ret)) {
>                 dev_err(&pdev->dev, "unable to parse the _CRS record\n");
> +               ged_release_events(geddev);
>                 return -EINVAL;
>         }
>         platform_set_drvdata(pdev, geddev);
> @@ -163,14 +189,8 @@ static int ged_probe(struct platform_device *pdev)
>  static void ged_shutdown(struct platform_device *pdev)
>  {
>         struct acpi_ged_device *geddev =3D platform_get_drvdata(pdev);
> -       struct acpi_ged_event *event, *next;
>
> -       list_for_each_entry_safe(event, next, &geddev->event_list, node) =
{
> -               free_irq(event->irq, event);
> -               list_del(&event->node);
> -               dev_dbg(geddev->dev, "GED releasing GSI %u @ IRQ %u\n",
> -                        event->gsi, event->irq);
> -       }
> +       ged_release_events(geddev);
>  }
>
>  static void ged_remove(struct platform_device *pdev)
> --

Applied as 7.5 material, thanks!
