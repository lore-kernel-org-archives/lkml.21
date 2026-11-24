Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545912;
	b=fq+PYl44gGqyn9Roi8HLgKgaao0b9PsIZVRe3JhWX35gVJH8dxgF+K1G8YC4ytxofI02
	 enOdoc+D1ZWIEMGyYgT923CRT4qKPfPiOYQ2DUfjt/mkRsJzB5gN7ax7bJGOIhprz+5vZ
	 PjsUfX3/jOs7YhRC3gxUl1CRz2WOh3Y8ROQLdpnoKF4xPngdeOJo0vqo22b4qIKSs1Np9
	 YWTU/W1NWhY2v3WpzXlA4OGYd2DbyaSA7zpwW0DLvE4P/5LRxJN8wwtVu5xv7lh13V4aP
	 2LdWcw1VbOxG5/NtatWWz4XLOw5g1O8Z/CIsgPPNSQbmgkO6xIZJjWqq3Ct1ZmGrj5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVt63sFAXFALqIi2TYrbUsERABkXRLEjuN5CXIXLcg8=;
	b=Pi5uGXeb6Az7bwQ6w9LGX/JdBeW6vRgUwCt9HZSDJfTlpcbwjA1y4/gUQBqM/ge2QrZa
	 QI77tidAQVIzLMLEBIjCordQZI3M5g9+5vAMzH7eWHOOb0EZYPakEhk3Sj/WSdK0f6+DZ
	 v6vBCVdiL3mwQsQGAQPzbtnrd3mTZsOfqj04MXQDsg5/SDJJFWp/8yCJt1p5B7gEXHvkR
	 eEv02RDJyKqkFyNeYerohIsZZDZkDMV4Jt5VzTYJhheSCa5RErPm+W9173H2D8mzjZgK9
	 mcPOiWc2LN1MtVYQWaWJtviONO4v+FNZA0i0sbkTb02mKYSoRHTIoxyA9h3i/9lpqew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EX5Ip8Vy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139E5606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139E5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EX5Ip8Vy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018493d57so193915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:45:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545910; cv=none;
        d=google.com; s=arc-20260327;
        b=LlO1vqn4rbphEVT6rOSWFjLmqzhu+PzxNLusOm1QOE84T4bctxuztNp1fpA6i+pSfO
         nnn2bCwPLPWn46Qs2tQZRPOm+AiAxPq+THVXQv6OizP6NkCisMYnO7Riq6ljJO8kOCtw
         4M58co0jXxnWhunlVvQBPoyttBfX9UmPC/X15LZI0wnlb1Hm1y0NkBtWKjAhumfhUMg4
         I7+uPtEratUIaJGUAKmwC2Kv5vZe6Fjdd4+P0CTbl7i3Fmuyhquw/CoCJrjCKWm6wiKS
         AakJe8FyOL8wwjRdEQpeaEFNW9dITHDztxtLgoUx7mgMZ0y9apoyrjTFY75OXJgrPgfn
         q/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVt63sFAXFALqIi2TYrbUsERABkXRLEjuN5CXIXLcg8=;
        fh=KxjpM/98b2zCvMVgKYaWrvzR55R969cic5X/K1qnVtI=;
        b=nO5y5pyU1rxDKcRgussH4V2cRcgwqCViXdSbPaxgkgrB/YM91cL0ADfKnP2oVoVb/E
         VNvGB+D9x1XXSXli/Y1WH4Ep8t7JDRkHYRARPtisxA/3j5KJDEi5SqdBQ3srDAuNdwCE
         vfeyksm9j95rYv7JLWizqwqFhnT/9ZoGwxMX5o+P47aRowVTYxbyP5fwq2rX85LQL6R2
         uNQcFjlEcZfJoPpKm3k6tteC9j6+3efeBf55/jUUs4jNDFM0UUva1P1ytFUJgNrL2OKN
         KP5GmnkGXHqRDch7jZW+ST2X0TgnFFL4fm3hqmOGuW9FlICjR6fg2ZCoEpT2raeL1F4H
         6n5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795545910; x=1796150710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVt63sFAXFALqIi2TYrbUsERABkXRLEjuN5CXIXLcg8=;
        b=EX5Ip8Vy8G2bSo/ueWGnhESIlAs0mrbqdtxZuoA9LwMy/GlKMShQ1UAI4/cv+GFurL
         +I0ZkpTeWfSYy6CugwTvmvx82ZOqEt2YK6jHg503nlno9cTCNMqoon8un66aypMAtIpY
         Je7VBF1+Bk1ABJ9z+SAkTdSy6ezf5Gi3LSIMWvaj6MPTyhZXFdF3jOFaaGUxSwKp8wVB
         4oBAZcisTHpzOeoHX195Wfv8XGFRIXx6fkUHieNJRuiiUhXl+Kl/RSF/R7bQar3C2amW
         PgGYsAMlXhlLSR6w4RbKQxbXRp2Nsuv0otkolUSSmje/nt4dJdwI/XYhLX2PleA6wFXk
         AKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545910; x=1796150710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVt63sFAXFALqIi2TYrbUsERABkXRLEjuN5CXIXLcg8=;
        b=RzDugjEXi2qX26Ox7MIUaLP2B6szy/NSiSxEh1LTGVtgDv60NArG/T1VZm/hsaldO9
         HVB81es3dANxekOoY8cGR9MFSjxUqMNv47rd9He7sEhe7wOXOiDzVtX1PO6fxbq5ZJwi
         Jztc8HZtkw/u9Q8Z6mT8+od8X1PRYMEy5Z0c25oZ1hRbI3+vJ50YyBqOa8MuA0kkNmYE
         Po7MDVZk4CTqgMfpbwBn6XOB7dbBLAi96WvQ+bk7I5ovWBenJMs4QavAMuJAcKYv+iC8
         RVMmy22SDeMxfMxKUMHXdvZYNCQO1atMiF9Phf6gjl3mLl4s94z28/Wa1r8flS2NraEL
         IopA==
X-Forwarded-Encrypted: i=1; AL+hErEZpDxXshH0rvuNKvO9INEuWdhO22j4AHsF4Bre1JlRY4vFTbYShlyay0TqnpnmO4MVv99brrL/bI7ESvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQi9xYE0HDpodaEBPPYaXWb3b1KYJy0PLD6XgH/Y2P/+KGJjS
	NF5vVJqK7EtwhWVm+/kxUH63n7H4BW7xD7LHS9SdOyHA/YqcYGF6jsHjVVMs8bt7gA86gpWVZOL
	0+4PzABwSJjBBHx0chjE+O9Nt6atX2qQs93H+jwT1
X-Gm-Gg: AZFdTZd/Egk8oGxYEzByd6AtKBRwCUJ7o5UBEU48ZD4AvZkwADj1aFmAUE7Qom6wlir
	dri1zgbMmOEghfQG9DVy/S3VyWAqbVjGMaHmlVZ6oFgNsjXO1ifbfrHE0Vv1DI6yHbEhDS3fuJd
	tF1fh6CeBs9CA2DbdaPiobZdgqjECjwBD2Oacwfl5ObW+2MoohzUd2rgsHM8HGZvEvP/2tWpjED
	BlUABQ2ARiJ2tftMui0GwbAaTNkR6th+ZkZfRmFdfbbUz+ESXWred+9+BsFVSeETbd2KKVpLqRf
	PLw0cl2Pm6vHKVYwNyLnoSZR/DH9YGOeFiE6Z3hAwFVl96+p2R7tLzy4T1d8VkNOzfB0VhxON4n
	2lvk7pc78aIKH+ZaC9Dq+0syUDUHdW5tSTc1tHhfRFhsg9EpYRmn5Lz5+kAe/wKzoW450puDkZA
	DGgrIkm8wEw0HK85jYtI4Ikuw=
X-Received: by 2002:a05:600c:5346:b0:4b6:7744:f4d with SMTP id
 5b1f17b1804b1-4bb916bdf08mr2257135e9.15.1795545910040; Tue, 24 Nov 2026
 10:45:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-huge-pfnmap-fault-races-v2-0-276007e73bcb@kernel.org> <20261117-huge-pfnmap-fault-races-v2-1-276007e73bcb@kernel.org>
In-Reply-To: <20261117-huge-pfnmap-fault-races-v2-1-276007e73bcb@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 10:44:58 -0800
X-Gm-Features: Aa3M54p26FbeOYUnrfBkiQh43qYkPRTQzVHFI8sjfXLSBe0jiLLjZbk3gYWYOKo
Message-ID: <CABdmKX2PQu7VvJ_Xs9NpkFo-wD8LWxO+FNqmdTEZBt0iAd=w4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: update walk_to_pmd() to explicitly return an error
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Alex Williamson <alex@shazbot.org>, 
	Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Wei Liu <wei.liu@kernel.org>, 
	Roman Kisel <romank@linux.microsoft.com>, Saurabh Sengar <ssengar@linux.microsoft.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Michael Kelley <mhklinux@outlook.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
>
> Rather than callers inferring an error from a NULL pmd return, explicitly
> return error codes.
>
> This allows different error codes to be returned for different failure
> conditions.
>
> No functional change intended.
>
> This is a prerequisite for the fix to insert_pfn() which follows, as that
> needs to be able to tell a failure to allocate a page table apart from a
> race with a huge fault, so mark it for stable alongside that fix.
>
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
