Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795209387;
	b=ya5mIEb/O/n945zpNkEqJ3pRNoo7V3fLtj7AIwe/lP6xOMy+c+Fn3RYdtu4u20rGQ1/e
	 4FOwumdglq8CNt65j5kKFQwjt6LM3NrzGS6tqLL7D1sgcJ4UUe1a/LCLf3KgjmdkTlAAT
	 X2HLtoLF5vLtrW2uJGGTvOWXwhwS0O0ZBxlr/44YGHOSpaZWxBZKVycV/QokclxXEUx0K
	 PRnQQhMl2bGKSC2NZUxyxGuNzCjHq9Hm2WLYiUdgFW93dlZOBxDbjmQtj78HEJ3G9Ng0x
	 kuSYuByYQ/DX5IOzPpjqeOCyx/Lsa4AnkPOLsz4UL+IA8SbhhDXQaE80BsxRUPFn9KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
	b=zS6/OnhvcHagO+Y/oOHHF4Jwj8sYYCgc6UkAsDbpS7QJxSlL4REUKmnvutFZUyXYdqkX
	 K4MN1i6mpa2PBVIhjSQW2+etTT4QEUfZmByWAvj3t7nsSdkOL1CzBdrIpPC4HrL3wz9kv
	 gYGcKRQswD9tooy5O7/d982CKZwQUThAy+285Q3SCTbOnLRFuFA3U6FFFtC9tGfqxBv5D
	 8saMdAeixMXlwMJeJnipgiY6Spp2hFMwacduTNOMhFZbiYblXD9RPMlvDqsC0fcrLrrgL
	 UnhP7wC+QZpwvBhrN9CRGlmimlbtO98aLXhhHKR68Bzd7AFPh0UGBSXe2jlqID4HV3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9;
	arc=fail smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E72606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E72606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q0ezxby9
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3acd239776cso11200601fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209384; cv=none;
        d=google.com; s=arc-20260327;
        b=kS171bOl5Lcvy89WKhX+Ld9WHRHUZT3f8xn3LmsTfWFbv0GVcwDjGyO+mlvVTHlFda
         vr22deQhZCmthNUe4BXKCE6I7dJ3MggDyw6XbbuF0qGm0t4SDASHFGWhGgS0F3sJ/oI/
         kaoUQBaRijAhEAVsnYi8yXQoFazOSEkdYevbS+iFbNV1GWoTP5iTZITApw620ZHJHjwf
         wHOXxyRUh2CjVIOgdfZ2V70wgVDZdJ5YeQmNY858k3UcTFUTqK6fKVrOym3iL13HNuKD
         EvJ4rBfacN5iNi1mUpqwklyYHmw8kVUhvYZFLHspL92A/l8lXco7WSuKaLL1cFAmTkiK
         s7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        fh=SRD1Z9Hhnr//yG5bSgbwtiV5xwDZNABo18x6l6gHxiA=;
        b=qa/KCFi6Ady3ZbkeNMG3MMmDOmaDzhEYeA8AIFeiGN7RIJdl/albxzIAIuDkyKMm6w
         YoofF28xkulY8c/2ckAI4A0a/OCmXVPVtRLaE53ZCC7qqtd1zANdz3yrRZbVTEp1us15
         ND0d/VbqkZNgJ5oqG/E7xAiTqZgCUG7jIH7solHs95HcE0t9J8oosrFmmqVtDlFYzxfl
         Tg1CRUbyASQRnuvmOwkiMA6gFw3EiJSxy5Zvu6M/BEkPRRqPMX8tLm0FdEh/muXzv25b
         YNSZzI9s8n9oehla9fethKNnhG5KLE+OVRcIOyvigWdTwe8M/SObmTg8HUTdUeum86lN
         0STg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795209384; x=1795814184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=q0ezxby914XfUpGLrhzfA6E1/m4QOv5ChuIclloI+bpZwI7pSVyRELveWg3VGGlf8x
         0ah6sTes6aaFJBTBqrSDmqmK8zeRZLPStCECxFt4dPRObKQN4NTxhbUgf3PGooeUOUoB
         V5av6Vxqu1RodwnduQCs/LIC06FqUqHLGVoQtRi+YpYNQcegi2LayeGPBGDYKO6k1HUs
         6RZ1441EVAo+jHUIpmaivLDV9OyMZm0rjt2rU/q4wkvtqqvqzDkPC3MwrwPjX0KgP+16
         rLdHJKs5CsP5+/40QnppnK2xzVaxqA9fxCMguzrsuioWYq+InT3/FAxG9QpEr4OyP9Bo
         bKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209384; x=1795814184;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7+mHRTo6mgB6YljCC8xTp3hfMCWQo1jCyRlofOJKI4=;
        b=E2meoeRuYzgz4oafH4e1bzU1xLW+1p0OG1gXkNl4idM+UR6B1M0Dwched8H6aOLf/R
         uQRPbCQzey2MoOx4dujNuzEgZ37RQnNqcobXqL6dL1F+eBLuafQsvw2tyGPFygQUQXF3
         VphSoekTJGJVOFuoYFuHe+13A9GClXraA7e0LKF/Jpv+vkLyV3cONhxrHQghwdh2Qt5L
         1Gwx038otq0h6WSYAVhpxFGf4RhD2xAtanTXonvuWyR6jwfKnwMrJ36qcBxXsGVZ2SPl
         G7HOS96UlZrK3vacdsk6G2f1zBAchFOBMO21ot6LRvix8bhB/GLwfCEAtZObRJTa+Pe3
         1Wfg==
X-Forwarded-Encrypted: i=1; AL+hErEilvk2iHZ4SDvb+F4B0W9XkKpo3FhgY4za948Z4ooQnZiiYHGuuJuYm7lb7xvIw+q+ujpO0MZwkcclnqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+95lwF/RaHXCILMu50LeiKewk3bgmt5NYRyZQwaMmMy2jviQV1
	YR9eXvL5CaWCyFl0TJCWtq09rp8iN9Bp2MdlQFHJRaK5vIpBJR0ZGlzdnRZjhytRXJFejiNDh+X
	VA1so1p26z1jiS6T3bgmHWn+0V1Til6g=
X-Gm-Gg: AZFdTZcxmBFOWCWYAUkB9VGv5Oa7CsV6QqZY1UsVjIIzGlY/e6gfyLvLOPmgM1aTz5S
	RUBLwkkySINAEK4Ndgm2xhJQ4AWmb6RxcO5Z0loduBPcZLdgcaGfqM4K7pIDpOycCexm35wKN02
	MN0x6PzHcQj8Ojnyj4q9Pi2EPxPt15Db70ObPQrC6OEwDklnb41y4l7yj8zIiX+UpZamRTMSL0A
	FQun62MFsRFeF+ybadPLr1TxFPxv6We5/gQJ6wMg/92hwwXQ5uDXyKzkz/uIZ+l6HoZOEWoASxb
	cBIwXBksqWdIPdcRrXNbB9BAO1GIetD+TF+aw18eH1k6YcYQG0D3lLn5GRT1zF38+cJ4XNCWFnd
	BQL7oG2er1YM2GTILE9tMIayq9umfmA7X2clgC2GOAZ3JSYhx2ssD9TyN5NTBFDEgUTZR/tq3NQ
	yjFQywCQlhnakGt7ICA3kMpIlJ
X-Received: by 2002:a05:651c:1595:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae7f9def47mr12754941fa.10.1795209383639; Fri, 20 Nov 2026
 13:16:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004121931.6746-1-festevam@gmail.com> <20261004121931.6746-2-festevam@gmail.com>
In-Reply-To: <20261004121931.6746-2-festevam@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 18:16:12 -0300
X-Gm-Features: Aa3M54oHDOEQ22OODjmPc2GutyOvkFljPYhxfBAHn2qECiQinM-o8DAEKa4qfsg
Message-ID: <CAOMZO5DFgk66C=+eNepzWwrNHa-t8KQ47wstPZRGW+tf548rOQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: rc: Add keymap for Ruwido Z3 RC-34 remote
To: sean@mess.org
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sean,

On Sun, Oct 4, 2026 at 9:19=E2=80=AFAM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> From: Fabio Estevam <festevam@nabladev.com>
>
> Add keymap for the Ruwido Z3 RC-34 remote control.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v2:
> - None.

A gentle ping.

>
> Changes since v1:
> - Use RC_PROTO_NECX. (Sean)
> - Use media prefix in the Subject.
>
>  drivers/media/rc/keymaps/Makefile             |  1 +
>  .../media/rc/keymaps/rc-nec-ruwido-z3-rc34.c  | 80 +++++++++++++++++++
>  include/media/rc-map.h                        |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
>
> diff --git a/drivers/media/rc/keymaps/Makefile b/drivers/media/rc/keymaps=
/Makefile
> index 38b84e34b225..525d203c0a94 100644
> --- a/drivers/media/rc/keymaps/Makefile
> +++ b/drivers/media/rc/keymaps/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_RC_MAP) +=3D \
>                         rc-msi-tvanywhere-plus.o \
>                         rc-mygica-utv3.o \
>                         rc-nebula.o \
> +                       rc-nec-ruwido-z3-rc34.o \
>                         rc-nec-terratec-cinergy-xs.o \
>                         rc-norwood.o \
>                         rc-npgtech.o \
> diff --git a/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c b/drivers/m=
edia/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> new file mode 100644
> index 000000000000..8a090772446d
> --- /dev/null
> +++ b/drivers/media/rc/keymaps/rc-nec-ruwido-z3-rc34.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// Keytable for the Ruwido Z3 RC-34 remote
> +
> +#include <media/rc-map.h>
> +#include <linux/module.h>
> +
> +static struct rc_map_table nec_ruwido_z3_rc34[] =3D {
> +       /* Ruwido Z3 RC-34, NECX address 0xe310 */
> +       { 0xe3100f, KEY_POWER },
> +       { 0xe31016, KEY_MENU },
> +       { 0xe3100a, KEY_UP },
> +       { 0xe3100b, KEY_DOWN },
> +       { 0xe3100d, KEY_LEFT },
> +       { 0xe3100c, KEY_RIGHT },
> +       { 0xe31019, KEY_OK },
> +       { 0xe3106a, KEY_BACK },
> +       { 0xe31033, KEY_INFO },
> +       { 0xe31066, KEY_DISPLAYTOGGLE },
> +       { 0xe3101a, KEY_VOLUMEUP },
> +       { 0xe31010, KEY_VOLUMEDOWN },
> +       { 0xe31013, KEY_MUTE },
> +       { 0xe31032, KEY_CHANNELUP },
> +       { 0xe31031, KEY_CHANNELDOWN },
> +       { 0xe31069, KEY_HP },
> +       { 0xe31000, KEY_NUMERIC_1 },
> +       { 0xe31001, KEY_NUMERIC_2 },
> +       { 0xe31002, KEY_NUMERIC_3 },
> +       { 0xe31003, KEY_NUMERIC_4 },
> +       { 0xe31004, KEY_NUMERIC_5 },
> +       { 0xe31005, KEY_NUMERIC_6 },
> +       { 0xe31006, KEY_NUMERIC_7 },
> +       { 0xe31007, KEY_NUMERIC_8 },
> +       { 0xe31008, KEY_NUMERIC_9 },
> +       { 0xe31030, KEY_NUMERIC_0 },
> +       { 0xe31065, KEY_RED },
> +       { 0xe31063, KEY_GREEN },
> +       { 0xe31064, KEY_YELLOW },
> +       { 0xe3106b, KEY_OPTION },
> +       { 0xe31050, KEY_PLAY },
> +       { 0xe31057, KEY_REWIND },
> +       { 0xe31058, KEY_FASTFORWARD },
> +       { 0xe31060, KEY_PROG1 },
> +       { 0xe31061, KEY_PROG2 },
> +       { 0xe31062, KEY_PROG3 },
> +
> +       /* RC-34 remote volume keys */
> +       { 0x3506, KEY_VOLUMEUP },
> +       { 0x3507, KEY_VOLUMEDOWN },
> +
> +       /* McIntosh HR070 remote volume keys */
> +       { 0xca5542, KEY_VOLUMEUP },
> +       { 0xca5543, KEY_VOLUMEDOWN },
> +};
> +
> +static struct rc_map_list nec_ruwido_z3_rc34_map =3D {
> +       .map =3D {
> +               .scan     =3D nec_ruwido_z3_rc34,
> +               .size     =3D ARRAY_SIZE(nec_ruwido_z3_rc34),
> +               .rc_proto =3D RC_PROTO_NECX,
> +               .name     =3D RC_MAP_NEC_RUWIDO_Z3_RC34,
> +       }
> +};
> +
> +static int __init init_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       return rc_map_register(&nec_ruwido_z3_rc34_map);
> +}
> +
> +static void __exit exit_rc_map_nec_ruwido_z3_rc34(void)
> +{
> +       rc_map_unregister(&nec_ruwido_z3_rc34_map);
> +}
> +
> +module_init(init_rc_map_nec_ruwido_z3_rc34)
> +module_exit(exit_rc_map_nec_ruwido_z3_rc34)
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Fabio Estevam <festevam@gmail.com>");
> +MODULE_DESCRIPTION("Ruwido Z3 RC-34 remote keytable");
> diff --git a/include/media/rc-map.h b/include/media/rc-map.h
> index f167c37179c8..290919a7247e 100644
> --- a/include/media/rc-map.h
> +++ b/include/media/rc-map.h
> @@ -289,6 +289,7 @@ struct rc_map *rc_map_get(const char *name);
>  #define RC_MAP_MSI_TVANYWHERE_PLUS       "rc-msi-tvanywhere-plus"
>  #define RC_MAP_MYGICA_UTV3               "rc-mygica-utv3"
>  #define RC_MAP_NEBULA                    "rc-nebula"
> +#define RC_MAP_NEC_RUWIDO_Z3_RC34        "rc-nec-ruwido-z3-rc34"
>  #define RC_MAP_NEC_TERRATEC_CINERGY_XS   "rc-nec-terratec-cinergy-xs"
>  #define RC_MAP_NORWOOD                   "rc-norwood"
>  #define RC_MAP_NPGTECH                   "rc-npgtech"
> --
> 2.43.0
>
