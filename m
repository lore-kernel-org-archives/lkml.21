Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947163;
	b=Tk6SXBjIU0N9bxeCRfdojQ22MgXrh6sIf/JNOtwOkeK3rHk9gEoi3O8qq4zKE8QxrgoT
	 yVvI3x4O0p615QR7sRKW7yrVtDhTvNiqKPzX3OBBqx9X4sKr+vtNYIdGGL3RsvbvNsqpc
	 iGLqQN+wcB9s2swX1D0NpbYWqsyewGNO7jpqWZF9DB/2wgW5k1Mf4M+66qNEdNt0Cwh14
	 jESTo675tzLIOaY2cW3UFDe/L8uD/nwvET9r1MBPX2vKlczAO91XUD9wr8H4hDmDhvhUU
	 yJNePT+2Oazj/T/041sN2fmag7VeUukFJyIOLTPdg0y8z5AGCJ1BgilYFl8iMoEIc1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
	b=YhM3PnsIBLKKJU66lpR88ZEol/lDsUlN8wwqAPPbudFrZkLgk5Cnj+BdGZq5uqmjQQVX
	 XRNqdtAlm680egpTRC5dvgrJK8nQOZdn2igYLS/Qyaqt3Nz9EaHBquzzInIf4p84s0kjd
	 Adqw+qMtjs8LVcL/N2dmhGwT0v98p6ae1ynVSAImv5GnSixeEdvNXsTpsdKA5r8qe6k44
	 g2SoCQQ/bclnK1wrzsot++W00beqTuLA6tpq71K1bgojYsfuwQsKJtxgNVOULWaDMGEzu
	 NpwzvcseejBuGHBcndGtBKe+l9PdYin4JBB6BbZH2VETNc7NVLBAKcOb9yVaPFYyXDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZCvar0e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F9606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8F9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZCvar0e
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55be673e029so901cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794947161; cv=none;
        d=google.com; s=arc-20260327;
        b=VAkWjnbMJqO2aGZmz6EKno+INWOIK8opcfuqLuHh30M2n3taKGp/XHwNiEp2Vf1RW9
         zn5rWr6xRs01Y5PxJe/Vv4xw9Caw+eY+83CWvCoi0+tHf4ZNv5rgxhsWS7JCqPGDNXWa
         V/VVXOqIFPxrbfLdkauoR2JIXVlIilyybiF3ri6i7xoTF7V/B262j8potmnJNpzLgeXZ
         Qrde3XiID3KtFfUtfIOvAIEjqrE7I3rF/R8J3G1rD7CcVRJnA6xNUBJ/UIYTvQueZ+dc
         Y5KwfVBM4BR6BLY7AzA9Y+qdR6VKMxnwMokHJ4GSYBVOUd0gubUYtTsT6LnCC6xxwWEp
         swXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        fh=1CUN5Co5DT4vXq0MrtDjO1KsmPp7nl6fG+zPRwwjVmM=;
        b=ltFuYW6o8HZihTgfSF2TBHhTvyssagcb40BRy3M5T0Hblsrs7/KrcUwgGwny6RuXYs
         cdzUxa1eLMk1JY16UsuCJbYbTcF31Dp/vyVqawf0CtVOa6skQ3wUMijAs+/f+HBlp2SC
         Li6nCphBIl1qy8ekmASTaK+Qmqz1/Y0I+scMojEznfOXzbvAYsisFF5ZR8WEwPnxLMmA
         XqTj3dHCB4scKsE+7H/vlt1J9A5wfOXLm19M4k6nHb+HTDBHCxnlYDZJZczCaiO+u9NA
         cFMSE6ZKYzAyyChRXpcFEQasi15QBbclbygi0i6gu/VCRzvAadQwsf2Wp9r4Dav9JuLz
         iGfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794947161; x=1795551961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        b=VZCvar0eimwgQLva0HdpriYLUsvH63/eT8RVb6GPzRHz7zWDvegttPHSlFCnFYORvE
         hGm71drNsPe2IOKZBduDAsbEW6AtqNb5Bk2YDSu1zkw+9wKWyXsu/wkrKqOLrkVLGtiE
         Uz3mUIeMzcmI2S8loauQLcQ+yKXSjeobgnvjgXGvy4JFaaAmXnkiLzPcDh8L4DELonA+
         DHbw/zIZh+CI0mNkviHmUwzeQIn7pWror9CkGN9muW99kac9y/xPL0mVpMxo4Jb5wKP5
         IZZs9qsNP+N2hUjrQAZtSI2tYeToJwCavIa9l71iER57mu3ck3YGUZ44Ec4qTpi5G2K6
         0Wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947161; x=1795551961;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCWHnnwEVxO1omjU149A2BWvg6ai6vFpainl1qSCuX0=;
        b=KLWXDkITpgx9GpL9oWYJduyWL5QgxRNY8/EZys30kSB8DCSk81kbE6dO0qFHv6dxWj
         +gHG8fx2+m7feQHGG+f69mRih9rkV/r+I8eNWqj/2ZLClLJ7/qAeUaReriuueeBY0WgE
         hjBRgpSY1uo7vlvU+Txugh9NyIHAORw2zaW4V7ZZdDtfwMl+j7IUbbNCSeYu8TwUOp04
         JCGwJanCg+JhSsg5k0XMnvzDdGt1UOaLkfAEH+B6uZN89IHGyEEKxWwOgdjLKyUaLW2l
         61N93FN/cHf69U2+T2J4tqf9XtnsleGNzic+ZSeD/W5S2QZtLocvddINnwgArkxVloc7
         sx5w==
X-Forwarded-Encrypted: i=1; AL+hErEPpHI6mSALBNpegI0AhqdhAXgvRcJHONcffWcB1DPQuvIL5Vo0GiUi+fr3F5+srukJxdc+wMy89d/c9AE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZPldUC5cG/lEj/AMikBOnaRths47NNpyQcbiVeKKImCVl3sqw
	la/jP29rw3ZUHE2zsBoz22Rclu7QUloecUQ4jewWz6j2MCJoASwiZN+aDxldCGuv84shXT1+vN2
	9CJ4u6atRb6lxKliWD/n53lGRUWzY1+jyLL/UasU3
X-Gm-Gg: AYBFou2XIWHnwhja9EJXuI3X10KPq51bshVkKaIcUuuX0oUr5//cH3sgBBbkwYgjeYR
	+fz4Bn0udWzxKMrgBse2/cplqGHJzcb5hCsqn7K7mjVm+ER4gX+iaoQ9257twhMsT8edZfdJMno
	RF2igDoCL2/tnXhyAHalOFi9fL74k59acQIkE2hrPp/PgeaypRKWMyA6FrXM8VoXsIThlZFsoh0
	3drTMksgzwAEo21L2XaAoB7sCxV7vNmUPPPgrf0+OqNaBiO+KSv+322QbWKGpFnyHO32SIfuiaD
	fnJyNMCpBn29ZxndwGCT86LX+Oy7R2ddG4o+dDxmjcQcDkntcAl6VhEsl97CGssQNL1QMtrffKh
	LW6mjaN6J6+6RaJ3NZflnGa4gM/9Xl8XCBetb3YbIUXrZy6R8l84I0DIyMHwcwNn1sb7tF85ntK
	1sbBWUEHO5P2A=
X-Received: by 2002:a05:622a:4c11:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55d5c25ac0cmr168991cf.7.1794947160746; Tue, 17 Nov 2026
 12:26:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com> <20261108223913.3624571-3-irogers@google.com>
In-Reply-To: <20261108223913.3624571-3-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Nov 2026 12:25:49 -0800
X-Gm-Features: Aa3M54rgKc4_PudcaM6yszp5Mdw4isGgsPgTnvL2ClaE7ml053-JZnxk-RQJF-U
Message-ID: <CAP-5=fUQvqpny1CrYVUqg9SQo6VpOuUqfOK403BxK_vWCDU30w@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] powerpc/secvar: Add missing kobject release
 callback to secvar_ktype
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, driver-core@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> In add_var(), a struct kobject is dynamically allocated with
> kzalloc_obj() and initialized with secvar_ktype. If kobject_add() or
> sysfs_create_file() fails, kobject_put(kobj) is called to clean up.
> However, secvar_ktype does not define a .release callback, which results
> in a memory leak of kobj (and a pr_debug warning in kobject_cleanup()
> when CONFIG_DEBUG_KOBJECT_RELEASE is enabled).
>
> Provide a secvar_release() callback that calls kfree(kobj).
>
> Fixes: bd5d9c743d38 ("powerpc: expose secure variables to userspace via s=
ysfs")
> Signed-off-by: Ian Rogers <irogers@google.com>

Gentle ping on this patch (moving PowerPC maintainers to To: in case
this got buried in Cc:).

Danilo offered to take the full 9-patch kobj_type::release __must_init
series through the driver-core tree with subsystem ACKs, and this is
one of the last two patches awaiting an Acked-by. Does this look okay
to go via driver-core?

Thanks,
Ian

> ---
>  arch/powerpc/kernel/secvar-sysfs.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/sec=
var-sysfs.c
> index 395399bbab2c..f3f6ac25ea78 100644
> --- a/arch/powerpc/kernel/secvar-sysfs.c
> +++ b/arch/powerpc/kernel/secvar-sysfs.c
> @@ -126,7 +126,13 @@ static const struct attribute_group secvar_attr_grou=
p =3D {
>  };
>  __ATTRIBUTE_GROUPS(secvar_attr);
>
> +static void secvar_release(struct kobject *kobj)
> +{
> +       kfree(kobj);
> +}
> +
>  static const struct kobj_type secvar_ktype =3D {
> +       .release        =3D secvar_release,
>         .sysfs_ops      =3D &kobj_sysfs_ops,
>         .default_groups =3D secvar_attr_groups,
>  };
> --
> 2.56.0.455.g6c5a503b38-goog
>
