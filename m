Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001325;
	b=Fp+1daG905p56vple0VLSEzXLe7zN/hmeppBoejOlah4T7MzsenMPMpumHZWrB6o77mT
	 sLPSpBO+ZnUsjd0wEdqKiqUyEn3yKFbDlsA8Ik8WitkcMS2KBHTiGdZcHwzz9JFXxcKiv
	 572rjslYf4iiAZKYdhvGO2LA3uuIh6viwvhRrZq2eyxnjYfStwtyyzRB85RkMyqume5XN
	 JZGWm8gsWIQrpHucx4bUoXWxjixBYProtPHo8JTUwyn1pR/2PafUASkgJl895MfWwe/Tg
	 zgroOZMlHWxaaHLElBJDTMJawI+HACMn0d3xNKiG4oIxNQPsthpRT+kVefwDu2vKwrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
	b=0uBNOQav0wDiBXtscO9FUGMonwCYd4Irrk92iB3T/MDmq0reRFxfDNyTyDWMKonREiTz
	 trqUZTlWX5F7OKmFa3beM6u+Zt7xrd6SyNbZeuJR0WRZpTSl6ASfiyIUK76xaehut+AmK
	 0M+ZljDL1XmGv5rqvkf0F19KL7i/II8Y6gyTbvt10NPxPp7b3wx6H98ZRfsBEqflMZ1Tq
	 xUTBQK4caeOR6J/0ar5eoHzTr/6mSAImuRa4qKZS1zcXCOt6MtkP+rMIibwqxDx4Ay0uZ
	 IC4eOQsGjfNdKfyDKU6qhGapIVVQ5X3lH2MtVo9wJVr9ESHbtl1r3frsEikLUtNEdZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7800A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J9D5OyQQ
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91f30ff609eso7290676d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001324; x=1795606124; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=J9D5OyQQ7CtDJfGNBTDrS8xXQb1oxOlFHB2CwmcqpmdeGfNTXI0akJ0lAfAC8TqwEE
         W50Zc7KjwtcLjWa64N2bJICEox+7cN8GZp6uc5A+aZVDr1EgOu+t+DzvVISOmYq2iAnP
         PN/umpdWd49EvKjLiMbMTTDtc2chbXkrfAjgKwizy/4ebN+GLj6a8QG9/g9QGRq3LP2F
         5aqm27u+smmz8Up+MD8FsgOPaxTto6ProUjm1Ki35/BNDk9qaIae2f3/ow6m/6yAcjKq
         cLv7TJBXbB76xCs5dvWqFwpFu2U8Z1Q49AEo32dVZKR7hFJLipWw1HLWdgp89P5IDKk2
         3zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001324; x=1795606124;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTE76i3nixm+phqU46XvEqvVLXQTlr+vsdjYP97MKXk=;
        b=E7u8sDowLWWtX4PcYxxW4A1Hc88YpJDlIXPi7pGXSelOAKnDYUnel01Rwd63fRh1Hn
         hSA8g3Yzs8jy60u5XdBIfxEs1+4XqL/9ypt6qjdw7XFd+jsIXbepRgXukQkczDwe5lEp
         dAZmyRv6V1E6Vnl9T1a0WD2L6ULYlxt5dFd97qalIdu+3BQqgYtioAqgeiracJAtZzOY
         Mo8MGupquXPhLr0vPVxaRIDesqEWIF/Mg6iNsvpQCdZwAnNPY+d1HoIYg1j2tfJ+Fp1r
         leIfEis7vMeh2VYj+Rk8LLFW2tzeUzWZVHYWa0tGeM6CNLWRfbb0WQ9IMDczXZVRFLo8
         3Xcw==
X-Forwarded-Encrypted: i=1; AL+hErEKtYvbkRC6m2Xxovc6956LpsL5HKXRNat0pZHZ2N9rbVkVfVhUF6lupHh9kcKqr1AOV1Jd/gFkgpk/4fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9r/sJKo65MWIl0JNvGtxPZYXGwLHeMym1xYypC98chQ6u2a1lR
	Qhr0EltXn6Nzti2SEfn6SNhJVYaVQ5rPdMM+xoYbvEJYMvnjwc31+1FB
X-Gm-Gg: AZFdTZc5zxvkN6UpqgpDb9QoudNYzQGHB/JR6EwBv4wHG9LgAymE5J8PgB13Zx4YhBN
	O1hzleQDlY+Fq/8QuzGzGkBV+y/TxrBkWh98d0JgwA2GDZxqL/QXExF510iD+XfZym5eY1A/SIQ
	gbFRdKAstM6vRFKxsvhpO3lwUQPDYMTQmbGtcG5LBzqSd1F5hdP0pFIKpX6wZCeYNaVz29vmDKs
	LYp7rokHCAiuy1sFkOXhhqAaA1fYH5txuM+321hyjjJoZCVqZNY01bLlUefRQloVZ32xAmqGaHt
	pgTL9KwFxzfIijiFy0k/XadlkeZXJQUmVoo7cBtMeV4Dyqn3CD3Onyt4CdKAYW9Yn/VmQ35GueS
	ATR6UbU3FDZ4tKODrtAZkxXev/dGut9F4BPV8najsUF//0BaMZfjRlEl+W031924+vC+eAkskyf
	F/XRPcp8NK92qK7b3ZaWnowelZDCnXr+jCB1RzajumBZqTRuzeQdI6RdWexaJhwze7mgy+LRNtg
	EBntr03gCifxwUQEnAwYADKyYx5834D3v8CGCEeuPQfnifUhRaz/DfllFU+HTjyl6I8kRdfe8SB
	qn0YRAiPxk+Nbj4T8zIPNE/n/Abq+g3YGQ==
X-Received: by 2002:ad4:5aaf:0:b0:91f:329a:904 with SMTP id 6a1803df08f44-92114ee2ddcmr32476686d6.32.1795001324220;
        Wed, 18 Nov 2026 03:28:44 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d35dabsm19207126d6.17.2026.11.18.03.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:28:43 -0800 (PST)
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
Date: Wed, 18 Nov 2026 06:28:42 -0500
Message-Id: <DMYAV3MCA9T5.180N4MSVXNWT@gmail.com>
Subject: Re: [PATCH net-next v4 3/5] psp: defer tx key deletions for SADB
 drivers
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261116-psp-v4-3-1a599df2aefa@gmail.com>
 <179498190614.3136.5698785790307751985@kernel.org>
In-Reply-To: <179498190614.3136.5698785790307751985@kernel.org>

On Wed Nov 18, 2026 at 1:05 AM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 2
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new PSP_ASSOC_DEFER_TX_KEY_DEL path in `psp_assoc_free()`
>   (net/psp/psp_sock.c:118-121) gives up its only psd reference before=E2=
=80=A6
> - [Medium] Removing the SADB check in `psp_sock_tx_rekey()` lets any non-
>   admin user who can reach the PSP device rekey one established TCP=E2=80=
=A6
> - [Low] The commit message never says that this patch turns on Tx rekey
>   for SADB devices.
> - [Low] The patch adds a lock-context rule for SADB drivers that only the
>   commit message states: they must not call `psp_dev_unregister()` with=
=E2=80=A6
>
> --
>
> psp: defer tx key deletions for SADB drivers
>
> This commit adds a deferred deletion queue for Tx keys on SADB devices.
> A key detached by a Tx rekey is removed from the device only after a
> BQL-based descriptor grace period, which a delayed work item checks by
> snapshotting per-queue num_queued and polling num_completed. It also
> makes INET_PSP depend on BQL, requires ops-locked netdevs for SADB
> drivers, and drops the check that rejected Tx rekey on SADB devices.
>
>> diff --git a/Documentation/networking/psp.rst b/Documentation/networking=
/psp.rst
>> index 43f222b38d3d4..ceb1e232317fc 100644
>> --- a/Documentation/networking/psp.rst
>> +++ b/Documentation/networking/psp.rst
>> @@ -202,6 +202,48 @@ Drivers must use ``psp_skb_get_assoc_rcu()`` to che=
ck if PSP Tx offload
>
> [ ... ]
>
>> +* Before calling ``psp_dev_unregister()``, the driver must ensure that =
all
>> +  outstanding Tx descriptors containing key references have been comple=
ted
>> +  or discarded. PSP core deletes all remaining Tx keys during
>> +  unregistration without waiting for a grace period.
>
> [Severity: Low]
> Should this list also say that psp_dev_unregister() must not be called
> with the netdev instance lock held? The commit message states that rule.
> It is not in this list or in the psp_dev_unregister() kernel-doc, and
> nothing asserts it.
>
> psp_dev_unregister() now starts with:
>
> psp_dev_unregister()
>   psp_deferred_del_stop()
>     disable_delayed_work_sync(&psd->tx_del.work)
>
> and psp_deferred_del_work() takes the locks in this order:
>
> 	mutex_lock(&psd->lock);
> 	netdev_lock(psd->main_netdev);
>
> Suppose a driver calls psp_dev_unregister() while holding
> main_netdev->lock, and the work is blocked in netdev_lock(). Wouldn't
> disable_delayed_work_sync() then wait forever?
>
> Even with the work idle, the later mutex_lock(&psd->lock) in
> psp_dev_unregister() would run under the netdev lock. That inverts the
> lock order the work uses.
>
> mlx5 complies today, because mlx5e_nic_disable() drops the netdev lock
> before mlx5e_psp_unregister().
>
> Could the rule go in this list with the other requirements? Something
> like lockdep_assert_not_held(&psd->main_netdev->lock) in
> psp_dev_unregister() would also match the ops-lock WARN_ON check in
> psp_dev_create().
>
> [ ... ]
>
>> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
>> index d497f41c483e1..48bffe088c79b 100644
>> --- a/net/psp/psp_sock.c
>> +++ b/net/psp/psp_sock.c
>> @@ -114,8 +114,14 @@ static void psp_assoc_free(struct work_struct *work=
)
>> =20
>>  	mutex_lock(&psd->lock);
>>  	if (psp_dev_is_registered(psd)) {
>> -		if (psp_assoc_needs_tx_key_del(pas))
>> +		if (psp_assoc_needs_tx_key_del(pas)) {
>> +			if (pas->flags & PSP_ASSOC_DEFER_TX_KEY_DEL) {
>> +				psp_deferred_del_queue(psd, pas);
>> +				mutex_unlock(&psd->lock);
>> +				return;
>> +			}
>
> [Severity: Medium]
> Once pas is on psd->tx_del.next, its psd reference belongs to the
> deferred queue. This path keeps no reference of its own across
> mutex_unlock(&psd->lock). Can psd be torn down while this thread is
> still inside mutex_unlock()?
>
> Documentation/locking/mutex-design.rst says mutex_unlock() may access the
> mutex after releasing ownership, so the caller has to keep the mutex
> alive until it returns. When there is a waiter, __mutex_unlock_slowpath()
> releases ownership and then still takes lock->wait_lock and calls
> debug_mutex_unlock(lock).
>
> A possible sequence:
>
> CPU1 (psp_assoc_free work)         CPU2 (psp_dev_unregister)
> psp_deferred_del_queue(psd, pas)
> mutex_unlock(&psd->lock)           mutex_lock(&psd->lock) succeeds
>   still in slowpath                psp_deferred_del_uninit()
>                                      psp_dev_put(psd)
>                                    mutex_unlock(&psd->lock)
>                                    psp_dev_put(psd)
>                                      psp_dev_free()
>                                        mutex_destroy(&psd->lock)
>                                        kfree_rcu(psd, rcu)
>   debug_mutex_unlock(lock)
>

Ah TIL. I was a bit naive that mutex_unlock() can still be running while
the next waiter enters the critical section.

pw-bot: cr
