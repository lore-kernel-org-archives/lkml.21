Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163639;
	b=2CgdGH1JCNqU4c2Tg5oVs7o+UTRSwsl71vtBm8wvS5hcJHL1ysHOeS0PigncpbV3vsfF
	 V1VocTQDlkDTibAlgpx0Sufv4zJi6Luf6pdF+1xq7VaDbUpW2IRsMbQSxxOClWDR7tich
	 HZVH2JVmTN2ndjwLfJkFQOZMBvyJK0b77DSjYshbEqmKWfDP86aJhr33CbOPs7PdR2yxz
	 gGDOzNzZ9uz7Q7FEzJ7kSiyK/joLN5akhSuA5JcMJcz+vXDKI80hu+y4FZAk6MIln8jJ9
	 PNRq1J9xyQm+yXSSQCzC9r2q0YzwsXY10oKZsJjBbMMyM0vg/CjR/rgdAuUT7v5d7rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163639;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
	 From:Cc:To:Date:Message-ID:User-Agent;
	bh=ptLndDlQvR7gm+qGW2gcBAb8R5h35bArgLqAPPISXfk=;
	b=NXUG+Hro+fxla5sNoG7SN7HxjjJ4ow2STQOywnRLok+i7li5bfOPI7kRIkQJPFWeRVKo
	 ly5bM+qtpNFnR6IzYkj2KfQeTaH1Nm2G0XlDEjbWSK9SJRAan4MIoCtqwN6gpeFNHdC4X
	 ghjqhRJvzY27IvdBIXVteVDPoFJxRuTfQupalVXgkGkN4sh5EAvvql9mqak7m4gLet/se
	 uQ1uZ7OA/c8LlYgzDyAY/6KvK63uiPVO0J6xGIoPJpWN/x7bfLCMuFdEKSx/zO3hJ0rq3
	 /FhK/LJ4QFjv38DQLZwrF1EegdkNPRwVHM6SaQN6viVxAGGEwdpLScvpvG+eer4BxLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvHozla1;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DF7606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DF7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvHozla1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795163639; x=1826699639;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=GMyEQJvmq27rqx1T/bFHEkXPkQXd+jF7hs13UOe1t2w=;
  b=kvHozla1xJhx23OnBtWIidfqHmzY/IikwD1OfqlL2piSiN91Z8hBxKH6
   5W3FUl2Vfixi0XXC0SZSkvX1MBzBE7sRd7fWzqyziPE42wibeuKZMgkta
   EjpUvLpU0r6wi5IXyB4Zn/tvWPcsY5SWuHr+CdCeQcjJi8TCgONFsB1xF
   wH0DyLsANLReX95AlplqSFxl7OPttQ7CGxE5TcyVaSQfri1smKcSONl1o
   Cz2pFnWJf35p4QWKiKPZBL+lXS/+t1Y4gUW2AUM+MhsDRUtvq2CZkW4mV
   iBlXYf0FxRc0ZiI9cZuyOmI9lVySyF1TaaEoc8M+53XnQKJnQ4dEkrvKs
   A==;
X-CSE-ConnectionGUID: oCIfL70HTsi37qxJc03dOg==
X-CSE-MsgGUID: 2mnijreeR9qaraqOtYa/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3950684"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3950684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:33:58 -0800
X-CSE-ConnectionGUID: aXEXX1cHRaWdAopq149/8w==
X-CSE-MsgGUID: D26vuOlwRlqmJloPrNm3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10644733"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.228])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 00:33:55 -0800
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261120024210.1658348-1-lcy8047@gmail.com>
References: <20261120024210.1658348-1-lcy8047@gmail.com>
Subject: Re: [PATCH] drm/i915/gem: Set the VM owner before publishing the VM
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
To: Changyul Lee <lcy8047@gmail.com>, David Airlie <airlied@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>
Date: Fri, 20 Nov 2026 10:33:52 +0200
Message-ID: <179516363210.27957.16651774665226630199@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Changyul Lee (2026-11-20 04:42:10)
> i915_gem_vm_create_ioctl() adds the VM to the file's VM table before
> setting its owner (vm.fpriv). A concurrent lookup can therefore see
> the VM without an owner and allocate page tables that are missing
> from the client's memory accounting.

This commit message is just not making any sense.

The ID used in the supposed lookup is returned from this very IOCTL.

> Concurrent VM destruction can
> also free the VM before the owner assignment, causing a write to
> freed memory.

Could you explain in your own terms the call sequence that'll lead to
this?

> Set the owner before inserting the VM into the table with xa_alloc().
> If xa_alloc() fails, err_put still releases the VM.

Very LLM'esque to just explain what the code does to inflate the patch
description.

> Fixes: ca02a0119f81 ("drm/i915: Record which client owns a VM")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.

Unless a competent human developer looked the patches through before
submitting and wrote the patch descriptions, please redirect further
submissions to /dev/null.

Regards, Joonas

>=20
> Compile-tested only, with x86_64_defconfig and W=3D1.
>=20
>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_context.c
> index c58ffa5a8fa6..489b221091d1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1838,6 +1838,8 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev=
, void *data,
>                         goto err_put;
>         }
> =20
> +       ppgtt->vm.fpriv =3D file_priv;
> +
>         err =3D xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
>                        xa_limit_32b, GFP_KERNEL);
>         if (err)
> @@ -1845,7 +1847,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev=
, void *data,
> =20
>         GEM_BUG_ON(id =3D=3D 0); /* reserved for invalid/unassigned ppgtt=
 */
>         args->vm_id =3D id;
> -       ppgtt->vm.fpriv =3D file_priv;
>         return 0;
> =20
>  err_put:
>=20
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
> --=20
> 2.43.0
>
