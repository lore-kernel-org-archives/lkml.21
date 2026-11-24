Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510961;
	b=zGT/hseFp8BqQ0LW4ZT6SwVCYLiNi8wpsujJXQ090pfvR0Y/RtLq2d+5ObH8lw4+Or1l
	 kwHCTKjcpLhICNbeL/L2bxWFs3OV2lHk9AUwWBuVH7BMQHml4YS+uwaWyBBFzSBZz1qJO
	 r4c0SLWJF5x2DS0r9ihvJqfb+SKB25faEmlrA2mlGdzYNE+LGHinoXhdjGQNW2y5jCHey
	 ud7AS2fFic0ny2Q4sLRFg/qcHiNkyxStp278cKeCK7Juwf/aY/jPpBoTCjF432q4qGwo/
	 PPFS0iNWto+vNKaqzF/fnAA0dae2DwU2U5zHmYbcpTQZoITMxDlBV/gnBC/Q2NEq/6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=f3rJv8YrmzEdADJbDlr8p5ker/HZcgTcdaAmPaPw5V4=;
	b=RO411i4x7g4lIlopEHJZbeBpcNMq28usDDM4P+kZ222rpodHsdusI8rL0EKVUkx1SXNq
	 S6QCu/p67KiSMrP/+50CKVQif7n1VZIWVZd4Z+RamtEo+ITI/tpXtEiNA7YP0X6IWs/yb
	 4KSe2WbZ2pvmrOwXRy+4qFFY8r/ngDjSY4IImIhYAGQswBQtEucShKE1W9tP0M+QSOAak
	 yYyaWLpnMthC/6Yi8U/YjktyfF9xwuHEkTCpIPPBRcQittQxKJoADvhN3lbmIyQftT6QO
	 w+js8ngXBCFoJcNlUE9ivrtv/0dM9sXClCYRMJ3kzikd6N2erobKGO+jaeRsyZZVlHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WFJuKjiP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81542606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81542606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WFJuKjiP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so3559287f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795510959; x=1796115759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f3rJv8YrmzEdADJbDlr8p5ker/HZcgTcdaAmPaPw5V4=;
        b=WFJuKjiPPTJLRL6xA9N6lY6hH1meTzrIl/OigvIKepYtiB01JB+aMQ81VP7vJDfJ8G
         cL3MBSh7Vju7iS82p+0+qV6NL6y6olYF73IuiRJIT04sl+R/GGwnXY4axFWvQiU/CfCg
         kioc8wGgGcVnCPSh2e3C/vtN8O/qPTHutptLQcyh8Xl6utlIm8SH4xykGIEzZA3AcbqH
         xsuzBfFjC5vD6L/GvB+zWV4lTPkTHY/6GrxMWag4wdZ2zJwVrTTw/w+pDrgf+0EA2cb1
         IzA7+yGoukChqRrUpl+Iwp7J4oveB4q+PimwdAv9KzO1y+/q86u3q4e0DH0d0cVntiso
         om5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510959; x=1796115759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3rJv8YrmzEdADJbDlr8p5ker/HZcgTcdaAmPaPw5V4=;
        b=F5hqdX1B+DPHedQUc7P80qcalHp0Lgp1CKv05IrCsRsJWnBRkyVZyUUVeCYvZp8zsn
         xbvNLAhJPvdDLiJtcu5XVEL8uHxkI+WrvsdZ89iegqvjqO9jQJCtoM3gxkZVeekrpj2H
         n5CI5JQGbdYbItN42PfCsy9g/O0JpjQNCDOofx2oB2AOqKCw7W7//A4U0GcT41Y7oNn6
         GrzyH+5dhjVRBy3QofpJXrKKB9Wc6HEvQbseMkf5PffyTZUmv2cr0vgkVKa/fZ4QCbUz
         /gH8kibYgLLO0g1UHg90Z70s819VEksluIdPZo69JmbjZM9bKdZ+9biz+uqwOIEs/lVT
         r5Vw==
X-Forwarded-Encrypted: i=1; AL+hErEDnEposC0iXgV0IUuC9jG86X573KGi+fUBPL//IdxjtMBUi8yzE1y1fqBykpILJnxgF6uBJMnYHsy/PWM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NXAL+SLwEHcvOBKQI/TSECdc/G4M7l4TyAaGbuyKu7dRBsiYx
	WmKQH5PhZReJ3iANNgzWa2pYLpC9a6j+l+FSAPqEfnf5UdWMa5MC9WXWeolc7MKxMNb1S9xPWdw
	+RtlXckU=
X-Gm-Gg: AZFdTZc1nYtpiDlu7bj81VuAGT2n7ZzIkOKU0+l7oqvG8646rspJa4i0U+WbPzyiDJv
	QOmbX+PZOgVRfrcJJw2Q5Ys9wfymPgMTXZRkRJGfnAxUSKinZHyuwnoWdIztHSfSuYYZ1QRdUg6
	H2fPr0jcOoad/gxD4wDBpQnYwk4qkS3YwzulIqKVvxsk2v0tJ4n1Y3PoEL8T64FNmYqxvWeRXEk
	2ntcD8WN81WshNua019+prTzI2XZW7cUsqBH3PPuUxTNOeHExon6hqiLnZUJXoXYH6nwNwPJDMH
	6Rn7/hK5Bf1dxxGERNQkROUQch+aHLe0haa5IYiSL2yRgUx2wm+XqIJLqAp6jm7zFqJuMKu+qXk
	89RkTYlCKgXSE9aWVK4SMk968xuz1fyBX08LSWv9vWm3PmJPGK0MMJpf/hkSO4oYKzxibiFP9O3
	YJy9ne9IBD5214FeqS4kIwZA81lZFyqMxkJ2U/+l/zw4LM0PIZOA9aZbLhLKgV5DJx1DpldRQcg
	NHF1JWYHzMi/6E1jfOESiLD6LRd1OhtWDJYFKQOuk+ufQway9EOogFztBvl3M86eM1cLyDU3c5g
	93o9PE6rHKw09hCwjbDqpEHx+iTKA/DN/MfeJ9ApYX0=
X-Received: by 2002:a05:6000:26ca:b0:4a6:4687:2ce9 with SMTP id ffacd0b85a97d-4abad5ac73dmr26444918f8f.4.1795510958871;
        Tue, 24 Nov 2026 01:02:38 -0800 (PST)
Received: from localhost (109-81-82-199.rct.o2.cz. [109.81.82.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm21973988f8f.35.2026.11.24.01.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:02:38 -0800 (PST)
Date: Tue, 24 Nov 2026 10:02:37 +0100
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] memcg: free the private ID of a memcg that never comes
 online
Message-ID: <awVSrbJn00wmh1nn@tiehlicka>
References: <20261124000439.967403-1-shakeel.butt@linux.dev>
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
In-Reply-To: <20261124000439.967403-1-shakeel.butt@linux.dev>

On Mon 23-11-26 16:04:39, Shakeel Butt wrote:
> mem_cgroup_alloc() reserves the private ID of a memcg when its css is
> allocated. The ID is erased when the last reference to it is put, and
> that reference is first taken in mem_cgroup_css_online(). The failure
> paths of mem_cgroup_alloc() and mem_cgroup_css_online() erase the ID
> themselves.
> 
> But css_create() can also fail after css_alloc() and before
> online_css(): in percpu_ref_init(), cgroup_idr_alloc() or
> css_rstat_init(). The memcg is then freed through mem_cgroup_css_free()
> without ever coming online, and nothing erases its ID. The reserved
> entry stays in mem_cgroup_private_ids for good, and each such failure
> takes one of the 65,535 IDs away. With failslab failing radix tree node
> allocations during mkdir, 1,500 mkdirs leaked 6 IDs this way.

Considering these error paths they should be pretty impossible in
practice (and without fault injection), right?

> Erase the ID in mem_cgroup_css_free() if the memcg never came online,
> which is when (memcg->css.flags & CSS_RELEASED) will be false: it is
> only set when an fully onlined memcg is released.
> 
> Fixes: 73f576c04b94 ("mm: memcontrol: fix cgroup creation failure after many small jobs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> ---
>  include/linux/cgroup.h | 5 +++++
>  mm/memcontrol.c        | 7 +++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
> index 2afb4cb2bb4f..123c713dcc91 100644
> --- a/include/linux/cgroup.h
> +++ b/include/linux/cgroup.h
> @@ -449,6 +449,11 @@ static inline bool css_is_online(struct cgroup_subsys_state *css)
>  	return css->flags & CSS_ONLINE;
>  }
>  
> +static inline bool css_is_released(struct cgroup_subsys_state *css)
> +{
> +	return css->flags & CSS_RELEASED;
> +}
> +
>  static inline bool css_is_self(struct cgroup_subsys_state *css)
>  {
>  	if (css == &css->cgroup->self) {
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 091401cecf39..e7dfc96fd1b9 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4545,6 +4545,13 @@ static void mem_cgroup_css_free(struct cgroup_subsys_state *css)
>  	irq_work_sync(&memcg->high_irq_work);
>  	cancel_work_sync(&memcg->high_work);
>  	free_shrinker_info(memcg);
> +
> +	/*
> +	 * The css_create() error path bypasses normal CSS release, leaving
> +	 * CSS_RELEASED clear. Drop any private ID that is still reserved.
> +	 */
> +	if (!css_is_released(css))
> +		mem_cgroup_private_id_remove(memcg);
>  	mem_cgroup_free(memcg);
>  }
>  
> -- 
> 2.53.1-Meta
> 

-- 
Michal Hocko
SUSE Labs
