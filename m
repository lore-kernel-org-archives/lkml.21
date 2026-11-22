Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795312749;
	b=0S+SZjLt4jrTz6dDUAU1JRRosyFHZab6jjWmr9DfGgDsrKg4ut+zewyaRyURYbqAVJZQ
	 b2W5/KgA/pBlkvECeU5+KgKBnnnFUz9WpPJ6rfeQXoQIavY1AYkdlmBlEOBXmVU6hYtVd
	 04lb3jKD9XW6ieIwmB0peNDwuYZ2mnJ9hPjyrvzmlmJ+esVnimEyFOjgmRsK0z6+nd4Lr
	 t6FHaDzsVqZEqqUNYje2OAgUA2stt4L0/NSJpKaJRqaghIK4882AGMmcFa3l6nJZ0n79v
	 gUThmowD1Jf64AlleSro93dgXlbsk//vtOFSt/3KzQduKvffK3xRnskyTqFshXXC1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795312749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=whetEHF4AWQXum1UflhOoTSbPDh8zDfbdm4KiuyO3fI=;
	b=2FT6VIcJfhHos17rUaKQCh7KQAGGnQnT/jE0BvXV3rnoyJbmARcF7X2UR95j+fHMrjV7
	 6c8F5iwegYGrRQ1DSCbP+qd5WByqE8JZ5t6fYjSTBZgn9WQrCBbKd/2ngSJrVW1BA1pe8
	 mOSGrLVp6GQEvdgYcFuID/4ECKRK5pxkzTgjQmyNqKUZH+s9RBrqa1pkGCmIocKGoggQr
	 Gle3fwneZzBAH0KpV6Zk+0lMGU9O46VZRAIym9an6d5p9P/HP8bW6G0wKgK3vAW80v5Pd
	 L15H0+S+ZuedvsHrpIc78k/tphyfZYofqRunaZCTqREDHNMP4wZwBoN4OVrDVY8m8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=minyard.net;
	spf=pass smtp.mailfrom=minyard.net;
	dkim=pass header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=aDm+Dn1W;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14093606A337
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14093606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=aDm+Dn1W
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6df7f544919so1336114eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1795312748; x=1795917548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=whetEHF4AWQXum1UflhOoTSbPDh8zDfbdm4KiuyO3fI=;
        b=aDm+Dn1WGnfM+brSC+XU+4UWDS+POymD3f2SHLVRar7WTn9jLGGPbN0dEaytiNEh20
         swhi1yZGUlGEwh/impRT9/wLTFNfrPTfySxpParn9Flb1C46VmKV0eUUzDH93MTAocIK
         0IeuTo9qNw8UVkyzW9XA30o74iDjRG8DBczepg6GdUEGB80jFVoviin5WyH7bIu4VEVK
         xpjCna9QyluTAw3zJ7S3IykkiYGmgmQAYS5Fy9XCRjltsAdXoEdzVI45FBUSLjJSq+Vm
         LzdD9x3/baMyj9LRkU2rADgnztLXgRNgi+dCB4/NhYeSJ9L0oEBwPqeiFlJa75ymRSsX
         NvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795312748; x=1795917548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whetEHF4AWQXum1UflhOoTSbPDh8zDfbdm4KiuyO3fI=;
        b=RhSltF17O0IIBrOPLwcEFxiazjus/Me1y4PGonWWhV0nEpuLLLSyDvES2qzM8xx52/
         dy+YUn/Umq0SWwDt9m9T7kLHls6d/vem6FmnMy4AYrhTZCHfq6kEe2gmWQx2/HjqephX
         C65OB/p3ebyuRnIYJLKIsQFauWk4RoRm8OmQkXoOKFaytK0HADd9m0tUF5wB2tXDTVmP
         MfEyUU64KMaG5ZBbdn0I8pAvLH/Xp0VhBLIra1wrS1LwXVWKrt5tRw7aA2hHaKQLGcXS
         kLWo6Kme4cOqSmPJf6ZWWIkgxYsPL+JSb9lKjvK1hQedQD6n0RIOu4QN0R4XqgRC0tDu
         TYGQ==
X-Forwarded-Encrypted: i=1; AL+hErEN8ow/nO3DxxwCAwLv0F/2usY6PvohpnzfyQ28uRL8qIe8kb05lIU5TvAWSuuHKXUpngI9dPQr30KQ3+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U7uB8iDTjABbH0sBohjrxb5QBPDSCWFJsDcGjNxOkWzMiaZ0G
	nt5N03ooaS2EEen0cekRd3P98WSStAZaq817W2lXlz+YkHaUbJF2HwWXQ+QSr+cZrnc=
X-Gm-Gg: AZFdTZciMAkbr0QD7UijkPE8rRo+aZgIyFG/qvomB2yF/MLtqILgQIwDyqqm+E3My9h
	+LrCm9HkSXLlV7dj4dGFFDKUtHrH20hweldmx6evQ1I5aJjvOB7zWgFiSdRH7oXbHuErvQUYidz
	BBmmzQSX4h4vqpuD1v7DR9vx0LeCHx9RqFODtIyws2hMJytBw4lhMvj9BDFPp6xbR6APwBV79rA
	rnkJyLEi2Rmp+sdYiq+mMvUptExSNqFsM54kEHMbQagW8Nz1do8pjJ8JQe8I44T2v96oB//CRCN
	n9XIKyRYw711vHF0WfqA2mihduHcWdBq6jG6yytWJ1wQdZwUdwlJ9t6OWvsgI3jhkuHMpaIhLmO
	miCy2WLZdQ1gIsBKOzmOEm9hyXTtwFPJE68xkjxVoGfm1X4YvVPQHx9MMEsx+kICGXK81WqoE9u
	QhaX4im64CGZYxeNqSO0FTvYozg9ULmMQMpkuhEjvmHN8tVIE/oM8rF7y31YebNtSlBGqdnNNUh
	twzTGyVA4N20SUCot3aVI/bTmHjd8tiMe9Bfoa1Nv5t/2Ue7KZdooaFix9uvYtAhA5L5W0ueYgz
	ha2KcJClLRIDeFDRseMIUCgOnb6TgbZ6rVm6SLnl8Dy0sfNfwi6/nfz0biANaV8JLy/PI8ZsZid
	B0CUD+4eJ+E49Fj2Br+XwROdQY+HkWbF1p5YMdE+FBkhhXm8SbA==
X-Received: by 2002:a05:6820:2204:b0:71a:fe3f:82d9 with SMTP id 006d021491bc7-71b395abea7mr6586380eaf.84.1795312747739;
        Sat, 21 Nov 2026 17:59:07 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f53d:ce4d:693a:42f5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38058102sm4461851eaf.6.2026.11.21.17.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 17:59:06 -0800 (PST)
Date: Sat, 21 Nov 2026 19:59:01 -0600
From: Corey Minyard <corey@minyard.net>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: openipmi-developer@lists.sourceforge.net,
	Meta kernel team <kernel-team@meta.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ipmi:msghandler: Free queued requests of a destroyed user
Message-ID: <awJMZfksZDfGO7k4@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261121031549.3599823-1-shakeel.butt@linux.dev>
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
In-Reply-To: <20261121031549.3599823-1-shakeel.butt@linux.dev>

On Fri, Nov 20, 2026 at 07:15:49PM -0800, Shakeel Butt wrote:
> In the Meta fleet we found hosts whose BMC had stopped answering IPMI
> requests while a power management daemon kept polling it:
> 
> - the daemon runs "timeout 2 ipmitool raw 0x30 0x7e" every two seconds;
> - every run leaves one request and one closed IPMI user behind;
> - one host held over a million closed users after 25 days, using about
>   33 GiB and growing by 1.3 GiB a day.
> 
> ipmitool opens /dev/ipmi0, sends a request and waits for the answer.
> When timeout kills it, the file is closed and ipmi_destroy_user() runs.
> A request that is still waiting on intf->xmit_msgs or intf->hp_xmit_msgs
> stays there, and its receive message keeps a reference on the user.
> With a BMC that does not answer, the lower layer is slow to fail each
> request: about 15 seconds of retries for SSIF, and up to a minute for
> KCS on kernels without the hosed BMC handling from
> commit bc3a9d217755 ("ipmi:si: Gracefully handle if the BMC is non-functional").

Oops, that's not good.  This is in my next queue for the next release
and I added a stable backport.

Thanks,

-corey

> Requests arrive faster than they leave, so the queue, the users and
> their messages grow until the BMC answers again.
> 
> Nobody can receive these responses once the user is destroyed. Free the
> user's requests that were not handed to the lower layer yet. Such a
> request is then never sent to the BMC. This only matters for a program
> that sends a request and closes the device without waiting for the
> answer, and with a working BMC a request waits in these lists only
> while another request is being handled.
> 
> The request the lower layer is working on (intf->curr_msg) is left
> alone. IPMB and LAN commands do not point to their receive message, so
> they are not touched here. Their receive messages are freed by the
> sequence table loop just above, as before.
> 
> Tested in QEMU with a fake BMC that stops answering and four loops of
> "timeout 2 ipmitool raw 0x30 0x7e", with KASAN and lockdep enabled:
> 
> - SSIF on linux-next: 465 closed users were held after 4 minutes,
>   growing by about 116 a minute. With this patch, 5 are held (the four
>   live callers and the request in flight), and the number stays flat.
> - KCS on v6.16, which lacks the hosed BMC handling, with this change
>   adapted: 476 held after 4 minutes without it, 5 with it.
> - KCS on linux-next: at most 5 held instead of up to 28.
> - With a working BMC, 1600 requests from 8 parallel ipmitool loops all
>   succeed over KCS and SSIF, and nothing is left held afterwards.
> 
> QEMU needed small changes to behave like the failing BMC: ipmi-bmc-extern
> makes up a timeout reply after 4 seconds, its KCS keeps IBF set while
> the BMC has not answered, and smbus-ipmi returns the previous reply
> instead of NAKing the read.
> 
> Fixes: 7ea0ed2b5be8 ("ipmi: Make the message handler easier to use for SMI interfaces")
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 41 +++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 152dd6b5bb27..52e95e1949b9 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1339,6 +1339,45 @@ int ipmi_get_smi_info(int if_num, struct ipmi_smi_info *data)
>  }
>  EXPORT_SYMBOL(ipmi_get_smi_info);
>  
> +static void move_user_xmit_msgs(struct list_head *from, struct list_head *to,
> +				struct ipmi_user *user)
> +{
> +	struct ipmi_smi_msg *msg, *msg2;
> +
> +	list_for_each_entry_safe(msg, msg2, from, link) {
> +		if (msg->recv_msg && msg->recv_msg->user == user)
> +			list_move_tail(&msg->link, to);
> +	}
> +}
> +
> +/*
> + * Free the requests of a user that are still waiting to be handed to the
> + * lower layer.  Once the user is destroyed, nobody can receive their
> + * responses.  If the BMC is slow or does not answer, they could otherwise
> + * stay queued for a long time, each one keeping the user and its own
> + * messages allocated.  A request that was already handed to the lower
> + * layer (intf->curr_msg) is not on these lists and is left alone.
> + */
> +static void remove_user_xmit_msgs(struct ipmi_smi *intf,
> +				  struct ipmi_user *user)
> +{
> +	int run_to_completion = READ_ONCE(intf->run_to_completion);
> +	struct ipmi_smi_msg *msg, *msg2;
> +	unsigned long flags = 0;
> +	LIST_HEAD(msgs);
> +
> +	ipmi_lock_xmit_msgs(intf, run_to_completion, &flags);
> +	move_user_xmit_msgs(&intf->hp_xmit_msgs, &msgs, user);
> +	move_user_xmit_msgs(&intf->xmit_msgs, &msgs, user);
> +	ipmi_unlock_xmit_msgs(intf, run_to_completion, &flags);
> +
> +	list_for_each_entry_safe(msg, msg2, &msgs, link) {
> +		list_del(&msg->link);
> +		ipmi_free_recv_msg(msg->recv_msg);
> +		ipmi_free_smi_msg(msg);
> +	}
> +}
> +
>  /* Must be called with intf->users_mutex held. */
>  static void _ipmi_destroy_user(struct ipmi_user *user)
>  {
> @@ -1375,6 +1414,8 @@ static void _ipmi_destroy_user(struct ipmi_user *user)
>  	}
>  	mutex_unlock(&intf->seq_lock);
>  
> +	remove_user_xmit_msgs(intf, user);
> +
>  	/*
>  	 * Remove the user from the command receiver's table.  First
>  	 * we build a list of everything (not using the standard link,
> -- 
> 2.53.1-Meta
> 
