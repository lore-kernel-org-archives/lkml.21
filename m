Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590863;
	b=CpnXJAVQ0Xr+juLPsD3TZMURDh4d+4HES3PHEo433/0iCr1iA2W6POA3nsLcppMIvT5j
	 lauVx7SikPZHi5jffq6ie01FMDyTNsppsfyc3C5iqJ84mxPwkqO8yIsIZE7yfsCvSnF6v
	 6DQK2YJedX6GJwmKyCc8xbdt8pVfgtZacYkgmjuRuMXcJjAkUWp7mM7CknSpeLPFjfTzi
	 4GA1HRaqvFjPC0NBtftJu5IO+OTlDJmAvkdAHM5XGHzdQSpLHJ3IQKPdlvVOnslcIWA1c
	 xuUaHBILtLSvFymFnCmc7v0O65wWP4gLc8efjyofoG1GXrGF7VjaYqBvd6vDmKarxGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
	b=n/bYiB1eV1rcPy9GCntQY4pVSwb3uOqoSvuePVMnMBtZ4lLbcV4T8hwjZFSKrde8GNsT
	 1cgwmtBRa/WbViCf8r4AkWKmsOEUxv5rjdIhZ/JXO39iuho3TcWJOlhUWki1IMtYCuFEU
	 MEpTCMMu9uo60Ge5CW08oWu5+adH6o+mkuQaTFyScfU8NL/6tWWaninlaPFJdosCnBij+
	 h5aU3lEKbr4UZXDc+5Y422z6E4t3LEgXN7Gswh/mCSqsHOrSF5EAOy+JZ7yDjHAxvkVDV
	 s954zmGqzYnjtuh+OzYADoTiYTurwAlXTEdnGamDucBe6h11dDScZskvshhds74W6hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Y7d+PtKP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298A3606A687
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 298A3606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=Y7d+PtKP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso56237575e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795590860; x=1796195660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
        b=Y7d+PtKPrZc9qrL8ruw1v2fnEiDIJp/Oiw2UpSegR2quLKxNQMSfHY8uFKTccIL/4R
         LryGVJ39a7dQhuuNh96TtjzmrNy6WXtuaXlWmHSDUtsvgdqUe/iV0pQxxrUKTcdi6d/G
         JzgjhkCIGo991kVo+5OuxAOat0SDzClE4Q7lxRlHMmYqBEdV4IJioU1kPuJyz6zX0Wjh
         wkt2/sPUo2ko3roosjYwPxD7nOOlOm+xiYO/8xs5reM3rtyZrIj2XhlrBVNrD266dGbM
         ycDAljyKKsdUTSXsstGvHR6kbQTTMw67gMFKXtXTLQfS6ny3OhYLy/FzBbUdHy0Yv2/+
         Upow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590860; x=1796195660;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OS4S/3wgJzlNANveRHhJ0JCqQT7lj4OoQJmmJFDLZnQ=;
        b=aEQjQbykakL+CgJT8rkssJhyo8fBV2h0fMp9lOIhTtUqOrsQbN+g8yPf9BOlzv98ap
         LS3bAqqcQjGog/UJRAluc9NIckt3WM2+Yywmox+imGYD8+yhNYpYolRIAEfgzEM/5DqJ
         bYnxakY5kqRZGbXm3emdRbgz+iZROUd7LQNCdYMHtSk5v3YRUdqLN4ooA3MGek/mpO0M
         vpkiQUAnqqpF5VpvEjA8YNlU1J+l+aZs5RXLn7MLSWYiCQ1HVNnZDpsKEYYtStS1Ooga
         IVLhWm45wC6FBAKcyJdnD3ejoY6KFO/Z9WTOKLoGIi6laylu0UtsHl67cNiPEP20fSnn
         MAwg==
X-Forwarded-Encrypted: i=1; AL+hErGnIqGj+DtLuKguaKVdoRbQc0f7HDOprc80IDpYdPghwF8Pf+Su4nsiglOSdwdFHUs5c7J/3yloON3Zpl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Sk3oD1Q7TTsjgwLmiazQmWW0jh4QmcdNtjm0Gi5Bilm1ZvRRh
	/L1UddYuIiAXOoCGsxJ53gS0JRP513HA4yo9d3AJbj+qfI06I5qnCxvEjwph2nrvAwY=
X-Gm-Gg: AZFdTZeKtTwFhCBPQAfMmGyO8JCwm8B3DOxcF36Kq4C5Qlp4qDfVXPHmjCDIjcdaXGH
	o8RLYTz8aPa/Cv/0szlXXqJqt8Pzu3+jUMUcYsCgV8P18dkOlvXkLUfqoEUcnozlITVpMMPkPIG
	6L0WbMWaz05WBqkiTSac6+ezcrgVLJp9hM8CYXWdX5mchqy/OXFFIDDbXslLs28wdjik09NPq5V
	0NoJ9VjZvWQa12pZtkACntuoFfFQWLuqrwE+xlWO+0gJ/OIYAg5Rh/03iL2duxAITWfyz8538rT
	3CeaBQHBR6L5oLDhULkSPWOzJcQTnob3E3yYnCJCsq1edXCt4QGN/X3MB82Lg9YiegXDs7UWXT2
	eUfcyFwoDJgP1i9ZusaC3rjpW+y4pckqawLbE7jGioTGQKHCjGxiQOozqCaBEQxqQEl4E9V+AGT
	VjByuYpyW7aPkhON0WbbEyd4ask7fFwVOfi8pIkGFy/Qda2xPsXLFbRTuwDIQbTULMyx6KHIS95
	p5hapLka0u2Kci8EKvFAfpP/uonaoXkBLGPv4xogNpBkVZa/WfOol+TRfFHYDHN0w7AJOJl84vI
	daycsvTplFyqelj7/rEiiJl0qHrjqhMKHChbfDY3zrKBJouuT2PpfgXdMBA=
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr301676605e9.8.1795590859967;
        Tue, 24 Nov 2026 23:14:19 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm582103175e9.11.2026.11.24.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 23:14:19 -0800 (PST)
Message-ID: <654889ea-3b83-4fd4-b283-184f87b3d208@blackwall.org>
Date: Wed, 25 Nov 2026 09:14:17 +0200
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
Content-Language: en-US, bg
To: Lin Jiapeng <ljp1205831794@gmail.com>, jv@jvosburgh.net,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, sfeldma@cumulusnetworks.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
 TencentOS Corvus AI <corvus@tencent.com>
References: <20261124024319.52145-1-ljp1205831794@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20261124024319.52145-1-ljp1205831794@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 04:41, Lin Jiapeng wrote:
> From: Lin Jiapeng <jiapenglin@tencent.com>
> 
> The 802.3ad enslave path binds a slave before publishing it in the bond's
> slave list. The periodic state machine can select the port and attach it to
> a LAG while enslavement is in progress, including while NETDEV_CHANGEUPPER
> notifiers are running.
> 
> If enslavement fails, rollback can free ad_slave_info without unbinding its
> port and leave later LAG processing with a dangling pointer. This affects
> both a failed upper-link notification and later failures such as
> bond_sysfs_slave_add(). A test-only kretprobe forces the latter to return
> -ENOMEM, after which KASAN reports:
>       BUG: KASAN: slab-use-after-free in ad_agg_selection_logic+0x1a0d/0x1fa0
>       Read of size 1 by task kworker/u16:0/13
>       Freed by task 110:
>         kfree
>         slave_kobj_release
>         kobject_put
>         bond_enslave
> 
> Drain the RX handler before unbinding so receive handlers cannot race with
> port->slave becoming NULL. Unbind before upper unlink when the link exists,
> and also unbind after an upper-link failure without repeating the unlink.
> Rebuild the slave array after aggregator changes and leave earlier
> unpublished failures unchanged.
> 
> Fixes: 07699f9a7c8d ("bonding: add sysfs /slave dir for bond slave devices.")
> Reported-by: TencentOS Corvus AI <corvus@tencent.com>
> Link: https://lore.kernel.org/netdev/20261113130454.63032-1-ljp1205831794@gmail.com/
> ---
> v1 -> v2:
>    - Drain the RX handler before unbinding to avoid NULL dereferences in the
>      802.3ad receive path.
>    - Cover NETDEV_CHANGEUPPER failure after transient upper-link publication,
>      without repeating upper-dev unlink.
>    - Rebuild the 802.3ad slave array after rollback.
> 
>   drivers/net/bonding/bond_main.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index e9f5e753f677..7ca948bb27d0 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -2355,10 +2355,21 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>   	bond_sysfs_slave_del(new_slave);
>   
>   err_upper_unlink:
> +	netdev_rx_handler_unregister(slave_dev);
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);
>   	bond_upper_dev_unlink(bond, new_slave);
> +	goto err_update_slave_arr;
>   
>   err_unregister:
>   	netdev_rx_handler_unregister(slave_dev);
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD)
> +		bond_3ad_unbind_slave(new_slave);
> +
> +err_update_slave_arr:
> +	if (BOND_MODE(bond) == BOND_MODE_8023AD &&
> +	    bond_update_slave_arr(bond, new_slave))
> +		bond_slave_arr_work_rearm(bond, 0);
>   
>   err_detach:
>   	vlan_vids_del_by_dev(slave_dev, bond_dev);
> 
> base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea

This looks awful jumping around error labels and doing the same thing
at different places. Surely you could rearrange them better, maybe
something like this (untested, needs proper review):
--- a/drivers/net/bonding/bond_main.c
   +++ b/drivers/net/bonding/bond_main.c
   @@ -1888,10 +1888,11 @@
    int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
                  struct netlink_ext_ack *extack)
    {
   +     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
         struct bonding *bond = netdev_priv(bond_dev);
   -     const struct net_device_ops *slave_ops = slave_dev->netdev_ops;
         struct slave *new_slave = NULL, *prev_slave;
         struct sockaddr_storage ss;
   +     bool upper_linked = false;
         int res = 0, i;
  
         if (slave_dev->type == ARPHRD_CAN ||
   @@ -2246,13 +2247,14 @@
                 slave_dbg(bond_dev, slave_dev, "Error %d calling bond_master_upper_dev_link\n", res);
                 goto err_unregister;
         }
   +     upper_linked = true;
  
         bond_lower_state_changed(new_slave);
  
         res = bond_sysfs_slave_add(new_slave);
         if (res) {
                 slave_dbg(bond_dev, slave_dev, "Error %d calling bond_sysfs_slave_add\n", res);
   -             goto err_upper_unlink;
   +             goto err_unregister;
         }
  
         /* If the mode uses primary, then the following is handled by
   @@ -2357,11 +2359,15 @@
    err_sysfs_del:
         bond_sysfs_slave_del(new_slave);
  
   -err_upper_unlink:
   -     bond_upper_dev_unlink(bond, new_slave);
   -
    err_unregister:
         netdev_rx_handler_unregister(slave_dev);
   +     if (BOND_MODE(bond) == BOND_MODE_8023AD) {
   +             bond_3ad_unbind_slave(new_slave);
   +             if (bond_update_slave_arr(bond, new_slave))
   +                     bond_slave_arr_work_rearm(bond, 0);
   +     }
   +     if (upper_linked)
   +             bond_upper_dev_unlink(bond, new_slave);
  
    err_detach:
         vlan_vids_del_by_dev(slave_dev, bond_dev);



