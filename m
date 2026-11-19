Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117781;
	b=dg8jN43/KjRwp+XrgEGcbbMZXhLv3w4IhF2zA6upu3I0AUBj90n8I78LlZjmFUV8+pBH
	 cI4IzAWiL7bdlNMkevIm3KfK+s5TtuLx216XqYpQ2MEQlWknFbmUfy/E1e3jTSRCjTF4s
	 RnfJC1RCPazED0mID6o/MwTaUcjVh/H1X4sc7wIMycupPBtz+dqmo8Yms4xVHVhft9Ynd
	 HK9SWu+uKfNO6wMNFXsTNTZ4biunfvM0DBI0U/F5WVFnN7faux4/11r+sv2QV54FOrFsZ
	 sXUAxc8HynrtQNvDwYSwAvX/kOYKnjYunjW8BMK9xJ14cfY74iKTd9DmpmgjsdeB6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=M/cTVLWcrP6wdweYhfAlqnzE5SnDU1HjoH6S98HjutE=;
	b=vsC0AvQbqmT7dxj/5uYgonJ+HXnZjhopHC5hrUBcs9EiYlQT+oub7wVWoMQProB66FK7
	 avHZM2MsTmpAPYtEHY2UnThPQnqWMPBmpnuZa0p9Tot7K0lIVUw604w15epkZkG/WWnN/
	 RFLBzGd9npzXvXBZ20+pWfp+Qw5gLu9Q3R9sZpUASAvvMai4JE/NpbkCrRokMBHXk/HiH
	 dF9jBJ3aCJbVDBcXSCeWENPdbllp5H1xjQEuVWNl+O2aQwJ6UmiAyIEaqWBDX4BatU/cN
	 zKthoXKU9abtGLBoCB/h7jmdX3zH3dvMQWXazZgpmm4Sgmehy7JdhA5Nnr76i095Fbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=minyard.net;
	spf=pass smtp.mailfrom=minyard.net;
	dkim=pass header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=b8Xyyhnk;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D3606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501D3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=minyard.net header.i=@minyard.net header.a=rsa-sha256 header.s=google header.b=b8Xyyhnk
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85c1135c286so127118a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1795117779; x=1795722579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M/cTVLWcrP6wdweYhfAlqnzE5SnDU1HjoH6S98HjutE=;
        b=b8XyyhnkF8vi61fWIpOmo3vBz4Kk8ItXPFhW6M2e/n8qgsypfAy0yobR9uEm5ASzes
         eK9RMwlZhMLX+Az0w7NGKDQ0er+lJK9OGmE0Iuzmo6pjaF7KykNqaEthTVt6tj0cDKSz
         mcG0K37URVUGtETIwLzvsv0fBs9yIRobm+NsGRVMJZxxAYhouKOlV1k5Hx4x73le4V9l
         uayhtXfnqswddPlLcevqOqia8X4IPRiPQyBiFuKKg17kNRs3g265qcyXEc9Q0wl2xpbW
         9bJEKVMWyfaIpU2/3j9f4mefcwoXWtypgwQ+D5JJcx2twv3gPjrWnjEFut0wlBFZczcW
         R/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117779; x=1795722579;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/cTVLWcrP6wdweYhfAlqnzE5SnDU1HjoH6S98HjutE=;
        b=gWp4o0lzIyPmqjdOju0JZfVndIV+i9Bak1tv41hBSSThke6dzW88y2DJvwEN/y1rPg
         qHw+2CvpFkNlHtiBI2jQrnjQwAofxHfFcwNtnoTxGf4oAiOFhPOpStivygq8LFZzi5x2
         GcE+zhUvpHs9vj5Sf+veQT3IahBVkH/S8PdF7zejRwZVgu+3jPCUM7dqzw8VF28pCwHT
         WQ9tXUTl/ZI3uKhij+cfOcD+ZP8QLRNCEJawNUqK5JG5V9eF7ApaE7IMxIrKN6CPIuvp
         HEfyunQxgBuCQUEuLPeI1sCktINBYvLEv7hqnM4yOC0c4VYunZOd9nXx7EMp/tMbjNEf
         XqUA==
X-Forwarded-Encrypted: i=1; AL+hErEING4aOFK/oJaFlRVaWrN6G3FA/EUZCIsu+S4W4PGtVMO/joYhpK15yJNBtICKe7/Vagj3r/3KJgQt6AE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pltUfL9oaMKQRzaBKRaf31HUHNPeiZFZCMGuZYsaX41zhCPst
	Eji6ywZvNwN/IL45Kup0au5JFh6OKd4QW6M1QcyurTP45sL9i6ApxXRC2sGh+msQJQ5qib0/FaG
	ZNEtvn0Q=
X-Gm-Gg: AYBFou0kR5237B/m/HPpktwd/eMCppBCGyYnccqQDfq5PrPuSvXnOaa9Orifwca+Tog
	4X2Ij9Tp4+ZXKLCySP2tpOhbwowoY2lHe1eZUXP/U1/neEamiLT1dZ+1Y9rRTSwrj0vM0fgqeX1
	99HvX+OzmXQulQEg7GVOnPZ43JPY+i7tMgfbjyNlC4q7RAM13xJjR/gSh7qH46NKya8oaGxlF03
	QXEZ83fGrPJajuOWKpOO3t8Piv0v3Lbca+Uq2ucBkmiICAGypuIvxH+zkV7jyVzWVRpBn0bP0KW
	lXYDzUW7/gfyEz7Qc2v6CFyWN4r/XuomsPwr4HkVN1W7h9kPhvWwjvU69OkBRVLkRrjkMf9k7Fk
	+MT48Zqx8mVxpfpZ4rGCjuh31s1AIFfpzUk0yTmFMvDEUc2hkmGdHZPqKf6pJXEfhojJVit91EC
	6uDfJobS3eGWFfxh2iEvfcx41Yb7PavZ0lo9gdcRMmWAviwPs1q20+Bs5WN61eQIANEwXr/TGJD
	yaKajpW+M5UkJHZOiV27zD4P9kPU+YwBllvimScySOjbHHzuhitN0bo7ubCtFw8c6zIErlHkh0G
	YhMeqCIZMB1WOmKMufqXylruKcFCvM7yKi8F8XD/USeZkt2crEZeIGjyui2p9WjCXxvwr4EiIsq
	1JiFanq38gtzCpJtQwSviQGzqMaY4TxFjkY7c/8Q9NnuuNpgK
X-Received: by 2002:a05:6830:6412:b0:862:a901:21fe with SMTP id 46e09a7af769-86315a0bc57mr1315957a34.29.1795117779142;
        Thu, 19 Nov 2026 11:49:39 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:c1ac:4946:698e:41d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dd6e7sm468800a34.12.2026.11.19.11.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:49:38 -0800 (PST)
Date: Thu, 19 Nov 2026 13:49:34 -0600
From: Corey Minyard <corey@minyard.net>
To: Deepak Gudiseva <deepakgudiseva@nexthop.ai>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ipmi:ssif: Stop the thread before shutting down the
 timers
Message-ID: <av9SzjAnkoPaqYea@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261119-ipmi-add-smi-races-v1-1-3b8b3648c512@nexthop.ai>
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
In-Reply-To: <20261119-ipmi-add-smi-races-v1-1-3b8b3648c512@nexthop.ai>

On Thu, Nov 19, 2026 at 06:53:39PM +0000, Deepak Gudiseva wrote:
> shutdown_ssif() deletes retry_timer and watch_timer and only then stops
> the kssif thread. The wait at the start of shutdown_ssif() only waits
> for ssif_state to become SSIF_IDLE, but a normal message is sent in
> SSIF_IDLE with curr_msg set (see IS_SSIF_IDLE()), so the thread may
> still be sending one. If that write fails, msg_written_handler() arms
> retry_timer again after timer_delete_sync() has returned. The caller
> then frees ssif_info with the timer pending, and the timer fires on
> freed memory.

Yeah, I see the problem.  Thanks for the detailed description.

This is queued for next release.

-corey

> 
> We hit this on a kernel without commit 88f65f903d25 ("ipmi:ssif:
> Improve detecting during probing"), with a BMC that NAKs every SSIF
> request: registration failed and the interface was shut down while a
> request was still being retried. When the freed slot had been reused,
> call_timer_fn() jumped to whatever was then in timer->function:
> 
>   kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
>   BUG: unable to handle page fault for address: ffff888101f30900
>   RIP: 0010:0xffff888101f30900
>   Call Trace:
>    <IRQ>
>    call_timer_fn+0x24/0xf0
>    __run_timers+0x197/0x200
> 
> Since that commit the probe gives up on such a BMC. On current mainline
> this needs a BMC that stops answering after the probe, for example
> while it resets, and an unbind or unload of ipmi_ssif while a request
> to it is being retried.
> 
> Checking ->stopping before that mod_timer(), as the other retry_timer
> users do, would not close the window: shutdown_ssif() can set ->stopping
> and delete the timer between the check and the mod_timer(). Stop the
> thread first, then shut the timers down with timer_shutdown_sync(), so
> that nothing can arm them again.
> 
> Fixes: 00bb7e763ec9 ("ipmi:ssif: Add a timer between request retries")
> Cc: stable@vger.kernel.org
> Signed-off-by: Deepak Gudiseva <deepakgudiseva@nexthop.ai>
> ---
> Not reproduced on mainline; the trace is from an older kernel, where
> the fix was tested on hardware. Mainline is build-tested (W=1) only.
> 
> If this does not apply to older stable trees, I can send backports.
> ---
>  drivers/char/ipmi/ipmi_ssif.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 3a11fc4f35..10393aca05 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1285,12 +1285,13 @@ static void shutdown_ssif(void *send_info)
>  		schedule_timeout(1);
>  
>  	ssif_info->stopping = true;
> -	timer_delete_sync(&ssif_info->watch_timer);
> -	timer_delete_sync(&ssif_info->retry_timer);
>  	if (ssif_info->thread) {
>  		kthread_stop(ssif_info->thread);
>  		ssif_info->thread = NULL;
>  	}
> +
> +	timer_shutdown_sync(&ssif_info->watch_timer);
> +	timer_shutdown_sync(&ssif_info->retry_timer);
>  }
>  
>  static void ssif_remove(struct i2c_client *client)
> 
> ---
> base-commit: 63fdb511c27afcebce797e3db580b3534ddfa639
> change-id: 20261118-ipmi-add-smi-races-0b8bce266803
> 
> Best regards,
> --  
> Deepak Gudiseva <deepakgudiseva@nexthop.ai>
> 
