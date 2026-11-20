Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193748;
	b=xBPlEbcfCnFB0xdFimF88fzdpEDyhcdfdhjACMnD//N2XolQX0Wu4tj+t533YTZI8i0b
	 EDVWsLw2aeviMBFLYqDUR2WrapeUAqWUbLct1DsrGrHPv9uF7WS0n14k0ugFcQN4+DBXK
	 UWDMmEI1eYQDzmARgeUXeide+p1qLmeofvF/QpLYoKvycnPpy9o75feWm6EU3tcZ2ga+Y
	 KCPLlysGHHct/NqLVSwup9Ox5pIP+0gmAOzfMBHnU8jjS3DJDPWEhGZHg2h5ENAMjZERx
	 pYbASworQgW4xe4Fe9p8pUsUP+FvHjFbm0u3da5Beg2cBFvsGwfh6FaXPxSgH7HX6Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193748;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=KfINgigE+Qsibsmg3Pd332ceU/DO12uJAUgUbTLWkTU=;
	b=VoztG9VFnLosHZLZtYI86HxKR2caMlGd2/57WjNCoiSISwGsg2/qjhU3lWyku1r9asdQ
	 qzDQSIetyP8Gu/Jo4x2ODKxcvGT2wynv1z4mVu3IAYnBZxFgKTT5mTjUttrwF2vTivLMb
	 CJE9ODnkU0fVWtE+XbPUCEu5jNRrDfADWVEXPsVS9+zKTVu9B4TG0vTkXg7wETjr2L0D1
	 4T11CHpunwPQddCMrnFYK2gmfEZbc+n6h+TV+w+kbRfT7raMfAngREhAPZ8dMFo0NWHTB
	 U2jcDdpPTU7L/S7+NGMD0+vu7VwMJYpTB6ZiixPRkLDZeapia0wJv6Fo+Gl5v318/mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G8SSsNFm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k39JZNZ0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9021560A2602
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:55:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9021560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G8SSsNFm;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=k39JZNZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795193745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KfINgigE+Qsibsmg3Pd332ceU/DO12uJAUgUbTLWkTU=;
	b=G8SSsNFm+qPeoE14VkXNcGaOvjiaotBkHy+PQnQFtB1EKaO9AMffvoKM2er2bgRShvmtYp
	cpiJ0o8eFk36VL67DzjJtjLlxYW9tdVQAqywW8HQOMZoOckS/9GJ9cHZ7dV5a26QOnOw3r
	NLwrGTuB5L5g4oD4wfhloIRtB+rDw+8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-_IcJOPj_M268VHxUSbmM9Q-1; Fri, 20 Nov 2026 16:55:43 +0000
X-MC-Unique: _IcJOPj_M268VHxUSbmM9Q-1
X-Mimecast-MFC-AGG-ID: _IcJOPj_M268VHxUSbmM9Q_1795193742
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4aae099f5baso540917f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795193742; x=1795798542; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KfINgigE+Qsibsmg3Pd332ceU/DO12uJAUgUbTLWkTU=;
        b=k39JZNZ0YMY1sI9/71+I/TGEZ4ZXIOoIzVUcSEbbO078jBVUmGqL/nfj45L1gkHEwI
         Vb1mhqLNAYKDJbvHM4WwQCjL1yn8dCvWplZHNW8DAwFc4sPzouZzWZoL5o9M9C9gxcCZ
         klz+FllRwjWqhvrGfG/u+ofOIzFsvFUx53JTXiod35+8jx0iO7n75NIRze2tPiBkznNY
         jNv9TlubHG3ZUX/2fPxvjKfr7qbNZVKWaJRtVoY+5PNjcf4KAuAAuXD9lJohmnSoeieR
         M9jIrRyqe0epu8FknFmrC3HxVGw1TiQ7g9zGNgcDMJV/zzgba6NbYDbz8pd9YttzCwL7
         7F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193742; x=1795798542;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KfINgigE+Qsibsmg3Pd332ceU/DO12uJAUgUbTLWkTU=;
        b=Coc+w8Sfwp0753dteuK1PoiUBI5Qia5i78322+LYDCSg1UmyD9tOXhLIZrYGojZwLD
         sOX36jvhU3jjtS1BY+iG+KGIrYC6UtvMzebbAMTe0ttXBKQr6AYY95JY384lvnNJYWLO
         ykZYTd/5CN+7EP/7ieMOlqbAxyeo3jf4RYOd4uOJGQ+TYjCJGEx0934oOva3DY60lGlY
         1Uru6Yk+F1YJRXD+B8sbt/4LfYOhO0p5FqdnvJI2wDCdA6FWQ9xmKmHlLpjVkMxXeEQc
         0xp9hOvLtdprW+ZDecnjW2H0wXnvU1m/wHPkOMtf2SP8i++eEBFcGqq2FvF05r82ZcHR
         BSOw==
X-Forwarded-Encrypted: i=1; AL+hErGW9zH1bbYbDWk+val5DvgnqCrxjW1y9+swwbGgLtWyK+IhOYGQSthiUKtswVcnxEuXNYT15yhEs5fZUjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AYnjOJJi+oopSNksXuiT4/9SRWoegYlB29ytEvR2SQz0H3nvx
	aCmcCC1MYYxYaVpBexUcupZtx9RNo5BdqFhe45nVzE2qVZ78/jKZNXnINxgfqIiQgc8TveZ/+Dw
	zIVsZx1L25mgrmXJo2JUjq8u9qOa8ro2ROMtFSXNMPAPsVf4zDIVPKnz7sxs+yuiiM6RihNDQ0d
	Ygzfs=
X-Gm-Gg: AZFdTZdtx5pX3ze6zyi4gLkML7z4q0qlLMyyWwFRa9CmMxV0ldp5kc0p0Uy6ziXKTkX
	4C3lEgfWwSmMX8w057vk8nATsM8aHLQjoOzyy3jz6ltPWGqkOsygBu5UogXKg+mg0Ky0urIKmh8
	/UYrY1Ww9+qx0b/KPgFFsYDAO1gsBAZIwpRmEd1/RuY4Je4cE/Qd8y7pRPaDoKbObm2O9kfWFks
	evW8kyiXMK0xAcEA26QpuUBhdjv1s44E6vPg1T1qqTXbcKMw9m53Xln2qlqwcOHR3nHbMF1jqXL
	jT3wo1qOUzFH/95lMzcKjNjdJ0ZdR7rf4G5x2+zIt4ys9m+ER0NUkT4aKsgsOztLzkfcHTApe5h
	loUEWSHndacAB5lBRdJ6GxKJchb+QnoNVIAN5D9y2nnjHsyNcOeZU2fUOvJz+kiEdtm34wh5C68
	ka
X-Received: by 2002:a05:6000:186b:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4abab02c60amr8111247f8f.5.1795193741955;
        Fri, 20 Nov 2026 08:55:41 -0800 (PST)
X-Received: by 2002:a05:6000:186b:b0:4a6:4f35:336b with SMTP id ffacd0b85a97d-4abab02c60amr8111219f8f.5.1795193741582;
        Fri, 20 Nov 2026 08:55:41 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm6819963f8f.44.2026.11.20.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:55:41 -0800 (PST)
Message-ID: <fd165f2b52d7a9afaa30c29963178da08fbc3521.camel@redhat.com>
Subject: Re: [PATCH v8 04/14] rv: Disarm HA timers on the storage free path
From: Gabriele Monaco <gmonaco@redhat.com>
To: wen.yang@linux.dev
Cc: Nam Cao <namcao@linutronix.de>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 20 Nov 2026 17:55:40 +0100
In-Reply-To: <0ab3632933008e028855e158b4b978881a2715dc.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
	 <0ab3632933008e028855e158b4b978881a2715dc.1793900349.git.wen.yang@linux.dev>
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
> da_destroy_storage() cancels the HA timer through da_monitor_reset_hook()
> and only then unlinks the storage with hash_del_rcu().=C2=A0 A handler on
> another CPU that looked the storage up before the unlink can still call
> ha_start_timer_*() after the cancel.=C2=A0 The timer then stays queued on=
 a
> storage that kfree_rcu() frees a grace period later, and fires on freed
> memory, reporting a violation for an object that no longer exists.
>=20
> A monitor cannot close this from its own handlers: any cancel it issues
> precedes the unlink.=C2=A0 The first point no reader can race with is the
> RCU callback that frees the storage.
>=20
> Add da_monitor_free_hook(), called right before a per-object storage is
> freed, from the RCU callback and from da_monitor_destroy().=C2=A0 HA moni=
tors
> implement it by calling ha_cancel_timer_sync() if da_monitoring() is true=
.
> Replace kfree_rcu() with call_rcu() so there is a callback to hook.
>=20
> Cancelling synchronously from the RCU callback is safe: HA hrtimers are
> always armed in HARD mode, so hrtimer_cancel() only spins, and on
> PREEMPT_RT, where timer_delete_sync() may sleep, RCU callbacks run in
> the rcuc kthread.
>=20
> Storages whose monitor never started are skipped via da_monitoring().
>=20
> Fixes: 4a24127bd6cb ("rv: Add support for per-object monitors in DA/HA")
> Suggested-by: Gabriele Monaco <gmonaco@redhat.com>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---

Looks good to me, thanks

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0include/rv/da_monitor.h | 27 ++++++++++++++++++++++++++-
> =C2=A0include/rv/ha_monitor.h |=C2=A0 8 ++++++++
> =C2=A02 files changed, 34 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/rv/da_monitor.h b/include/rv/da_monitor.h
> index e3cf85c9ce55..c7f9733fb8a4 100644
> --- a/include/rv/da_monitor.h
> +++ b/include/rv/da_monitor.h
> @@ -67,6 +67,17 @@ static struct rv_monitor rv_this;
> =C2=A0#define da_monitor_sync_hook()
> =C2=A0#endif
> =C2=A0
> +/*
> + * Called on the last reference to a storage, right before it is freed.
> + * Monitors embedding a timer disarm it here: an earlier point races wit=
h a
> + * reader that resolved the storage before hash_del_rcu(), and
> + * tracepoint_synchronize_unregister() only covers tracepoint probes.
> + * Default: no-op.
> + */
> +#ifndef da_monitor_free_hook
> +#define da_monitor_free_hook(da_mon)
> +#endif
> +
> =C2=A0/*
> =C2=A0 * Type for the target id, default to int but can be overridden.
> =C2=A0 * A long type can work as hash table key (PER_OBJ) but will be dow=
ngraded to
> @@ -543,6 +554,15 @@ static inline monitor_target
> da_get_target_by_id(da_id_type id)
> =C2=A0=09return mon_storage->target;
> =C2=A0}
> =C2=A0
> +static void da_kfree_cb(struct rcu_head *head)
> +{
> +=09struct da_monitor_storage *ms =3D
> +=09=09container_of(head, struct da_monitor_storage, rcu);
> +
> +=09da_monitor_free_hook(&ms->rv.da_mon);
> +=09kfree(ms);
> +}
> +
> =C2=A0/*
> =C2=A0 * da_destroy_storage - destroy the per-object storage
> =C2=A0 *
> @@ -564,7 +584,11 @@ static inline void da_destroy_storage(da_id_type id)
> =C2=A0=09=09return;
> =C2=A0=09da_monitor_reset_hook(&mon_storage->rv.da_mon);
> =C2=A0=09hash_del_rcu(&mon_storage->node);
> -=09kfree_rcu(mon_storage, rcu);
> +=09/*
> +=09 * A reader from before hash_del_rcu() may still arm; the free
> +=09 * callback runs past it, so the hook disarms there.
> +=09 */
> +=09call_rcu(&mon_storage->rcu, da_kfree_cb);
> =C2=A0}
> =C2=A0
> =C2=A0static void __da_monitor_reset_all(void (*reset)(struct da_monitor =
*))
> @@ -607,6 +631,7 @@ static inline void da_monitor_destroy(void)
> =C2=A0=09 * pending, we can safely assume no concurrent user.
> =C2=A0=09 */
> =C2=A0=09hash_for_each_safe(da_monitor_ht, bkt, tmp, mon_storage, node) {
> +=09=09da_monitor_free_hook(&mon_storage->rv.da_mon);
> =C2=A0=09=09hash_del_rcu(&mon_storage->node);
> =C2=A0=09=09kfree(mon_storage);
> =C2=A0=09}
> diff --git a/include/rv/ha_monitor.h b/include/rv/ha_monitor.h
> index ebb7f91e3447..3bf1dd15544c 100644
> --- a/include/rv/ha_monitor.h
> +++ b/include/rv/ha_monitor.h
> @@ -29,6 +29,7 @@ static inline void ha_monitor_reset_env(struct da_monit=
or
> *da_mon);
> =C2=A0static inline void ha_setup_timer(struct ha_monitor *ha_mon);
> =C2=A0static inline bool ha_cancel_timer(struct ha_monitor *ha_mon);
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon);
> +static inline void ha_monitor_free_env(struct da_monitor *da_mon);
> =C2=A0static bool ha_monitor_handle_constraint(struct da_monitor *da_mon,
> =C2=A0=09=09=09=09=09 enum states curr_state,
> =C2=A0=09=09=09=09=09 enum events event,
> @@ -38,6 +39,7 @@ static bool ha_monitor_handle_constraint(struct da_moni=
tor
> *da_mon,
> =C2=A0#define da_monitor_init_hook ha_monitor_init_env
> =C2=A0#define da_monitor_reset_hook ha_monitor_reset_env
> =C2=A0#define da_monitor_sync_hook() synchronize_rcu()
> +#define da_monitor_free_hook ha_monitor_free_env
> =C2=A0
> =C2=A0#if !defined(HA_SKIP_AUTO_CLEANUP) && RV_MON_TYPE =3D=3D RV_MON_PER=
_TASK
> =C2=A0/*
> @@ -551,6 +553,12 @@ static inline bool ha_cancel_timer(struct ha_monitor
> *ha_mon)
> =C2=A0static inline void ha_cancel_timer_sync(struct ha_monitor *ha_mon) =
{ }
> =C2=A0#endif
> =C2=A0
> +static inline void ha_monitor_free_env(struct da_monitor *da_mon)
> +{
> +=09if (da_monitoring(da_mon))
> +=09=09ha_cancel_timer_sync(to_ha_monitor(da_mon));
> +}
> +
> =C2=A0#if IS_ENABLED(CONFIG_RV_MONITORS_KUNIT_TEST)
> =C2=A0#ifdef RV_MON_OPS_INIT
> =C2=A0#undef RV_MON_OPS_INIT

