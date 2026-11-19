Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103654;
	b=qwYeMh3jLGExpgHsiFhmCbfx65EGEVIwbFOQB77KNzMO4LzwUW2h8VfAIhdU4Zz9SC7i
	 8Pq3w31PBZmf9AxbQT4pOWOe4GBuxjfQVpVt0HOxTy3lKKkFu8u/yX43AD5+MgU8R8zmg
	 x2iBjl6DaoLplG+7YYV6c5JDg6xa3TcAcJpX5o5Ar3dCB/YK4ql1c8BDkWXN/SS2Ytlg4
	 ZuY3vuPnAfYU1C7trsn45PYl7jZF9FT26oB+PlD8BL29YBkIxoVz/d8SaFuXuK/yOzwH0
	 MxuuterVrXnLTZP4UiKM9pk9VOk/Su1nwd3U1oTN7dYPFta6EfaS/yA04uqaa/ltR2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=ZawY5Vp5pcmWaRt7k/I5GMdXlKlkbCgLu6fGYeE6CNw=;
	b=f++z4dH06SddbZmNHQxYf3OfPX18wznvaemHs12sBjn5q/w3hZEBHZs2UGp/TyAHxrBo
	 r1wJ+iE+hiUs/HvHPo0J1DJ03LRbwaa18SH/RpClrQo49oyYYYB8mzp69H3QbGiSYpdHV
	 mgQbjGFj1draiIa178ELaGLFIDIcM1YUHkjQTm89KYzKLpzsWiQsD41yOsbpmHj8+JlQF
	 a2Qj9vIprwdxOa7RZDOQQX4ZfZYUVVnyZhMx2rkgXIcB2FLsjaA3vbBr47hXRkoeqyKHh
	 TNzK1NN6KxV55jOgyIBqi3Thi2nZvvxMj+iCSYS7BdkVQeyJUa+L0mXFCPvDCZvEcUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Fn6uf0WG;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B96606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B96606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Fn6uf0WG
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7fc8265aso25873866d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795103653; x=1795708453; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZawY5Vp5pcmWaRt7k/I5GMdXlKlkbCgLu6fGYeE6CNw=;
        b=Fn6uf0WGQLZwHv9Y4DrUj9SHXPHim70Jg+wXkfpg+KPKucfnhJ6CaepO240AkOIxYJ
         qM90tEA4QP7zpxFSe5YJtVt5u3pYx4qvoxBa/NBnmWLlvYm8tWOY5NGOImq4cH/S+Tld
         uWo7ddbOBClwavEGEjOB59ljUdYcCvirnyujd2oIiVtP4nDxW5PWPV8yJT2cdlHfhAEX
         Eq9RILr0RdDmTsfuwD+83NDVAosRfq+olrmMF029Aey14C9Q3GvHg0nkjOKE58QZ0bfL
         JxmqCOmHNrj6P9xIJIp+x52yPJLNQ/nH83WYt8LRmdKin70kzjZaWz3fQ3uO7/m9fW7y
         /dmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103653; x=1795708453;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZawY5Vp5pcmWaRt7k/I5GMdXlKlkbCgLu6fGYeE6CNw=;
        b=CD4J65IFwb8eF+oIlUMV6RptO8oFaKwJH6vxVarv1UFyJTzxDkSn5uSbYeXrMLOE+I
         7QahwH57pGEZ/ZnTAT6hs/oBmdSp+viySHxZf0vMNQl66JZI7u8DLxVz2ed2rEoLF4y+
         4ar6AQfhQGCwGkXyldWbmS5WHnUOrLFR74N5dBgeOLUtjEnhjhhOqypAaBIdHy53gt3H
         6dBLhjgN5dZTUJZsavWDvzQ74oBtfv5ipwo9/pKv/OEOt/SZjx17M3fxPJnombKBL2+/
         WDdKxdpPrxlRhu4TTDF7QaJFV0qKfuLgBUAGzTCxwqYIqCAch4koMT/Vl6r5qf8ntnnW
         WBAg==
X-Forwarded-Encrypted: i=1; AL+hErEtEMdNCzNarzd+r7DLdfUBP07cBBU4yzey/ybhnrbZjIslLPAgxzUzV3wcUwdEqa8EC7/9XK9TzYCe62k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZlldHPUpTJ/GHe/pQJsa9OdcU29WoJpFxBEaG+CV50EKoz6+R
	k7RLW2fLS4mweLmBU0ByaYCRHZCSz/STSbttVTtDgZC+mkfeNBlp+A+PER5uxUqK8UE=
X-Gm-Gg: AYBFou0it/L08TpYS6HB7BfjUJgl+3t67J6EMmaxlPJs7PG5fkfN5CZ1iApdIxwgKag
	CM2rjJqPZ01LlVI8R5f04iXOR7BRcsYzoihPWgFiq71HzIXVnxGFmyM1FhTHvInw/fe9LtCTlS9
	kf8f0c7HAvRt7QtHnAIW11jYXsdIw2BkFfgRa94i5uls9T9b+NbI+tOIEPSJw8KLhy4EK4266Uj
	Ra8gN2bNsoJrwi5C/6AWOAcgKCRX20SfW0Tc1O+iN8AlEGOG6SjQDelBiR6bh95Tndl+XVVlrqd
	LNBjrIZoDiwloDp3leFkvIYdSt0Y/sH/iU+uFV/LpbaC3kpemFBOU/ffpDwoUM2y1cvOTIY8HXH
	MBEdt/Wty9X2ZaWWmkwUphXs47OWm9VcGldLDID4G8Cj2r2yrkKGF/avMpwJf+sxNmDwSA+M06v
	j0ZwuVFlra90gs4HMNX5TDwdeZDZib1h250DnAucHFsAsoVSpOyQx1x3J6z5AxKP91slqpiFbCg
	PZEWTKoDIgCAHQhQrjPHfoKAhYt09Am9GsKNQ0LvFoIpGVF/0fdBI6pSIAFXAHoS2FbPIbNK+2a
	w2DVNIEEO76zSfqY7d8VyeSkcoXKz6XGrWfGdVEMR/C/uTAr8rcR1Aiu71oAEGfrH9DhQzFwmza
	IMakAdZc=
X-Received: by 2002:a05:620a:7019:b0:949:6fb1:b422 with SMTP id af79cd13be357-94999722082mr1095088085a.16.1795103652690;
        Thu, 19 Nov 2026 07:54:12 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949b9a3fd50sm19992585a.19.2026.11.19.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:54:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] pipe: Prefer mempolicy node for metadata allocations
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Andrea Righi <arighi@nvidia.com>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Quan Liu <qualiu@nvidia.com>, 
 Lee Trager <ltrager@nvidia.com>, Seth Forshee <sforshee@nvidia.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Gregory Price <gourry@gourry.net>, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <avQP1aXhe7nQuzt9@gpd4>
References: <20261110065219.894219-1-arighi@nvidia.com>
 <hbkxlhc5y2jkvuov5o2kjgpisx2pavuo3ad4c4ydixeic7vaq6@mpzzfmhjvtof>
 <avQP1aXhe7nQuzt9@gpd4>
Date: Thu, 19 Nov 2026 10:54:11 -0500
Message-Id: <179510365141.412063.5548407366346393690.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-11 07:48 +0100, Andrea Righi wrote:
> 
> Vlastimil, Gregory, do you think this SLUB locality and mempolicy
> aspects makes sense here? In particular, does preferring the policy node
> for slab-sized pipe metadata, while retaining the policy-aware path for
> larger arrays, look reasonable?
> 

Funny enough I was leaning toward task mempolicy being ignored for
non-__GFP_ACCOUNT allocations but SLAB_ACCOUNT makes this a bit
complicated.  This would be another scenario I have to consider.

(related but not directly problematic with the change here)
https://lore.kernel.org/all/20260701222112.2820098-1-gourry@gourry.net/

As a rule I generally think depending on userland mempolicy
to direct kernel memory placement is fragile and unreliable,
but your results are interesting.

General notes - I dislike direct current->mempolicy access in
random places in MM, and dislike any MPOL mode checking outside
mempolicy.c - but sometimes it's necessary.

I'm not against slab having better numa awareness, it makes sense
you'd want to prefer the metadata to live close as well.

Give me a bit more time to wrap my head around this, sorry for the
delayed reply, things have been a bit chaotic this past month.

-- 
~Gregory

