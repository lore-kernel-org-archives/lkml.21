Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795226295;
	b=wWUafM2upAq0heOt5PVKHkBIb9SKY6koh9gIBB7nISoIq8ktc438AxVHKay7E8ETG8l/
	 vef1AhLiAlobMN8uI+YVWWcB97af53BENULxih1Ie3pUgUK5tCtcTTvH26DCTiykY8PIu
	 sYiU4LQjdOZq7FB260KCucsBQ0Ef1R0G5BIQzNLp7hqNi1soCMfwdO7Tj5KvvZXB9Ewqx
	 sY95C95AiPz74Arbfosh1Td3ycZu1QlqjcpKOoyAwMglr2OvoN2u+OBUt7qeKhI2RwmNC
	 XE/COJoohSE0rFvmLI3iNIIznA0bUxTU34Y/d7EF7BXA2nD0sdl5piTzfCaEA9aYlfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795226295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
	b=PEGJFD5GiL440b0ShPBHq3FEEbzGSOcvVIUvgTV0fu0EiJh4XV7MxxJsQ9+XSjDRiVJY
	 OC3FDGdLDZLr4BGYI+LTeLvZGTK21IMBfpyqlNbANcwUXo//zmGg1tZDcxxsxFSv45EI6
	 xBVCT/Lsc4sj8a+oVGxGdQwWtr3ul4SWXVipalSjTcMSmRQAaqD0wQQ0xnwPSoTz8WIzx
	 oVmyxr+kqutmNJ9bUewRkxB3b1Jr8+UcfhtE2Tchj1ZslYD8HS2DtxbluPl8IB6w0T749
	 RApK9GPuNhFMBCasL/fHty8Bfk3ZvmQm29Klv2bYDUauCllCxtPRdFUhm4rj5fo7GjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvoL8HAD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B533606A336
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 01:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B533606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvoL8HAD
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1965436e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795226291; cv=none;
        d=google.com; s=arc-20260327;
        b=rLgBQ+twPFXoYZvkHl+2DS9NrI55jbyUh20BK8DHu4De99rYWSx6hXgPLIjx9l4irA
         yjfawvyiHf1Weed2FufvoUHUes9cOQMyWjAjIP7Rt0Z+Y1SYZ69Qb8Iz8pITtnog77lZ
         GshCMSEA4/pPvEdPaEgQnStmrPCaFzhYa31TXy4qMJKdmOLbAsncBjLiKS2vLUPhG9C2
         5q5Ya2ac4Tfpk0+H3yNBRahIAlJPQEe/ul01x0Z1uRj5Dqeqvfvi2g0Vd+JxUgb8kBYb
         lRKRF+AGpG3BNQA6MCn2aqDA/Z5gmHEhWJ62uUrx0OtGikZIs4HzZnPsEoQHFRI5kc6G
         JrGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        fh=bNN4qhA84MQh+Fqqflg3EPvUZirViJ7yj/xR5/wihTc=;
        b=lAIzxPXo6di1X3s0/L0ToZD+M8viH5tKVFtrTkxp99blohsZVVBkHujclAiYYdy7tf
         aZ4UZHSUwna9NQ97WYB91AwIZrfcwjmW9xKtE4HF0pRQmZXppyFW945PJXs2lKFEch9T
         0bJD9EMLrd8vvZgOvpGVIrOM3NNnGp8TNElxNjfTgzUpuhaWks8t7HMwQ0zmINhcuYdl
         7gmP3RYNw9IFABwZ1tXn/QTxoxkjWimgHTmKohnBSagwO8dRBS6hsQvcuZZdGZRFCYc9
         moh8hAaQ6ujBS6HEJ9f5hJIY4nL4ianNdsLrIdCUcmc7HXjmtAISN2E/XNNDVZ9QtHgw
         BVIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795226291; x=1795831091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        b=KvoL8HADhptaP8Sly/9m4hTBRi9BTQAOM8HOsxop7jXKORfHKjHLdZsAhzWMyPi7ZE
         boW31RuWMrl7q9UsvKKHRU8pt+nL1JQYCdk+d6DyY2WUT1SAE8O0UTdmkGlxNP22wFbA
         Si4zujzjCuVc5DxN6WFjUU725qvuTPuye2lrhIB+dqbiZvzx5Q4L75jXB2uJ83PEODGZ
         E3hTLp3AH9g9L5C73VcSa49roEYs9OSuqdRTyfcjohLsziffe7/tdlhjzViUIZQgSMFz
         zFuhtq1GahBT6HKFX/8pilkxZHOd9d/U4/TeITC1AH6AGJ0Fz9pmQo/NOnz/VnmZ/2UE
         v9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795226291; x=1795831091;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ViePrhkW9tmaFAR9u/XBSqg02m0Nj6G4/uTmbScrP0M=;
        b=k9QBea147yYWOGUDyYaPcBW+/C1G6eUhp4FTaBFKn/n++SEf8w5luT4VTtp7Ph+nAN
         kjOtFqPYhAAtMp/iYoOStyys5yOvPoC00cDiV/FN6HfF5zsdcytJEp85y4Azf5FsciHV
         G+rTDhBgVl+5T08vZ4oiN1hp8fKr9OG1OtTBAbszFHHCKaRGdKyaLAfPgOBWey/Cd95q
         c9X6qgip0IrOJa0lx2J41isBg4DRkFsaE0kwxL6wKdyqmAqZCt92Xfg9KArD7eEYJa6a
         +Cwe/zzgmqGameSVNepBDCk9nibNvhyMFOv90PHdmmB8hmuChEo982GFCrma0J7iinmv
         dGiw==
X-Forwarded-Encrypted: i=1; AL+hErFPrNaV0xoeuqdhepH/rwYPN3lLX7wPWJIyWRCtPSqXYT1htgbAnuyp7RYELWT1sOLpCPohHdj53s+EMcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z888gK1OkzokxgjHrF3Tg6kAHFfj8Ehu17aXJ4Af8X1jD9l7Hoj
	bD5z3MuDvbnjk5ccoMVEkkxwb9OPLYg23EM6PVwsSaBxT92UMKX08n360oXQrzSaFAZkUjM29DR
	meGcEVfj1PNXgyQWRrpRKyNtxOS/fEac=
X-Gm-Gg: AZFdTZcoBt4+GNUjAp5UBEOruuWgHsFoBrbbzM5LQ1zIxIiOLOhaF0OyCMUq5SDDt22
	9btGHcpEgQ3jwgitXXs1RWb1pSXi6fheUnqTaoCcVHL0IEEff+sTkwrsTYL4dj2NrCmA+aEm9ue
	GJEldBzFauMiiIIfE6XK37IGGpf9hZwGaSoAHBhhEPzpdIAVbIZGXldylAHD7HMtOrJD5lTr3Wo
	G4IcI5lmjOZEpCGoC/VTDZm6qNPlA/WJBG1qHtEDSIE6UAILiRcenWa7vd8bHKyAYuWdS8w5JwH
	Ifs7312DEdkSbk8EHqHujTHG0FnA5RTO7zb0TcYbBbCssiJLcWSJ0HKm8t94HP4o3V427c2Aw+m
	Au7nGtmm5XBvrU+IQankp9IrCb0QEPq2oTdb7
X-Received: by 2002:a05:6512:3c8d:b0:5c1:ac77:25e with SMTP id
 2adb3069b0e04-5c1bc7bcc06mr1704756e87.14.1795226290518; Fri, 20 Nov 2026
 17:58:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120155021.1618964-1-liubaolin12138@163.com>
In-Reply-To: <20261120155021.1618964-1-liubaolin12138@163.com>
From: Hyunchul Lee <hyc.lee@gmail.com>
Date: Sat, 21 Nov 2026 10:57:32 +0900
X-Gm-Features: Aa3M54pm2AqGJ8rfhMyI-qjsY_0TNOQdzS6bz0LFsIAGC_D4K0CAlmgi2iF89qo
Message-ID: <CANFS6bZHFoG-6tmH2squCBbfzEmfGsfcfuf5HRVq5S0=qhGHxQ@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: limit MFT mirror comparisons to system records
To: Baolin Liu <liubaolin12138@163.com>
Cc: linkinjeon@kernel.org, d3nchk@outlook.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Baolin Liu <liubaolin@kylinos.cn>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=EB=85=84 11=EC=9B=94 21=EC=9D=BC (=ED=86=A0) =EC=98=A4=EC=A0=84 12:51,=
 Baolin Liu <liubaolin12138@163.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> From: Baolin Liu <liubaolin@kylinos.cn>
>
> Windows 10 can leave $MFTMirr records from record 16 onwards stale on
> volumes with large clusters. Comparing them can falsely report
> corruption.
>
> Commit 749357bd48c1 ("ntfs: mount hibernated volumes read-only regardless
> of errors=3D") made these mismatches force a read-only mount even with
> errors=3Dcontinue.
>
> Limit the record checks and comparison to the first 16 records within
> the mirror, following ntfs-3g. Keep reading the full mirror for runlist
> mapping and location checks, and leave mirror writeback unchanged.
>
> Fixes: 2beaa98b46c4 ("ntfs: restore $MFT mirror contents check")
> Cc: stable@vger.kernel.org
> Link: https://github.com/tuxera/ntfs-3g/commit/85e208176ffd16ce9a51a9f534=
b194f0ebbde6e3
> Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>

Looks good to me.

Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>

> ---
>  fs/ntfs/super.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> index 98e6449fd79f..103d2b1b630b 100644
> --- a/fs/ntfs/super.c
> +++ b/fs/ntfs/super.c
> @@ -1207,6 +1207,14 @@ static bool check_mft_mirror(struct ntfs_volume *v=
ol)
>                         ++index;
>                 }
>
> +               /*
> +                * Windows 10 may leave mirror records beyond the system =
files
> +                * stale.  Read the full mirror to map its runlist, but o=
nly
> +                * compare the system records, as ntfs-3g does.
> +                */
> +               if (i >=3D FILE_first_user)
> +                       goto next_record;
> +
>                 /* Do not check the record if it is not in use. */
>                 if (((struct mft_record *)kmft)->flags & MFT_RECORD_IN_US=
E) {
>                         /* Make sure the record is ok. */
> @@ -1250,6 +1258,7 @@ static bool check_mft_mirror(struct ntfs_volume *vo=
l)
>                                    i);
>                         goto mm_unmap_out;
>                 }
> +next_record:
>                 kmft +=3D vol->mft_record_size;
>                 kmirr +=3D vol->mft_record_size;
>         } while (++i < vol->mftmirr_size);
>
> base-commit: 4862a81576e3b20ba40cb94a38c5df0450047ffe
>


--=20
Thanks,
Hyunchul
