Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017578;
	b=cGuKcayRO21hTgDAPuOOfOZ4casm7r7HEeMASwob0V6k1gqs/VapXedkji+Ejeg5Newa
	 tKkp1YYPW3XDaUvT7mC1A1lCwrZk3jiF6FwAHHODKLsMAJibTZ1nE4ne+nt6rMwM3UCax
	 Q2Vdh1wACRWolJCyJ5mQqg8DkV54S6KszM9l6sSEZTKkC0ukWVMW7hbw+fQokxS3HdwgY
	 SkccrrKRnuqwlekxb5ijFXmWhL7qPAr6emPE/r5m4v2s8Ph4Gdo0kjx7QQA2wVVB9xvk+
	 ogIscWgotNDZzMp5TC8t/WRSxIqVomtfrpGwh6eFvcNoIlrS7oJdXFh//NK4XKGQ4mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
	b=ni/IuxNc/j5JB2TWCePRrgWDE9gO+6dwNBb+pOuOAShCK+zCar7f4KN5XCa/zuZK1xNU
	 klzgHugETvXs2ltQpN7fgavVl0ehUq06zuCx+aTUzySnMiRVL3iURX8AVYGZUGdpNUVwY
	 dO9Srkd1wM60A4Aufiq4mT271rNgtwWh+SJnxlMZe1fzv10vcj/ivGUq9X4EOIxKveRNA
	 2kkY/sly/I/TACDCbhlqG1B8LDRIOkr1GbB82VDkE4ji439P1mr978bP9f1BncHzH+l01
	 H1PTl9KuApgjcQfc1tidRZPO3ckDh7h4mIvORL33joTaSydCHowwlrlgmuO7ySDQKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fln29ZwT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07351606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07351606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Fln29ZwT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so12490715e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795017575; x=1795622375; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
        b=Fln29ZwTeNU/hpOkxJGZye3iOySM5HLQZY9DFRfKDDUmFl4L4shxRbTg2kjRQrHxfw
         U70HTi9A/FZ8W1fYk/bJ1Kcut92DcrnB1FrRvuMncX25dIGMcyqFCZBU4MgIjnxykVnW
         q1Ka3Z7v0VHlOQ73sf0MA5Ek7wvdTOmpeUhlklhvYpxi4f70vQU75YR7z40YBgISxWuh
         Gihap+mOK2WDgj638bjqZo9ON3eZ+3jMSCagrQXLs1Ji3s0I8jZR11xCZrqCe4TgQqc9
         asuGAGxKt7KDKI50utY+52BZS0Fyx5puP+nK63E94MJqSRHh5C5LmMITdWDKR7Z07kQH
         2SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017575; x=1795622375;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/h9rgXrfF5u1ci5MS4XgrHJyRv+KAHpfbsqOKTTt0mE=;
        b=bzGOjfEZYbPXteSwQJyUlCTaNz+mrpAKVVli367SYZ5RokxWWvuV2FtQKXB0lrR+9Z
         OvtLD4NcnFO4Ff0dOAr3UTvSnPgQu7hoWL4jtiCklkjypQd1zj92iJXfzTNwDgMV8iH3
         NWP43vPsxic39iXwpvKgjNb9CT6TjyWXTL04RaOeEZU1/HiuYz9NrqM/ZkxGje1TDZBy
         sOSnjbSXDNMDXUjp7RKSUN/p//zKGV/BOz9ef4bR3Lobm22sdR6AjIHzKkjrvPwB3uRf
         cffXqPW3sZjAUhmGK5V1WykHVan6nZjN/XJFC+r5nXIyd3074I+XDbT8TYSophjKvcB/
         I9KQ==
X-Forwarded-Encrypted: i=1; AL+hErGWxMa3HeiSRGu166/hoOJjcCySYEqS+/lvj2018HRC08dYzvNd9nNIxFK982OYRL8V628xcc8B22puGX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z85sgiYXV25eNSWO70dBXBJYbqRtWUHWJKAJ+HRSKQmOpoPbSUb
	4P4WYt/JC5xAhzQbvNJQnMr4lLFtY6vNJxqKJz6ElXMvj2H2a5ARde/lrfJzaK3mY6s=
X-Gm-Gg: AYBFou0Qqp7VQJi76/5DvvnxrYoQPaENPxsJP+ol7MyPd8CGnCojLfdpxIgDxpIi80M
	9rskr8sDLMx18EKzVzbncUMdLK3KjcSqvUsamD1xN8mDeOuCQ79qSg6fwXm/PpVtkAyN8Fz7Vru
	byWQnY/rRbX1e4TyrPHBaBRCIlmfNyl9t9Ovj3qArXhwzowLfXHSGnycwDG/nI21VVRwKd911Bx
	DotWeC5g1pCZEACI4n3JAiOEiWlpm9A9mJ8hsn7b+RPDi41cXs6Q9IMuzYUBQYqIvgJofjitxHK
	wtxPs6ikQjkx3ucSvAQZF0+qIz11JMA4Ck7u/KoNVRU7w4rdi5PR1sgD/uT5dR7E/FPBwvaLgyz
	cNtctzspK4OhasF6JTUuUbNHwknH2kZsfspijNEZvkGHgpeTwaHY6NdQcyEkGD0afYQ8t35gAeJ
	i4Jfl6ZRF5GrVmNv7Z7T9ut6fzLnp/vosRgcK4z0r7hjG+FyYgH5mYMCfG/mCiOwQhJfjf7SF+N
	9lBVOxyMel7iQyKPGK7mnsdXC108SU4s2GnIj0GrroAUoLZzl3MQzFdpQMvbmzOcji/dpiVhcal
	ltkACaEjnaKch07CLX3/FNy+vLBJNmWaovE4hsfDtB/cKQ==
X-Received: by 2002:a05:600c:1da6:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb7da34ef7mr56355545e9.24.1795017575257;
        Wed, 18 Nov 2026 07:59:35 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7840b05bsm224055145e9.7.2026.11.18.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:59:34 -0800 (PST)
Date: Wed, 18 Nov 2026 16:59:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	John Ogness <john.ogness@linutronix.de>,
	Sam Crossley <samuelcrossley@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH net-next v2] netconsole: register one console per target
Message-ID: <av3LZA_ZemI7ov0q@pathway.suse.cz>
References: <20261110-netcons_one_console_per_target-v2-1-bebf45b2733f@debian.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-netcons_one_console_per_target-v2-1-bebf45b2733f@debian.org>

On Tue 2026-11-10 05:10:01, Breno Leitao wrote:
> netconsole registers a single console (or two in case someone wants
> basic and extended at the same time), independent of the number of
> targets.
> 
> This was not ideal, but, there was no reason to change.
> 
> Now that we want to replay some messages [1], we cannot do it per
> target, but, per console [2].
> 
> Embed a struct console in netconsole_target, so, each target has its own
> console, named `netcons_<target name>`. struct console holds 15
> characters, so longer names are truncated, and two targets can end up
> with the same console name.
> 
> No ->match() callback is added: netconsole consoles set CON_ENABLED and
> register without a console= match. console=netcon0 no longer refers to
> netconsole.
> 
> Unregistering a console waits for an SRCU grace period and for its
> printer thread to stop, which the netdev notifier should not do
> under RTNL. A target stopped by an interface event keeps its console
> instead, and the write callback skips the target as it does today.
> Writing to its enabled attribute drops that console.
> 
> The console is replaced when the target is enabled again or resumes.
> The user may have switched the format in between, and printk has to
> format the records the way the target sends them. A target whose
> console fails to register is disabled, as it would not print
> anything.
> 
> Today, a target switched to the other format while deactivated resumes
> silently if no console of that format is registered.
> 
> target_list_lock remains the device_lock of all the consoles. A target
> is enabled before its console is registered, so only disabling it and
> interface events race with the write callback, and both change the
> state under that lock. The printer threads of the targets serialize on
> it, like the two shared consoles do today.
> 
> /proc/consoles now lists one entry per enabled target, and per target
> stopped by an interface event, for example:
> 
> 	netcons_foo0         -W- (E  N   )
> 
> This makes the mental model easier to understand, and also simplifies
> the code.
> 
> --- a/drivers/net/netconsole.c
> +++ b/drivers/net/netconsole.c
> @@ -1134,19 +1112,6 @@ static ssize_t enabled_store(struct config_item *item,
>  			goto out_unlock;
>  		}
>  
> -		if (nt->extended && !console_is_registered(&netconsole_ext)) {
> -			netconsole_ext.flags |= CON_ENABLED;
> -			register_console(&netconsole_ext);
> -		}
> -
> -		/* User might be enabling the basic format target for the very
> -		 * first time, make sure the console is registered.
> -		 */
> -		if (!nt->extended && !console_is_registered(&netconsole)) {
> -			netconsole.flags |= CON_ENABLED;
> -			register_console(&netconsole);
> -		}

What is the expected behavior when people repeatedly disable/enable
the console, please?

register_console() always initializes con->nbcon_seq, see
get_init_console_seq(). A solution might be to keep the current value
when con->nbcon_seq or con->seq is not zero.

Alternative solution would be to add a flag CON_PAUSED which would be
used to temporary disable the console without unregistering. It might
be handled similar way as CON_SUSPENDED. The point is to make
is_console_usable() return false when the console should stop
emitting the messages.

Note that we could not use CON_ENABLE because it already has another
semantic.

> -
>  		/*
>  		 * Skip netconsole_parser_cmdline() -- all the attributes are
>  		 * already configured via configfs. Just print them out.
> @@ -1167,6 +1132,9 @@ static ssize_t enabled_store(struct config_item *item,
>  			goto out_unlock;
>  		}
>  
> +		ret = netconsole_register_console(nt, 0);
> +		if (ret)
> +			goto out_unlock;
>  		pr_info("network logging started\n");
>  	} else {	/* false */
>  		/* We need to disable the netconsole before cleaning it up
> @@ -1182,10 +1150,7 @@ static ssize_t enabled_store(struct config_item *item,

The code does this here:

		nt->state = STATE_DISABLED;

>  		list_move(&nt->list, &target_cleanup_list);
>  		spin_unlock_irqrestore(&target_list_lock, flags);
>  		mutex_unlock(&target_cleanup_list_lock);
> -		/* Unregister consoles, whose the last target of that type got
> -		 * disabled.
> -		 */
> -		unregister_netcons_consoles();
> +		netconsole_unregister_console(nt);

Why do we disable the traget before unregistering, please?
I ask because it might cause loosing messages, see below.

>  	}
>  
>  	ret = count;
> @@ -2615,53 +2585,40 @@ static void send_msg_udp(struct netconsole_target *nt, const char *msg,
>  }
>  
>  /**
> - * netconsole_write - Generic function to send a msg to all targets
> + * netconsole_write - Send a msg to the target of a console
> + * @con: console of the target
>   * @wctxt: nbcon write context
> - * @extended: "true" for extended console mode
>   *
> - * Given an nbcon write context, send the message to the netconsole targets
> + * Given an nbcon write context, send the message to the netconsole target
>   */
> -static void netconsole_write(struct nbcon_write_context *wctxt, bool extended)
> +static void netconsole_write(struct console *con,
> +			     struct nbcon_write_context *wctxt)
>  {
>  	struct netconsole_target *nt;
>  
> +	nt = container_of(con, struct netconsole_target, console);
> +
>  	if (oops_only && !netconsole_kernel_dying())
>  		return;
>  
> -	list_for_each_entry(nt, &target_list, list) {
> -		if (nt->extended != extended || nt->state != STATE_ENABLED ||
> -		    !netif_running(nt->np.dev))
> -			continue;
> -
> -		if (netconsole_ratelimited(nt))
> -			continue;
> -
> -		/* If nbcon_enter_unsafe() fails, just return given netconsole
> -		 * lost the ownership, and iterating over the targets will not
> -		 * be able to re-acquire.
> -		 */
> -		if (!nbcon_enter_unsafe(wctxt))
> -			return;
> +	if (nt->state != STATE_ENABLED || !netif_running(nt->np.dev))
> +		return;

This is where the messages can get lost. The write() callback does not
pass any error value. As a result, nbcon_emit_next_record() bumps
con->nbcon_seq even when the message was not emitted.

A better solution would be to unregister or disable the console
so that the write() callback is not longer called in the 1st place.
The current con->nbcon_seq could be preserved and used again when
the console is resumed/enabled again.

>  
> -		if (extended)
> -			send_ext_msg_udp(nt, wctxt);
> -		else
> -			send_msg_udp(nt, wctxt->outbuf, wctxt->len);
> +	if (netconsole_ratelimited(nt))
> +		return;
>  
> -		nbcon_exit_unsafe(wctxt);
> -	}
> -}
> +	/* If nbcon_enter_unsafe() fails, just return given netconsole
> +	 * lost the ownership.
> +	 */
> +	if (!nbcon_enter_unsafe(wctxt))
> +		return;
>  
> -static void netconsole_write_ext(struct console *con __always_unused,
> -				 struct nbcon_write_context *wctxt)
> -{
> -	netconsole_write(wctxt, true);
> -}
> +	if (nt->extended)
> +		send_ext_msg_udp(nt, wctxt);
> +	else
> +		send_msg_udp(nt, wctxt->outbuf, wctxt->len);
>  
> -static void netconsole_write_basic(struct console *con __always_unused,
> -				   struct nbcon_write_context *wctxt)
> -{
> -	netconsole_write(wctxt, false);
> +	nbcon_exit_unsafe(wctxt);
>  }
>  
>  static void netconsole_device_lock(struct console *con __always_unused,

Otherwise, the patch looks reasonable from the printk POV.

Note that I haven't tested it. And I am not sure how many scenarios
are possible. It seems that the netconsole user interface is really
rich ;-)

Best Regards,
Petr
