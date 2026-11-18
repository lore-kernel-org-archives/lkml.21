Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795020631;
	b=ifRAzVXUkEFLhPXYSTBYq1QwPxRns+t1IcsS3MnuT8ueDifpRkjkrLLXYY1jlXMpkY+i
	 p1q6lRNQcLwdnBxTTaZ/z/N3SKhFijmZW2lrgu1g5NiE8e9mL+qmTpBRj4rQpgfZuxxCD
	 YS2I6Rc40xfiBvCuTj3YS2jlAon3Bq1R7+fOhM04b9gUpYt2au81y9MDs8qjRXYxDocTn
	 v6jTTc4htfXFRyo5+028wvQGTwJdgcwTuBtPOnqHBzUdZkBkYqHZwmlhKm/55Jc+RdRC7
	 fsNR0VPbMs+ACQ0BefV+asBtWLHvvKH84uhz4fNGpAUdce3hMv3+a1Nq32zbWcdfChg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795020631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oxOuGc8f47gMHpuI4bZ1qBRpP63fNQyLbMXtHjN4yGY=;
	b=hQzysCrjq6QIemHIITxdaQDs9YTkDxTwd6fOUCJ41OtKzBhjh6Vmyt0fraeTfzuKp8BJ
	 X5muYKABFD6cJHCnjz8/G87TrnBzrxHaja9vk4NPe6C1/s2Kzay6a9aktHklvp7vCve5J
	 x80N7OH7sk45GLUJDhEzFf/Ef1oiYrIUCVo4IskqjAoCas6nv0Sz0NGVgoJ62V7iTrvNd
	 bUXvlrIKUjOWrHFzLKxmp+8ht+mNjJuZBw8G5geotZebVcYAnNnch1GisJyzvLXjgRVfR
	 lhLQ2g2ZIF+ZIBVA6ijJoByS4qVioaLbWSSNnQz60PAUCoZQMgJEcaAfXet+wGM2VRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WzN+c2lY;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14A8606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14A8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WzN+c2lY
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ada7d53082so111001fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795020629; x=1795625429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxOuGc8f47gMHpuI4bZ1qBRpP63fNQyLbMXtHjN4yGY=;
        b=WzN+c2lYUQyblX7SYw6GNgf+LJC/y7dShZYcf8msdkYWPfJh4a26KePgO4uTWJthXj
         D62LmOwh+YQz71OE3KnI+AGll7D4XJDvWQaZdYvZEDBfZxdOybpQe3Ls6G0YVqRYMKZX
         dyg/T+CMJlwEdl4Ye/I555axEpNR1f7B8P1hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020629; x=1795625429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxOuGc8f47gMHpuI4bZ1qBRpP63fNQyLbMXtHjN4yGY=;
        b=YKmJHseDETZsqzhH7TnahIOwf8FLfk176ER3fpvQeIPUi3s3Owx4QTjr1cZi8ai3iH
         xBtfnCm0ifgy5ohGGAWin5Rd7/nEkNLNe7/bgGChruRr9wP8TU/cGMvdXZvSZsSi3NEo
         s1843tzHZr0BxXJvD6BfC0mtKgFAwOKu3M9nIVQs2DAUSnru71PhsvfGsJThkP5Gd5g6
         /rLoWEFxEijwjU05/0PduUt6A6MqloPX3NgClziB45WZpIUMnhUvQ8RjtbvQWNAXic/Y
         qOgwFIovbXotqkdUm65LPIMNuVOm2EotjyLzx9/Qy3A5hfquysQwDI684ZW6uIawE0xh
         7V9w==
X-Forwarded-Encrypted: i=1; AL+hErFKrvS74k1+Chvr2zsTPdJu4RzGPXLDrxbCNv9AV8BTSrGNspHe/DB8LysjlAfT/gwiyJd3Puw8lQD+LS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8x4uINTT88EOhlQppoIdgpxTjXBl0sqcStGrzlqJEO1SprS5El
	YTIoyiPmSc98OxCeqdKGqR2ZfkMChq3hHTgkTTvh+In6992q9THZXLZNdf14xsow2riRI3qAuDV
	At/uqFmPM
X-Gm-Gg: AYBFou0uoXVrQ31Z4fONa0ggIVqu/3ljz++iWDwGYDlbNwwpqy3f8E31JLCUymEeDUf
	hU25darun8B939xBKVooRwLHy3xdHl2DmvddSBY4HTxsPZlpfnRY5yaTJIhTRoO5jgRxaBRDZ3b
	NiKy8QEKZcso9OsPy0UsA/JefNG4cEAM/KNurvJqQ2L1cqeeIW+2paAhkCuTebN6fhbGMI3tnhM
	S0X/SCVuSP0nLTGarjtWtQ2pb8EoE7EzeevBHRFUrrgHvJ4JKVd6q3QXhMxYvOB6imPB7OzdTNg
	DbjxmEg63nUVWHs8kyYytiWUBrv5TwxJHq+jyIl0pvaTYS4K1/DHE2kqIUA8y9WqztX2Y0KZT9d
	y6qui91nxS3/pGT43MyMCSoPBqPQ2Nq81dVoUsokaqHdApQAEa8w+4GTKxyDvElxcZQHW9xzve/
	6B9YOvk6C3Cu/JtpsK7viqkkB6sSzXQH9x0udY9nE4nXnpEhzQh6xXQhcxFEpcVt3Hjpu+wdk2u
	NwyBaOxeyf1BRKqqLkjAWnQ7nWfNWLURtxirZB/oW4mX/UROGhP46HXaC7Q1K7HQ154Bf7HurYK
	T7ZPi71kj7WXc5rakldmDuriyxFl+MXiLcRt04Zd2e4fXJ1hoLkU3Ns4IJf8deMvLc8pKseH
X-Received: by 2002:a2e:a593:0:b0:3ae:920:ac4f with SMTP id 38308e7fff4ca-3ae6fefb3a5mr44831fa.8.1795020628628;
        Wed, 18 Nov 2026 08:50:28 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae6ea7cc69sm1326621fa.10.2026.11.18.08.50.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:50:28 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ada7d53082so110861fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:50:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHpPk7Flz9Jt+WaVuCPVSzgMOD7Z2/t5ajXZjw+HQe52Kq30+S78a+9Yz+0qBpekYBONQOeUMYK+/qxXw=@vger.kernel.org
X-Received: by 2002:a05:6000:2286:b0:4a3:c963:c1c3 with SMTP id
 ffacd0b85a97d-4a8e557d595mr123263f8f.15.1795020136499; Wed, 18 Nov 2026
 08:42:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118150045.2414052-1-haoxiang_li2024@163.com>
In-Reply-To: <20261118150045.2414052-1-haoxiang_li2024@163.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 18 Nov 2026 08:42:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQQyw8_bhVi8Y0JbxXB8XP62ivBPUnfrgWGMcLo7qLtQ@mail.gmail.com>
X-Gm-Features: Aa3M54pB6COHcWFeP1e0tF6KVDem24lURpneNehSl_Twk7SaRLtLmSvQAajZ5BI
Message-ID: <CAD=FV=WQQyw8_bhVi8Y0JbxXB8XP62ivBPUnfrgWGMcLo7qLtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix DSI host node reference leak
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	luca.ceresoli@bootlin.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	sam@ravnborg.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 18, 2026 at 7:01=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.co=
m> wrote:
>
> ti_sn_bridge_parse_dsi_host() acquires a reference to the remote DSI
> host node with of_graph_get_remote_node(). If ti_sn_attach_host()
> fails, the probe error path removes the bridge but does not release
> this reference.
>
> Call of_node_put() after removing the bridge in the probe error path.
>
> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI =
device at probe")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll probably let this sit for a bit and then merge it in a week or
two. It doesn't seem urgent, so I'd plan to land it in drm-misc-next
instead of -fixes. If anyone else feels like landing it sooner, feel
free.


-Doug
