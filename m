Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795439608;
	b=EnfySPu32H3Wg4wGlygTAM9tIOVZULZcB9wdIx5aSXF5F7l6/p0Z0CJyai4TT6S97Sl7
	 JhEmM6sj8dRnDayTOI0GVjwFo+msrRxy7Z37cfzEjzySwFVLEK3RAvO8SZbEoCca8S2H0
	 K2174l13lkSOG0tljIK/syCfmPdiRxwhG4Uo8fcZ8PZv/ZIDQjw2advlv38qII2q0lWFz
	 RwzIj20cPHyfbYCUYdVb0BrV9Fxfz5ExlVvXgMC0HxKmTdLVenJcbdrb31Na1Pl3qDEYi
	 pRPq6OeskbtZ0MiqEuiLlKH6Q6YyZjRoRvrI/viu17aJevEsT8MM5SqY19PiIShcy1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tQb6g9BiZ4ZosTHX5re+WDuvLyIDAspwcbz+If1/Czw=;
	b=tiO3KfSkkOe0C2fj+hApuMGGH730BlStd4e1WcXkAG9HOBXDyans+cRdXDdp9vmOWoX5
	 a1zVIf52QqpQJwqWDAlFFPpHbKTnGUeQLKEjuI34FBaXsoiz7rZS7nM0WKK9pzFu7/Sv2
	 OgMXQYwATTnowvasv84KKd9IsFRHjusKikFFMi5n8EoIkPrFePVXOOC0mz/fo8AAnv0QX
	 urzu+qq+gm4FBWPkP0Xh3/dTGdEQqy6xLmjXh8M9r9ykvTvvdH/QsXP4dMC9pIfU8YGD8
	 Dgb9AlxzrbCnb1MGNylzgcq4mbiyi+AgfYSlyYZj1NOF4sEiATix/zmaInk0waF+VvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b="UjvV/f1P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58450606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58450606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=UjvV/f1P
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a194350so145183666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795439606; cv=none;
        d=google.com; s=arc-20260327;
        b=L+NqG9W4Gd+AjgnMZzHaT+o1mitA0AcqoURPIjcw7DO6DmUWn54jf8Ioh+ydA5T0aL
         0senKAL3mXflupJdJr2zIgc6axcxfEHwBce3TfA5jweknRE1D48hXHq34loIrS8DJUFi
         FUbGsy77Mc3l0klhSDI7DpVC28oKuIGBphpeowLOJ/ymsWhXPLjy5jVkXYYB/jIgdwFV
         lIr5t9sq2tmWAQENWXDQOsmBssDSI1gS7DlgW7qCSKy2DTQZYYzzqo5xCfc5H9NJLlUr
         EM7TxSwI/tmtWh/ddimm3Z6qVr3wIxze12nQfQGK/6ua8VtX/rJt9AtkIqlvj290V0Tl
         wTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tQb6g9BiZ4ZosTHX5re+WDuvLyIDAspwcbz+If1/Czw=;
        fh=6KagZq2WL8jNqSxoHrVkaV/zlkz134/eHY66vBM4/i4=;
        b=MqUfcKuo6aFe+FdE+4769foa60Oe+kw9fMjpRdiY3cL/NQtnCD+Xvpn3uJpHHT5yw0
         UV+0R68vZxMi++RFfXWXDm89q3mtSzMgvGN4r1cI1aqm/otSonwtACfUI9zcYsker8Hh
         vEARpqYQSD4QEXkDuJcx9Jhn+N+8a6gsj42HN/pA3rQg9D3YC9TRdOAKpqXV5GKDUl/Z
         xyVa/qO+XeQHOjzfYtI66nxOTZNSSNo4LyPSGAgFjjP1YoJW+mJX+aQRnKSJfRdG6U1b
         8N9/BWCsShsxpK0FG8oAkv7W9whc3PEW7aHCx8nKZg95Qaf2mM1NF/ijxSulgVKhmp1S
         4+VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1795439606; x=1796044406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQb6g9BiZ4ZosTHX5re+WDuvLyIDAspwcbz+If1/Czw=;
        b=UjvV/f1PXeqJk3P43u6GpN2S80BHpyhQ/o3AlGZmFSM8kDX1olHEGYBAve6o9J5OHx
         Lv+vpFRMOJ0z6/iHEXqqjO8Jga0+77qSEsAtvXpgKp6rpu8wy9ZOUWKW1pu5Yn9MMB92
         sMrB1VXTjODKG4ZKK9I3Uy4+oyPG80+ZzzOqDyQBJhUOToARl9gZVY1e+gbBTZTdW9m1
         q7vxwP/mwAZ23/TV6zmTmmfouSoSNdgYHKnPlqQC5+YcQN6yFlpYmUJewiH5AQTbqgR1
         Io/7yRO9f3U8lTwd09oBO4eFWP+/00VtUXymu4CE4kRz2eaNapMATyEnnuPqLj5AY+r0
         ltlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439606; x=1796044406;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQb6g9BiZ4ZosTHX5re+WDuvLyIDAspwcbz+If1/Czw=;
        b=dYmKmOboIjauehDxhLW0PFsxkIyTk0kZKgr9ppXby7iZbOiI4/xD0Z7ggLZHASfEPc
         3nQwd6MjgAFVHMLt/jXKycZ6e53GRVhFFZhQjh+7cxQ4w/7xN+wF0RvclzZ5aP4jN8wF
         moFWgS9TGfkf/EIj7fRKugwfheJ1xxaploscadZpUUihdvxaIpGXJ/4cD4JOpPRb1ja0
         Lby/xd8rYYRk6nq6tY5yAB6T1w2ip7knAq9gz97aiwcKtvNvgifpTJGk9IekvQGdjtX2
         aqztd9Ltx/NJjUjbjh5g2rodXhboTYscb5uRag7ziQa0H+ya0J7cWyVWGxCzHx7vsSjC
         iwQg==
X-Forwarded-Encrypted: i=1; AL+hErH+I4Lp95ARDXZHozAtO+Q7wHbpp/f6rgx1Yfi3WO9DSn4/qS5pYGD8DoqJXicxnv1do1TPZq83H9kf5DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kggXnL4yFyL8AwR1yk7AjS65VzYNru8cEmMyCLj5zXwhum+0Q
	mvOkfJrJtpJXA2QFh8GuI67vgSjq3WXdwJXahAPXMeUTk8akqjRwPPLyYR73WWnCMiebBdiVcvh
	k/vutK+zHDvIDVs7VoSPMi8MeIM0SlDD0vF/E8sWkKw==
X-Gm-Gg: AZFdTZd04vabmp19eY9udmXTAZExWDpXrsysA8jIi3US6fCWJ0WvsNabXQHzutydFCf
	pVXBS0qVlezBvfSnG5I+EcK3bGy00mnxYmYh8qFezZJP30nXjuj8lp9muNnY9VwDcJqQcWZ9Bae
	+7IJ4mxGOKICvSWAbfYcAG+cV6DguR9Qh7nbY3tQg1o9lpatWsD02qjDhJCBFUSopb6g1DPNkCK
	3AQz6saaZbvhGw+lUGOIDTpa6KyutiIQvqcVK22aefMnh80yu8kfMKglpftCHo/pAsLtvXaLO8g
	Y25KxtvQvNJF+uEkyqx7TVucPhqH8TD5tXVpNb4E/2Am1sVUcB3VnnSalCGEnrFK7yqyw94adlN
	I1niIf/h8p1BdOTfNJMpp6a59uiTiVgyLW3rTFyyh+Rzvo/Yg27lLgy8AN9x2qtbjkQ==
X-Received: by 2002:a17:906:5453:b0:c50:5a51:632f with SMTP id
 a640c23a62f3a-c513aabad57mr752927566b.39.1795439605669; Mon, 23 Nov 2026
 05:13:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com>
 <20261116081403.216452-5-max.kellermann@ionos.com> <CAGsJ_4w3cP+tgCGhTFu5p27Wi-9AFCneQgwLUAUg7X-gvX=e4Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4w3cP+tgCGhTFu5p27Wi-9AFCneQgwLUAUg7X-gvX=e4Q@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 23 Nov 2026 14:13:11 +0100
X-Gm-Features: Aa3M54qkAN-FUxtSPdh9O8Qt6TQF6J4MfIqPGFS6SuLOsMmm0mfMW-dt_mgEmPk
Message-ID: <CAKPOu+-Pzp-ovWNq394yBD0Qa5zCLZjx=sE3ixLs+WLf4EgZBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] mm/mglru: avoid redundant rotations of young memcgs
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 3:01=E2=80=AFAM Barry Song <baohua@kernel.org> wrot=
e:
> I know it was my suggestion to avoid unnecessary calls to
> get_random_u32_below() unless we actually need them.
>
> You then pointed out that this would move get_random_u32_below()
> inside the spinlock, which I had overlooked. Sorry about that.
>
> Have you tested whether calling get_random_u32_below() under the
> spinlock increases lock contention?

Yes, indeed it makes a big difference.

My initial version which always called get_random_u32_below() at the
beginning of lru_gen_rotate_memcg(), prior to locking
pgdat->memcg_lru.lock (but some of these "bin" values would never be
used with this patch):

                  &pgdat->memcg_lru.lock:     103487653      103501074
          0.06         301.90   195317628.84           1.89
113777275      116290184           0.04         339.54    30052760.20
         0.26

 Completed: 681 (success: 1, EAGAIN: 680, errors: 0)
 Elapsed: 61.23 s; requests/s: 11.12
 Latency: mean 713.05 ms; max 7470.24 ms

With the get_random_u32_below() call moved inside the lock, however
only called when it's really needed:

                  &pgdat->memcg_lru.lock:      99442644       99458122
          0.05         342.95   243043664.06           2.44
102985677      104642320           0.05         231.58    34095676.89
         0.33

 Completed: 548 (success: 0, EAGAIN: 548, errors: 0)
 Elapsed: 60.66 s; requests/s: 9.03
 Latency: mean 880.18 ms; max 3847.24 ms

I did a few runs, and while there was a lot of noise, but the
difference is real and reproducible.  Surprises me, I wouldn't have
thought this would be measurable.

I guess I'll move the call back out of the lock section?

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
