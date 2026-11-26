Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680697;
	b=SPa/OKhwG17x6qGrVT5UwkGhrt0uUNg2WNbYjfy47X/7+ST9uNFtwH2Ed5/T9F0mAo10
	 bNMEaWaHYrXkd0Vpt9IdQzaKp+MKWQ1mHnXV1A2yhVRNQK4eH/sumdNhdj9uGL4ZFmxR0
	 XBwux6ev9a+rFyhHqgvPxvgZU7+vsNA6OPaotMTmuDLzVPYT+2l7suTdkpfKTbUguafo/
	 zV3KpmdYl0ftmivuwMojQ8n1wqqLH7BSHCyHJlErga5JJdEVhGwOIa4/w84/Uf5UKgTMG
	 CFIbyTWxXqPGRi/V0mHzUcXwwQnhrmXQcS2dfliTyNmFXz+5ngI5BhsWjE9SxeKj6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=GL2QQf6Hybi7McXFSucE4yIPEEiPBa2bBf9e6M/zpk4=;
	b=3NkXibuhXk0iStP1uRKMrO0F60HhoPq+ZoBplGGjSXYUYJHN6eABXigERc9OfjgleGmc
	 l8i90gOhHLNk+jIxkr8GGf2uptgdbNAVx4D0UARMcaQY7dWWYMTT1vb6pBvsLehR2522M
	 ELKVtoKTumBZ48xepxfPcackigXdDjfj3gX09vq79RHrvCUl1EjTrB6IKvyl7d4JSE5Dh
	 DLam/IwVwujZX7+cHDsq7arXnGEXKI824VLWvRGsSCiC/cxfFwSn6Y3c3yoV52o9IecN/
	 rHKkOPDHV6l9pF0lbWFuDy+Hg5o5R7WYpjwjFP7Yyi6pEJ7GvSnCkPNOx9R5ZcnkrTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ez7tUPlQ;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C467B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C467B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ez7tUPlQ
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3563086b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795680696; x=1796285496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GL2QQf6Hybi7McXFSucE4yIPEEiPBa2bBf9e6M/zpk4=;
        b=Ez7tUPlQLV4h4VXs6zr7aRZDMyuXy+nBjTqXymgX953P/utIBhN17H4aJGzjkVNQxi
         OaiB+peWJ3e6ozirb1Xk9+RnpIavJHIqZ9doBK6nhKU8/FxGOhRR4XNGzPM1xWkzpvsB
         eeG1we0a5reg7VZLM2a9mZ1+0/ltoJGsaoPjqHABACijSlD00Rk4CrOqa11tcye7pycF
         NVN5ygl7/KYZffcFRZGdgDQw7FtecUh0ZFIlfmybERVgiuh0GbEP/cYAYYGWkax8wmAm
         h7P5wm/kjbdlj0yFI4K2VbGp2Nb4NvLK/8hNfYowvoYdNosjatAt5B4rdEYLhXytNXHV
         TFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680696; x=1796285496;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GL2QQf6Hybi7McXFSucE4yIPEEiPBa2bBf9e6M/zpk4=;
        b=OihbGChEiNPiwi6gt1Nbkckv9z4jjagtVFhjKpgeyBnHJYGGURCzQ/Mn/969r4H5iK
         505Lb1sgtcy6QGx4gg+gAVXoC37sqTzFqD85JoNxAtQCE3ALAhYbU+y0A7cAHgOtle7c
         8a58aQhx69ngwJuvCV42PjJ6/nRb3cAqigxfahGj4RU8I6V5hg7LhvzM1GKKFi1AxiuU
         wqjjay1P12FfNmhB38zos7g5pvlJ8kWYLj1gHAWtBmIvxR7WDNGrffGI5yq7FCAYu2Qq
         VXk0ZaWrLqMKJLuRE02WDWBPIi4n5MIqHm3e59yUJ6PGgyUan+QC9k3UMbN5smviZvJV
         mdLg==
X-Forwarded-Encrypted: i=1; AL+hErH4LyJ+eV85hg+U7zro3RcOX8oYviWfeA94+I7t1lVKOMSY2jRE2Xt0W9KJJDpwBDu1jApcF/Y82qA5pqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z89uvplCrke4GLDoPaucg3iCRSsjsF9Ee2pe0yrlkbNSg2VgdWs
	5essvEDQyU5gSVKfAqPE6+eaSuTlx9IIBsyIZmzAJj78jHTpxbYcZcIo
X-Gm-Gg: AZFdTZc82O5JSSapgwvG5uraTaNfh+F/fPI5d6sbKJ1dmfJlDEqi+noPDnEuJspTm5g
	JlCVWG889WBNa42kltajeS+iXfUe/GXf9zb5zBoOHqlqMZ5jdgVEdKn4xahl5w4p0YP56k1GNAR
	Pk+2Fx7PO2HRk/LebfFXnoQcwBo1iSQi/NsRBWfhM4Oz4+rwLzIPeIbjsag1tLcbYxgh3IoHXZx
	xkmZ0WaBMir6WheLHRcNQVALwLdtgh2vubDuxqrWZngmiLExXtwRiBkUC7Q7CU2nRI0MjA74+Kq
	+0lOFemS0csOwg+4VAu92mXxQxv5fvOAV2Wk0bHIrAKIv0BdNEKLB7RU780jC3gmxuIVRDzFZ5D
	DXMBMJ0tUN4fOPoud5AjJm0byQG8ldbGnfHIMVUuViDq0MoOqiFiymTU+Zg4p2oFdMEtoFFwAWI
	c/TQ6LoBmXF2A5fQzxnbrOKsYNC4mLDkXoN36d5SEwHvQxjjilDlavALEuSMDLjCo6WvFZtt7J4
	kGWly6mFQ1VL9DXiLWeo6fcVYut4n2qcerN1rstJAA57o+qmRkm6O2GMqnjB8Jix7urmxIIrEe9
	rTBgpXrYqL1uT673FpZPMZc0P9VpWbZI8R8SPXDPz1oA9WID5JWp++RDD93H
X-Received: by 2002:a05:6a00:b56:b0:881:8b53:f64 with SMTP id d2e1a72fcca58-8c87d9fbdd0mr18120807b3a.59.1795680695879;
        Thu, 26 Nov 2026 00:11:35 -0800 (PST)
Received: from [192.168.255.10] ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm10396720b3a.56.2026.11.26.00.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:11:35 -0800 (PST)
Message-ID: <66b530b7-8115-4774-915d-1e846ba1487e@gmail.com>
Date: Thu, 26 Nov 2026 16:11:31 +0800
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
To: netdev-bot+sashiko@kernel.org
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 sfeldma@cumulusnetworks.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiapenglin@tencent.com, corvus@tencent.com
References: <20261124024319.52145-1-ljp1205831794@gmail.com>
 <179557818044.3135.12445495570412161226@kernel.org>
From: Lin Jiapeng <ljp1205831794@gmail.com>
In-Reply-To: <179557818044.3135.12445495570412161226@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026-11-25 11:43 a.m., netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (2) · Medium: 2 · Low: 2
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] bonding: unbind after upper unlink in bond_enslave() on link
>    failure
> - [Medium] bonding: carrier left ON after 802.3ad enslave rollback in
>    bond_enslave()
> - [Low] The commit message has no Signed-off-by: trailer.
> - [Low] The patch adds bond_3ad_unbind_slave(new_slave) at err_unregister
>    (bond_main.c:2364-2367).
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but balance-tlb
>    and balance-alb have the same kind of dangling-slave bug through the…
> - [High] This problem wasn't introduced by this patch, but
>    __bond_release_one() has the same ad_agg_selection_logic/aggregator…
> 
> --
> 
> bonding: unbind 802.3ad slaves on enslave failure
> 
> When enslavement fails after bond_3ad_bind_slave(), this patch now
> unbinds the 802.3ad slave from the LAG state machine in the
> bond_enslave() error unwind. It first unregisters the RX handler, then
> unbinds, then rebuilds the slave array. The aim is to stop
> ad_slave_info from being freed while it is still attached to an
> aggregator.
> 
> Link: https://lore.kernel.org/netdev/20261113130454.63032-1-ljp1205831794@gmail.com/
> 
>> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
>> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
>> Link: https://lore.kernel.org/netdev/20261113130454.63032-1-ljp1205831794@gmail.com/
> 
> [Severity: Low]
> This isn't a bug, but the trailer block has no Signed-off-by: line.
> Documentation/process/submitting-patches.rst requires the DCO sign-off.
> 
> Could the patch be resent with this line above the --- separator?
> 
>    Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
> 
>> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
>> index e9f5e753f6770..7ca948bb27d01 100644
>> --- a/drivers/net/bonding/bond_main.c
>> +++ b/drivers/net/bonding/bond_main.c
>> @@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>>   	bond_sysfs_slave_del(new_slave);
>>   
>>   err_upper_unlink:
>> +	netdev_rx_handler_unregister(slave_dev);
>> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +		bond_3ad_unbind_slave(new_slave);
>>   	bond_upper_dev_unlink(bond, new_slave);
> 
> [Severity: Medium]
> Is it safe for the 3ad state to stay attached after new_slave has
> already dropped off the slave list?
> 
> When a NETDEV_CHANGEUPPER notifier fails, __netdev_upper_dev_link()
> rolls back with __netdev_adjacent_dev_unlink_neighbour() before it
> returns to bond_enslave(). So by the time we reach err_unregister,
> bond_for_each_slave() no longer sees new_slave, but its port and
> aggregator are still attached. netdev_rx_handler_unregister() then
> sleeps in synchronize_net() before bond_3ad_unbind_slave() runs.
> bond_3ad_state_machine_handler() takes only mode_lock, so it can run
> in that window.
> 
> Commit 220ade77452c ("bonding: 3ad: fix the concurrency between
> __bond_release_one() and bond_3ad_state_machine_handler()") uses the
> opposite order for release: unbind first, then unlink. With the order
> reversed here, two things look possible.
> 
> First case: new_slave's port joined an existing slave's aggregator,
> and new_slave's own aggregator was the only free one. That free
> aggregator is now hidden. When the existing slave's port is
> re-selected, ad_port_selection_logic() detaches it and finds neither
> a matching nor a free aggregator. It logs "did not find a suitable
> aggregator" and returns with port->aggregator NULL. ad_mux_machine()
> runs right after and passes that NULL aggregator to
> __set_agg_ports_ready(), or reads aggregator->is_active.
> 
> Second case: new_slave's aggregator was active and also held an
> existing slave's port. ad_agg_selection_logic() running in the window
> only walks the listed slaves. It activates another aggregator but
> leaves SLAVE_AD_INFO(new_slave)->aggregator.is_active at 1. When
> bond_3ad_unbind_slave() later moves that LAG to a free aggregator, it
> copies is_active across without re-running selection. The bond then
> has two active aggregators.
> 
> Moving the unbind ahead of netdev_rx_handler_unregister() would only
> narrow this, since the unlink already happened inside
> __netdev_upper_dev_link(). It would also reopen the receive path race
> that v2 was trying to close. Is there a way to keep the state machine
> off new_slave's port until bond_master_upper_dev_link() has
> succeeded? Or to unbind before the notifier rollback runs?
> 
> [Severity: High]
> This is a pre-existing issue, but does the same unbind-then-unlink order
> in __bond_release_one() leave a window for an aggregator use-after-free?
> 
> __bond_release_one() {
> 	...
> 	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> 		bond_3ad_unbind_slave(slave);
> 
> 	bond_upper_dev_unlink(bond, slave);
> 	...
> }
> 
> bond_3ad_unbind_slave() clears the departing slave's aggregator, sets
> port->slave = NULL and drops mode_lock. The slave stays on the lower
> list until netdev_upper_dev_unlink() runs list_del_rcu(). RCU readers
> that started earlier can still see it until synchronize_rcu().
> 
> bond_3ad_state_machine_handler() takes only mode_lock and
> rcu_read_lock(), not RTNL. Suppose a port listed before the departing
> slave has lost AD_PORT_SELECTED, for example because an incoming LACPDU
> changed the partner parameters. ad_port_selection_logic() then picks
> the first aggregator that has no lag_ports:
> 
> ad_port_selection_logic() {
> 	...
> 		if (!aggregator->lag_ports) {
> 			if (!free_aggregator)
> 				free_aggregator = aggregator;
> 			continue;
> 		}
> 	...
> }
> 
> It never checks whether that aggregator's owner is still bound.
> 
> For example, take a slave list A, D, C, where A and C share agg_A and D
> is being released:
> 
>    A detaches; agg_A still holds C and no longer matches
>    agg_D is free, so A attaches to agg_D
>    the handler reaches D, sees port->slave == NULL, jumps to re_arm
> 
> Release then unlinks D and calls synchronize_rcu() and kobject_put().
> That frees D's ad_info, and agg_D with it. A's port->aggregator now
> points at freed memory. Later, ad_mux_machine(),
> ad_port_selection_logic() and bond_update_slave_arr() all dereference
> it.
> 
> The enslave rollback added here doesn't hit this. The new slave is
> always last in the list, so one of the earlier slaves always has a free
> aggregator. Would __bond_release_one() need a separate fix for this
> ordering?
> 
>> +	goto err_update_slave_arr;
>>   
>>   err_unregister:
>>   	netdev_rx_handler_unregister(slave_dev);
>> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
>> +		bond_3ad_unbind_slave(new_slave);
> 
> [Severity: Low]
> Is unbinding here right for every bond_master_upper_dev_link() failure?
> 
> Every failure from bond_master_upper_dev_link() lands at err_unregister,
> not only the NETDEV_CHANGEUPPER rollback. __netdev_upper_dev_link() can
> return before the adjacency is linked:
> 
>    -EBUSY when dev == upper_dev or a loop is found
>    -EMLINK when nesting is too deep
>    -EEXIST or -EBUSY when there is already a master
>    a NETDEV_PRECHANGEUPPER notifier veto, e.g. a switchdev or DSA driver
>    rejecting the LAG
> 
> In those cases the 3ad state machine never saw the slave. But
> bond_3ad_bind_slave() already set port->slave, so
> bond_3ad_unbind_slave() passes its !port->slave check and always does:
> 
> bond_3ad_unbind_slave() {
> 	...
> 	__update_lacpdu_from_port(port);
> 	ad_lacpdu_send(port);
> 	...
> }
> 
> ad_lacpdu_send() increments the per-slave and bond-wide lacpdu_tx
> counters. It then calls dev_queue_xmit() on the slave device, which is
> still open. So a port that never joined the bond now sends an LACPDU
> with the bond's actor system ID. Before this patch, nothing was sent on
> this path.
> 
> This also seems to contradict the commit message:
> 
>    "and leave earlier unpublished failures unchanged."
> 
> Could the unbind be limited to the CHANGEUPPER rollback case? Or could
> the LACPDU be skipped when the port was never attached to an aggregator?
> 
>> +
>> +err_update_slave_arr:
>> +	if (BOND_MODE(bond) == BOND_MODE_8023AD &&
>> +	    bond_update_slave_arr(bond, new_slave))
>> +		bond_slave_arr_work_rearm(bond, 0);
>>   
>>   err_detach:
>>   	vlan_vids_del_by_dev(slave_dev, bond_dev);
> 
> [Severity: Medium]
> Does this rollback leave the bond carrier up when it should be down?
> 
> __bond_release_one() calls bond_set_carrier(bond) after it unbinds and
> unlinks the slave. None of err_upper_unlink, err_unregister or
> err_update_slave_arr do that.
> 
> When the first slave is enslaved in 802.3ad mode, the state machine
> can run during NETDEV_CHANGEUPPER. It can attach the port to
> new_slave's own aggregator, and ad_agg_selection_logic() then calls
> bond_3ad_set_carrier(), which turns the bond carrier on. If the
> notifier fails, __netdev_upper_dev_link() has already removed
> new_slave from the lower list. In bond_3ad_unbind_slave(),
> __get_first_agg(port) then returns NULL and ad_agg_selection_logic()
> is skipped. Neither bond_3ad_state_machine_handler() nor
> bond_mii_monitor() updates the carrier once !bond_has_slaves(bond), so
> the bond keeps carrier on with no slaves at all.
> 
> With min_links > 1 there is a second case on both err_upper_unlink and
> err_unregister. Suppose new_slave's port joined an existing active
> aggregator and brought it up to min_links, so the carrier went on.
> bond_3ad_unbind_slave() only re-runs ad_agg_selection_logic() when
> __agg_active_ports() drops to zero. With fewer than min_links ports
> left, the carrier is never re-checked.
> 
> The err_dec_slave_cnt path also falls through here. By then
> bond_set_carrier(bond) has already run with the new slave counted, and
> nothing re-evaluates the carrier after the unlink.
> 
> Should the rollback call bond_set_carrier(bond) once the unbind and
> unlink are done, the way __bond_release_one() does?
> 
> [Severity: High]
> This is a pre-existing issue, but can balance-tlb and balance-alb leave
> a freed slave in tx_hashtbl or rx_hashtbl after these rollback labels
> run?
> 
> bond_enslave() calls bond_alb_init_slave() and marks the slave active.
> After bond_master_upper_dev_link(), new_slave is on the lower list, so a
> concurrent transmit under RCU can pick it:
> 
> bond_tlb_xmit()->bond_xmit_tlb_slave_get()
>    (or bond_alb_xmit()->bond_xmit_alb_slave_get())
>    ->tlb_choose_channel()
>      ->__tlb_choose_channel()
>        ->tlb_get_least_loaded_slave()    <- bond_for_each_slave_rcu()
> 
> The chosen slave is then stored:
> 
> __tlb_choose_channel() {
> 	...
> 			hash_table[hash_index].tx_slave = assigned_slave;
> 	...
> }
> 
> In ALB mode, rlb_choose_channel() also stores it in client_info->slave
> and bond_info->rx_slave.
> 
> bond_sysfs_slave_add() can fail, or a NETDEV_CHANGEUPPER notifier can
> veto the link. In both cases, none of err_upper_unlink, err_unregister,
> err_update_slave_arr or err_detach calls bond_alb_deinit_slave(),
> tlb_clear_slave() or rlb_clear_slave(). Only __bond_release_one() does.
> 
> err_free then frees the slave with kobject_put(&new_slave->kobj). The
> synchronize_rcu() in err_detach doesn't help, because the hash table
> still holds the pointer. The next transmit that hashes to that bucket
> would call bond_slave_can_tx(tx_slave) and read tx_slave->dev from
> freed memory.
> 
> Should these labels also clean up the TLB/RLB state for the lb modes,
> the way __bond_release_one() does with bond_alb_deinit_slave()?
> 

My assessment of each point and the v3
handling:

- [Medium] unbind after upper unlink: accepted. v3 binds the 802.3ad
   port only after bond_master_upper_dev_link() succeeds, so an
   upper-link failure has no bound state and the state machine cannot
   race with an unlisted port.
- [Medium] carrier left ON: accepted. v3 re-evaluates the carrier with
   bond_set_carrier() in the rollback, the same way __bond_release_one()
   does.
- [Low] missing Signed-off-by: accepted, added in v3.
- [Low] unbind on pre-adjacency failures: accepted. With the moved
   bind, such failures never bind the port, so v3 skips the unbind and
   no spurious LACPDU is sent.
- [High] balance-tlb/balance-alb dangling slave in tx/rx hash tables:
   pre-existing issue not introduced by this patch; I will send a
   separate fix.
- [High] __bond_release_one() unbind/unlink ordering: pre-existing
   issue not introduced by this patch; I will send a separate fix.

pw-bot: cr

