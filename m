Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538122;
	b=hatA97Ra2/ZKuBeOu5eqKrrSgm912485OvK24xJ1cO9nsaFQnUPXsZpMmEgelcBrd+Uf
	 Jn1v/H63pUa5gi6EHUq+SN613TL5ogsU3xMS1NBKZI88bEu7lFUutKdFQDFQJdGFq/nuq
	 VIIRNdmZj9fwKT+oOLCXdX/qmkpa/tCavw8GgNWuYnkwmSI58qR1VisuWHrbqUhBw9Pyy
	 +6E7obstuxtnJm0RfXhGgGg7OT7tNtdqVU1oUfUdr6qfqDn3WkA4HA6TaPL6Z1tMRtzZY
	 mRaiuZGAVtMQfo9NuwArR28+rSipPk07TWD5AobKRuvl4Iked6AAd6l/3TXI4Ma6jeQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q1q2fcn9fQHuOJd5rAEfOkFeJSM6fAoxK5VQa+ilSls=;
	b=sbXPijcRFD+SXIPk0cO1DLJ8hRHrnoSGOhKIG4YwObjR4UQBnRurRlR0MjXlBisEBT07
	 b7ReM1tQNla5n7bZRC84Bi+Xmb/vszYbqTFxYZrynhHFX7qO6FeK3Jt/zt1IMOzXGxOcW
	 dxpzahHIbwu7DamvKm02GKw4hDmendEXfBubjcPlNk2LuXMldwoRli1F15CInpu5A/abD
	 hY9thkGXMKj4l1l+N8Jd+vSwtTt4kfkYtidnpqnFC7fQ+YL7OGMZmdj7NGsH3eA0gIPDt
	 QdPZ+1vlgnasyt1PHoMxJYFRcnZzQfxpzKrbwXgONSKD2NhgfoFpHIJy3IpyC4ZNR6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04L5qKV7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F46606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F46606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04L5qKV7
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b51389f58cso51297527b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:35:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538120; cv=none;
        d=google.com; s=arc-20260327;
        b=iOuLcO6uQXnai5dO2q43vBL4QN4cRzKwBJYLj4Pjtlh+4fVmjvk7Ezu6cYumg7mc2G
         PK3yAN+nSiZlXBofEslnsI+ADl/c6CIETEtjX8yyiRfhrwA8VYl+IUud9+2j0mz6dwsp
         adaNWlInhImq1/YEe5PvlsQFTl+lhsgXZJ1p8PLR/CmyqCtmPrqxiWxhtg6XWMUggmx9
         UsI+9/mII9DJOFJ3JH5Z1PpNcZXRg88hRe1IWm3IfDYK3KXiksh1+J5Fy/sRBtR6X8UX
         KXthl17uIP9g0qJbmq2srziIBgpn3tH1Gnsjt0Inz3/bKQwLrwJsrinw6Dpl5J2g+Oyo
         LTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1q2fcn9fQHuOJd5rAEfOkFeJSM6fAoxK5VQa+ilSls=;
        fh=dNFdYGVjJezanBkT0xx/8vYFnGLiaM0pbBvNd27ArHU=;
        b=h5nFzE8fC5S1iUG5HG0szIBJzFUjP8Dl8o/YVbVaXmh01vSADk3YsxzN+kA1oRk8yG
         W35P0YyR+fTbcuurM1r5WCsl+6k4tKvGxf2V/23bLB8Uq2ARMVjrGsUvAFCu1tgmXAy9
         9etvOpBy+8kdoeshYd9HNYXr3d6rLNWZFasH6EtAACO+4Nyr5IPEmXCXW4tNOcK5ipsI
         eVKs5v94XHQ57woER1aK3yEb9II6lifcO2+0C1sO94aYyTcN2/mEDim6t3FaWiRTqj0i
         Hvv7DqU9it6b0cBqF3HAF6ve8o9dTyhiW2HhtmB0r3Gx75dwuWNK90c87xKuOYmds/ng
         LmIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538120; x=1796142920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1q2fcn9fQHuOJd5rAEfOkFeJSM6fAoxK5VQa+ilSls=;
        b=04L5qKV7f1wXxeDhtgn0RuTHsfVXFVqiIjdVBavsJIo5maITe43jK/Kt7+BheWgJ4G
         K3ETEJtA/5um/qVhM7s9S5J+BqnAqN4NEVoXmmWePjlmvYh/+uCD3Vo0ilgJpq1AKgjN
         C5z+ng/lTZdixDOgst3s5PTu8Hjejg5jDOkFHIRsl2kZvorh4RjV21U0azg5pr16jbVI
         BNFiYg/n9WZkW6/pZzIGq1vGV6b8lmbZowlDscaihmP1T9tpklX5CjuyGJ8ra7Gtj3TZ
         14PkP0b8NJh61omrqD0TwEhADLNG5Hxrmk4EbZlAe2rAghMiK5ShgUf/SkxOnEuDk3HS
         WfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538120; x=1796142920;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1q2fcn9fQHuOJd5rAEfOkFeJSM6fAoxK5VQa+ilSls=;
        b=ljivW1RrECAN03MGUrSU6VgbLeoHevO+SghPobOA1fKEvkNFEmvDZtDZcFVI5DKBqZ
         kFExQ1Aeds2jqMxkOyx76OEkXt08PvOf3sy5RwEhRkgtbSlvS9/saSpGWuA4r7aSQWW6
         wQYrneYPNhJ2yviDpMhcrTRyXIOCx29mNm8mS0pxcWeYg9kXKfNNX3k3xy2PQX7485gL
         Gey8ivVKSig2htMpWAkmQt6MSdUuO/GrGBaBj+uNnDsvP94674cZ5XjXg00eTciOmPkD
         XfTIw3TU3HlxedOnKPLyHZx9epuDG8C2rmt9CUfGzPpIlQRmZSsDX4HXCQaSj3+vRAgS
         0lNg==
X-Forwarded-Encrypted: i=1; AL+hErHRB3n7dmpFyZY7fR0VjEPdxuLivzYjyxi0jbMB9FNXvZKZ8gvRcFynFemYHjEH4P0mD6O2BWOJyCjkpMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XoJHObQ1yL89/sZa30l6/zNXHPNBt4+z3NKFMYVCvkcKZ+4QF
	XD2hVRXYgb+PagJ3bJF0js5eKD3WOMC26fZhTIIcCMuIXfR/r4Z9bSFNVsWVf2aagpmE6aqJl3x
	EHPx/5oZlXknxtgVHGfhcCNxh3u9adZQ=
X-Gm-Gg: AZFdTZca7Dn7K+WsiKcccmhU6DKBRWlQLofUxtW8LbFkcL5NQ9S+MVxNIIfNHXqxkkO
	jtpss2O1WEkDO/4jfvw/eqQk/H5VdLReubNx5AIt61LvvSt0eU87ht2i8PTDyZEsDn2YIfYa2kS
	t3JCvjXoWx7QYx+wWd+Z27hnp029Z4ZTdMvS2DnNkzCW+oZVx7Wk778jX2x3mJTuYwFeoaFB7e8
	cdXjDf3Cu+eJ7tzOKKISGjnvw7t78nwlleL4b+CqWQ7v3S71ZxPTXyLxDLcA147cNEnID4CuIOQ
	QoB3gYTQwV1uKd1vgfPMa3VpLN8R8boYjKFI7bx2jZR2AQoK6h4dlHvxEDrdpH1jNxzmgvas0qw
	4PdxI8zCm4PyKwQziYVOW1QM1P6TfMZpkokCrXNyN9D2vMxM4x8mqa1jinZ28awTCrLDYxHuIGo
	u+MCaVKReoqSN9B0u0p0iZftYnEHbZaarZSC/pfGfavG0yBPygw49A3TdnvmNbfLTH9jNFCTyDa
	CD/qA==
X-Received: by 2002:a05:690c:a409:20b0:8b1:8dae:e8a with SMTP id
 00721157ae682-8b52043cd97mr31267007b3.20.1795538120088; Tue, 24 Nov 2026
 08:35:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-for-upstream-le-conn-params-rpa-v4-0-f2dd5eb41f45@podgorny.cz>
 <20261124-for-upstream-le-conn-params-rpa-v4-2-f2dd5eb41f45@podgorny.cz>
In-Reply-To: <20261124-for-upstream-le-conn-params-rpa-v4-2-f2dd5eb41f45@podgorny.cz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 24 Nov 2026 11:35:08 -0500
X-Gm-Features: Aa3M54oYGPSa1mat6D7LEK4uErs7ATZyYto1_uaeH_zD0QzKThEF3gVMCQ9BrgE
Message-ID: <CABBYNZKCSXsMb++hkgxk+Q8m1W1=+=Z_sgpaQFgWtnSJg8G43w@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] Bluetooth: connect to an RPA as to the identity
 behind it
To: Radek Podgorny <radek@podgorny.cz>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	Johan Hedberg <johan.hedberg@intel.com>, Jakub Pawlowski <jpawlowski@google.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radek,

On Tue, Nov 24, 2026 at 4:31=E2=80=AFAM Radek Podgorny <radek@podgorny.cz> =
wrote:
>
> A connect made to a peer's RPA through hci_connect_le_scan(), from Pair
> Device, an L2CAP socket or a CIS, looks for an existing connection by
> that RPA only. A bonded peer's established connection is kept under its
> identity, so the lookup misses it and a second hci_conn is created
> under the RPA, which waits until the connect times out. An L2CAP
> connect to the RPA of a connected peer does exactly that on v7.3.5.
> The connect also marks params under the RPA for itself, while the
> peer's advertising reports are resolved to its identity before
> check_pending_le_conn() looks params up, so it is never started either.
>
> Resolve an RPA to the identity first, through a new
> hci_rpa_to_identity(), so the connect proceeds as one made to the
> identity: it finds the peer's connection and marks the identity's
> params. hci_connect_le() still puts the RPA on air when the controller
> cannot resolve it. SMP can free the IRK without hdev->lock, so the
> identity is copied out under rcu_read_lock().
>
> A connection hci_connect_le() is already creating for the peer is kept
> under the RPA it dials, which the lookup by the identity now misses.
> Fall back to finding the peer's connection by its IRK, which also finds
> it after the peer has moved to a new RPA.
>
> Fixes: f75113a26008 ("Bluetooth: add hci_connect_le_scan")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Radek Podgorny <radek@podgorny.cz>
> ---
>  include/net/bluetooth/hci_core.h |  2 ++
>  net/bluetooth/hci_conn.c         | 57 ++++++++++++++++++++++++++++++++++=
++++++
>  net/bluetooth/hci_core.c         | 20 ++++++++++++++
>  3 files changed, 79 insertions(+)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index 4aa0b49ae104..28eb79dd51f0 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -1927,6 +1927,8 @@ int hci_bdaddr_list_del_with_irk(struct list_head *=
list, bdaddr_t *bdaddr,
>                                  u8 type);
>  void hci_bdaddr_list_clear(struct list_head *list);
>
> +void hci_rpa_to_identity(struct hci_dev *hdev, bdaddr_t **addr,
> +                        u8 *addr_type, bdaddr_t *id_addr);
>  struct hci_conn_params *hci_conn_params_lookup(struct hci_dev *hdev,
>                                                bdaddr_t *addr, u8 addr_ty=
pe);
>  struct hci_conn_params *hci_conn_params_add(struct hci_dev *hdev,
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 8638b7f8dee3..c1583cb6c28a 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -1520,6 +1520,54 @@ u8 hci_conn_set_handle(struct hci_conn *conn, u16 =
handle)
>         return 0;
>  }
>
> +/* A connection to a peer the controller cannot resolve is kept under th=
e
> + * peer's RPA until it completes, and the peer may have moved to a new R=
PA
> + * since. Match it by the peer's IRK instead of by address.
> + *
> + * This function requires the caller holds hdev->lock.
> + */
> +static struct hci_conn *le_conn_by_irk(struct hci_dev *hdev,
> +                                      const u8 irk_val[16])
> +{
> +       struct hci_conn_hash *h =3D &hdev->conn_hash;
> +       struct hci_conn *c;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(c, &h->list, list) {
> +               if (c->type !=3D LE_LINK ||
> +                   !hci_bdaddr_is_rpa(&c->dst, c->dst_type))
> +                       continue;
> +
> +               if (smp_irk_matches(hdev, irk_val, &c->dst)) {
> +                       rcu_read_unlock();
> +                       return c;
> +               }
> +       }
> +       rcu_read_unlock();
> +
> +       return NULL;
> +}
> +
> +/* Find the LE connection of the peer at addr by the peer's IRK, for whe=
n it
> + * is kept under one of the peer's RPAs instead of addr.
> + *
> + * This function requires the caller holds hdev->lock.
> + */
> +static struct hci_conn *le_conn_lookup_irk(struct hci_dev *hdev,
> +                                          bdaddr_t *addr, u8 addr_type)
> +{
> +       struct hci_conn *conn =3D NULL;
> +       struct smp_irk *irk;
> +
> +       rcu_read_lock();
> +       irk =3D hci_find_irk_by_addr(hdev, addr, addr_type);
> +       if (irk)
> +               conn =3D le_conn_by_irk(hdev, irk->val);
> +       rcu_read_unlock();
> +
> +       return conn;
> +}
> +
>  struct hci_conn *hci_connect_le(struct hci_dev *hdev, bdaddr_t *dst,
>                                 u8 dst_type, bool dst_resolved, u8 sec_le=
vel,
>                                 u16 conn_timeout, u8 role, u8 phy, u8 sec=
_phy)
> @@ -1787,6 +1835,7 @@ struct hci_conn *hci_connect_le_scan(struct hci_dev=
 *hdev, bdaddr_t *dst,
>                                      enum conn_reasons conn_reason)
>  {
>         struct hci_conn *conn;
> +       bdaddr_t id_addr;
>
>         /* Let's make sure that le is enabled.*/
>         if (!hci_dev_test_flag(hdev, HCI_LE_ENABLED)) {
> @@ -1796,6 +1845,12 @@ struct hci_conn *hci_connect_le_scan(struct hci_de=
v *hdev, bdaddr_t *dst,
>                 return ERR_PTR(-EOPNOTSUPP);
>         }
>
> +       /* Connect to the peer as if by its identity, under which its
> +        * connection and parameters are kept. hci_connect_le() puts its =
RPA
> +        * on air when the controller cannot resolve it.
> +        */
> +       hci_rpa_to_identity(hdev, &dst, &dst_type, &id_addr);
> +
>         /* Some devices send ATT messages as soon as the physical link is
>          * established. To be able to handle these ATT messages, the user=
-
>          * space first establishes the connection and then starts the pai=
ring
> @@ -1806,6 +1861,8 @@ struct hci_conn *hci_connect_le_scan(struct hci_dev=
 *hdev, bdaddr_t *dst,
>          * and return the object found.
>          */
>         conn =3D hci_conn_hash_lookup_le(hdev, dst, dst_type);
> +       if (!conn)
> +               conn =3D le_conn_lookup_irk(hdev, dst, dst_type);

Any reason why le_conn_lookup_irk is not incorporated into
hci_conn_hash_lookup_le? That would mean other plcares that want to
resolve a hci_conn to a peer always lookup by both address or irk not
just by address.

>         if (conn) {
>                 if (conn->pending_sec_level < sec_level)
>                         conn->pending_sec_level =3D sec_level;
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 024960e9af66..a87c92dccd4f 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2359,6 +2359,26 @@ int hci_bdaddr_list_del_with_irk(struct list_head =
*list, bdaddr_t *bdaddr,
>         return 0;
>  }
>
> +/* A peer we hold the IRK of is tracked under its identity address, so
> + * point *addr and *addr_type at the identity behind an RPA we can resol=
ve.
> + * SMP can free the IRK without hdev->lock, so the identity is copied to
> + * @id_addr before leaving the RCU read-side section.
> + */
> +void hci_rpa_to_identity(struct hci_dev *hdev, bdaddr_t **addr,
> +                        u8 *addr_type, bdaddr_t *id_addr)
> +{
> +       struct smp_irk *irk;
> +
> +       rcu_read_lock();
> +       irk =3D hci_get_irk(hdev, *addr, *addr_type);
> +       if (irk) {
> +               bacpy(id_addr, &irk->bdaddr);
> +               *addr =3D id_addr;
> +               *addr_type =3D irk->addr_type;
> +       }
> +       rcu_read_unlock();
> +}
> +
>  /* This function requires the caller holds hdev->lock */
>  struct hci_conn_params *hci_conn_params_lookup(struct hci_dev *hdev,
>                                                bdaddr_t *addr, u8 addr_ty=
pe)
>
> --
> 2.56.1
>


--=20
Luiz Augusto von Dentz
