Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631467;
	b=KqFFo+AlmjaL79UDJsT4IUfkD5XOxiTs6cQ48iKKUZlIjUrh4PZfPBNRV5aec//uVknP
	 4PEwE5Jg4ySHj1d7nW6Yg3ZhZOU7aK+8ChJElWpljflD/9cK3HO/4RYTnOGUHHCiHhlpU
	 XDquNvke8lr2MdVFL8X93nRMPhCTZt9G8zv9SL2sz0JbXwlsx5JyinKoCvN9jhzNIk3LI
	 DTLFBzH7rfsgfP2IpEHQNHYfrkX4WFNalzR/nn0lYbCve0cKUyJgs3l8Cb76s/xq7QjJL
	 lgftpy6yVyr7qmU0QMjKiFuemhxLmKmmLAlpKR+QOMiGOMxlxCYsHvf85h9MY7s8TGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
	b=tVyL7rPPqLaRRE88c3BE3qtx7hNdtzPLwQGkNdgjJQQli9dmRoGgZFAm75bwPW9xFML1
	 jET8psNCemtJ9h12PkRBmi62T/30GzvIGOhfbryzaNCwhhkt2WdG9LIF9A8wNlfr9ICGi
	 jfv7VRp/H8dShzWJtUAmQnWelKDP9LVmRb1C5S/Y8sJ2PrydVBGM4oraBBPPjmQPlkJoH
	 nkMsiOSfVIZyG74Wx3A+W04rwvAf5l1NzUL7LBxYsmJ5WI/rMjkITzvTQnorJ6brQTz+w
	 AmhP5aLM+7J4ee8HWKRdUuUCyamcdHWKIjwcn5OqLNj9hiCpPv0KfVO2G+1/ISfvYnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="iuOU/6o1";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E1E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iuOU/6o1
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b41e5a1719so2608835a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795631466; x=1796236266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
        b=iuOU/6o1FuX7edBvOPgSborrvsi1AV6lTW56f3MrL5M3ciggBn7NAMlgNa88wa9V0h
         J2Y2J/+E6RkGUPUJU9gtxrUxsRbD+Wnf8wxUdHbhuC6IF58UhKws6Egbecx6RlQZrWRc
         sbwD7lV+ODmhLcZu3dshIVn5PBnQSddEGx0on5bPltu6CwR/+DAzjDvxHYc56xTscHSW
         0UD3kL2HkVHMUYXYsenkXbR7h/iPK7m40xNTWZ6q31opovxwEq6OPI0BGDYcq/RMhxJU
         abuWOSQEv/ECu0OuE/qdbLllXyEhJhw/wIovR33xiLGIailJ7jfGaHE/7mFFU0aA0siG
         lXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631466; x=1796236266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=psXaIp3Nh1NYvXPifg51KMF8ZXrIK7h4nbMDzeSpDqk=;
        b=WXLWxpey3rSMQCaP/+LHJEo1lw5wM5cHD7CMmZx/BvPZoCladx79dw/3pYJ8kVzFRM
         /tmCZywuKvXJ7B+SoizWraKtxkSHqAj2ebfqfU/wsa8KYyCBZOg5qBBUsOlZIZb7Bp8N
         lsZSdCD3XVVc1ok/9j350Xk5jruDj/jBEdZ+6X08hR5DMq2MjOvDkKoebSwTGv4ErMe/
         9xG/4NuF5iqHPC/PI/agcv4gIovfZZXidjRWOTLTCyuIZS8vt/3aLOycdGU5Bze6iGzF
         J7WY2yur1CI/Vlv7ufXNPenlolhBxhEXWC+ZmZTDJ2kUKtV+L4qq8kaqVrUcGkhcsS2J
         DUnQ==
X-Forwarded-Encrypted: i=1; AL+hErFejuRB3+7/RTMzu5en++NBZIvBPUQ1xuGrIqeJJafIga5HjmbeIBLC5W6h8jKd4eABvW9GullARQTg1Ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+keSIbLhx82dUQImLPLgnh9rNVCAcDwDPNFLKq3wpqQOUivzTE
	QRHhpYQ+ZIMF3Xroe2vwQwx6IqoqtkL2vTG8KasK5Wj2L5W9fwRNY/+fzRO5lLpzVykc5bm3yml
	rLhfB
X-Gm-Gg: AZFdTZc9FsJkY8ZAjkxa+nSx8PC0aJEagsEhdKJ9PgRV+XUU0xYqi+4lczU3dnz/GMT
	fYrZRzB4CWUcTqWCqesz8bQi6Ew7mym6//P2kShOogtC8X5toGLBgvWjLGI69T6x16XSDElx0zm
	kCMRWOyMTD3xRXF3KQpELZO+0vyubY5rJCWI2Lb+AJ9pyGf1OJuZ93nw9ujeunmrwywChjOfS1I
	ekmo3+lMkZcEukCnfxTwAEGfEh0UmCYPNAyhK2XQ2AK1sFpgJzUCKz6kvqQDvh1ZEf2SKKD9CEa
	4Go/oK4Ncl9Ix+FcE1j0zxvvdUGwdnIhV84MQFYujP9cnUGSmHH+UewjNm4PK7F0kJvA7qyO4X8
	PRHmsNV0mM4DgAGYWwUyDkTB++kJChrA7aPntjZxDSKsauelgUWO7/inRz7vcWvSmPy99GYnYMq
	xEVYZY93Nts9jc9MwtUWo5i7cC37R08EKsiqzz6VO1CxPf8D6pvgwEyVAePXi56/y80sms9KDV4
	YUIWbVtd39dRCsbdGz3Ck3P09sEzj/1FNJgmrwDrul9Z9KvyFIo+NiSgvA2q+FTVluKdZQZ0LEe
	rejuETfdzlImCoSXjjy3CIpTuwGGdStfGriSgDYMuHexCm6c/XBFeHkGIyB/WGIg
X-Received: by 2002:a17:90b:3f0f:b0:3b4:393:452a with SMTP id 98e67ed59e1d1-3b41c9120c3mr19229519a91.23.1795631465833;
        Wed, 25 Nov 2026 10:31:05 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4e::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm30399611a91.3.2026.11.25.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:31:05 -0800 (PST)
Date: Wed, 25 Nov 2026 10:31:04 -0800
From: Joe Damato <joe@dama.to>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, mbloch@nvidia.com
Subject: Re: [PATCH net-next v3 0/5] net/mlx4: TX helpers and deferred
 doorbell fix
Message-ID: <awcpaDKczx96P/oB@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, netdev-bot+sinfo@kernel.org,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, mbloch@nvidia.com
References: <20261125180021.1804204-1-joe@dama.to>
 <179562982857.3294.6026464051217294907@kernel.org>
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
In-Reply-To: <179562982857.3294.6026464051217294907@kernel.org>

On Wed, Nov 25, 2026 at 06:03:48PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I mentioned it in the cover letter, but I've been testing this code with SW
USO changes on top of it on an mlx4 device, specifically a connectX 3 device.
