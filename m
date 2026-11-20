Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176766;
	b=NVeAfmYvulWYaXKhhU6DiwTrj/4pbVcyFiqzMO7m/SpYrL+kkVI60mX9thicpMExBB31
	 lTfqrauaSUHP8iLB7HiwWfGiRzesBrz/AEOd98fnTLuubFiXtHZzh+jSRLv68srfpfenZ
	 VVwdLAuzyPOpqMrGA21gBMXzIp+YWF0axR0VzoFwCA/iaC69tlRVZ5stbavnTUwc9lR/o
	 FDi9eS+JbQUhMy4gU9gqUiEC8YPCe6g3dD6zY+rU5ASa9Pkyj2/VgGIGOSMbKl+kBSVso
	 0/gBEhVKTYDJq9wg+i1ZrLEt9VcN8NDRP0xcxIoMrv0fcggCUQL7foUkRXkLwoJfU5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176766;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=Fm0n4WElJ0e9msCLidXhb9kiBDeF1hAX/ZUDT+BPJeQ=;
	b=O609IagRcv2cn5PbwQNLAltRIwiIvdBoeHy6wPQdVMlgBL2YUPpHak3zexZbQmJRmzXM
	 mxxHGWWGxqKb3xMqeM81H4jjc46bvTsoS1fF7i29aNjkrBelZR1vSul7UeBGI8ExbaOYK
	 dn5e6xTGu6VMQ+BUjXI5f3UG3uQpsmh8TNOQZIS8rddaKdRrlcfTDkFyiCGGcpvUsA8eB
	 +4jWnx2NgB6kWRJTQrxsxr7R3fr88p7/M4lEe9/xXNey26w4T6v2/paKrBFifwmbMOGcV
	 8Ba4m6TCRtT69V0qOZNq+dSFFeT2/ua7tfK8DZFJzmTPzDl/8LhIcPLzKqL0lWMeBuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0UXYX1j;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VFvnFheF;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0UXYX1j;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VFvnFheF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795176764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Fm0n4WElJ0e9msCLidXhb9kiBDeF1hAX/ZUDT+BPJeQ=;
	b=Z0UXYX1jYOB4n8eAGEgGtIRa3HHpQgVgdDNNQtIwXnCQr8DOWMHK3G9onnjGvc9p1xhkLG
	iUv62iAlJTqiBF1x78pKPFmxjV+la7XGUS0vXaME1lbu3SsEVmCukQMQcw61G7xxgJt7ia
	TDxdxA9iRB0pHNwNldGdAWprAEzwz2M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-ZvGjDinXPY-EzrxW59wgTg-1; Fri, 20 Nov 2026 12:12:43 +0000
X-MC-Unique: ZvGjDinXPY-EzrxW59wgTg-1
X-Mimecast-MFC-AGG-ID: ZvGjDinXPY-EzrxW59wgTg_1795176762
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso6743435e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795176762; x=1795781562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fm0n4WElJ0e9msCLidXhb9kiBDeF1hAX/ZUDT+BPJeQ=;
        b=VFvnFheFJa2oxk6b08mpEruvRoGp2xHQrNp2/ZeXDgoRTrF8bpVnHe/o8cuU8FQAgx
         fsDldllZ541Ke8MMCqUL2V9ia/maBhD+ftAU1ctE44HF5984KVb5GGTbwJeM6MWEz5nk
         lEoHSZzAMEDk/KuIkXyTzMP9WQ6XSNWBVRV13jBgMFp2wkEgghDdLGiizJ4KdwSjKo+6
         82boByAwwosLcEyhLN6yUVLzwAkvhqzgy2Akbog7k9o+/CgfzzVISD+NFO3KXYhwHFxF
         Xp2DyK7RlkTyzRjATkyKAN3UzNjx9qjUI72uhSBus8rgBkhxPC4oY+u3uth9+yYvzJt/
         P9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176762; x=1795781562;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Fm0n4WElJ0e9msCLidXhb9kiBDeF1hAX/ZUDT+BPJeQ=;
        b=nvJ2FgzRDlHNqh+Kx1G3AYHR8EDjZmDr6jlnxKJ2qmU5VEBL2HylGoWsBpgzRyN6jh
         44MvIIxM9UXDRtU+0iarjqPbniBcxJu+/XD6PbUvFOfwd30uLc53LohCria7PzK2OFKZ
         15rMesqGZhaZ6wMJFS2cueGTkTnZx0UPVXyDBX5HC3bXdnb7gREnXeeUawT6SxHRtaRZ
         7jaV9bpAZtYzlStKoV8rS9LSCEGtaFEQEH8/1lSuWb174KgQjzchUUgeygw1TnsP1Bm/
         wJt5HWMRLWX8N/AoQCZs1jy/qwdaFZnYZRxvWR+wc0CrLkOYesaRAj8/oIKP66Tnvr1P
         ccSw==
X-Forwarded-Encrypted: i=1; AL+hErFyM8LSNjyK/4kGgiC+yg/UYwUM7WP259sUuU73rW/cKOJTC3sXQ3mrGCLw1OhK1AFvnsBjoKdg6GXWmXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DzP1nrJzERu2mL3RAnkp5YIfg9rv9fIQvY3Q2wktdx1nqi3cM
	ecIC+mw9nj6qEfmPv6o3PefnG99oF3Jlt7wtGq4ONd9as2ImeBXDd0DHrRGztKU4ae8c6CU305g
	uCCtqqVn+EaxZ4zlM8XbZtYcw8qKhe2d2LZwABTVkc29qsB9NrLv3+VcNuu3I2JEk3Q==
X-Gm-Gg: AYBFou0TMdd9J0AHc7Am7Mk4bAZgHwtDlx3f1pQ2GQqCaOdjZSHMNXKznlTRoBDc+6x
	v37GH+1cwCMDmwzcEJ5+va6S+MRUEADvPXsNi1AkEsCUI26j+Sn6rXWzlv2H9yy0AFe2yrx/JcL
	F/37z9cPTmwp8MP3+CaXNLBXCGp/UKcqB4Seu9+bpIS0tNtDK9aZEfu37fvt1PsSKy/1aejyPYs
	+hF2FOXNXBEsHj9u0UMJ85ZkIH4NYEvB5Q2TpQ70uHiX4UFRnZhvjNjrff1NOYcbqBBNmBccn/u
	71vche+9YkEKvmrqz12Z4OQq0RMZHipeOHMIfokcXJdTHQ3sajwXljpViQ0F8nu3BSmoo4AEU2n
	Z/ssiglhr8yjFcNE4fg5anWBRnrYOFsEzUQL/mpWEyrrRzCCspihgCwxcVhhXhhYMPRlPYS6+Q5
	xg
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr64759765e9.17.1795176762179;
        Fri, 20 Nov 2026 04:12:42 -0800 (PST)
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr64759385e9.17.1795176761785;
        Fri, 20 Nov 2026 04:12:41 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm5183887f8f.7.2026.11.20.04.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:12:41 -0800 (PST)
Message-ID: <9709becb82665468bef304ece738c17280550337.camel@redhat.com>
Subject: Re: [PATCH v8 09/14] rv: Add generic uprobe infrastructure for RV
 monitors
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 13:12:40 +0100
In-Reply-To: <21469501d58c0b7efc662226f4c9e9a9d7d32847.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <21469501d58c0b7efc662226f4c9e9a9d7d32847.1793900349.git.wen.yang@linux.dev>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-06 at 01:49 +0800, wen.yang@linux.dev wrote:
> From: Wen Yang <wen.yang@linux.dev>
>=20
> Monitors that instrument user-space function boundaries need to register
> uprobes and deregister them safely.=C2=A0 Provide a thin wrapper so monit=
ors
> share a single implementation of this boilerplate.
>=20
> struct rv_uprobe embeds struct uprobe_consumer directly, avoiding a
> separate heap allocation per probe.=C2=A0 The struct holds an inode refer=
ence
> (acquired via igrab()) for the probed binary for the full uprobe lifetime=
,
> as uprobe_register() does not take an inode reference.=C2=A0 On unregiste=
r,
> the inode reference is released with iput() only after
> rv_uprobe_unregister_sync().
>=20
> rv_uprobe_unregister_sync() calls uprobe_unregister_sync(), draining
> all in-flight handlers before the containing struct may be freed.
>=20
> The API provides register, nosync unregister, a global handler barrier
> (rv_uprobe_unregister_sync), and an active-state predicate.
>=20
> Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

This API requires a lot of manual steps from the callers. We can refine
it later on but at least I'd simplify the teardown.

I remember we discussed this already. The uprobe registration requires
both inode and mount to stay alive, path_get() does both, so I don't
think we really need also the igrab()/iput().

Do users really need to carry the inode around together with the path?
Other APIs (e.g. bpf_trace.c and trace_uprobe.c) pass only the path and
get the inode internally, I don't see why we cannot do that and mandate
the path is owned by the caller (which is already the case).

All the other logic might be fine in the callers, but at least let's aim
to simplify what is general enough.

Thanks,
Gabriele

> =C2=A0include/rv/rv_uprobe.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 +++++++++=
++++++++++++++
> =C2=A0kernel/trace/rv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> =C2=A0kernel/trace/rv/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0kernel/trace/rv/rv_uprobe.c | 56 ++++++++++++++++++++++++++++++++++=
+++
> =C2=A04 files changed, 96 insertions(+)
> =C2=A0create mode 100644 include/rv/rv_uprobe.h
> =C2=A0create mode 100644 kernel/trace/rv/rv_uprobe.c
>=20
> diff --git a/include/rv/rv_uprobe.h b/include/rv/rv_uprobe.h
> new file mode 100644
> index 000000000000..b93c2a81bc22
> --- /dev/null
> +++ b/include/rv/rv_uprobe.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2026 Wen Yang <wen.yang@linux.dev> */
> +/*
> + * Generic uprobe infrastructure for RV monitors.
> + */
> +
> +#ifndef _RV_UPROBE_H
> +#define _RV_UPROBE_H
> +
> +#include <linux/types.h>
> +#include <linux/uprobes.h>
> +
> +struct inode;
> +struct pt_regs;
> +
> +/*
> + * Free the containing struct only after rv_uprobe_unregister_nosync() +
> + * rv_uprobe_unregister_sync() + iput(p->inode).
> + *
> + * The inode reference does not pin the dentry, so callers that re-resol=
ve
> the
> + * probed path must hold a struct path: 9p cache=3Dnone remints an inode=
 per
> + * lookup.
> + */
> +struct rv_uprobe {
> +=09struct uprobe_consumer=09uc;
> +=09struct uprobe=09=09*uprobe;
> +=09struct inode=09=09*inode;
> +};
> +
> +bool rv_uprobe_is_registered(const struct rv_uprobe *p);
> +int rv_uprobe_register(struct inode *inode, loff_t offset, struct rv_upr=
obe
> *p);
> +void rv_uprobe_unregister_nosync(struct rv_uprobe *p);
> +void rv_uprobe_unregister_sync(void);
> +
> +#endif /* _RV_UPROBE_H */
> diff --git a/kernel/trace/rv/Kconfig b/kernel/trace/rv/Kconfig
> index efa930f94ea4..2bc412304293 100644
> --- a/kernel/trace/rv/Kconfig
> +++ b/kernel/trace/rv/Kconfig
> @@ -86,6 +86,10 @@ source "kernel/trace/rv/monitors/nomiss/Kconfig"
> =C2=A0
> =C2=A0# Add new monitors here
> =C2=A0
> +config RV_UPROBE
> +=09bool
> +=09depends on RV && UPROBES
> +
> =C2=A0config RV_REACTORS
> =C2=A0=09bool "Runtime verification reactors"
> =C2=A0=09default y
> diff --git a/kernel/trace/rv/Makefile b/kernel/trace/rv/Makefile
> index 4b84b83b942b..8dc14a1819b8 100644
> --- a/kernel/trace/rv/Makefile
> +++ b/kernel/trace/rv/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_RV_MON_DEADLINE) +=3D
> monitors/deadline/deadline.o
> =C2=A0obj-$(CONFIG_RV_MON_NOMISS) +=3D monitors/nomiss/nomiss.o
> =C2=A0obj-$(CONFIG_RV_MON_WAKEUP) +=3D monitors/wakeup/wakeup.o
> =C2=A0# Add new monitors here
> +obj-$(CONFIG_RV_UPROBE) +=3D rv_uprobe.o
> =C2=A0obj-$(CONFIG_RV_REACTORS) +=3D rv_reactors.o
> =C2=A0obj-$(CONFIG_RV_REACT_PRINTK) +=3D reactor_printk.o
> =C2=A0obj-$(CONFIG_RV_REACT_PANIC) +=3D reactor_panic.o
> diff --git a/kernel/trace/rv/rv_uprobe.c b/kernel/trace/rv/rv_uprobe.c
> new file mode 100644
> index 000000000000..1c7f8466aeed
> --- /dev/null
> +++ b/kernel/trace/rv/rv_uprobe.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Generic uprobe infrastructure for RV monitors.
> + */
> +#include <linux/fs.h>
> +#include <linux/uprobes.h>
> +#include <rv/rv_uprobe.h>
> +
> +/*
> + * uprobe_register() takes no inode reference of its own, so grab one he=
re
> and
> + * drop it only after rv_uprobe_unregister_sync().
> + */
> +int rv_uprobe_register(struct inode *inode, loff_t offset, struct rv_upr=
obe
> *p)
> +{
> +=09int ret;
> +
> +=09p->inode =3D igrab(inode);
> +=09if (!p->inode)
> +=09=09return -ESTALE;
> +
> +=09p->uprobe =3D uprobe_register(inode, offset, 0, &p->uc);
> +=09if (IS_ERR(p->uprobe)) {
> +=09=09ret =3D PTR_ERR(p->uprobe);
> +=09=09p->uprobe =3D NULL;
> +=09=09iput(p->inode);
> +=09=09p->inode =3D NULL;
> +=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +EXPORT_SYMBOL_GPL(rv_uprobe_register);
> +
> +bool rv_uprobe_is_registered(const struct rv_uprobe *p)
> +{
> +=09return p && p->uprobe;
> +}
> +EXPORT_SYMBOL_GPL(rv_uprobe_is_registered);
> +
> +/* The inode stays held: in-flight handlers may still reach it. */
> +void rv_uprobe_unregister_nosync(struct rv_uprobe *p)
> +{
> +=09if (!p || !p->uprobe)
> +=09=09return;
> +
> +=09uprobe_unregister_nosync(p->uprobe, &p->uc);
> +=09p->uprobe =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(rv_uprobe_unregister_nosync);
> +
> +/* Global barrier over every probe dequeued so far. */
> +void rv_uprobe_unregister_sync(void)
> +{
> +=09uprobe_unregister_sync();
> +}
> +EXPORT_SYMBOL_GPL(rv_uprobe_unregister_sync);

