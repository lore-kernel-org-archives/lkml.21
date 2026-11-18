Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987965;
	b=s3mRnmJKNRTPYcqoXe3u23D98XtxJ20cxp3IktLWD7aFktXOoREsbE5V4NWoaKwGtLZk
	 rvVTudac5PpN6TLTLMJKMekXNV6Nm3+yLGfErrH8/NkNeLnk+VvXJ8PAcoU7vBM2Evnbg
	 2Kv/FIdBa5LM6liVNBgWuBZHBOQIK96A2A5hg9ZQSVtN53LRAZgRDRbb2alknTHbxvrMk
	 OXyTU+CIqcVVDu8vdoyJ3grZXJrJexi2dI9arxcN1N8aK7er026gf0dlcd0O5lG5+FrIQ
	 V9vsB+OhH3ISnaFcqWxlDu+K9WSwLrmsud9A5II8fLBO9LfkmQrYtZStRagYB2b8zzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987965;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+uuOiZnlyHUArWLCT9ZvqAUynSEjzvlk/CcyW2HZNtQ=;
	b=EE/e0WoJNg8vFcm5C/7PxcL8a0/lalJ68dlJXayvvj5fy84rNugoOGcd8Y0LoFYA27km
	 SS3abCXxHGLQAM35JMToxvGotUqhCATl4wgvcpPJ5IeHw+QoM8+ClK2gs6Nv0NI3R7aS4
	 zyCbJXfN/M/sykx9ndBCIqOloZEry+wzbKiyfE1Z10WQiToihqIBo1tkjMvF9PbNIpdaj
	 tnDm9Lhv1qyIX9ecF+MDd5yDeqyZAciwGxrhGYmf/FiScUILcO1Wf+xJlIW9Mzo4AoUIB
	 aUv1qvjcqpUBEAxxqxAU2DTihTsWvSe6A14uiR0YLMBUBIWNB10OjyBcs2OohT8Ho+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JU5/Pxj9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B0F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JU5/Pxj9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BC71F000CA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987965;
	bh=+uuOiZnlyHUArWLCT9ZvqAUynSEjzvlk/CcyW2HZNtQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JU5/Pxj9A4lgTk3i4cM3xwbwVE4DKVsdKXRY2/DCDMR4iSRcHJrbN+cB1Wvuw+/d9
	 vvdMyQtgYJiwfD8ckDEXhDctnzhji4l19c6/gijRh2cV6CAn+JjyQKNRn4QWlj5j6D
	 dhVZ5zMJu+TJ9Herc8cUwFa3wF6DiJsnUw5XzNEJU+roMPM2YqwT3FQhUxAW0D6+AK
	 2e3RLq/hgWl5suAxgS+OKdRkBvAc5biIa5DQJCMnJixrTn430azRMAmU5N0DTPr0y1
	 5ccYM8DNc7N7q/JjqLNW8mg4daQdKPc6X5ALMPK7u92K99WEvEiW6isdEohgmyDZSv
	 NSiG4Qb7xZv5g==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so932902a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:46:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGyQbUTsiGkB8q9EDP7CeAODePYfa6ZlEtL3o4B03lI3P0olRjgIBoGNlJvfoMwZ30ZG799GE2sXWBhxdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8anBknmZetaqFibWzRKtbiRzdmjlYEI2w3y/Lox9NdpoaSlFTP
	qx3OeTdw2I3Nj8pqNzrmljOrRzdxTUjeiFP7/DGAlmNZx4HsZkLOuwFUHz61sN1eqmf7UrKorXT
	8kCrl2kvGTntUavuMNkriG8oj/8i98UQ=
X-Received: by 2002:aa7:c513:0:b0:6b7:d1a4:fe38 with SMTP id
 4fb4d7f45d1cf-6b887f161e6mr914951a12.40.1794987964096; Tue, 17 Nov 2026
 23:46:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118030330.25779-1-zhaoqunqin@163.com> <20261118030330.25779-3-zhaoqunqin@163.com>
In-Reply-To: <20261118030330.25779-3-zhaoqunqin@163.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 18 Nov 2026 15:45:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4NPJXqciuph96e2LmadNbo49ENB-c84k7rQgsRffNdhQ@mail.gmail.com>
X-Gm-Features: AclHuK8UjdPhT-4UtZuI-F1TxAlbz1uoBdYFExh2mDu1lsBwd1HreL0o0d1hWzY
Message-ID: <CAAhV-H4NPJXqciuph96e2LmadNbo49ENB-c84k7rQgsRffNdhQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] EDAC/loongson: Encode node and MC info into mc_idx
To: Qunqin Zhao <zhaoqunqin@163.com>
Cc: bp@alien8.de, tony.luck@intel.com, linux-edac@vger.kernel.org, 
	zhaoqunqin@loongson.cn, linux-kernel@vger.kernel.org, 
	Wang Jinwei <wangjinwei@loongson.cn>, Yulong Wang <wangyulong@loongson.cn>, 
	Dongyan Qian <qiandongyan@loongson.cn>, Chao Li <lichao@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Wed, Nov 18, 2026 at 11:04=E2=80=AFAM Qunqin Zhao <zhaoqunqin@163.com> w=
rote:
>
> From: Wang Jinwei <wangjinwei@loongson.cn>
>
> On Loongson multi-node systems, memory controllers are distributed across
> multiple nodes. Encode node and MC information into mc_idx so that sysfs
> entries uniquely identify each controller.
>
> The driver gets mc-idx from ACPI _DSD property if firmware provides it.
> If not, it falls back to edac_device_alloc_index() for legacy firmware
> compatibility.
>
> The number of memory controllers per node (mcs-per-node) is obtained
> from firmware via ACPI _DSD property, with a default of 4 for backward
> compatibility. Validate that the firmware-provided value is non-zero to
> prevent division by zero. The node and MC IDs are decoded from mc_idx:
>     node =3D mc_idx / mcs_per_node
>     mc =3D mc_idx % mcs_per_node
>
> Cc: Yulong Wang <wangyulong@loongson.cn>
> Cc: Dongyan Qian <qiandongyan@loongson.cn>
> Cc: Chao Li <lichao@loongson.cn>
> Signed-off-by: Wang Jinwei <wangjinwei@loongson.cn>
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>
> ---
>  drivers/edac/loongson_edac.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/edac/loongson_edac.c b/drivers/edac/loongson_edac.c
> index 5dfa41e877..4ee9dcb3d5 100644
> --- a/drivers/edac/loongson_edac.c
> +++ b/drivers/edac/loongson_edac.c
> @@ -9,10 +9,14 @@
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include "edac_module.h"
>
>  #define ECC_CS_COUNT_REG       0x18
>
> +/* Memory controller index invalid due to inability to read it from ACPI=
, etc */
> +#define MC_IDX_INVALID         BIT(16)
> +
>  struct loongson_pvt {
>         void __iomem *ecc_base;
>
> @@ -23,6 +27,7 @@ struct loongson_pvt {
>          * register state.
>          */
>         int last_ce_count;
> +       u32 mcs_per_node;
>  };
>
>  static int read_ecc(struct mem_ctl_info *mci)
> @@ -44,7 +49,8 @@ static int read_ecc(struct mem_ctl_info *mci)
>  static void loongson_check(struct mem_ctl_info *mci)
>  {
>         struct loongson_pvt *pvt =3D mci->pvt_info;
> -       int new, add;
> +       char other_detail[64] =3D {0};
> +       int new, add, node, mc;
>
>         new =3D read_ecc(mci);
>         add =3D new - pvt->last_ce_count;
> @@ -52,8 +58,14 @@ static void loongson_check(struct mem_ctl_info *mci)
>         if (add <=3D 0)
>                 return;
>
> +       if (mci->mc_idx < MC_IDX_INVALID) {
> +               node =3D mci->mc_idx / pvt->mcs_per_node;
> +               mc =3D mci->mc_idx % pvt->mcs_per_node;
> +               snprintf(other_detail, sizeof(other_detail), "node:%d mc:=
%d", node, mc);
> +       }
> +
>         edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, add,
> -                            0, 0, 0, 0, 0, -1, "error", "");
> +                            0, 0, 0, 0, 0, -1, "error", other_detail);
>  }
>
>  static void dimm_config_init(struct mem_ctl_info *mci)
> @@ -72,19 +84,22 @@ static void dimm_config_init(struct mem_ctl_info *mci=
)
>         dimm->grain =3D 8;
>  }
>
> -static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase)
> +static void pvt_init(struct mem_ctl_info *mci, void __iomem *vbase, u32 =
mcs_per_node)
>  {
>         struct loongson_pvt *pvt =3D mci->pvt_info;
>
>         pvt->ecc_base =3D vbase;
>         pvt->last_ce_count =3D read_ecc(mci);
> +       pvt->mcs_per_node =3D mcs_per_node;
>  }
>
>  static int loongson_probe(struct platform_device *pdev)
>  {
>         struct edac_mc_layer layers[2];
>         struct mem_ctl_info *mci;
> +       struct device *dev =3D &pdev->dev;
>         void __iomem *vbase;
> +       u32 mcs_per_node;
>         int ret;
>
>         vbase =3D devm_platform_ioremap_resource(pdev, 0);
> @@ -102,7 +117,6 @@ static int loongson_probe(struct platform_device *pde=
v)
>         if (mci =3D=3D NULL)
>                 return -ENOMEM;
>
> -       mci->mc_idx =3D edac_device_alloc_index();
>         mci->mtype_cap =3D MEM_FLAG_RDDR4;
>         mci->edac_ctl_cap =3D EDAC_FLAG_NONE;
>         mci->edac_cap =3D EDAC_FLAG_NONE;
> @@ -114,7 +128,13 @@ static int loongson_probe(struct platform_device *pd=
ev)
>         mci->error_desc.grain =3D 8;
>         mci->edac_check =3D loongson_check;
>
> -       pvt_init(mci, vbase);
> +       if (device_property_read_u32(dev, "mc-idx", &mci->mc_idx))
> +               mci->mc_idx =3D edac_device_alloc_index() | MC_IDX_INVALI=
D;
> +
> +       if (device_property_read_u32(dev, "mcs-per-node", &mcs_per_node) =
|| mcs_per_node =3D=3D 0)
> +               mcs_per_node =3D 4;
> +
> +       pvt_init(mci, vbase, mcs_per_node);
>         dimm_config_init(mci);
>
>         ret =3D edac_mc_add_mc(mci);
> --
> 2.47.2
>
