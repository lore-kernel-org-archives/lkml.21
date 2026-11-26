Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681261;
	b=s5pFpH7C/jeYxWNozGHHsJACcSUUV0BXSrjHZd34mzGZoCRx632wbZErfv7qWzIgbELS
	 //PADkTILAZuUw8wmIAyhtOch0nZqZt8rJztw+d6ExcnEnrtd2WKAgNla9LzSWryX4y0h
	 g31wOOW1T2jJqc7sWazfxjy1oFXJqvP9dhrXm2PukISHjfgkyDQoccExc2Jz0pu8eJl+8
	 90uULldpOAEdzmI/S7mEmuFO8ZkaT4x2n2fFBKOYYeALX1rHIYQhwy+hJCPD7/39kYCTu
	 71nmvnqNsmWkDfx5obW6z9hKhwq6spadzfLSrssegQySbEb7r8sRcSnm2p3hcw07BzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
	b=n5xhxlW34gJscTA59++vZsuTas1Wl4BrUDXNXl4ZP4dZkAvHyOFau/4+b+o9VLjIUtzr
	 4DtRuv3uTqW4Cq1VRJtmPRtus0DJfROCF4tIl94bXtcDtBtnC8gm2MBKvnTDYMyX2kJhp
	 US7607b9nB8V/o5NLH2o2EPISRyFfWmB+4J7j+0B13TsgbrNiEiLLiopzdZVoTBU8Ef9S
	 BKzAitVLaIN1jhcQjYHqRA7nWwaFodpos1KEeRglV2cuQGC52HVckSxAFTO918Ob6krAJ
	 LTuXJsjhn/PkdIzeuoYkjBUC3Ltsg4k7iJTb7UmsUerqMD9Wv+5LfAe1YhiA99kMAAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxxYqGEl;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD667606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD667606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KxxYqGEl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3227433a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681259; x=1796286059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
        b=KxxYqGElOq5lW5A+bS0tALx/oAwqgEL/9qSYCKn911jBtH9pbkiCvxaJdT0v3oGq3y
         JpIDQ7J47l4wGfqo1POzNlMjh9XpzAUNYJpVCzlRnT5nG7iXcLCu/Vz/xbP39rJmUjLt
         WQC83CX4eLHB2JEgZ0wi+5j1ZG8zU1CJgHbFq04jnxvORYhdDk6lpQhmqdt/OrJT3bol
         vzwnv0GVfY8TAvewFH10/FOXMcP10wcGVmiAR8F+BjDVEGeRy8FMuadMM16AkunvxQ1M
         YlvqpRwapZin13rZ0jJ/1a7Gm+j+6MxvgrjXxvZOrLfyzekjgBU7IZAvBgpb1TGV6Yst
         WZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681259; x=1796286059;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nWb5Z5t6RK8tqOX0Y27tfK1vMpGLhP24jlEag1RHczg=;
        b=l7EyJl/5/mNEuP7Pw5U7ggKYqdAj+BThniWsAWyBtIzK+zG/8VR9ROQ0Dq2CJ6nXD+
         xjU7IoI6seipzJhTkP8Fk+AEExwbNHhhZN4QJ8OK74Tren2ItiS5UkQNLMw7XFMGOXn+
         9MgD+wQ4gm1Zey0hsBjtgCoFtpeYBAuGfxDLHF1/HbRx6DOc5O7sOJbC+BPunWpps4rk
         W/fHRrSzSCb1MkufOyZIeA/yHgbwvOWPLVGAYnwniRntUl9dAvqoP0GYND/0iLj+Fljp
         K0aLP4llyIcikBVpxiWVJt0F4R3CQF2Cm0zy3t02VpCmy+ZStYPTZQSfmz3JOBAYCpvo
         LB0A==
X-Forwarded-Encrypted: i=1; AL+hErE9kKgLHpwe30nakn7hWkVNkgVW9lErJbBq0Y9ShsP7Y4oB7lYnHIPDk/Ppqh6yx5tz9184tLwXNte3mnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kAZuyR6j3w3/z0vDz1/GyMvPerWGSKWH5RKxvmW4dt1BnClaL
	+9gfMdsZyRflIYGGLU7dX3izHCToQEhzUzm8O7elqDz5vNxZCD/23TQR
X-Gm-Gg: AZFdTZekfYiOGfmEjvxH7bUDrLMdxWz8OzONdT4R5SU4D5BEXu+Cr/FBzwikRfxA4xc
	IVsjdiBMaggP9wvPIVZxWsFVQxqYv3HJptpJ9Ht4oxHwD36vcMYazqRtlSm1Sye5MDqdf1LK8rn
	5pP1q/riQuooLcyZCueeQqcdY5PbxhDDCyup1iXXD0ibw0UpC08NFaLwGzkqrJUQNSR5XNP9J9a
	zvUwDJknYW0SmvgsX1f7bJe975Cs6WiCJ6IvLAM8EgSCv6ooZjQVVAjfKzN6buI7j2MBa6ewnMf
	aYnkndxUBB2vFJgC8j2IZUz26jCLF5CB85WDSdjyskfxXRPYySW0tY371noz2QKOBLeB7G4NX8c
	6uNiU2wKW8uuoUNVCgmLV8ie6u6xKYehHkWgEiS0ssTYgrLiiKwieY+F0/C/p4M3dEqa/8daEsD
	avZCGqIY1yyjyNdlkN13OBli8UshIhBzFPuWh70HLg2FUm82kYwweEwhErXpTAzPVdhgbZHWGzF
	ayGzDrAOmek9tg+AMuNaRuVsUBgdNP9xsvG9ZW3KIbp+8QgG55BtRsob0lB/tGWPhBZ71uvJXiI
	ohWEU2NwcjidktjYoMvwpaAwJXfFfUnPk5+xQdMf2Fvf/2Rk0mEGrkworQVG
X-Received: by 2002:a17:90b:3f0f:b0:3b0:934c:5e41 with SMTP id 98e67ed59e1d1-3b41c9080e7mr24217936a91.29.1795681258845;
        Thu, 26 Nov 2026 00:20:58 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm30537371a91.7.2026.11.26.00.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:20:58 -0800 (PST)
Message-ID: <5b2703a3-ae4f-431e-bf4e-d44348654913@gmail.com>
Date: Thu, 26 Nov 2026 16:20:55 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] bonding: unbind 802.3ad slaves on enslave failure
To: Nikolay Aleksandrov <razor@blackwall.org>, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sfeldma@cumulusnetworks.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20261124024319.52145-1-ljp1205831794@gmail.com>
 <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026-11-25 3:14 p.m., Nikolay Aleksandrov wrote:
> On 24/11/2026 04:41, Lin Jiapeng wrote:
>> From: Lin Jiapeng <jiapenglin@tencent.com>
>>
>> The 802.3ad enslave path binds a slave before publishing it in the bond's
>> slave list. The periodic state machine can select the port and attach 
>> it to
>> a LAG while enslavement is in progress, including while 
>> NETDEV_CHANGEUPPER
>> notifiers are running.
>>
>> If enslavement fails, rollback can free ad_slave_info without 
>> unbinding its
>> port and leave later LAG processing with a dangling pointer. This affects
>> both a failed upper-link notification and later failures such as
>> bond_sysfs_slave_add(). A test-only kretprobe forces the latter to return
>> -ENOMEM, after which KASAN reports:
>>       BUG: KASAN: slab-use-after-free in 
>> ad_agg_selection_logic+0x1a0d/0x1fa0
>>       Read of size 1 by task kworker/u16:0/13
>>       Freed by task 110:
>>         kfree
>>         slave_kobj_release
>>         kobject_put
>>         bond_enslave
>>
>> Drain the RX handler before unbinding so receive handlers cannot race 
>> with
>> port->slave becoming NULL. Unbind before upper unlink when the link 
>> exists,
>> and also unbind after an upper-link failure without repeating the unlink.
>> Rebuild the slave array after aggregator changes and leave earlier
>> unpublished failures unchanged.
>>
>> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave 
>> devices.")
>> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
>> Link: https://lore.kernel.org/netdev/20261113130454.63032-1- 
>> ljp1205831794@gmail.com/
>> ---
>> v1 -> v2:
>>    - Drain the RX handler before unbinding to avoid NULL dereferences 
>> in the
>>      802.3ad receive path.
>>    - Cover NETDEV_CHANGEUPPER failure after transient upper-link 
>> publication,
>>      without repeating upper-dev unlink.
>>    - Rebuild the 802.3ad slave array after rollback.
>>
>>   drivers/net/bonding/bond_main.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/ 
>> bond_main.c
>> index e9f5e753f677..7ca948bb27d0 100644
>> --- a/drivers/net/bonding/bond_main.c
>> +++ b/drivers/net/bonding/bond_main.c
>> @@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, 
>> struct net_device *slave_dev,
>>       bond_sysfs_slave_del(new_slave);
>>   err_upper_unlink:
>> +    netdev_rx_handler_unregister(slave_dev);
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +        bond_3ad_unbind_slave(new_slave);
>>       bond_upper_dev_unlink(bond, new_slave);
>> +    goto err_update_slave_arr;
>>   err_unregister:
>>       netdev_rx_handler_unregister(slave_dev);
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +        bond_3ad_unbind_slave(new_slave);
>> +
>> +err_update_slave_arr:
>> +    if (BOND_MODE(bond) == BOND_MODE_8023AD &&
>> +        bond_update_slave_arr(bond, new_slave))
>> +        bond_slave_arr_work_rearm(bond, 0);
>>   err_detach:
>>       vlan_vids_del_by_dev(slave_dev, bond_dev);
>>
>> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
> 
> This looks awful jumping around error labels and doing the same thing
> at different places. Surely you could rearrange them better, maybe
> something like this (untested, needs proper review):
> --- a/drivers/net/bonding/bond_main.c
>    +++ b/drivers/net/bonding/bond_main.c
>    @@ -1888,10 +1888,11 @@
>     int bond_enslave(struct net_device *bond_dev, struct net_device 
> *slave_dev,
>                   struct netlink_ext_ack *extack)
>     {
>    +     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
>          struct bonding *bond = netdev_priv(bond_dev);
>    -     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
>          struct slave *new_slave = NULL, *prev_slave;
>          struct sockaddr_storage ss;
>    +     bool upper_linked = false;
>          int res = 0, i;
> 
>          if (slave_dev->type == ARPHRD_CAN ||
>    @@ -2246,13 +2247,14 @@
>                  slave_dbg(bond_dev, slave_dev, "Error %d calling 
> bond_master_upper_dev_link\n", res);
>                  goto err_unregister;
>          }
>    +     upper_linked = true;
> 
>          bond_lower_state_changed(new_slave);
> 
>          res = bond_sysfs_slave_add(new_slave);
>          if (res) {
>                  slave_dbg(bond_dev, slave_dev, "Error %d calling 
> bond_sysfs_slave_add\n", res);
>    -             goto err_upper_unlink;
>    +             goto err_unregister;
>          }
> 
>          /* If the mode uses primary, then the following is handled by
>    @@ -2357,11 +2359,15 @@
>     err_sysfs_del:
>          bond_sysfs_slave_del(new_slave);
> 
>    -err_upper_unlink:
>    -     bond_upper_dev_unlink(bond, new_slave);
>    -
>     err_unregister:
>          netdev_rx_handler_unregister(slave_dev);
>    +     if (BOND_MODE(bond) == BOND_MODE_8023AD) {
>    +             bond_3ad_unbind_slave(new_slave);
>    +             if (bond_update_slave_arr(bond, new_slave))
>    +                     bond_slave_arr_work_rearm(bond, 0);
>    +     }
>    +     if (upper_linked)
>    +             bond_upper_dev_unlink(bond, new_slave);
> 
>     err_detach:
>          vlan_vids_del_by_dev(slave_dev, bond_dev);

Thanks a lot for the suggestions. I have adopted your suggested 
structure in v3: the err_upper_unlink label is
gone and the rollback is a single err_unregister block gated by
upper_linked. On top of that, v3 includes a few changes based on the
pw-bot review of v2, mainly binding the 802.3ad port only after the
upper link has been established and re-evaluating the carrier in the
rollback path.

