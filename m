Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295771;
	b=ZsWvjgTj/tLjyfUANwV5NzXQc37fil9MXefWv1EoIi7szNYf3dQ2t7o6pgii463NkAu4
	 NBhUHNz167CGS+uRLpJWZ8x43EIdwTsI6HXNTkI7Rkf/p03c4okPsYovVd4Rh0WFgnOHY
	 c75U9JqitUkB9fVb4AvbWxGZlxdgzSU/yYz7OS7UtUMuvtbZkcw4Mw42IX+Ji9qVQD9O3
	 +6cEIPiR+FjEsCqWJTwHb0aZRJ7uwi8mm4hHX0aTnQrb/tsNNPc+NCnpG5CZxWGGXpMKH
	 GtS+ZZGgyFckjnJx+NB0qUoV9j50/Ju1J7hku914n9aqYe+F4elqnoAPye8IJHz1rZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295771;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7eXrGkj05XJIeWdMg8bWi/sqvFudK/TAUg1y65LM1tg=;
	b=zLQLH15XnfOm0R3FcT4hfQ6C5LKF4NN7yAajAWgfn+tx3KLhBrcuQd5qSJWUteEHonGL
	 AuQCVcunnbasHDeQRAUKlWvaOh1X1X8L1xkMTzLp0Kt76ReLA5UWkoItopGs9bjDwhGeN
	 jXNGIRZlvWGXOqVIvdm8ftUwa3wAs1ifo9tr778aUnxfxkOqmFywjBspLQYxcc2D1SuFH
	 F7g8xXCVO7/KmmiepNLq1iRL8j283r9+/b6mn2L5lJyD0WVySdTMH2WeO90SXRgD7MFpi
	 X20hWGbucFSYihslq1m3B5un40ZP2WCtraDVXtRbqNxWBPYQRUagK4KHGwm/PPB5oZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=byGxwCUu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B10606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=byGxwCUu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D861F000ED
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 21:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795295770;
	bh=7eXrGkj05XJIeWdMg8bWi/sqvFudK/TAUg1y65LM1tg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=byGxwCUuh5O87gOGC39H5SQNQxs1CDkdy0T3fQo/SjrYp6oHt/UkzZaFQEhu9iHuQ
	 enNmWGbZFz+D7B4BNdeAx7DhShQxOMhmHptAOssaOPHVKpv2tYPbeknGi/q7FkvRN1
	 ADE/exyhF4Az4ygBI5TL0tMWcOgWpzGjygQmNDvk4ZwtPnRECU/BBTV/lNmD7NAAeh
	 /ABWstb7KW9HwTHm5lW1fhSxw2pOM9g1YNQr+T/Vle649Zzyb/TD+2eBTlNUzvnQvx
	 2kJdQh9uy8q4yzsEFDpe15cYvwmGcqSjXyepL7e4lLIKQrRK+Jk1dhJ1oGt9huphvW
	 Uhhcx8LbwBlvA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso1633214e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 13:16:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPi/wmvs7s5mvRSAQypRu5IuZcgb1m+732fxxdHhQ9sDI/u/H8h1cc5sVggMgP/uRZ1nBt7lQ75ccIpKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8yx7okwi85Q7PTyA7D5Glb8wiCX2PnyXzzblk8GaHQxYu5EeG
	RS+KuT0HkwUb6JVuDt11J0ZZA60Zc8xtQanEn26MuBr3/qmKM1TNHWgbnUjEsCOcIFwf1hlJazu
	HVy7OglGbhsXBZxp0s/09XsLPgAVAKqY=
X-Received: by 2002:a05:6512:3087:b0:5c1:4974:c159 with SMTP id
 2adb3069b0e04-5c1bc8cc90cmr2071934e87.55.1795295769485; Sat, 21 Nov 2026
 13:16:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-5-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-5-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:15:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVu-nLi34mZT_wuJAHqgupgBT5A1jBUfScn81wuY3UCg@mail.gmail.com>
X-Gm-Features: Aa3M54ro2NNB4LQvH-Q4GEm3pg_4771RV__twhnRQdUNcV3HdQO1On99ooANozQ
Message-ID: <CAD++jLnVu-nLi34mZT_wuJAHqgupgBT5A1jBUfScn81wuY3UCg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/15] misc/arm-cla: Probe firmware-described devices
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan & Jean-Philippe,

thanks for your patch!

I see this framework is (ab)using platform_device, and Greg has many
times pointed out that he doesn't like that, and I don't like it either,
so I'm gonna complain about that.

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> +static int cla_of_to_cpu(struct device_node *of_node)
> +{
> +       int cpu;
> +       int ret;
> +       u32 cpu_phandle;
> +       struct device_node *cpu_node;
> +
> +       if (!of_node)
> +               return -ENODEV;
> +
> +       ret =3D of_property_read_u32(of_node, "cpu", &cpu_phandle);
> +       if (WARN_ON(ret))
> +               return -EINVAL;
> +
> +       cpu_node =3D of_find_node_by_phandle(cpu_phandle);
> +       if (WARN_ON(!cpu_node))
> +               return -EINVAL;
> +
> +       cpu =3D of_cpu_node_to_id(cpu_node);
> +       of_node_put(cpu_node);
> +
> +       return cpu;
> +}
> +
> +static struct cla_dev *cla_dev_alloc(struct device *parent, int cpu,
> +                                    void __iomem *regs, phys_addr_t base=
)
> +{
> +       struct cla_dev *dev;
> +
> +       dev =3D devm_kzalloc(parent, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return ERR_PTR(-ENOMEM);
> +
> +       dev->pfn =3D __phys_to_pfn(base);
> +       dev->regs =3D cla_get_regs(regs, cla_kernel_pl);
> +       dev->cpu =3D cpu;
> +       dev->dev =3D parent;

Why is struct cla_dev just a hollow thing without it's own
struct device? This is free-riding on the parent device, which
seems odd to me.

Should you rather have:

struct cla_device {
      unsigned int cpu;
       void __iomem *regs;
       struct device dev;

^ Not a pointer

       unsigned long pfn;
       unsigned long pg_offset;
       struct cla_domain *domain;
};

Instead of first creating platform devices, then spawn this
hollow struct cla_dev from the platform device, what about
just creating struct cla_device directly from the beginning
if the platform_device has no real use?

> +static int cla_probe(struct platform_device *pdev)

Why send in a platform device here at all, just create the
cla_device and pass this in here instead. It does exist
right?

> +{
> +       int cpu;
> +       void __iomem *reg;
> +       size_t reg_size;
> +       struct cla_dev *dev;
> +       struct resource *res;
> +
> +       /*
> +        * TODO: the firmware maps this as well to access PL3, and the gu=
est
> +        * will map PL1 and PL0. Avoid TLB attr mismatches by only mappin=
g what
> +        * we need.
> +        */
> +       reg =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);

And register resource to &cla->dev; etc.

> +static int __init cla_module_init(void)
> +{
> +       bool driver_registered =3D false;
> +       int ret;
> +
> +       /*
> +        * For now, we reject any CLAs discovered via FW tables, whose CP=
U is
> +        * offline during init. This keeps things simple by allowing us t=
o probe
> +        * all HW at init time. Keep the online CPU set stable so that th=
e
> +        * cpu_online() check in cla_probe() is consistent with the onlin=
e cpus
> +        * when we call cpuhp_setup_state().
> +        */
> +       scoped_guard(cpus_read_lock) {
> +               /*
> +                * CPUs may be hotplugged, but all CLAs are described by
> +                * firmware so the probe can be synchronous. This only se=
ts up
> +                * the resources, and CPUHP callbacks do the actual peeki=
ng and
> +                * poking. This returns an error when no CLA has an onlin=
e CPU.
> +                */
> +               ret =3D platform_driver_probe(&cla_driver, cla_probe);

Create your own cla_driver for cla_device instead.

Yours,
Linus Walleij
