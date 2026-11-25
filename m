Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607611;
	b=D920hzDSdrX99VyMPv1fUZHStjPRThIHbld+mvgRoR51zEM42U2OUTAtrZN5LG8/GEth
	 STtRtLhmhi8SP8RX5GwKN3DWYZXbJEXPbTbUI6TPq+VM/s/XW6a9JldNJQN2kEavcGZFN
	 yjDjd/SMZAtSNvnSpY+lFYlwifvUhnuFQ3RtoXw/gRAAaDqxA36+Z2KCoNd4VJdE1J1W8
	 ZI7VDrob3OKrFrtwtnq520w9e9a3HW6hORq4W7925VNcocPIKu36A1+TKGR8jcsrJyx9u
	 MR5XEsCRzGHAD2pjQ7Sft2TrqXpKYxRvUD8SqxDBwIVzI6Za+KPz23ObyjRRhL1MKkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607611;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=CKcIKM2HoXT27gj9tsENI24WawP/zHfFghaOwejS+tM=;
	b=03lOMsQk1K/G09pl1nksJQrMRXa/4MFwPkztlup5PxTDaFC4hdrwWJueaJbDmKbJaUZz
	 OfD9XthEX3+yLfksAGbXg5aAGdMLRrNnfF9JIKLwGJ7HgH5loGe56oQgOqrnlUHzmkteM
	 gDPW4DXgbhu/VEP3JNu4SfLjsMBkY0IDFE7BAW3pasUN3ivcMJPV22VRUF6Q6dP8uPNfy
	 tdZBWelS1GPg65nUxZRi3P4RzNka6j5pF3/RYSF77ajtJ+sqEXye8SHpXQ9ED3CNQ6Sjg
	 fzLPxBa/0esI7e0gAp/Hc245+a0qiUtiusqCV2iAuXWA74oRRu07V2TI9l6rSzWk5iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bUIkWYwE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D951606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D951606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=bUIkWYwE
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F73373;
	Wed, 25 Nov 2026 12:50:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795607454;
	bh=NTnR3ucVdadYj5pUOifw5RHcnZpPRNVcEfRv0KFgbmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bUIkWYwEJTgrEs9oUvp2p8ZbymBRhepLU5mhhTt1L758SlftwJknwL6iWpqeLz26C
	 gO3POIgr0NDN43FlMO8v92m6yU/p8bk4jqlj37GtBx9Km2FrLC7bOni+kNI/OK40Xd
	 7E2jYRrNyigbKaOSa4D2iKA6iWmmuY6TjXkFAVtQ=
Message-ID: <7783b523-3d37-4a10-b541-bf9ae8013e78@ideasonboard.com>
Date: Wed, 25 Nov 2026 13:53:23 +0200
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
To: =?UTF-8?Q?M=C3=A0xim_Pedraza_Padilla?= <maximpedraza@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
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
 <e58a5ff5-9c1b-40cc-a65d-c7fbfdaf18d1@ideasonboard.com>
 <20261125101541.463585-1-maximpedraza@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <20261125101541.463585-1-maximpedraza@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 25/11/2026 12:15, Màxim Pedraza Padilla wrote:
> On Tue, Nov 24, 2026 at 04:38:43PM +0200, Tomi Valkeinen wrote:
>> I felt that approach was a bit odd (and if I recall right, failed with
>> my OLDI panel), and in my tidss version I just used the clock rate
>> directly from the clk_get_rate() (see dispc_vp_readout_mode):
> 
> Thanks, good to know I'm not the only one it didn't work for. v2 does the
> same: the functional clock rate divided by the LCDC divider, rounded to
> the nearest kHz.
> 
> What I added is a 1% tolerance on the pixel clock in tilcdc's CRTC
> compare hook. When tilcdc_crtc_set_clk() can't get the exact rate, the
> clock read back after a commit differs from the mode by a few kHz: here,
> asking for 16941 kHz gets 16940.69 kHz from the display PLL. Out of 20
> pixel clocks between 16.9 and 45 MHz, four were off by up to 0.015% and
> the exact comparison reported them as mismatches.
> 
> Since you know tilcdc: do you know why tilcdc_crtc_mode_fixup() flips the
> HSYNC polarity? Its comment says the LCDC aligns VS on the second edge of
> HS, but I couldn't find that in the AM335x TRM, where IHS directly sets
> the polarity of the HSYNC pin. As it is, a panel needing an active low
> HSYNC has to leave hsync-active out of its DT timings.
Sorry, I don't remember. It's been quite a while, and that part wasn't 
my code. The original commit says:

+        * We use adjusted_mode, to fixup sync by aligning both rising
+        * edges and add HSKEW offset to let the slave encoder fix it up.

which sounds like the encoder (I think at that time there was really 
just a single encoder used) supports hskew, so the encoder then adjusted 
the syncs horizontally, and also used the correct polarities. You could 
have a look at the old kernel sources.

If I had to guess, the hack helps on some particular panel/encoder. And 
breaks some other. If you remove the hack, you get it the other way 
around =).

  Tomi

