Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795879639;
	b=nmV6dhrUG1EGw4O7AKATnr6EQHr8Io9Cv0IkfNxOHCxzXTGwY3KZB9lnq/8aOiXJB0tp
	 1hSml0aVtkmvGgPnZfQqNmj1VDtcNK791sQjPxxGhU6BxuwqdzzsSLYpY1lFLwkGyr2dH
	 X/37dpS8ACukaCLIt6aGMJAQ48x2SOT54f44xnhJR2OGHfBMSJpWMrAQ/jl5VzVIUqzuU
	 v54PGSnoq54+Im60JHNqo44JiMIOiMzdtBI43QIy9RE3R/yYRJt0EbMF5so+7gVCP59Fi
	 i1HZV1R5FxAgUm+4MS4FQLndG8gxwfhPq5cineRIH8M1kbfK5bk64nUlvshqDXxZWPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795879639;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ou38e2SxRsowsC4OABL8WDLpn3tpSXaemiOSd+5fjw0=;
	b=rYh5bd7z4nmmBqDUhKmGoX7yGfvq/k7b/XQJcYEUpngfLamQwGpSWmk4dCDq+B53K2PF
	 3bA0+4WWJYV0m7Jz+auSLgGbG7s+f0UzQa4x70BFyeQrpGpw23YL87iwXL3RDMSI0Y8zU
	 6DUOBdQIVyrLe/46gdsSUkskSaJoYdEa32PQ2YjkT46oqL/kdlk3LnWuC6Jk7aST6X9Pm
	 lt/ozxOSYoy9ayVTnyBybKV5d3LAdXCpwvTd9ULhemxDcUEnlP8laz2hH4QokUwAPDS7h
	 IY2OLHM+kPi9ppaR3ynq/3cBDv2TSaWTqSM8SQCNaznN1g/jSVweB/Bd026n+hdDbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZJUxCOd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC69606A31C;
	Sat, 28 Nov 2026 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZJUxCOd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7DF1F000C1;
	Sat, 28 Nov 2026 15:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795879638;
	bh=Ou38e2SxRsowsC4OABL8WDLpn3tpSXaemiOSd+5fjw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iZJUxCOdwutyskFfl6Nb4zm7dBqtJXvwYO+bh2MC87lvlGU3MyDxQ4K0dwqpCw0wA
	 xfW6wCv5woDXumjsGRXQbYKZma3P1TFHy0m5MBpvx5xH/RA4XJi3ATDjTwsDko8sXV
	 8c1WZIY6fowr9OA8ZmM7C7omtMAThiXMf/IVgkzxzLpAmmvqnyMLEW4Htq7YbbHjzU
	 adN108Yrrx8tKaSqRsFeWupRih5VzqyrtRC8lEHwqDndnj8eXl/9weLYjQ+cIM/sCx
	 csd9yYzb8aItDIPr/IiIwDf/Oktj007rBkgshR8ZjaL2KMF4PG2EsGoilxkWDRmWX/
	 /vZhCJQ914eHg==
Date: Sat, 28 Nov 2026 15:27:14 +0000
From: Simon Horman <horms@kernel.org>
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
Cc: Mahesh Bandewar <maheshb@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, 1342116488@qq.com
Subject: Re: [PATCH net v3] ipvlan: update port flags only after
 ipvlan_set_port_mode() succeeds
Message-ID: <20261128152714.GB804035@horms.kernel.org>
References: <20261120032438.18789-1-sunwenbo@cmss.chinamobile.com>
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
In-Reply-To: <20261120032438.18789-1-sunwenbo@cmss.chinamobile.com>

On Fri, Nov 20, 2026 at 11:24:38AM +0800, Wenbo Sun wrote:
> In ipvlan_link_new(), port->flags is updated before calling
> ipvlan_set_port_mode(). If ipvlan_set_port_mode() fails (for example,
> when switching to L3S mode without CONFIG_IPVLAN_L3S), error unwinding
> calls unregister_netdevice(dev) via unlink_netdev.
> 
> While unregister_netdevice(dev) destroys the port when creating the
> first ipvlan device on a lower interface, struct ipvl_port is shared
> across all ipvlan interfaces on the same lower device (tracked via
> port->count). If another ipvlan interface already exists,
> unregister_netdevice(dev) only drops the extra reference and leaves the
> shared port alive with the updated port->flags, unintentionally altering
> the flags of existing ipvlan interfaces.
> 
> Defer updating port->flags until after ipvlan_set_port_mode() succeeds
> so that a failure inside ipvlan_link_new() does not modify port->flags,
> matching ipvlan_nl_changelink(). Note that failures occurring in
> rtnl_newlink_create() after ops->newlink() returns 0 (such as
> do_set_master()) roll back via ops->dellink() (which shares the normal
> RTM_DELLINK path and does not revert shared port->mode or port->flags)
> and are outside the scope of ipvlan_link_new().
> 
> This issue was identified with the assistance of an LLM-based code
> review tool, confirmed in a User-Mode Linux (UML) environment by
> creating a second ipvlan interface that fails in ipvlan_set_port_mode(),
> and verified in UML that the existing interface's port flags remain
> unchanged upon failure inside ipvlan_link_new().
> 
> Fixes: a190d04db937 ("ipvlan: introduce 'private' attribute for all existing modes.")
> Reviewed-by: Hangbin Liu <liuhangbin@kylinos.cn>
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>
> ---
> v3:
>   - Clarify in the commit message that deferring the port->flags update
>     prevents failures inside ipvlan_link_new() from modifying
>     port->flags (matching ipvlan_nl_changelink()), while noting that
>     post-newlink failures in rtnl_newlink_create() (such as
>     do_set_master()) unwind via ops->dellink() and remain outside the
>     scope of ipvlan_link_new() (Simon Horman, Sashiko review).
>   - Add Hangbin Liu's Reviewed-by tag (no code changes from v2).

Reviewed-by: Simon Horman <horms@kernel.org>

