Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795068301;
	b=hb7iw8MRKTH+9QK8qMK/xINaLSX+nhOx+NgwMN8YZeXGBDLPNUPBGMNXZaK89oXH5xPh
	 7frJO76XrfJJ9V6cunJovQTUiB0IXYVCKGsYwAnMpUBUpBLvVIsJZY9aR6poHPU0gmklj
	 mAHd9HWUEL9jZqlHrIHXGQ6cRy6RPtQ4sUezECCxLO/Cd0EBFlyVCz6WTppRrsNO3VcXN
	 f8mZ7U1TD/ugligKs5gcp6gMmHgO3DajeF6LfujKcqgPya1bjjgRtUJzi6W0kgQuUqcNb
	 zvSG3h2z4D3BLcfMpvIm/qkSEOSY7YFlrRdjBQkmIPSGdd6Bjzx+AWfZeHsmkIr9NpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
	b=Z/IKIdJp6fsEeFpuXYmS8dqyGQa6hxlb+dPnxC5kuG5z3phANDQtn3mfkUaoykjV5Aqe
	 HxNOrWghV6aDBT283mJKm/z8ffWZ2UxwsMTKpNgpgSrzvxMe24fscKnMJtG7YIk8rh+d0
	 Zy50qop852PCftHUg0AAvsaYYuf6+QrQ3if1yotDXhp+tAtNH4OBUX9lOuqgwcsHekW7c
	 h9SiBj2QG7mrBiyN3dgsguhND37BeSczxSk0SLc1bd3zRHg321Avy49blczg4/VDxtKOm
	 X4LizECSsVjxxJFlK5e+btd8fPxCBPxKzItwY2sQIR7iK02iXp8K9XpB8Tcd/V31q7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Srhn8kN1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A50606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70A50606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Srhn8kN1
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so2046228a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795068299; cv=none;
        d=google.com; s=arc-20260327;
        b=PWleVBYVv51QW5hPhIXl+Yp5WRcCMIJ96HYrqssUqcAVTADKTO9mefX31LFa9f3W59
         +hFfwsZo7CEltjTf9Xij9JrYdWk9KjvUEDOXUEsc3zIPg7lHgE7O1c5CssQfG6IGjLsD
         w8n2MjgIqiw3nuub16tGX6p1VtjXC2OmCxRPEQ+rs/q4XEv6hD5Wp6tltWGbKyMG/qli
         WmHBtX210pqx8LDh942NdQOg4A/NbXaly/qap9fLIEJuIeovp6GGYfO5wq5C9iR+troA
         iV5bc99h8ynPy4YW5S+dw3y7MwEdK2gkDIEkSzg/JrCbxsSUAi8/T+H7wwRz9KwyBOyg
         ZFew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        fh=NJ//OYuMPRFzBTEtdYwlqGppgXy1hTFw12jH5DdXzj4=;
        b=redH2VHdkzafl+g9hKGvErF4xIHdKegz36cLPjwtfRx+vbD9b1XmcgsmxrGy8tB1UE
         +CSBFb7cCtHrD5dqCIqs+E9q1Pjxnf/v4SMSdWjE4I5PO5AGxbbg/DBgnTL7HtlW+678
         viC6mtuvaWwPcivVIskTKzgJZhQuAcQzNbWdGa/QLo3uhgwZMtncZzhJzqXr475a8F0D
         MVj+bQZCSPQvNAYvRVLl+dS+Rk+DFGRmvHycnhZjlM0z/YNSW0HRLYguzi23+D5mLl60
         gMQ4NWA69JLU7UZxnVCo6n8E2qEcyAXbZTBCHiZ8NQQy5ldBdcZ43Kx4a3abwKtMA+yb
         YoJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795068299; x=1795673099; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        b=Srhn8kN12nw+CtlFdussih8FNlkzw7xSWmlWQS3NXEt1CeYxD0zgzhfwQuOG8/RnnW
         qN9wkngaExKG0jk0yITi3/m6RXrq6yRQ3+EO8AGWh/fb/a1AJ2ELlnTZc2QE9H2XyS3r
         AMUC+WgI3TSGOgqTiVjwFST8sobzRjZbjioDbBvkMZC+rSKzX0Uen4dG3iAljyBAE09q
         9xXzO4qhuNeiWW/B8MPzwGI/0CM1/APkA0bn5r5qwKXaP5ivHTVipuF3sfBpf6CZfIMx
         JP0vz2eHw6rE9zmIPzRLvw8HjdLRNElAjs2OVsloF+a+SXdVvg12+OBJKjQg3ZlIOmQZ
         4fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068299; x=1795673099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        b=Z6UelT2AkGZ85vEzkY0aZTSaOgB+ATn3mGcSCU1bZ+j+b+0mhpPK0I8pSOiRUEKHPh
         Qr93x2IbHb1nqmrbubnBrchp/IOcuGWhZ/OWvNlzU0vm6Y1rsrlD+CpT9isXsyM3QMzh
         +o4HxHr5KFaCJUeAwIWiTrsSMiMu/oXZ+4QiuZqPX+bJtRFm2I06xg/7aBzSpssOgkyo
         mmwEesv7hZ8h7Xuu+6YkFViFoTgQ1+5ipI9ukFGC/Wgqv2Ttr838mO2dnIJzJaxYjiwC
         bm9mjpUR6WhG34E7R6cjI4/hyGTm9N5YLdEwZcNe3+YTIg308y8My7HBF4nE/GjyKlj+
         gNnA==
X-Forwarded-Encrypted: i=1; AL+hErH5g/KeNGr079oXfolwSiv39i2+pCbIh4XvhQRvqbEkPZweN3YQIPEliArpPRxOQTXEaLq91iYunTdK6A0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AFgbjLD0axpcKozfSs1lRJl7UdYnHIfURs4wi+mvvZrwu0A7A
	3IC0zSSixNEv2w43B2/KCsD0eery1krhhYZpinZUWV/h9maxnzzZoTf1HkEEyb9xr254vzTXA1Y
	u0cr8354vrdJy8RcEA6bjTGcPPL3LLBY=
X-Gm-Gg: AYBFou3YBsToLNvtxCNZF04pJMAEmR9WN9UBXdHQ82IK/hxHTwWpFb5084H3kjCj2Z6
	arux3YoE95Ab04ok+tdv9oOXtXQ/088QD6c+NeoJS458rIgA/sfYU6SQA04rTajgu6/FOgWN2Ff
	+4qU3VVm+aAjraI8g31Q63JqTJHw2eVUmNDLSWwutaiVtOZETzS6hrq+trsTll/qCoHArUdSarc
	kWTMcn4KMeVzqeQLx8yswotJizg7xBi8o68CayTwcboak0SE8bDwYm8ZyjHBvWhWrIiIbWdXU/3
	i/Wx5OrjdpylFqacsg20BLjhTQ5iTg+6iOepSCMMAyKbZSTSGgVQnVf7EgXLhchsK7GRVKiUgAV
	20/GWoste8lSjxYiyv3nmGLcJkAJnDTqAEzk=
X-Received: by 2002:a17:906:c104:b0:c4d:28ba:f221 with SMTP id
 a640c23a62f3a-c510e5903demr427620066b.42.1795068298655; Wed, 18 Nov 2026
 22:04:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
In-Reply-To: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Nov 2026 11:34:40 +0530
X-Gm-Features: AclHuK-yj0qp-k9YYA6fs3KiQog3XEeJOKWZ7G7ZFB-glkWEk6yaKExA1sPwYKk
Message-ID: <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip-host: Support hibernation with endpoints in D0
To: iav@iav.lv
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Igor,


On Thu, 19 Nov 2026 at 06:42, Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> The driver runs its suspend callback on every system sleep transition,
> including hibernation freeze and the quiesce step of the kernel that
> loads the image. The PCI core leaves the endpoints in D0 there, the
> link does not enter L2 after PME_Turn_Off, and hibernation aborts:
>
>   rockchip-pcie f8000000.pcie: PCIe link enter L2 timeout!
>   rockchip-pcie f8000000.pcie: PM: failed to freeze noirq: error -110
>
> Keep the link up across freeze and thaw. On restore, power the port
> down and bring it up as on resume, because the kernel that loaded the
> image may have left it in any state. The port may already be down if
> poweroff_noirq ran, so track that state.
>
It looks like we aren't disabling all the PCIe regulators (0.9V, 1.8V,
3.3V, and 12V)
during suspend and re-enabling them during resume.
Shouldn't we power down all of them on suspend and bring them back up on resume?

Thanks
-Anand

> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on v7.4-rc3 with this patch, ROCK Pi 4A with a WD SN770 NVMe:
> 5 of 5 hibernation cycles restored, the NVMe readable after each.
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 33 +++++++++++++++++++++++++++--
>  drivers/pci/controller/pcie-rockchip.h      |  1 +
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 1e1556e436b8..df4b9b3ec031 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -863,6 +863,8 @@ static int rockchip_pcie_suspend_noirq(struct device *dev)
>
>         regulator_disable(rockchip->vpcie0v9);
>
> +       rockchip->powered_down = true;
> +
>         return ret;
>  }
>
> @@ -893,6 +895,8 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
>         rockchip_pcie_update_txcredit_mui(rockchip);
>         rockchip_pcie_enable_interrupts(rockchip);
>
> +       rockchip->powered_down = false;
> +
>         return 0;
>
>  err_err_deinit_port:
> @@ -904,6 +908,25 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
>         return err;
>  }
>
> +static int rockchip_pcie_restore_noirq(struct device *dev)
> +{
> +       struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +
> +       /*
> +        * The boot kernel may have left the port in any state, while the image
> +        * holds the enable counts of a running port. Power it down so that
> +        * resume brings it up from scratch.
> +        */
> +       if (!rockchip->powered_down) {
> +               rockchip_pcie_deinit_phys(rockchip);
> +               rockchip_pcie_disable_clocks(rockchip);
> +               regulator_disable(rockchip->vpcie0v9);
> +               rockchip->powered_down = true;
> +       }
> +
> +       return rockchip_pcie_resume_noirq(dev);
> +}
> +
>  static int rockchip_pcie_probe(struct platform_device *pdev)
>  {
>         struct rockchip_pcie *rockchip;
> @@ -1011,9 +1034,15 @@ static void rockchip_pcie_remove(struct platform_device *pdev)
>         regulator_disable(rockchip->vpcie0v9);
>  }
>
> +/*
> + * Freeze leaves the endpoints in D0 and the link does not reach L2 then,
> + * so keep the link up across freeze and thaw; restore re-inits the port.
> + */
>  static const struct dev_pm_ops rockchip_pcie_pm_ops = {
> -       NOIRQ_SYSTEM_SLEEP_PM_OPS(rockchip_pcie_suspend_noirq,
> -                                 rockchip_pcie_resume_noirq)
> +       .suspend_noirq = pm_sleep_ptr(rockchip_pcie_suspend_noirq),
> +       .resume_noirq = pm_sleep_ptr(rockchip_pcie_resume_noirq),
> +       .poweroff_noirq = pm_sleep_ptr(rockchip_pcie_suspend_noirq),
> +       .restore_noirq = pm_sleep_ptr(rockchip_pcie_restore_noirq),
>  };
>
>  static const struct of_device_id rockchip_pcie_of_match[] = {
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index b5da15601b58..51877678d3df 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -324,6 +324,7 @@ struct rockchip_pcie {
>         void    __iomem *msg_region;
>         phys_addr_t msg_bus_addr;
>         bool is_rc;
> +       bool powered_down;
>         struct resource *mem_res;
>  };
>
>
> ---
> base-commit: 35f800669ce835aa77364a2ab5b61be19b778d3c
> change-id: 20261119-b4-rockchip-pcie-hib-004e1adc4042
>
> Best regards,
> --
> Igor Velkov <iav@iav.lv>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
