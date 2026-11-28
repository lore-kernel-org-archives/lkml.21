Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795869145;
	b=oPP8S2FIHJEKvtr3mg28BFAN9Eslvd2N1ST6D1/UEzVolN8oHNwLRG+10N9CpiGqfvoF
	 y97wOeTK65LvSoQlhRN7pKs6RAsFiXg1Rcaia1/g9rsKtpfVDm00/i6rVjacNyC2TrHlB
	 Uiz4An1pwd5IHVZvMwXVLr/mGE8KZoP59s7a0bKk4wIvh14gCSHII5cVXNndaMXCVPMuT
	 LpC4udNAtY0dsBdRY17ZTHwcfkFul7DOetkeuYESnSaS0UZ/y14fLQdE/O/vvacu8pvzl
	 k38GyzFwvq4NCk4VEYrdKFqSwnHRCrxwhgHAwTndLuu3f6MSDP8rWmfkLe4a23sfoNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795869145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HgH3G1IMY5/oQi3SfRPGzW25VEa+KdwR3lTkeuHkhmE=;
	b=KUfMXmFAIkbO69vO4q1UPGJbv+8cVTVr4d38mVFGqV5GZAXxpUmSDB6MSmxaPoUXH93L
	 Uoz0EIKz4Pk+I5JPJwfHiZvgKVRvBfMyGYZrxMr2yd0VArT65140W5jamHDXPAl4iQuzw
	 EJTA5iQr96caAsl8LPW0w5Xjv6Bqn/MMsN67y/DYj1F/cUaXMKsgat231hfCtGo/0YtUc
	 a4RZESvLgfuQdP3600CAi4Nq6mssXrXGSJOnR05SeoWIhHBtEojP9SAxBIN0S3rZzJv4n
	 maQpHcqtoxh3lXXHdwSrB4WeRRq/MHsfPSXcyhXeXycQdaVyztOSCPb7MsK0NHXUthg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=tomeuvizoso.net;
	spf=pass smtp.mailfrom=tomeuvizoso.net;
	dkim=pass header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qfMfcz4F;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECACE606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECACE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qfMfcz4F
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5361e313e63so122819951cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795869142; cv=none;
        d=google.com; s=arc-20260327;
        b=r+kYfglJU2qm6M09or6+y7ICt6hh6KQxGIlpQPn7MS4SCNnAqHB2MhUioCJJD2weQA
         I2HAB7H4qMu2N4ODpTt8oxHTOHv9RSd+dK3IkxSkvZErqsZH5/ILgM43rNebQFoX2/gu
         Y2/MyRbQ3IhVZMrnB+p2rd7KkxITxTE96e44suCZaGg0y+6WMTqD/Ddy8VEaWG8yPcdW
         f5tPC3IhF3pYPHdAUVAgz5vELwD5V1zsCi59Zod2//+qmk+/ShRWTJwixiosC6RdshJ3
         S5UPg82/dXHaKNjPMIfeQaFk9woFwj/bRniKsCv7grK/ANAdolJYzo35pALOL4c4cBrq
         BKEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HgH3G1IMY5/oQi3SfRPGzW25VEa+KdwR3lTkeuHkhmE=;
        fh=zcncNdWlKJmXuNpfe6WTof3mMCIjDB/Kjyvoiy6PnnY=;
        b=S5f823T+A/PJSqV/Qxbw2MTOg1+MLSe2G9NIctTb8F1ALYWvpArK6wrKBejC4QgR5z
         IvflHOkjsFfEoswv7cUc6gYlca4GEdQe//y7XHvN9HzXQd+UdUo4hkzBE4GWgOnPZjd6
         mDsU6VBXuFMiDxyrbL9ZVLPEKMew5l+qkOFiWQRXLg1UUcRslK7Awlt8mBgRq+tG7BC0
         2zBfuYlsFRk+4sZHH80BWWOweNXgolruVdE8dkCtVAaWUUwriwS/ExOWX07+NuPVVyZ6
         L/XBXBBZkWiCmrRa3B2MapGFkRHuYmglODdGp4QLCColkUSApiTWEb3XMK+Q90IKkih9
         R43A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1795869142; x=1796473942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HgH3G1IMY5/oQi3SfRPGzW25VEa+KdwR3lTkeuHkhmE=;
        b=qfMfcz4FLnEe55C7LJAJqwS8tQHm1GmQuO/o0+cThJyr80D+WBeNR/ZwBzzgKzHvuj
         DeCkb9HzsER/K3vWOForRs8LB6v2vQlSHzU4N1JSKxJK5Wt/NU6Iw8RP6nbTd8z8SgzL
         bOWBw+WNFxziVTmUVTQoIbroPvWRMOi3t8oiElB1xlxVT7KgNlaUj4rpKbccyMnc+oXa
         F+AqcSu/2K5CK8pXqNLuTEZFGZe8fnuyiwL4zSRouURoiFlQsfEssAlR1A0xb8bXa56z
         jG5uOBFGUvehl4lbcYQO0Fby2bEP39BhppDnS6peDhyKgQae5qzc6aA0fBVj09Dipc+s
         craw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795869142; x=1796473942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgH3G1IMY5/oQi3SfRPGzW25VEa+KdwR3lTkeuHkhmE=;
        b=DzBLvGCt+WLrePac96s3X0neLm57lwkTABfhjfrpNhwbU5Yp9w0rHyu6cbuXjHUkhr
         yXwWOU9urxI0MjNI4vyHIxw/pP2GOomZKhAFSEjhSSfGuXWVWxG9C5fcWh11jEShg+dN
         sQKf8SAk2r5rveLOnmq1Bb78/LoL16sG0tzEGuyCo4bJCMdL1LuLenAFoBV7zEpf4MoY
         MabrBoi64C6U3z+6KxkAzmPMzZ0SHjziwh9R3nD/Z1iFrYR4D8IsYv+KBegJ4XrIN8Bz
         ur5Vg4R3euxUp3m88Pr5GlvtLmRbjZOVfRjUEOi06uPkBDZwqxX/oG64BFx6JFut1JAG
         NnzA==
X-Forwarded-Encrypted: i=1; AL+hErHCVKEU7LbJ9eN1lBM6E/RhrhlBmhG7ba53P9iu/635e0KlHtDiTMNPRTxc8wpA2JSnQRxQBzbKsVw2pY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tNabgs7TcqDm4nJc6oWs3LqM92OigWrHnPQ6UkJE5bHrBA6oE
	FR/ib1CHrzEpWvIX0O3GWnkRQj4tqMJCG5SC4LWrMoohNvHdkK2hrDLpEeDo9KZiK2EZJt9nYT6
	gMRgN/sVPKKbdk5A9defg6s4A6+TV5XIsg2XkN17jqQ==
X-Gm-Gg: AZFdTZcN1NQeBBXTAKjXpY8IaE3rSnuAYLFZ7wEJC5C+bCEhThZaGkMEriS05u8VPt/
	Unhz1HiVFro9Edx82rd595GzPjRKBpU1+E8EwWLFs8nwu8hKazzP5AsAFZrq5F9ioNWla465tWB
	kP8zRy9ykN+HZ+QRodJ6L+BKRxSRBBjWn/J9YKa7UYYhuSwkxB9tR6cetRMZDbA2TpwEy2l1zUJ
	JmnCHRbvxkQ0EjzsQKiCSIWpqi8AKJ9xLCZAjM5XUo/8s+V6Tpes2NQRvv7v8GxwNfDVSZQ0xk+
	H7STdm88B5FjbPZqMNPSQFTKZEt7lR8NA7dfQeIGKz0wlwpgRdCqJa487bMhWSBw/gFhauGX47w
	FZymibIEiBwh2f4bIrdPOvUYvK9LnBIsoyuE3WZaYWFoXHX2z7tNOYHXzyOwoxFAbJgfkdXJzf2
	OPiAoovxbvlgFJm+b/9VDYF7lkAEaE5mOMhuhYJzzDmHk=
X-Received: by 2002:a05:620a:6491:b0:93e:5dcb:eb9b with SMTP id
 af79cd13be357-949ba9b3b89mr4296589085a.42.1795869142029; Sat, 28 Nov 2026
 04:32:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org> <20261120-ethosu-fixes-v5-15-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-15-52d459acdb84@kernel.org>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sat, 28 Nov 2026 13:32:10 +0100
X-Gm-Features: Aa3M54oz6YEBVz4CgXKG8v0WOF26xVlZhTDNrqvmm_YzBRVyfpbh5y5XpFnLiRg
Message-ID: <CAPsqS2TKu+m+0tzJmA-z_3oLsVMJeGZzy_=-fNLzW3YJrGe_xg@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] accel: ethosu: Validate resize operations
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
> Resize input coordinates are controlled by the scale, offset, and step
> registers. Require those values to be explicitly programmed and validate
> their scale and step relationships before calculating feature-map bounds.
>
> KERNEL_WIDTH_M1 and KERNEL_HEIGHT_M1 specify the input dimensions for
> resize, not a convolution footprint to add to each sampling coordinate.
> Compute the final sampling position using the signed resize offset,
> check it against the input dimensions, and include the upper sample
> only for interpolation modes that use it.
>
> Pass zero-based maximum coordinates to feature-map validation, as for
> other operations. Keep the block-step relationship based on the stored
> M1 block dimensions, as required by the hardware.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v5:
>  - Use signed resize offsets and the programmed input dimensions.
>  - Account for interpolation mode when including an upper sample.
>  - Avoid adding input dimensions to the sampling footprint or converting
>    the maximum coordinate to an element count.
>  - Do not validate an accumulator input for resize as the accumulator is
>    never used for resize.
>
> v3:
>  - Fix width and height calculations to account for kernel size reported
>    by sashiko
>
> v2:
>  - new patch
> ---
>  drivers/accel/ethosu/ethosu_device.h |   8 ++
>  drivers/accel/ethosu/ethosu_gem.c    | 161 +++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 168 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/ethosu/ethosu_device.h b/drivers/accel/ethosu/=
ethosu_device.h
> index 368daac25acc..6aa7f035f32c 100644
> --- a/drivers/accel/ethosu/ethosu_device.h
> +++ b/drivers/accel/ethosu/ethosu_device.h
...
> +
> +static int calc_sizes_resize(struct drm_device *ddev,
> +                            struct ethosu_validated_cmdstream_info *info=
,
> +                            struct cmd_state *st, u16 mode)
> +{
> +       struct ethosu_device *edev =3D to_ethosu_device(ddev);
> +       u32 ifm_width, ifm_height;
> +       u64 len;
> +       int ret;
> +
> +       if (!cmd_state_reg_is_set(st, NPU_SET_KERNEL_WIDTH_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_KERNEL_HEIGHT_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_WIDTH_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_OFM_BLK_HEIGHT_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X_SCALE_N_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y_SCALE_N_M1) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X_OFFSET) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y_OFFSET) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_X) ||
> +           !cmd_state_reg_is_set(st, NPU_SET_RESIZE_Y))
> +               return -EINVAL;
> +
> +       ret =3D resize_axis_size(st, 0, st->ofm.width, st->ofm_blk_width,
> +                              st->ifm.width, mode, &ifm_width);
> +       if (ret)
> +               return ret;
> +       ret =3D resize_axis_size(st, 1, st->ofm.height[2], st->ofm_blk_he=
ight,
> +                              st->ifm.height[2], mode, &ifm_height);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D feat_matrix_size(edev, info, st, &st->ifm, FEAT_MATRIX_IF=
M,
> +                              ifm_width, ifm_height, st->ifm.depth, fals=
e, &len);

If I'm not mistaken, st->ifm.depth contains IFM_DEPTH_M1, but the
pseudocode in the U85 TRM at 3.10.11 shows the hardware using the
depth in OFM_DEPTH_M1 instead. Can you please check?

The same problem seems to happen for depthwise (3.10.3) and for
pooling other than
reduce_sum (3.10.10).

Regards,

Tomeu
