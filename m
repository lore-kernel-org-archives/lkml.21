Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531131;
	b=nETIQ5X9vULtlkg0XghaBmYrm8Qq2RQtu4a4AIQ9tVgjvYZBbA8pS5LqqEyvKeU2icQl
	 2mz2h0f7xIXhzlf8p7ujgu46FAQ1EFncGus0nENko/LFp9Tn3eh9rf6d+XvXokkqrnNTK
	 SRhsKi57S9rjU3kO78Xq/xCRYEZXMayGtW+pmWYr/Rj2w8xsI6H9Zz3uDRcFB8Pq3dlS9
	 7J9MeeTD/9ADbXxKoc3vnW7ARqMW/lnmuj0tdG0jsq4yKw8KD3APcnRMS2JP08bQYnIMm
	 lVZFkV2fNCDE+YWxFhRthgRCH7m+yAYJRCypX+7kI4waES1FKqDzU1cBihZp/ZYvlwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531131;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=P2GxaQJcikTxvKRU5IokHE97WgQzfMeICzxy7HGfwWQ=;
	b=Z7KiFqo29ypyS+kozEilVUCHIOn0UwlScKpd0Sa6YWRfi1ICuhBih6ZBrV+pUx+DaZfz
	 vQuvZEQIpd5NzqCdwSuGOikxuNCAhtuRprROLR9YYbFkc4nzMtOKO8kjBYuVugsqNr726
	 6jh03cNLrKvliUtcvOWQ6bI/+OoXYBUaKQkJDlcIamtYW5VUsNuAXDz4MTTGN9Aa1woUA
	 CPhDD1h4o4qbZ3BNoZE9pFQGtP/dA78N0GSkZJVZh75WmZmoV183kS10n2kuNUc5EsBMH
	 JKeHW+aJecLu334QeCeXh1sSpFk8LutqF8FcgdmPo810nU/j/EKCvlFTR+Tcih8lU/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nJeizpLC;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A8606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F2A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=nJeizpLC
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BCB9FBE1;
	Tue, 24 Nov 2026 15:36:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795530974;
	bh=UB0ii/fj7GuuWSBblXDInqUrRawYOWHMp4NCHjO6TU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nJeizpLCa0dEauhPzl0WVPhSd4v/7qp6+E4dm5D7AHuDpDyN9pteU4GnVq1f8IbIf
	 LCM+exM7Xs+WZ3zud3Fe1DyrkvYsXHwy/vl7MQHjODpXxxiDZJjk5dElw5waaTMhCm
	 Zs+r2ikB9dyXsbNxRgAe0XL9IAyfCeCh3bGPEveQ=
Message-ID: <e58a5ff5-9c1b-40cc-a65d-c7fbfdaf18d1@ideasonboard.com>
Date: Tue, 24 Nov 2026 16:38:43 +0200
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
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
To: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20261116142707.1299360-1-maximpedraza@gmail.com>
 <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat>
 <20261118212114.150992-1-maximpedraza@gmail.com>
 <20261124141119.441163-1-maximpedraza@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261124141119.441163-1-maximpedraza@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/11/2026 16:11, Màxim Pedraza Padilla wrote:
> On Wed, Nov 18, 2026 at 10:21:14PM +0100, Màxim Pedraza Padilla wrote:
>> Makes sense, I'll use the same approach in tilcdc, and see if it can be
>> turned into a common helper along the way.
> 
> A follow-up on this one, now that I've rebased on v9. I ended up doing
> it differently, so I'd rather explain why before sending the next
> version.
> 
> The tidss approach rounds the clock to the closest standard refresh rate.
> Panels driven by tilcdc often don't use one: with the timings from its
> datasheet, the panel on this board runs at 56.8 Hz (33.3 MHz), which would
> be read back as 60 Hz and 35.19 MHz. The adopted mode would then never
> match the panel mode, even with U-Boot programming exactly the same one.

I felt that approach was a bit odd (and if I recall right, failed with 
my OLDI panel), and in my tidss version I just used the clock rate 
directly from the clk_get_rate() (see dispc_vp_readout_mode):

https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux.git/commit/?h=ti/boot-splash-v8.5&id=b08e04d7ff284234aebd048982c98cc5368affa8

  Tomi

