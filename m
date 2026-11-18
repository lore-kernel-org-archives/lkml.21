Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997307;
	b=i7DcYnKxXoLaBuW4Hbq+E/2v5e6O8ZWg+P3eMtBAsx6DK8n23OJSxO8ZXsQRSAG3NAON
	 +ZvE/aFQSOTLJm98ZV9RCnDyptx/SRVLHfebVEKHWxrHcO++FfbO1jNZgDBFXDB2imYGb
	 q/IXLsbGno5DkL8KkxW482CvhCo10lgHpmQSnT64fTP84N6kJuO1sYm8mNSdETjZvpEbv
	 F0MJHF1qUwmYig+gezHyAHC+cflv7Q0XoGx3AVuGNDlFkFbQkNT/S5r5bvG0lgPb9qVHc
	 7hLgDqsCKEtp1pHl/VutOT7PelypusYH/ge1H+Qs7TJyonFo+xtD/2ptqM0u4E6jY/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
	b=sg7XYS7aQYv3kraQmNeSc6oqT+KfnNNdwES631HHQHt2cNNmjrVX2pyQerBwKsERtrsb
	 /u9kFd3ECj279GVpGkj/8PwiAJX+3u3K6CpJ3PshnHST1cqIccxpyf8ErPBjbhFfYH6U7
	 9DOC5wSU4aga+1Sip/y0ICpDeEvAZrKXs4L7WoJclmAJjIDxAwT11ki34vsYNk/aKgUUA
	 QQIaegCDqnuRKcp8ExDDLfx6g6l+KfetOofdN/LLl8D2RE2iWo5BqyS0uIJEKp5LbOQtK
	 iTZLO0Y60jzEj02Yg0tWHj0Cu9o7sSa1k46zCKZjJC9Ucj1EzXt7cdf3ltpprjw0tAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU4bYpyz;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D6D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48D6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BU4bYpyz
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92119da3d37so3168076d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997306; x=1795602106; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
        b=BU4bYpyzpln6vZPMuIQM2DiZhzvlWv3UrOF8HiTMlCx9epoczmdAlqona7iT71/xPK
         xQZcHXmpkmOGqbS+IqrsIi4I/vCGTDwE0ogByZ1KhpwjzRyOSxcTbzBa7WpJzxFiS1Zd
         Il/HokkCS/e1n6/KvDdLx+eUywc8IYUJT/iKUz3QRnQVbBnlAGC76FdapV+y4hAFp/8T
         eELeXTSkXEO+Tx/nBx+i3Zxul1hACemoZj94gmtP2cItO4JSwtx7iDyzOZ8wdYwiG1CT
         t2aOGZ6hRwvNzznHQKCQBZsQYFh2d5I2WmSu/yHKMC1vSut5dj3bAkKFWBc2FKvh9icf
         E80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997306; x=1795602106;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3IJ5oLj14lpgQEhMKNadywDImk2GjSKGL/HdUAQRNM=;
        b=bKiGuxZa3qAlijabHU/ojinR3IaXq4wvlEzalghX/QnWNhZ9JMTCOPparf1DCYwOP8
         Yb1V2PkiRJ3WFDFJaZwqN7CIs0EiFA4w258QgNJxKqiafG4+Vr9f074APLNK/YL8Vb5g
         8XmMQiPQC3x2ylGsa8PVVttU+qWf59S4r3tS/t0Zz1YWFQq0TbiicxwGoQc4xSnB8pII
         4wG1RULYfsq6EH/yWeyDZkMmtz6imV3AN3X6Nfp1tnj0SSZ/kZgbtNNuPDgM87EJW8sE
         WTvZN5DKb+WFOG51jUrQ6VC/ycVONgQ5QHT+jVrhe0zMm/NaXeiAOhUjBSzdk4CkPvgx
         zmeg==
X-Forwarded-Encrypted: i=1; AL+hErGWSGBJBzRBMFZVdrfcJvx5BPSuu1kSvWlY73773RwyHsNAS3orKYY9KxoYMfSjnNHYc29yfONjtv4nSM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ef8MqQY8KvywBtz7YUdajEeK4Jo+xbMgH3QJk8QzdUyvHnLpV
	I/ZwYUiU6CMyh24kU57G+j9YSSmPF06Bl8KEHNREZOnAfS1h35qL/dQH
X-Gm-Gg: AZFdTZeTVcUGu3EigRRzRWrRc9LLyyxkWdWc/v9qUUwOj9gpAlfVeP1Ch6Zlf+1bYt+
	Z6BeLvt+Uh9jLj/DxI3d+3QtDGNJAyQ9kGu1r0ojJbUMyGcALdz7mnsDc+L3oaQjP6kX/0Co95m
	k+HOjOGofkrn36aKSJZVlZUSh2QPsusotCSGbXVKnaqeOSMC9cRoCQpzcT9kU3kC++HndPdlQc5
	lCeV1hIggD3H2dj9G4F7b6oIuGRVAWeuo5nnQ/92ysdBrD34x8h99hJUB4UFIyf3gZc1QkRgcVU
	u8nJWgLQN6N5VBateNBEg//Zm40RXwaiPZ4MCvsbb4lWks/oWLS2snpYPeHFw6lqknmILTqnOLV
	wA+RvdCCx8WX5/Z/T56SqMrtAZnxBxIwqJfhd0eGqcAvHh9CF5yrgAbRSqzARn2jmJ7M+A9YFEE
	bug9/1w/XVoOre6Jdu/oWMUK3QpYLkDtKyJAtZ2d1GLh005DMin6uwy4JhIpL5qLIe8J6YgtDuJ
	7v9ooLfvrHsCAoLRzntceopSLUyC2cKo0OBBGCDY54CaI9RQbjONgkEWybK2mV5oAReXBTYIH01
	3s/Nd/iHa6SHQ3gaCt9fRfkiIONYYm9ZBg==
X-Received: by 2002:a05:6214:3f88:b0:91e:9811:7a2e with SMTP id 6a1803df08f44-92114f415c1mr27630356d6.13.1794997306087;
        Wed, 18 Nov 2026 02:21:46 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c5csm17918346d6.31.2026.11.18.02.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:21:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 05:21:44 -0500
Message-Id: <DMY9FTQ22U8T.JKYB4HL8J8PH@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@kernel.org>,
 <pabeni@redhat.com>, <dimitri.daskalakis1@gmail.com>,
 <mohsin.bashr@gmail.com>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 3/4] eth: mpnic: sync unicast and multicast
 address lists
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-mpnic-l2-oot-v1-3-8dc6eb3582b0@gmail.com>
 <179499313262.3136.12811016164943625265@kernel.org>
In-Reply-To: <179499313262.3136.12811016164943625265@kernel.org>

On Wed Nov 18, 2026 at 4:12 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The unicast and multicast lists are synced in the wrong order
>   in __mpnic_set_rx_mode()=E2=80=A6
>
> --
>
> eth: mpnic: sync unicast and multicast address lists
>
> This commit adds the secondary unicast and multicast addresses to the
> MACDA TCAM and advertises IFF_UNICAST_FLT. When either list outgrows the
> table, the driver falls back to promiscuous or all-multicast mode. A
> per-slot users count is kept so the same address can sit in both dev->uc
> and dev->mc.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/ne=
t/ethernet/meta/mpnic/mpnic_netdev.c
>> index 43547a7d6e5c7..c01e276c4a74d 100644
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
>
> [ ... ]
>
>> @@ -35,7 +53,14 @@ static void __mpnic_set_rx_mode(struct mpnic_dev *mpd=
,
>>  		mac_addr->state =3D MPNIC_TCAM_S_ADD;
>>  	}
>> =20
>> -	if (!netdev_hw_addr_list_empty(mc))
>> +	err =3D __hw_addr_sync_dev(uc, netdev, mpnic_addr_sync,
>> +				 mpnic_addr_unsync);
>> +	if (err =3D=3D -ENOSPC)
>> +		uc_promisc =3D true;
>> +
>> +	err =3D __hw_addr_sync_dev(mc, netdev, mpnic_addr_sync,
>> +				 mpnic_addr_unsync);
>> +	if (err =3D=3D -ENOSPC)
>>  		mc_promisc =3D true;
>
> [Severity: Medium]
> Can the device get stuck in unicast promiscuous mode here, even though a
> TCAM slot is free?
>
> The uc and mc lists share the same MACDA slots (between
> MPNIC_TCAM_MACDA_BROADCAST_IDX and MPNIC_TCAM_MACDA_HOST_ADDR_IDX). The
> whole uc pass, both its flush and its add phase, runs before the mc pass
> flushes stale multicast entries.
>
> Consider this sequence:
>
> 1. The table is full of multicast entries and a secondary unicast
>    address U is added. mpnic_macda_sync() returns -ENOSPC, U stays at
>    sync_cnt =3D=3D 0, and mpnic_promisc_sync() enables unicast promisc.
>
> 2. A multicast address M is then removed. The core runs
>    netif_rx_mode_run()->mpnic_set_rx_mode()->__mpnic_set_rx_mode().
>
> 3. The uc pass retries U. M's slot is still MPNIC_TCAM_S_VALID, so
>    mpnic_macda_free() rejects it, mpnic_macda_sync() returns -ENOSPC
>    again, and uc_promisc is set.
>
> 4. The mc flush runs only after that. It calls mpnic_macda_unsync() on M:
>
> 	if (!--mac_addr->users)
> 		mac_addr->state =3D MPNIC_TCAM_S_DELETE;
>
>    mpnic_write_macda() then frees the slot.
>
> The reverse case works. A unicast removal can make room for a pending
> multicast address, because the uc flush runs before the mc add.
>
> Would it make sense to flush stale entries from both lists before either
> add phase runs?
>

I see this more as a low severity issue, because having the device be in
promiscuous mode when a slot is free is not incorrect, just not optimal.

If anything I would probably just rerun __hw_addr_sync_dev() on the uc
list again after the mc one, if the first call returned -ENOSPC. I
didn't think that was really worth it when this same comment came up in
local review though.

> [ ... ]
>
>> @@ -53,7 +78,7 @@ static int mpnic_set_rx_mode(struct net_device *netdev=
,
>>  	struct mpnic_net *mpn =3D netdev_priv(netdev);
>> =20
>>  	if (netif_running(netdev))
>> -		__mpnic_set_rx_mode(mpn->mpd, mc);
>> +		__mpnic_set_rx_mode(mpn->mpd, uc, mc);
>> =20
>>  	return 0;
>>  }
>
> Because mpnic_set_rx_mode() always returns 0, netif_rx_mode_run() never
> calls netif_rx_mode_schedule_retry() for the case above.
>
> mpnic_service_task() doesn't re-run the rx mode sync either. So U stays
> unsynced and the promisc entry (zero mask) stays installed until some
> unrelated rx-mode event happens. The commit message says:
>
>   Advertise IFF_UNICAST_FLT so we don't need to use promiscuous mode to
>   handle extra unicast addresses.
>
> The later patch in the series, "eth: mpnic: support changing the MAC
> address", keeps the same uc-then-mc ordering.

