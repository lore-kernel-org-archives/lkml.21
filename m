Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442155;
	b=Da+l5IqQVEiJzWbWQwiaK7sYTHGqAfSl+Z/Wy28Bqrsh53O0+MPjMAKHH7xEk/Bja+og
	 NS92LO0scZv5Sw6uZlxzc42dh1QMNpMuD64wWwP0fYDukeEAbXBN5j69V5YfBdGHNRTYb
	 akZdWcgW5hAzXTcRvkC8SmT6WmheaV7FE2dLovNU1xwEzvKWMR+qh26zrOukhmoiost2i
	 VPxgGIycy3m68/zU/09NIlyG3q8RF/NA+rRpsBfpYteTKi3GrKIK8QQAElwYtIfX6Xh1V
	 XXywZY5MrmsHTAIjx2m1Imu8S4H6cRL7xOBiWtlHIuYbzRrD8ikSexMGXySXapkPAAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aDhEOsQ4kFs3m5ViT1erT7rUy2o/jOwOkZo0YQ+jEws=;
	b=P+qpGU9J2Mi7ht6pWOb7WZV/f/ogSnFCZCv6iTX3ZCm0Mz51SX7oeGndt4huoe043ndd
	 BREgpmF2WBResKpok4WOO3pDtY5EN7bxgohiERVf2NE7ZUvIjDZ4tLLl45CuiJl4F+KqH
	 D1FOmj9BiOgy3iZqWfZgDCD/zTDC8h6aq6II+JcknKHbm9QB24LNb+RRAXa6sov8go5Wv
	 AsmD/hCGjk6BMq5geYeMw0d+d6vKfR4rRHKifVMA66Zp5T2OCsZCI4OAFsksHv2iQxlK5
	 g7ZP+WrjboqfUW9GiVYbUWX3XVG2eCZL5MMIfk/Wk6WY+Z+UCiGlGgDqsL+RdR5A2bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dZwPZCU2;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC943606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC943606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dZwPZCU2
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so42507075e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795442153; x=1796046953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDhEOsQ4kFs3m5ViT1erT7rUy2o/jOwOkZo0YQ+jEws=;
        b=dZwPZCU2fIX/5W8G0vxwLoj9r4o8hFMFAmyocqsj0NUur9jREy9acRsb21OdUyb5cR
         Cz2dR/yYzXaGwJl7NnMrPhj6ubFJYlqfkqedlSSWCnnEND1/Xbm2+KhYrVLPuZdNbItO
         pgJP+ttJd0Jx3NMBY+vYBoRAoF46IAil9QcxX+Vd7qR6maf/gjVHuF+1/U23OVeDXSJ0
         vfGajDLsiKfUy2J5dr30sMUv35g6+n7XSvJbk2xkSD/IivAzAzURG8UU59KJu36P+nQA
         otQ5iUZVKaImYHRntjTekGMjH0EDyCnz0Bk2kQmAiwZvEg2eOBXSl0BODp+IGG9F1tDP
         Hvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442153; x=1796046953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDhEOsQ4kFs3m5ViT1erT7rUy2o/jOwOkZo0YQ+jEws=;
        b=p+LQGZcqZYjSo4N2SbwVdHfOIr+U6rIuA1luqoRcr+bp/54wjid9uYd/DblmWmLqor
         XNvQPM9wdDIdzPyshFzSXmGhwWxx0SRkYvXwpwFqzf0PM60f37RSQWhQ7M/Plel4VXmF
         G3ci8e95DkmGVBLp6SFvSGdX3B7JFZSxwKNf+4XXHvTzfyEGlBKTWlF1JZUahlxMBBia
         M15JbC0opa84ovn7MKn8FmgnOyAER0qrJGfF2DJfx+ggVqNhMLfVoyrgHbiWYOSHv5oB
         RgSB7kD7StXW19yQuRERkkuaBT07V/B8HCQnic7jrmAyL1Ur7OYEYwbWEYnrNsBYGeab
         cE9A==
X-Forwarded-Encrypted: i=1; AL+hErEgXwgO2ySn3sANND9Btm1NOpgjdiPRXVtRElKa9EOOYzpIF2V0pK4zBcklVjYRrA23lkFL9emd891OQ4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R8pkHMoChqX+pTFv2+2CBLPs5s9nBdR8MnYE0cwdQ1MuDvPOT
	hlj59Dg+isuv8noNwJWRuvxAGU1eUbwc/PbIU+FFYVoMT7TnOZxekP8kOzJ1130vwlA=
X-Gm-Gg: AZFdTZeWKwaqryIVOcBHVtlCmTpJEe95bmR/CMiL92Ma3G0vy3orkzEyF6HSHlRWo+z
	0lzfRn63D5fEBUrlUh3+mSKQiLomxCu5+WewfLH8aCa88rHZGlXqZwfujMbDHDHuWaqwC0YQ//Z
	lpmCjhoqYVjc61Y/FEOzEXnCx53A1jKc7p8Ctt4UbTJNs3mK6Q03WfKXrdl6VtHre4Agv6tPhUm
	8iI7wr5aIv65pNleRLFww5F1fUUU+bEa2U0Dbv/jwjh/H7X+88Ixw/MtQuwskMdCwd4V8Jiyphx
	vVkFcLUvDfjncupFkoheWinij8Fl9vkuQIZDpHv5VqQby67JkhMBEAkZuyZNTPBeFYtAiLA4QIg
	N2t2ZEa7v6SavAGzkFDamGeWNtl/gMQF9Zsdavcfbt5lOZ9cKK9tbLaOhca1mX/u9YWNwDo88wW
	r62BRw2tTy2eY3VsN3MzDfyWZx6rXXzsMaMeviUs4ZqoXNZyNdHkuaknnrkVHp77UQMec/fhbbV
	6iWbMdVFq6mPSoMGIWhHA8WOBR+MwGk2S2WIYC5B4vvGmNDySLmf0Bh7BlCuwk2SGyaD1gK0Y+a
	uzmdSVCVjf7xC8OG1J4KMUm3JFIQGMWjHpTvhybRzV5t43YrAFY+wH9r+fb1GCyu8jOf0RR5PN8
	AE32eToc=
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr82975115e9.2.1795442153256;
        Mon, 23 Nov 2026 05:55:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e50:3860::642d:5bda? ([2a01:e0a:e50:3860::642d:5bda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm176803775e9.4.2026.11.23.05.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:55:52 -0800 (PST)
Message-ID: <5278036d-c939-4726-a591-91c7dbedd431@baylibre.com>
Date: Mon, 23 Nov 2026 14:55:51 +0100
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
Subject: Re: [PATCH] drm/imagination: drop redundant zeroing of new GEM
 objects
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
 <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <CAKbEznssOrO84z_msOZ0tYjVYkaQ8P+f8uma3PhOF6+zp32Hvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gyeyoung,

thanks for the review.

Le 22/11/2026 à 08:55, Gyeyoung Baek a écrit :
> Hi Guillaume,
>
> On Wed, Nov 11, 2026 at 6:43 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>> pvr_gem_object_create() clears every new object through a CPU mapping
>> so that userspace never sees data left by a previous owner of the
>> pages [1]. shmem already guarantees that: it clears each page it
>> allocates, and the dma_sync_sgtable_for_device() call that follows
>> makes those zeroes visible to the GPU. The second pass, write-combined
>> on non-coherent devices, only adds latency.
> I'm not very familiar with shmem, so I'd like to ask: is this zeroing
> something shmem guarantees, or just a current implementation detail?
 From what I see in the code, it is guaranteed by shmem, not just an
implementation detail. The zeroing is done in shmem_get_folio_gfp():

           if (sgp != SGP_WRITE && !folio_test_uptodate(folio)) {
                   long i, n = folio_nr_pages(folio);

                   for (i = 0; i < n; i++)
                           clear_highpage(folio_page(folio, i));
                   flush_dcache_folio(folio);
                   folio_mark_uptodate(folio);
           }

pvr objects get their pages through drm_gem_shmem_get_pages_sgt() ->
drm_gem_get_pages() -> shmem_read_folio_gfp(), which uses SGP_CACHE.
Each object is a new shmem file, so all its folios are newly allocated
and not uptodate, and they are always cleared here.

panfrost and panthor already rely on this too, they never clear new
objects. There is even a comment about it in should_map_wc() in both
drivers:

     /* We can't do uncached mappings if the device is coherent,
     * because the zeroing done by the shmem layer at page allocation
     * time happens on a cached mapping which isn't CPU-flushed ...

For pvr there is no problem with that: coherent devices always get
PVR_BO_CPU_CACHED, and on non-coherent ones the zeroes are flushed by
dma_map_sgtable() and by the dma_sync_sgtable_for_device() already done
in pvr_gem_object_create().

> Since the driver would now rely on it, could you spell out in the
> commit message where the zeroing happens and why it can be relied on?
>
i will add these detail in commit message in v2 if it look ok for you.

Regards
Guillaume

