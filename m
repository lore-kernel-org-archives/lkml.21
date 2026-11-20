Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795199372;
	b=YT//34OxNLroUput/cqQWPu8WbT66P7bCf45HjzcvPlC5LUN2TohUbXhjHIUi7UEr/JV
	 aBqosGSh5FXx8d471z0vPn6bolR4lZ/CEJY7wfb9+j4Y9APBfArTD3Y7xto5xrkz7Qyg7
	 ZOBe5/kTL+gKBgXeCsk2tAuaNc0y5PxmEFyUxC1P334Rrk79p5JAGBMtqQggzdPNzDen/
	 PgqBP1OITvzbA7FYsOMZvfpwxo6/5Vv8zrr2ThS71sT47oBlSwHOuJldJ5jVE8Jbmj4gs
	 +rWFqg9T2ulQlmj6t+bxrgP/aliZnmGbSf9/TAg8OQ9OKA1ELCniMGYNn9cSjsA9LEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rgUMX9qHZUJbBmUpguL56XnLssX5w+QXcL03YNunXoQ=;
	b=wjcCcqNXD1Ct/4xjxYS0sJUM96w+koHd1SVzPFUtwVUgNfnh1EaP3pwt8s2s3twn1mnd
	 lsA6VABL6972Xowd52pKpxHgz829ryHrAa7r6dscHwi1i15n8HEfnTVA+9WbtP4A6hlFk
	 8OSGyn7xQnlSXW4GWvChFqdDUBdKRrTrC/rO/m3EXu2edWDiOCqp9IMJfVVc6/5cqBGyE
	 B4YhTZuEnfkT9FpXbtv966LheFjPgeEzd5/OnLXhO23TYzU5rYTOyhqJk5yhabek6B5ZT
	 tckvXB6fw617I0PKqtsFbyRuYzSzLsoWd2Tf1gMhPO834DhQSX5qWD7hP5fhwpFw9ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EURERcJH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3C606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E3C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=EURERcJH
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-71ac8129d95so59756eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795199370; cv=none;
        d=google.com; s=arc-20260327;
        b=FfuqoWnQP9M2YNaMv8GE+ZIrriDfaihtPFCkF586aHue8Izfe8BvIeVRCEspSB1kf1
         tlRjnj7eVO/mWSp/xiKpKfqznoR6Tv30jt/peXN9bemfZGMXBs2evdmhnuoUGIpg8My+
         QtuKppSd2Rj4bSPSHEa0VJidQcifOpgljPLjlbGutDpg01RrN23FnUvrzaFV68Xaw7h4
         TcdLwoToK35MnRPunBznWl1Y4zYHzpQChy6QATgZF7Lf4VqZafWXvZQfbYKZVTGlT7BM
         RGBEsaWXzDQj9DPebqYHq5gdB1IMgWnSzdCv6k0w07k7/79pJmOnUWhTmyvrpd/NBPRF
         oRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rgUMX9qHZUJbBmUpguL56XnLssX5w+QXcL03YNunXoQ=;
        fh=1lw1k1v5ApArVeqWy8wOKUUbFqX0oP1xqW7OlFFIM8k=;
        b=IFVKG8VLr45Ofnescr8oO/4f7aE9gIZzU2SCucj86uBPRVXXdcb4uL7lhdSuJKiwNY
         U9RO4jzfN2EIqLQegqd4Rl/jHUGiI6LpsCm3sPHpl9sYsmCW2zmwG5A/PmbDGf2Yy/9I
         mWUN61dKEzmhM2wVVoMDnG0nn5cskZQwDZv9gwhVfcKImAzRXWypaNSJfj3egYvceahe
         Kp7fzPIhgIbmACH145ijx4oPE1jFAN4It1ohMrCAP1QCyxHudnu1eo3G+0bCqhTPzNV5
         5n7etjH00nQ1wh+AHVgI3r7FgS+FnMHwjK7si88XF9oc2sACEMcarxnfsZTbgxef7WGQ
         njlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795199370; x=1795804170; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgUMX9qHZUJbBmUpguL56XnLssX5w+QXcL03YNunXoQ=;
        b=EURERcJHBg/we6G4bCd9KT0WhwgCqkCqdasBxX1RwqaGtm2cTV8z2rS3D6RBus6cbf
         2drAznMT1+UywPsyrUg/PgNwnaHMYM7ooA4Ux30lxYwXp3BmZYM82xapVrnn25CRj6ZR
         vnh8DOUreOt2ltczLQp1DRj3Uy8s6ijcaOpN51zrZp0NUx1LSIhZkfZNl8gzND/Spo1T
         uH7Z0+fqMGnzvYbGylTnSSugza8bMEtSv+HIOD4m0rIu/dhY3R+W8fd/w5Tl7OQ6iecw
         NlpDGMYSkVOa01kd8jLggDMQvv1hScyPc6gpHqoII4vjxZsLWp+5zq9n1U8Hb+yFv7B6
         jpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199370; x=1795804170;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgUMX9qHZUJbBmUpguL56XnLssX5w+QXcL03YNunXoQ=;
        b=pI9cRWWW0sGSqNPKOEDf+kjxF9YlV3u//u1Pybj0Crb2LKjuX/CzIUmTmJWZJFrXkk
         AA9ecc4Ezp0vBMc3WRdfmBaRzWn5C+rmin4d8gfRveMCSCIr/j1wlEy+ZPnSiaF0SfAD
         SAhw6dyNnIPCb3bPGhQjFyiY82p1CCjELPHLvHJJxCia1yCTdjqxRHZyZm8qD+HJzY3b
         nQctp2q6T6SGybJ+DcDVfIVlN5nMa+wtGyftWbYZfRNdw441Svx3Kt54IH79H0gCeXK9
         S9+FoMAyhQIwb90zKnHJzMcqIjqr74N0OSsGucZKfSAR2DxBzZ1lcGpCb/ibqaehuVSs
         i2Bg==
X-Forwarded-Encrypted: i=1; AL+hErEdPL69mGcCPY/WMew8IAms73131c7EJGLNRJrn+afF90CZ11OzArHHlk7L1dQ+PKE8Cdw9Smt/S+5F2yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k7XPAtzX06Zd6kvWJnfd6sJoQQ82DvaSrxqPkfmfP0hiKVR4Q
	GwjG3gquMVSa9LaVP/xJU84AabpFaY29Ktn2PoUNJhy82AtHUAtQHQf2wN+Jy8fyCmCzha7SupP
	mdxCWG4FfuvE8NTK8v7kWk9SyJ8xo6IoWYl+ztSMLJ2Po6+wYbBzU7nCF1g==
X-Gm-Gg: AYBFou0uHmo8lnIAOQwq+b0tCuGy1rtZCUmNKtcwWj/hf43SDjBgKxo1FeLIZYteJkt
	zrKVaoGYNw1v7jKnA9s/e8oWwDb8oNhJgU1Rg3njjiwvGXF3UPfhJy4k54qN7kb7xPvO4OIvE1B
	iw2jdJTqYYCFgvDR2oSneO5JaMYiEzeSwdxXtqeHd88JWaMp9mmBkWZvRGMdcpiLMMLCJ/2CXdx
	Cb8GietMTE+15hUs04AFYb3wTvFj0/xUybYp7+KnHMSxB+iIXsJasJ1BDz0993m/kTE5vLNw87t
	jimsreioRxzPQtMsWgpyvAdccM84kK6RFPFDjbkceaX16xbtHI4sh4ueJ/5b2CzVg2S1SKCfEH0
	p6BsBTXJvIrAgUusduDn8swnmgoOUYEnsM6Sx
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id
 006d021491bc7-71b39033ddbmr4203075eaf.0.1795199369899; Fri, 20 Nov 2026
 10:29:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120064806.752251-1-csander@purestorage.com> <awBuiVyOQj_YHCZD@infradead.org>
In-Reply-To: <awBuiVyOQj_YHCZD@infradead.org>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 20 Nov 2026 10:29:18 -0800
X-Gm-Features: AclHuK-s6j1YsrlPtwSKf7apfEUcNespK_RTRNAYp4u75GuQefesSFhUkseeyTs
Message-ID: <CADUfDZonvcOkM7DD76Gg=Z6NHhM87a+n0xPirfTYS+wLLnHfmQ@mail.gmail.com>
Subject: Re: [PATCH] block/t10-pi: deduplicate blk_reftag_remap_{prepare,complete}()
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:00=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> Good idea.  But I think the new function name is a bit misleading and the
> double ternary operators on a single initialization line obfuscate the
> code compared to the old if/else.
>
> Can we do something like this instead?
>
> diff --git a/block/t10-pi.c b/block/t10-pi.c
> index a19b4e102a83..f24ededd70a8 100644
> --- a/block/t10-pi.c
> +++ b/block/t10-pi.c
> @@ -436,69 +436,32 @@ static void blk_tuple_remap_end(union pi_tuple *tup=
le, void *ptuple,
>         bvec_iter_advance(bip->bip_vec, iter, len);
>  }
>
> -static void blk_set_ext_unmap_ref(struct crc64_pi_tuple *pi, u64 virt,
> -                                 u64 ref_tag)
> +static void blk_set_ext_remap_ref(struct crc64_pi_tuple *pi, u64 from, u=
64 to)
>  {
>         u64 ref =3D get_unaligned_be48(&pi->ref_tag);
>
> -       if (ref =3D=3D lower_48_bits(ref_tag) && ref !=3D lower_48_bits(v=
irt))
> -               put_unaligned_be48(virt, pi->ref_tag);
> +       if (ref =3D=3D lower_48_bits(from) && ref !=3D lower_48_bits(to))
> +               put_unaligned_be48(to, pi->ref_tag);
>  }
>
> -static void blk_set_t10_unmap_ref(struct t10_pi_tuple *pi, u32 virt,
> -                                 u32 ref_tag)
> +static void blk_set_t10_remap_ref(struct t10_pi_tuple *pi, u32 from, u32=
 to)
>  {
>         u32 ref =3D get_unaligned_be32(&pi->ref_tag);
>
> -       if (ref =3D=3D ref_tag && ref !=3D virt)
> -               put_unaligned_be32(virt, &pi->ref_tag);
> +       if (ref =3D=3D from && ref !=3D to)
> +               put_unaligned_be32(to, &pi->ref_tag);
>  }
>
> -static void blk_reftag_remap_complete(struct blk_integrity *bi,
> -                                     union pi_tuple *tuple, u64 virt, u6=
4 ref)
> +static void blk_tuple_remap(struct blk_integrity *bi, union pi_tuple *tu=
ple,
> +                            u64 from, u64 to)
>  {
>         switch (bi->csum_type) {
>         case BLK_INTEGRITY_CSUM_CRC64:
> -               blk_set_ext_unmap_ref(&tuple->crc64_pi, virt, ref);
> +               blk_set_ext_remap_ref(&tuple->crc64_pi, from, to);
>                 break;
>         case BLK_INTEGRITY_CSUM_CRC:
>         case BLK_INTEGRITY_CSUM_IP:
> -               blk_set_t10_unmap_ref(&tuple->t10_pi, virt, ref);
> -               break;
> -       default:
> -               WARN_ON_ONCE(1);
> -               break;
> -       }
> -}
> -
> -static void blk_set_ext_map_ref(struct crc64_pi_tuple *pi, u64 virt,
> -                               u64 ref_tag)
> -{
> -       u64 ref =3D get_unaligned_be48(&pi->ref_tag);
> -
> -       if (ref =3D=3D lower_48_bits(virt) && ref !=3D ref_tag)
> -               put_unaligned_be48(ref_tag, pi->ref_tag);
> -}
> -
> -static void blk_set_t10_map_ref(struct t10_pi_tuple *pi, u32 virt, u32 r=
ef_tag)
> -{
> -       u32 ref =3D get_unaligned_be32(&pi->ref_tag);
> -
> -       if (ref =3D=3D virt && ref !=3D ref_tag)
> -               put_unaligned_be32(ref_tag, &pi->ref_tag);
> -}
> -
> -static void blk_reftag_remap_prepare(struct blk_integrity *bi,
> -                                    union pi_tuple *tuple,
> -                                    u64 virt, u64 ref)
> -{
> -       switch (bi->csum_type) {
> -       case BLK_INTEGRITY_CSUM_CRC64:
> -               blk_set_ext_map_ref(&tuple->crc64_pi, virt, ref);
> -               break;
> -       case BLK_INTEGRITY_CSUM_CRC:
> -       case BLK_INTEGRITY_CSUM_IP:
> -               blk_set_t10_map_ref(&tuple->t10_pi, virt, ref);
> +               blk_set_t10_remap_ref(&tuple->t10_pi, from, to);
>                 break;
>         default:
>                 WARN_ON_ONCE(1);
> @@ -524,9 +487,9 @@ static void __blk_reftag_remap(struct bio *bio, struc=
t blk_integrity *bi,
>                 ptuple =3D blk_tuple_remap_begin(&tuple, bi, bip, &iter);
>
>                 if (prep)
> -                       blk_reftag_remap_prepare(bi, ptuple, virt, *ref);
> +                       blk_tuple_remap(bi, ptuple, virt, *ref);
>                 else
> -                       blk_reftag_remap_complete(bi, ptuple, virt, *ref)=
;
> +                       blk_tuple_remap(bi, ptuple, *ref, virt);

Sure, happy to switch to an if statement instead of the ternaries to
initialize from and to. However, the code generation is worse with the
2 calls to blk_reftag_remap()/blk_tuple_remap(). The compiler doesn't
notice that the calls are identical except for the swapped arguments
and emits 2 out-of-line calls to the function instead of inlining it.

Best,
Caleb

>
>                 blk_tuple_remap_end(&tuple, ptuple, bi, bip, &iter);
>                 (*intervals)--;
> --
> 2.53.0
>
