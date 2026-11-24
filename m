Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510349;
	b=zrqZ9WrXTJxy4VPuVasV0r2+ts9lC4loQOPK9PVTWWoFfhWIHCa88yDXLIBmXVJvuNO0
	 r76rREiOJ1SThiLhHE2dXvrri+qb1AuSCSgI6h3bAWlzwyeH9mbIBa07D0zeaQ9YI4WFU
	 ua/cs+aG5JK2iIzqBDLWnjfZAE2LUcbwcNVMMdrZ+LT77yuyr+PnAOfUtzgiqUj/9pEp+
	 enUYpX64FMiM0mmKf2slkQlYkTrEwM1+FQ75iW3rojS+C8gtXfZv9yih5XPeYlb3ZvWdd
	 uUh9irMcF4JX9TzCL9uQRlM4qL8lWho4DEX8dczZx9spsqbxG7OGl0v2lOL2oBBWHEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=R4vZ6P/pxgMeaZu3yTIBPWC7zlioL2LZflk1ZvJYOpA=;
	b=t9ItM3w3oMDfHkzNy1ureg04hvNGxvf2krAwprWMvpLEaXmQ4Spi4gzhxo7cVIAG7fP4
	 +wOFVHHQahtR8P1OHdxkH9xyU4R8iBoTjp2VXbHL8Sqz2LuC4NVbl5uXPLJ351ZiwSpsf
	 hZEtpqSR1TovBKNeEQiwvaZCLBpOK5rTnv5BfoVS7zrSFbMwO+5rDKxHxOpmUYTcvB/5m
	 BREjwmguPBjUZ+b55Mo3Ex4iLgCfCYvpXIEHK4tXacd8EDKQ2M/Va0XL85Ozhk2AidHCW
	 mfZaR98ujRLXB1YUk9UbPlB4TC9ZcR05jZjhWyYteiKoZxRV0g0/B2onaKXfoCAZWFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="V/IsWWW1";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214A606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4214A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V/IsWWW1
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a32576da88so2418132f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795510348; x=1796115148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R4vZ6P/pxgMeaZu3yTIBPWC7zlioL2LZflk1ZvJYOpA=;
        b=V/IsWWW1UpSzX7z9pJcpdtlcnCRVcc6BhobP+A46XoiRD/Cl+QlRC0+Oc7sjPFpwst
         nxC1rOBfbzgZ+wtpIYDGn2m9VDvVGvi/GnK38w/wbN2JTUv6MSoHmzXx7hKhPbUu2csT
         OR6CeVj28t/1TIAzjM2NPTxfM/EC+A/P8l1oqt2KjajKI2okVRa3yZLwgu8b798kA/rk
         nhFczyZHhlKB8WkaCSTmtDJMJwjLj1yat+dy8ybTUdfEpsZZwhv0n57q73REaytuwH8d
         MCgr6GHVHR/wqzs/jcmJ7a+W2GV0GtVOcoHkzkes/XRCVbJ+dij9KJ5lFg+QHqz9W3e3
         AtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510348; x=1796115148;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4vZ6P/pxgMeaZu3yTIBPWC7zlioL2LZflk1ZvJYOpA=;
        b=C5bT05/EfJIwm1PEkg2dXAgh5UZ4QP/HBu/zqaDcwuPipFlf9VflOmxUrb5Pgj5CLX
         qNhMKFzezRbxegWFZaaTv04HKi/HF/Y39chmvjMvXWSl9hbeegTxRwaSE/CNS/gLx4Py
         lbGeZb/6xmTN/ALira96QYVkOu6XeWELRI9JafPvwyZpsenqHSmyzjjuB12SJ/Jm8knx
         R6ukSv6zztvWcsEZsSWdqvd/ftbYz7rYKVVZ36e/97zL0IV43xVIgsx+H3Ol5yGd050y
         73ESxwYbLNWozKVt+v4KPNz8zDENttVoVNh6uWf/B9ygojCxxJzRhGeOBGmjdCQNV0W5
         V3Hw==
X-Forwarded-Encrypted: i=1; AL+hErFbCInA1uBcdwJ5JisQqvHI554o/cU0zHza2sQHpGki9aUqVNi0tk1zQLZgQXvDDY0yOMDTL3QkATJmjdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k62hHrx5z5/sP23V/JKxW/FYlgRXwFS8kEABSMyyzGdYC68ZG
	iG67Xw8w/2eE0jHpyjkpynqes28aGHknuelaD+oyHnIX2zMnOmPEbWQUZUtpjiBZXac=
X-Gm-Gg: AZFdTZcHNzAzzAfUrhQ57Eu3wYduu/sgKD2UiNR7Zy3wLrPdLsach0X8ves5ZTpjohY
	E9bHYKF22aHNP1mSaKwa0zdc5rjkZYKP7kKhStPomR4AhuUR24a35idPo/WJjgRyOKiP5DAkh/O
	aL4I9RqS7WlHsf0rdIr4RT49M4UaFe2tE3nEoyxq5kGomblN7isiBN1iO6AFS4RLvU2MgdxnuMh
	d7f+qiW1iFa2yjgMU4pIiSfhF3VZyfjp0AvW+za8oCZ1dWNOJ+j1DE7bDZ8GpyWZexOsqEh7rhx
	xtCPROw/QQE1dUesIHEmNdnOKsraUSsTgC0xpbTq78mpXLTQpZrpWLYOpcXCNvfGiBTE+ffboWp
	Zvv3302qao9zO64Zw0TbUnnydAClcsH4H1be+x00DxcMfVWcxt27TeDfr/4LwanuW64Xmiw5NLL
	yPRNes2peblIT7u3CvHuyOWrbaBcXQo+9D0/tki6DOG5zqZ8WQCNXie4PtdPO/kivbrRZzad8Ef
	73cS4vsAOPZtp0JnfT8Ub3xtJKvz1wlMHlmFfJrG+AcS8Wjk9mfV7b2sl8nuG5cNmZct90zoDnV
	1w3fdnEHuwOBb9zITSi9kywL1LIzGJG4NzLer17En3nlOH+ogsgNVusj/m2pXqpD
X-Received: by 2002:a05:6000:26c1:b0:4b3:b495:d5ad with SMTP id ffacd0b85a97d-4b3b495d6efmr9273447f8f.23.1795510347681;
        Tue, 24 Nov 2026 00:52:27 -0800 (PST)
Received: from localhost (109-81-82-199.rct.o2.cz. [109.81.82.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm26747447f8f.50.2026.11.24.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:52:27 -0800 (PST)
Date: Tue, 24 Nov 2026 09:52:26 +0100
From: Michal Hocko <mhocko@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memcg: warn when memory cgroup IDs run out
Message-ID: <awVQShRRwF1IfEws@tiehlicka>
References: <20261124020800.2313930-1-shakeel.butt@linux.dev>
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
In-Reply-To: <20261124020800.2313930-1-shakeel.butt@linux.dev>

On Mon 23-11-26 18:08:00, Shakeel Butt wrote:
> Every memory cgroup gets a 16-bit private ID, so a host can have at most
> 65,535 of them at a time, counting dead ones. A dead memcg keeps its ID
> as long as any swap slot still records it. On Meta hosts that create
> many short-lived cgroups, dead cgroups held this way filled the whole ID
> space. After that, every mkdir of a cgroup with the memory controller
> failed with -EBUSY: systemd could not start units, and container setup
> failed.
> 
> This was hard to see:
> 
> - Nothing is logged when the ID allocation fails. The only sign is
>   -EBUSY from mkdir.
> - Since commit 8290f45995f5 ("memcg: move memcg private ID refcount to
>   objcg"), a dead memcg is freed even while swap still holds its ID. So
>   nr_dying_subsys_memory in cgroup.stat can be 0 while the IDs run out.
> 
> Print a rate limited warning when the ID allocation fails because all
> IDs are in use.

Not that I am against but isn't the issue clear by observing EBUSY from
mkdir?

-- 
Michal Hocko
SUSE Labs
