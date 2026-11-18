Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045337;
	b=IGn5yLrb2L52Q+mExuxEFC75nhgpquBDTdVwR128AvFAqSJ6ozPhhZgIrXKWZNJCq1GD
	 YMXkpAkTEmVZjupBiPiLR5oqFVFyF5C94rBfnGiXCBB69HcCpJKd/HTKye2C9YImIwqEM
	 1o7qXNLZOSV0tXs1n/LWLGt0UUK5pSoh7NPavg8q/M/6aje9a6ucJbK3AvFpqVDE0KEC3
	 q8oJV6FEo2FAnV+BOACyv68fo4o2+z+eCquV7qZyN9ze4YHCS6tSTwLc7rPuZRzDTMu1c
	 y+FepTSYTBUjXJzvzbJxl3Li1rAD0QiFZlanJR6+um0K4cLxXfASjfnI8w1tytnAJCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
	b=ohHNCZKTVVX26XUgsFQeLrWPXui6oAMAqKscoNLFXtmj1swNKOgPouqxOTN682UjSw4W
	 zDdzKaKErIreagixzXixD76LpVT1eM6Y/17Uzj/HVwVSdfoqJNMXR4i6EnQBOUTEXzCoO
	 dQz8kN5L1Ukim/0XIjzbc8puYf99PQNAtkQDyX1y/xD1Zhg1lZF7StGS6hRk97Umstp7c
	 RAU9WsmWGHMO5pjeOoT51pZ+dJ5DuEQzkFDs1Z+1wAPJKnQK6CKHO/BEwXu+KG/CZgOBX
	 RAncFmI3PcmbXXMTy4aNzraILy3EtZirilRAF+vYjd73Mr4DvK585SNQuKzBsEFC6mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYPFQo2m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC814606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC814606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BYPFQo2m
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2efc4a84e75so13905ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:42:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795045336; cv=none;
        d=google.com; s=arc-20260327;
        b=HtJKac/DgF1xo0eMweAouD/1396PApq0YCKiC0oW66J9VtIbgbTzdf4sTTV8xcCIB+
         xVzI20Qa+gD4DlZdhLK4SmumC1Q1PkfowL/lA6RFlGqHJsKc/1ryhBbM7s+QS4y1or9C
         1h5gB1P0CqOXHIGBThiUZ8NWEVDtDkeAsy8i2BdNDk4r6imAXVouzrvJRWm6NblDptRJ
         jyOwb9X8rHyBTJbyrqXh8HgS9EgTKu5P18WugxUl8jWPZKoVHkq1L/pWZh+uesdod7O1
         P+m+0+zLe8d2sn5g77B8oXiWfAYCyp1Z25T4Zl0gXfo/ixPEg0ra4ohJ2gYE3H62QD3f
         SOug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        fh=zxuRLsm0RcPuMGLrqo/Xd4O9jAcTynyZqDZZzal2XWk=;
        b=K21l9OqljjnhcHllzt5zDZjhP97oIcPEmImFEBRThq/h93Na9eg2QE7xy4x8aibUel
         QdgliAJoKbBUtic2LMM3l1jU/5IJc6ea0RIKLQTRA8DFfi/jiIH+dJCGAyl3efKmUdXH
         RRJfpW2+Fw61PcKCXBMx9Su8koRycLJVIh3T3ijVpQEUhD8rUHDIYf6VLNqTjqvkqvQU
         Neuxje20OIOB8xYi7IKqkZNhzpqUYJ1a9D1aKJ6R8UPYefFy/LbVDkcBTypSQ9wvhkCI
         u2js2Z0MMUU4SABs5HBBOvPKU9Yq8o+1VLsgDyqcz3zwdEF9UTRN5LWtRcyOX2BVQxOq
         CRpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795045336; x=1795650136; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        b=BYPFQo2me3FI9+6BoNiaXzaOQPNXr2VbBy/Ph9cbu3UzPsUPyMiYJz1MQR9otfUvHi
         drXujMbOXyXnWPFfyJ4Uv7gGipquzv3ETUttYf0fQi3TJ/0oukTN3KL0YarpRCGWS8Kl
         Q4x3RfaA4ZI9RTkfj4RIW+SGedXjg0q1MGLtDIB05XmUmAQWlvEcWbYdYOWp3uGjTnNQ
         /Jcmr/TogJ1yRXMRBMsfOf349U8LHeqBJipOLHtnS7JCNYiSmpvk23Wpf41qJ4yEJOU2
         BzwYS+AR2LnYRTRl8L/2PLP1574w30ryIRWBBX6eoMxDvM0k7TCbLdZ2kkrpTFMDAgcO
         ladg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045336; x=1795650136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s58pISHO6GBziIbcD7smkIkbecT4gUDSwM5+fhy6RzU=;
        b=LyeODkMTI8kZqIdGhfyIPrRZ1K7iMgOsdrjdhesMRcQ7uPkUMrtqwwOZjIPOG2y13Y
         H9U1ApCWHLEiV3i2dev0lVQR7DuPXkRx9Ot9uiLkm/0PMHDkLX8o8dx0Ar9sKnDzahFP
         pDhNaYRZ7QCln2Gi4wg8v2QRiOjfsadgzAR19RO0sl47fEyax3OTw4CpcTNtlAPz27kt
         VjLKfxmgZOU+InCJciCRQKIQWOKJw6TQw3Km3lR6LjUyOFZPrVcgruPvIfwaj2liPfYB
         OQVTdhNYj5RMeeE1X7bOaLcx2TOgs+YX4r4k5e5O/kNmLr2/Aj8N/i+u0T6lTdDd6+GN
         H0yA==
X-Forwarded-Encrypted: i=1; AL+hErF69ehS154dsU17/iOWwAiRMbSshIDSCNXtSHbtx9rM4lkiQu5IlkTVJo8NuP3NVfgaxp//LKPHXJZlFn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DPtJ/8Z0nrb1nRLoIPADRL4elfMhpprKtDLOsm2CjGocyLnq0
	52LetGC0e7B4QPzfl6X+Ic3bbRWkR4Ur3y+tDJjCU7ooMLv4lc97ZgzMz8U0Db5QzRkL6Smkp3G
	dvhnpcMG08OKwXp+UZsyACrKRpJ86US8pWJJXaTn6
X-Gm-Gg: AZFdTZenHzGIvOvVScOp1ZveSCsPmjAoxHjMNHBH18zVKge8eBmjq+kGZXzEq3SySgn
	/RZE6Z0rrQspnet1kFxeNbscoKyKNK+bcw/Zwm0F1AW/PwheBUAzbQgMqmlJ8b0pKgcVpXAKeV4
	8LHsW4qvvwRH4jQSSWMZEORap39cUjlfpuKRCf1RZ7vpTbQi2KM1E99wt4SiXLYpWTATvD2927w
	v6k3/X7+Y5uWuBxRnfTvPF5cUCOA5NsBLiJdfWpk3Rv5tDGpnEre1OwPDjwf0JCQeWaNI6tLMt+
	kYd7MrqKb7SMxy7M2urk+i+s6WBgwGkH0xDy7qjV/z8GH2TrSC0x8F0sDVxOIgwPFTgoRTvuE6X
	7v58puCaeB6Upu5ARNhVvHxRd4dMwei1Q4xH5RjbHL+V6JdM6rQGyc+gjXQBNOKsydROIwEho6U
	1LBPf1S8rQ4Ix4m45r4xPVQnvlrDtiPGAfitiR
X-Received: by 2002:a17:902:ccc7:b0:2e6:d25:d874 with SMTP id
 d9443c01a7336-2f028c3e17fmr143915ad.10.1795045335693; Wed, 18 Nov 2026
 15:42:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023429.29330-1-enderaoelyther@gmail.com>
In-Reply-To: <20261118023429.29330-1-enderaoelyther@gmail.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Wed, 18 Nov 2026 15:42:03 -0800
X-Gm-Features: AclHuK9zkg5a7aJIuOxzPa__9fJ6mx2Z38mZmb44f7PTJuVcXf4iZLJXA2rnRU0
Message-ID: <CAEAWyHc+0zrhwgAC9m9uj-R1Ddj7_tKqVnTwQt1LoAfNAAhM_w@mail.gmail.com>
Subject: Re: [PATCH net] gve: clear flow rule cache state when freeing its buffers
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Joshua Washington <joshwash@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Jordan Rhee <jordanrhee@google.com>, 
	Ankit Garg <nktgrg@google.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Tim Hostetler <thostet@google.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Matt Olson <maolson@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:35=E2=80=AFPM Zhao Li <enderaoelyther@gmail.com> =
wrote:
>
> Freeing the flow-rule cache clears its pointers but retains the cached
> counts and synchronization flag. A successful rule-reset command
> invalidates the cache, but a failed reset does not. Recovery can then
> allocate zeroed buffers while retaining a nonzero count and synced flag,

Yes, this is possible when gve_adminq_reset_flow_rules() fails in the
gve_reset() path however....

> causing a later flow-rule query to return zeroed rules as if they were a
> synchronized cache.

The user visible case is narrower and will only show up on an ethtool
-n <dev> rule 0 with a stale value. Because gve_get_flow_rule_entry()
will end up re-querying for every other location.

Also, the more holistic fix is up in gve_adminq_configure_flow_rule():

diff --git a/drivers/net/ethernet/google/gve/gve_adminq.c
b/drivers/net/ethernet/google/gve/gve_adminq.c
index 8b215fca9c1b..ee9d5bc20e7e 100644
--- a/drivers/net/ethernet/google/gve/gve_adminq.c
+++ b/drivers/net/ethernet/google/gve/gve_adminq.c
@@ -1399,8 +1399,7 @@ gve_adminq_configure_flow_rule(struct gve_priv *priv,
                        sizeof(struct gve_adminq_configure_flow_rule),
                        flow_rule_cmd);

-       if (!err)
-               priv->flow_rules_cache.rules_cache_synced =3D false;
+       priv->flow_rules_cache.rules_cache_synced =3D false;

        return err;
 }

When a new flow rule configuration is _attempted_ as opposed to just
successful, we can treat the cache as out of sync because the command
could have failed for any reason and the device state is unknown. This
covers both the reset path and a failed add/del command.

I'd suggest a v2 with this diff instead of the memset describing the
problem a bit more in detail in the commit message. Feel free to use:
Suggested-by: Harshitha Ramamurthy <hramamurthy@google.com>

pw-bot: cr

>
> Clear the complete cache state after freeing its buffers so reallocation
> always starts unsynchronized with zero cached entries.
>
> Found by code review. Compile-tested with W=3D1.
>
> AI assistance was used.
>
> Fixes: 57718b60df9b ("gve: Add flow steering adminq commands")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
> ---
> No new W=3D1, sparse or smatch warnings.
>
>  drivers/net/ethernet/google/gve/gve_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/eth=
ernet/google/gve/gve_main.c
> index 35cf0f06a0f2..747f5229d7ef 100644
> --- a/drivers/net/ethernet/google/gve/gve_main.c
> +++ b/drivers/net/ethernet/google/gve/gve_main.c
> @@ -189,9 +189,8 @@ static void gve_free_flow_rule_caches(struct gve_priv=
 *priv)
>         struct gve_flow_rules_cache *flow_rules_cache =3D &priv->flow_rul=
es_cache;
>
>         kvfree(flow_rules_cache->rule_ids_cache);
> -       flow_rules_cache->rule_ids_cache =3D NULL;
>         kvfree(flow_rules_cache->rules_cache);
> -       flow_rules_cache->rules_cache =3D NULL;
> +       memset(flow_rules_cache, 0, sizeof(*flow_rules_cache));
>  }
>
>  static int gve_alloc_rss_config_cache(struct gve_priv *priv)
>
> base-commit: a2239d5dbbda3a61b6323df8836f605921a29f7f
> --
> 2.56.1
>
