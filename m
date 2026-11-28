Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795827440;
	b=WoAlxgenseMKZjkrKGZGTFPRH2GrwkqDUTkjmtkkmBMsIX683wif8IglV88O0hC7zb90
	 YDbNNEwHhY/UtzORPHNmTOC2tIDuv2tmQr+laahcPKEbWGYMdrmuH59wYKhY/ELQmuVn6
	 yvZCw5gOYTNaGOY7DwR0zupbnYq0vJUKwUu2KOCgtYaxgmZbCTqqEGiF8sFxLN5g+ucSC
	 yDz3Fkw+v7hLvMd6eKshZCHhPIbDX17RzXlvbIdRX/RnC+2T/cqQHtZ4HWvIkIPl4ROLs
	 Gczp1w73zY3XvPfOdOIjwtz60eZFnu9soKO2fCsOzJF23P2uY0rh3JoJpH2CLPzOLrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795827440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=OkwyOiCRAz5EAkzPE2HGFHWSVBJwZ9Gjp6yJVpEfm8Q=;
	b=Vfjg42bH9PbykZ3NTMFBMM7rotlJVTe2gkj1w3BBsJv/frPETjJEEi+nTh4blFc+y+0g
	 ACojhjiQnzms74vlpO8O7PgAxdcgi4nl8CIVIcukRh/P5sF2ldaEy51ddoKaZCgTahEMP
	 GvVg5w9DFzpMOrfy/oJqrKBmxeDeJfHEgG5iQd7EbxmvOndasfNK691tY613SN4oRYzES
	 okDd+Wqyb5d4Exg7PLzLU5wryoOkr1HSgn1z6L321g34aOEGugrK2CIA2nCtdWHlMY0Tx
	 zG0echEX5ZmgGkrheyYmKLU8jVAsrD8STpk8PtWLEYtCfOUorD3TwZAel1lpdnhmlAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=C2yVn601;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=C2yVn601
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3402105b9so61260087b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795827439; x=1796432239; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OkwyOiCRAz5EAkzPE2HGFHWSVBJwZ9Gjp6yJVpEfm8Q=;
        b=C2yVn6010RByzLoQdU0F2bY5TVCz2FI4O4hBokJJ5jDBRg5aY+GcCWso+QRAq5qvZ6
         rpAdyPUuEhtLk9JRl5H0jYje6dtOOVfrDgAxQLMybP9vO3ikaYNsAUIhUliub6kfm2pi
         go+MWzhHEoNKc/8q9BTKhY+BSFOr47O+aKKas=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795827439; x=1796432239;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkwyOiCRAz5EAkzPE2HGFHWSVBJwZ9Gjp6yJVpEfm8Q=;
        b=s14nBo6lnY7IphHAsQk+qYseEDt0qv7poGfUsF5VmV1o3Hi61NZKW38PjtVlitkRLF
         8WnybfvXqXqSXg4I2PGGNUB1dTIMbovKoqJwIGkAmafb1mb3RPD08vN5NJfE5dV3reBd
         FTWmQPzClclXXQESW5gAsGSHN+xC2adVkh+bwHQS+q8rNhgSacZgMoK5HyISsSqtWx8f
         lUu0zCT7tZMjwfFyjXMnEdJl90Bk6sub1lFGBctJb6sj1+ahuSCvX5432xjL0JJFXe17
         Nw1sSl6rGE1eg7Lurn04e6xmu3GXwchw7wD6D+4VimrL+QfWmeIrPEXTjyEq4k5s2Yts
         08Ig==
X-Forwarded-Encrypted: i=1; AL+hErGhNaBPntCW9Ae5xKL8gqmqf1/ASnTRkBZI8DQaj8Y1T3PTM+7gqTu9Zi95PK6JfVx65IeWtSk1OVCuOiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZoWxO0E4SBP/wUtsKm7XjBgr5CKuA4FCIKGC/U6OBIhODhTia
	/QdKHPJEU7zJ+fd57jizB9jYSaKhrLAATO7JQeIoNOTIbtvlhQ/M8NmYHrVBzfFV+xU=
X-Gm-Gg: AZFdTZfrPBvoSifDL2AdmxeWVpNUttHCAGATJ9tfzHORttSxKOB/NABYv8/mzIjqwX4
	TgnnR/U9v2G9MIn4/qTVp3nUAQSS6amCIyx+UGp+t+Jn707BmqE+tzC7OvF9LySqVWUiVUqmDsg
	dsRMghNaxm4tan7IzmcdhPMoGkZOhTk6DLa7WwFdmWD+fTBC7I+IdjKyEXILCDH3F9Dg0Ze0GOk
	qP0989j3a8LJq4bPb1Ko1wtAKA+5SoDQDe2ocC8JarmZ79M7j8VAq6fjqplpLyemXHZFAp+Rztm
	S7DLYg7kHD6hEw5ikg46a7BRdk7mJUZPJmgyv6A1K9Rzw5MDkOYIYx6VKVi//R5+VUE1JW0MZ4l
	A1cdtktpXYc/N4vvqSQYTCOu2m2zaYDdzYbKEj4Ph6efZWb+hiWFIbXEB5ZUb6MyUP1WveXQFEe
	wM4cDyf0rZY6nZhDP1g8ipW+8GTLMMeKd0pu980rURvwLW2qVcPZCgyy1JnElImQLHolYWijUkS
	MBPGdgZ22xQGFadHhWJauwAxxj9GQTFFfqx5vZbLjeYDq+EiPy/P4uhz5dBuJtxMsfANJ8KryB5
	Uj77CI3angbDmejSsuWGN2o3/4SjPauQ7GLjlf2wgJ8upHMbBeIVIMvGHp86QBDMyNnx8J8Z8dG
	SQEtM9DGAlG28aHTYTTNAHYBEVxEdDei8/HPLiXJu/lAPaDDLdOiL/GWyxTp8SG0ChgwryUks4+
	hEpknTDYdNpa1DIeRd0cs3RcrP+09hrc02PiZnPg0XepALEK3vNyg1A3d7z+uO5//Ai6fWh4QPG
	LP9p5gXUJIWfkk/nOObKRo=
X-Received: by 2002:a05:690c:9b11:b0:8b0:f116:1200 with SMTP id 00721157ae682-8b5204efae0mr102371357b3.85.1795827439428;
        Fri, 27 Nov 2026 16:57:19 -0800 (PST)
Received: from [172.20.0.2] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028bfa2sm100757467b3.14.2026.11.27.16.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 16:57:18 -0800 (PST)
Date: Fri, 27 Nov 2026 16:57:16 -0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Greg Thelen <gthelen@google.com>,
	Greg KH <greg@kroah.com>, Ming Lei <tom.leiming@gmail.com>,
	linux-mm@kvack.org, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mm/vmscan: Fix legacy memcg reclaim deadlock
	against filesystem freeze
In-Reply-To: <20261126180228.9b672a945d480e3d3f301985@linux-foundation.org>
References: <17d0d1395c0237d201a1abb2473d51f5@kernel.org>
	<f188775aea9580f9ab2b477788503434@kernel.org>
	<20261126180228.9b672a945d480e3d3f301985@linux-foundation.org>
Message-ID: <awom7B9Evkdhq1EY@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Andrew,

Andrew Morton writes:
>Can people please take a look and suggest whether it should be a
>standalone patch, or just fold it into this patch, "mm/vmscan: Fix
>legacy memcg reclaim deadlock against filesystem freeze"?

Yes, I think we should fold it in so that stable doesn't get the fix
without the scoping. With the other patch on top, the reproducer I used
for Tejun's patch doesn't deadlock either.

>(That's mem_cgroup's fifth bool - maybe scrunch them all into an
>atomic_t and do atomic bitops on it?)

Hmm, oom_group and zswap_writeback are in the read-mostly group on
purpose. I also think packing them into one word with runtime-written
flags like this one is likely to result in cache line thrashing, though
I haven't tested that. It wouldn't save space either, at least in the
x86_64 config I built (given each bool sits in what would otherwise be
padding).

>(I am told that moving wb_wait_skip to just after oom_group would avoid
>increasing sizeof(mem_cgroup), but that puts wb_wait_skip into the
>read-mostly section. wdyt?)

On x86_64 it doesn't increase the size from the previous situation I don't
think, since peaks_lock is followed by a 4 byte hole, and then wb_wait_skip
just dutifully slots into it. In that config, pahole gives 2240 bytes for
struct mem_cgroup both with and without the other patch. So I'd keep it in
memcg_cold, since the read-mostly group is for fields that are set when the
memcg is created and only read after that.

It does need an entry in memcg_struct_check(), though. Every other field
in the groups is asserted there, and without one nothing checks that
wb_wait_skip stays in memcg_cold:

    CACHELINE_ASSERT_GROUP_MEMBER(struct mem_cgroup, memcg_cold,
                                  wb_wait_skip);

With that added:

Reviewed-by: Chris Down <chris@chrisdown.name>

Chris
