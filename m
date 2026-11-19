Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132282;
	b=vPG+ZpCPnvvNcL9PqxjF/ezehUNsPlr8lIYi0Fcoda0bNr09wOABJP7PffsbYZLARMTP
	 099RSIAhTT6c+jqM0k35mIkQ1hLbX3cVkNnf6bhUdtprmyHObudJeVn6UJxfP1oqFifHP
	 aPgJFmtdHQn1vatEav6CLuTl+iIpK2SUuM/jrxQbTSwbkrhyq+sJqWXwU8SruvDP3Jyal
	 P4IC2itN8X0VPS1TSIytqVp4eV9Ao7nL9UQHwEyK2Iwc/gaH8Tqmi4IgTHcZkZNHeyy8u
	 WcrkNuhCKYHs/TPVpgh4nklwZuzSs0o/if+cuu4WKgMLS7iB7oZ1RT/tKmGXnK47qsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
	b=TYMbitzNRW4d1ZbLAdZHHtETxCQBpC4ApJnerNzaXcCDZMP8K4ASsA5F7rvyh919D78K
	 wrbGaxOAbpdpIAMncorkBt/HlkLWwAoRh/gdLYqx5ERfldLR8WcLsHNl8AUrsrRMlYbHM
	 fZEch8NRpYwvyHVNSOT6s+h3XHrdeAnSDYH8uBGj4/ZRdh098xm+7XwSgZZhEUYSvUKo0
	 hsh448P+MZbDE9FR+d8/LhuuKQb/1enjoXhOZ9VwHen7O/HdKAE/YucivtJOfusTIRgQO
	 RzB67LbDAp/ModU5JJuXxESvTPH3fJdgSfYhOtnmV2pujvcSjZGfLhunX/ZyG8LZD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Co9TRkul;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA15606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA15606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Co9TRkul
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so229562b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795132281; x=1795737081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
        b=Co9TRkulxAgfAFWFJH8dH9X5VDp9mOl5BXJxhWBtgwzuf0nMx3ED9GImbLxhU+4+Zs
         jE5G//vdFQolfdoPjMlZbjGqT9mm8aakSBQdeXZ5Jsi6LfxwYbjw68VoJbrromP8EvP+
         WSQtVmyDFdfG2Qyepw+GAo+ZS1ETp7zho8JdhtisRmDseVSO3/M/Tz2ehb6WM2+7D+Ar
         3Uiy6ubTAM+bMtop5BPvxHPutQ1LBT13c2aL8rerimuJEK409eWM4hAKDvWR/XivBRPF
         EPI5oXwxf6LSW7GEcdkB1AAPKjXkjENtYSa0gvYofAFfodKJ4FNu43LXeXV+dLcFhHvm
         KdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132281; x=1795737081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8ADdYonZWrL091y2jSjEEH2R/PyNmllYhkBRfpcpWo=;
        b=fwvLgrGXrlR2cs2JesArH80rzaNwBcK+hlSs7XPgxxmPPDJGFXia5EwZiUU11rb1RT
         elVOec21FXPXy7HyXWWX7wLkwCHmtJH5JI6GBX+BZDAU/9SdcCCrrjrq840c7p/YQHzg
         5pQggQY4klBYeyBNxDPAjWswSN3mTIWBnupX+Bzb2QwB5i3GwwwqXAenYNH58G+vEWTl
         fks+M8i1giCeVRHiF4ySZNJYY+qm0KhwMQZR9qqHivcfQ8DfabFYC8YjV5a5ZlHBzbn5
         UJHTPx+qQ4CG1ujPpWSC9R4ZhqbfB70ULBZ1G71E4nvExBQEYFpCCxY2EoMRuTd/Aexj
         oPEQ==
X-Forwarded-Encrypted: i=1; AL+hErF5ltMZVozTGzUOs4z/u4B9zV7iJP6b1JLH2Jt59TTUMZyzdtUWe3cZzby9FhvfIp1vjWrR1Z29yUaHbDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zsk9OsO9yR2pCY2tgBihc2QOACDjTMU2naxlKjAKCM5hGBweQ
	WNmp49p3yni8kZc8i6bVzAvAvnr5sS5T8v0Tbn7inNukUMHecu7J6OoyH5CnHSL+xygim+I8Arc
	hhNa+jvQ=
X-Gm-Gg: AYBFou35m0ljG952iUOM5mHjHZNeuxXaBShOnu6xl3X6cRG0HtReX4a/3zhMINexFVP
	rkMdFHLW4dpBQwkRaaHkTb2ZPzTb9nr84eJVT0gqOhTvBGaTI5XMw37We1xvhw2aHq16I+lJo3e
	jO5qoiMFGf4Ls2P6D8uLFPgP6ohBknp4aN0OjAJaIudXiLILP35SGfmSEWnJzfYnceUxYbPose2
	oOea1efrkOCT7FLYmQn0gBsBlczb/kIbVCfYc5eNEXGeDNZf+ZJ0bmDEJW3cqyrgZdcLEeFn+WV
	VG6K3L1SBWMXOqDcy8X41rn7dB2JWPY3Z15f38b5jq7qMUyV1lOrIcTIU+qvC8xFE4YFXzl3R/x
	Roy7OgCiLgNd9KH2YvHJ+okkfJ6DF02WInuMWs+XlcAja3U9bHvg5VyZtjOY/5CjdLJ7Xy83mL1
	R9Fix1zOfC0GBtL73KiJI8S/Mplg0OqPDrPBS9h6Ri7kx4g08mEnrbMbtpYulb105w90cYnEoyC
	Syf/wdgIVQE5g3XWwon4TDMvF1aKsr9+VqdPWeec5CbGRZ9L5Gj5vu6SHW6tHA47Esl2S1luJNv
	iX8ZVuDHz72uFAC9G02B008hARwNa70kx0npjgXsJ77g6u6bqwQyFx8MDdfOrUzqbbjK6Sgh0mO
	kIYx2HDGrWDFMLCZP5PHjD9XTU1w=
X-Received: by 2002:a05:6a00:600a:b0:8b6:594d:7031 with SMTP id d2e1a72fcca58-8c87d51edf1mr1113785b3a.59.1795132280946;
        Thu, 19 Nov 2026 15:51:20 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f11da2sm549456b3a.55.2026.11.19.15.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:51:20 -0800 (PST)
Date: Fri, 20 Nov 2026 10:51:15 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>, 
	Arien Judge <arien.judge@morsemicro.com>, Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 3/4] wifi: mm81x: bound the .fw_info TLV
 walk
Message-ID: <god7c5ejpf3edqwnsrhtg3oi4mdfdsrgjze72c32dp3hxxk4pv@qqfc2soc42br>
References: <20260812060740.1275280-1-lilinmao@kylinos.cn>
 <20260812060740.1275280-4-lilinmao@kylinos.cn>
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
In-Reply-To: <20260812060740.1275280-4-lilinmao@kylinos.cn>

On Wed, Aug 12, 2026 at 02:07:39PM +0800, Linmao Li wrote:
> mm81x_fw_parse_info() only checks that a TLV header starts before the
> end of the section, so a header that straddles the end is read anyway,
> and MM81X_FW_INFO_TLV_BCF_ADDR reads its four-byte value without looking
> at the TLV length at all.  The BCF address can come from whatever
> follows the section.
> 
> Walk by remaining length, and only take the address when the value is
> really there.

Can you rebase 3 & 4 of this set on mm81x-next [1], they no longer
apply as a new new TLVs were added. I applied 1 & 2 a while ago.

[1] https://github.com/MorseMicro/linux-wireless/

pw-bot: cr
