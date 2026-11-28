Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795869574;
	b=y0TJ2LLrRt5opI4puTCN2G12qQP43HmdBvc0Lg0Yy2TV69xx0M9kYNDN5TO9xi09dqJu
	 +K/K8EZtQtc201nBwGji45BZJgJxUXnkeabLf3+Mf0DOUQLSew214eTU8Eg6EGPEfyu54
	 FX1BT6JIS6GxmVQIRjbDhEs1l+91qvPA5vhJHNqX2PW0Xjir6FlW+duoOrib0Q3NCxDFk
	 uT+awnyEZL3mEnuVa1TOq/05qEWYDr0J5K+MGylWKeo05su0FxsF+Qe0jvHDeYeIuRlrh
	 6pamHYu16eFitP1BTbDe29qtGj9sm+OjIJtsJ1B2ZOPZzNODqPiCF74O7sFNSdmg6AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795869574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LP5lwouaH4Bu3n5GkilT+zZHlYTgic3W8tCjtt3bVRk=;
	b=WoLWtcWGTqQxv4FhzhollyVVO2DCwOyGoOaorM/+Ul+M0hWwVGhDao/MCSkR9AC5dKpx
	 5wT14zj6c6TFgC/YAi8SGE/u3W7qnRSdM37jhJWHZpK9AVe7NTx/6XB1dbn/AnZ5WkASs
	 w8oKz5tqgMB7iJWd+37tlbz69sBaVF+BlbvxJ3wg4zboY/iS2yH27RJHuzg/40mYpkrxt
	 DGBnKyhaXJhO/FVaMOSPx5RV/2GdSeBn6tfjgXfKpWzjblVV6IoDdwP7aEWP60aEuhe8T
	 DgEMfNkbfl8T8ip+oVixQkgMr+53CIpaKdZvEloy6oaDr4bnULojJPLxxwlVEpYySFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s35ZxMZJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4E606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=s35ZxMZJ
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94965745d92so880425385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795869573; cv=none;
        d=google.com; s=arc-20260327;
        b=k6JqyqrdGGwGyPTh78LBrFX78TsHY9H/fJ1SKDBBhnyOjML9NIFwWRb+agfX0D0lp4
         SNBhfh0Y/NzMy/krIArRTgCcDMU2cK7vOM/I4cuFUkLd6S9VM1w9jOIHVahFPopUdFLE
         JHw40wgrqTowUxQPBTeXmIQfhY0X/FQnObkMSqZJ8BCIGooWtemOJ5LxwtkZY0YAJmFQ
         IxlpzurtO9/sYa9Ar4h/NrN4bZmq07ncJWEmrOTY0ttsB4cNb+gJuC1dKCj7tZOqio6t
         XQCjPiJ5L1fi8TpLgKrfe4OgdBluFLXtmLI8+tHd+xDSLTY7REKcs16VcF6soq3ml7vq
         WPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LP5lwouaH4Bu3n5GkilT+zZHlYTgic3W8tCjtt3bVRk=;
        fh=ZZHGfpHOxnSXKIj9H6/6qsoJi//oRyauQVW7JPjG3Ck=;
        b=NEsvkaM7uALvYhl6+Oq+nLQIZepZ4+D8PoVWmBXqsc2klRRZQhJo2UtF3XOvf4dxpl
         ye6EFQhZ/W5VqWUVSEnOeJYjb9PcrSGXAbUHgOo6B2mqyT6i8I0TRnRBv5hfaDyJuxV+
         YofqHO7M5dQbPOOw2LAZO4JZxL18PJwLeMmpzbYgbau7eobDp8rJjB111fhLzPUJRwE/
         i81A+3PeAOHJZvlTFek95mIaTozGZugaSJ/yGd+J5seP3kl9c/mDGm8Cvz3BhFUgJDIQ
         ItzrggSiAU7UDX6LCT/EnPzHb5yS/JFKCSsQfz+Va77wl0uEtW/Tb5FdwwjxnhwHH/8l
         k0Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795869573; x=1796474373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LP5lwouaH4Bu3n5GkilT+zZHlYTgic3W8tCjtt3bVRk=;
        b=s35ZxMZJrykqNlamkWcugvRYxQVA8K7kVbJAm84PlYPzCKhkZLC8Lx0iOiZCkfpzQe
         kqtO7kjZIofpW897C0zIdAtLFD0YaSisQZpvJEGKN3ke3vtO1gGO6oY68jIJGOr61URH
         WBg0f/s4UowKrLoBFoxnzXk46Ub37j4Xqs86ILdA+TLPNqzmJKdEmdrV9zD5BU/WO7yR
         cwTEERm3SvXhO0GGi4HjykA+tmaX5nmOP/fTLygIVmWc1N92VQ8ZLGsZxPLMopj+D6YY
         Z4fptVS4MclQ9RMNC4/4nRLDl9XR52Q4MTdB9FNPBtRJn78HgsVle45ZTRPm6yryY+RH
         jbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795869573; x=1796474373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LP5lwouaH4Bu3n5GkilT+zZHlYTgic3W8tCjtt3bVRk=;
        b=T3EtXmHDw7aHPpXPUmPUDufgPfiL87dc6oyHffUYKdmGRwFlblaIbktBfo6d6AcKF8
         vEaN0wQTNLhsiz3ie6pY8SyMsMUAjwLzfofGZRsfXCxjUlLwos/Be+P6Sho8cdgjJ0cB
         WepmoelE7QSt6zR2JdPNaFTT3yY2ByVRFaeCtcalhogcDv6aHSom2AQZZW896jZBBbWz
         +yJIXGRbjtd99R3n2GjVquE9WmAvoz1LTLxJ1EnyToK5tncCwZ91XkYEtQeJSVyCl9gs
         UoxDKeg8exqq5EoTUuAfjzxu9uef5ySTddeUxT7jy1s4O5x4BCmUBiiQmqiTS14rDYqd
         Tj6Q==
X-Forwarded-Encrypted: i=1; AL+hErF3YY6SemENJ9FfDcT0HIngqMdn2h8iGz1DawHr0bziWA208Bv+QsNJa76Ltpt3EI89IMqC4plL96020fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IK8sVP5PtMn07/+Vd4LKPOOnF1sjhgiYa/I4M/QFlpN+8Sq1A
	TL3kYTikyLoJpgXRCsU0ORlClnvyAP93z8WTRXpHKZKSF9t7JABkpK4wu7oOkfN/PO/+/mShcbh
	LcQDo1GpY+wIOsVlYpfM6/+84gkZzQLW+Do9+BEoigg==
X-Gm-Gg: AZFdTZf5jga4y6MXqt/uUSQUXpN1SisOrM8C8bf7NFzRBjyCN6Pr6bpHPSeiNG5CTAg
	Ld99+m9sA3c+J5AGUeThC8OK6GZS4ATYyx4/Pv/ADaQGba/ZpQBJaID6fwmPOBnse3KS+pk5TS3
	wrNMHtav3mW7IkpWtalYBPHT4kfOJpynXUEnxlYU4/UxT3CaBIe1pQyc/LCJhmQUnrzwO18D7Cz
	Y427enL0qoQif01sFBtTVVac25H2x7A7x4Gyn/aHQbiPG5S6GOsUEKtSx8+5Cdcclwytx1uaF4D
	2QOmWN39j/L/NYAezEIAh/TMnob14JVv9kUCg8GrVIYDfVIQKlFzHSdy8i+RoealUr6hb/Wu2Dx
	rOYq4mR6zWsM0bOKHXdyh819CjQEsYIPBnzU6Ofz4cgOpVWTddATBryLg4PNEeeLp2iR6YIpNIG
	tddzwaAhqMaRdq1IpJtwE=
X-Received: by 2002:a05:620a:4004:b0:93c:9c0b:3898 with SMTP id
 af79cd13be357-949baa1565fmr4667037185a.59.1795869572920; Sat, 28 Nov 2026
 04:39:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org> <20261120-ethosu-fixes-v5-18-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-18-52d459acdb84@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 28 Nov 2026 13:39:20 +0100
X-Gm-Features: Aa3M54rdDX9otZl0YmDbbG5JXwSVr_ufI9n-5pDORB0v7vvtL9kARUZf-Qg0jf0
Message-ID: <CAPsqS2TLe3eO23BewwJzkUr25X220oC-qTfBH4FeEzET=P2WWw@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] accel: ethosu: Support IFM upscaling
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Nov 20, 2026 at 3:58=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Track the IFM upscaling mode while validating command streams and
> adjust feature-map bounds for its 2x resampling modes.
>
> Resize operations require no IFM upscaling, so reject a non-default
> mode there. Ethos-U only defines upscaled IFM reads with unit kernel
> strides and non-chained storage. Reject incompatible state when the
> operation actually reads IFM, including elementwise operations, rather
> than checking when registers are programmed.
>
> Also enforce the pooling-mode restrictions: max/min cannot insert zeros,
> and reduce_sum and argmax do not support IFM upscaling. The coordinate
> reduction used for bounds checking must not be applied to these
> undefined hardware configurations.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Reject various invalid modes
>  - IFM upscaling is not U85 specific, but supported on U65 too
>
> v4:
>  - New patch
> ---
>  drivers/accel/ethosu/ethosu_device.h |  7 ++++++
>  drivers/accel/ethosu/ethosu_gem.c    | 46 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 53 insertions(+)
>
> diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/=
ethosu_device.h
> index f8066a9cf610..40b7f28ae61d 100644
> --- a/drivers/accel/ethosu/ethosu_device.h
> +++ b/drivers/accel/ethosu/ethosu_device.h
> @@ -93,6 +93,12 @@ struct gen_pool;
>
>  #define NPU_CMD_CTRL_CMD1              BIT(14)
>
> +enum ethosu_ifm_upscale_mode {
> +       NPU_IFM_UPSCALE_NONE,
> +       NPU_IFM_UPSCALE_NEAREST,
> +       NPU_IFM_UPSCALE_ZEROS,
> +};
> +
>  enum ethosu_cmds {
>         NPU_OP_STOP =3D 0x0,
>         NPU_OP_CONV =3D 0x2,
> @@ -109,6 +115,7 @@ enum ethosu_cmds {
>         NPU_SET_IFM_PAD_BOTTOM =3D 0x103,
>         NPU_SET_IFM_DEPTH_M1 =3D 0x104,
>         NPU_SET_IFM_PRECISION =3D 0x105,
> +       NPU_SET_IFM_UPSCALE =3D 0x107,
>         NPU_SET_IFM_BROADCAST =3D 0x108,
>         NPU_SET_IFM_WIDTH0_M1 =3D 0x10a,
>         NPU_SET_IFM_HEIGHT0_M1 =3D 0x10b,
> diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/eth=
osu_gem.c
> index d2884d9922ae..b4544298742f 100644
> --- a/drivers/accel/ethosu/ethosu_gem.c
> +++ b/drivers/accel/ethosu/ethosu_gem.c
> @@ -167,6 +167,7 @@ struct cmd_state {
>         u8 acc_input_precision;
>         bool fast_weights;
>         u8 parallel_mode;
> +       u8 ifm_upscale;
>         struct dma_state dma;
>         struct buffer scale[2];
>         struct buffer weight[4];
> @@ -402,6 +403,11 @@ static int feat_matrix_validate(struct ethosu_device=
 *edev,
>                     !cmd_state_reg_is_set(st, NPU_SET_IFM_PRECISION) ||
>                     !cmd_state_reg_is_set(st, NPU_SET_IFM_DEPTH_M1))
>                         return -EINVAL;
> +               if (st->ifm_upscale &&
> +                   (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_STRIDE) ||
> +                    feat_matrix_chained(edev, fm) ||
> +                    (st->ifm.stride_kernel & (BIT(0) | BIT(1) | BIT(6) |=
 BIT(9)))))
> +                       return -EINVAL;
>                 if (feat_matrix_chained(edev, fm))
>                         return 0;
>                 if (!cmd_state_reg_is_set(st, NPU_SET_IFM_WIDTH0_M1) ||
> @@ -745,6 +751,11 @@ static int calc_sizes_resize(struct drm_device *ddev=
,
>         u64 len;
>         int ret;
>
> +       if (st->ifm_upscale !=3D NPU_IFM_UPSCALE_NONE ||
> +           feat_matrix_chained(edev, &st->ofm) ||
> +           FIELD_GET(NPU_OFM_TRANSPOSE_MASK, st->ofm.precision))
> +               return -EINVAL;
> +
>         if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
>             !cmd_state_reg_is_set(st, NPU_SET_KERNEL_HEIGHT_M1) ||
>             !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_WIDTH_M1) ||
> @@ -811,6 +822,19 @@ static int weight_streams(struct ethosu_device *edev=
, struct cmd_state *st,
>         return 0;
>  }
>
> +static u32 ifm_upscale_coord(u32 coord, u8 mode)
> +{
> +       switch (mode) {
> +       case NPU_IFM_UPSCALE_NONE:
> +               return coord;
> +       case NPU_IFM_UPSCALE_NEAREST:
> +       case NPU_IFM_UPSCALE_ZEROS:
> +               return coord / 2;
> +       }
> +
> +       return 0;
> +}
> +
>  static int buffer_size(struct ethosu_validated_cmdstream_info *info,
>                        struct cmd_state *st, struct buffer *buf, s8 regio=
n,
>                        u16 region_cmd, u16 base_cmd, u16 length_cmd, bool=
 inactive)
> @@ -871,6 +895,8 @@ static int calc_sizes(struct drm_device *ddev,
>
>                 if (ifm_height < 0 || ifm_width < 0)
>                         return -EINVAL;
> +             height =3D ifm_upscale_coord(height, st->ifm_upscale);
> +             width =3D ifm_upscale_coord(width, st->ifm_upscale);

The elementwise pseudocode in the U85 TRM (3.10.6) asserts that
NPU_SET_IFM_UPSCALE.mode is none, so I don't think upscaling is defined
for elementwise. Should this be rejected instead of halving the bounds?

Regards,

Tomeu
