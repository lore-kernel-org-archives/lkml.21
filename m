Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601746;
	b=VwaYe8NjpUAkvLLNniuyYFht5RVXKZ/92xbkmWbmtI0QEdjI2bJ+mMJuL9P2e/6BuG9P
	 DIPFCpb2Gv1XfBUNqNqLFo2bUFb1wpMQN8sYMAq1c/9vxrN6mPJOBziQlhBO6t2bLwmHj
	 JmBlUFrve9jCjOv8A7SsJYpIac6qRVemmCjX7JiWGRY35xsLFAKXVTZc1wf5F2jN/H2Og
	 gpnGWRprwk1NGMp0gXiX1gaX4kdd7iiDb3OI1CZI4yB7XIPHsXNnzBAo0ZE55zI0qHbQ7
	 Mqx2DPqrRurfQcv6IKtFXwSUC/4Qh4RjqT+Tz3LdYIx1/6UTetjbJ1tRDbKr4oE4AcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PFUuksXTO3TNxrTTYeNDfahMSpkP8c6YJRD7Cdnatmg=;
	b=WO/tQYDG5tLxEhrvJfRrQGjBhtnE2+PDKCLgkXqW2sEccXU69WxBSwSCqcHEfo1fgn3b
	 nMNSlI0Y+YMcsVlrd9wy2xJUP65jM6c+5uegxnglXbbV+C5sbrO++RG9C3ag7Xo2RtqR1
	 fHqAHApZ2QlIFSqRpbC3yOJpaSjcsadSQ5u3xX6yGu3Xc9MBX4A2XCUroEppH5+TsAkr1
	 35XK6dBW5PXpfP/Bq7huGqXGOE0m6yJCWREwLagsDVoxunLuxAIadBmUA0FssbUIR17Bg
	 5IyKhD0WUDyJts7YSGIyxd05q1rEn/dXOvwLIHsAdYgm87uqIqL46oKboLSkGM9alBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK9MqZW3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B7606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK9MqZW3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3924000f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795601744; x=1796206544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFUuksXTO3TNxrTTYeNDfahMSpkP8c6YJRD7Cdnatmg=;
        b=iK9MqZW3FqxCVrre9hD6C+9kW6iZFZL1s2vr1bHDzmhUiv5HqWaOnVPQA71pUgi6b9
         imVHSKUWK9Dgxx3KcAdHVhgVSipwiuX+c9CpCHBfkVLH3wUeH7moIVUgKPsLVPgTyBZL
         R4zu+SpZiB0t3JayxwgxpMCIg2jQhIUcMyIF39ycxsP8zgHycZPjgXKTki2IuvhCUZqn
         tE6k8BRig4gc8KHHQ3dvUVQgZUCNNQ/YDntCfLjQpNq1cJvAh6V1IOrQAc5Qn3P7QeyL
         pFbfXke4W2KTGPCrK3KxQeEH5pXP7tPPY6Xsyefo8jRgGQSjUhwbVQN1KIdbh8Dbne18
         D4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601744; x=1796206544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFUuksXTO3TNxrTTYeNDfahMSpkP8c6YJRD7Cdnatmg=;
        b=rKmHOfawq4tNiVzyLh8n6X5tcfFD5K2saImxSRdkoo4MC0mg4WINZ2ZyMA7uNoo7Zi
         uxuSRjJ02yAG099fXxrpmV8isIoh0ISM/VT5FyvLddMwSVf56CkvJnT0ZFMmjwIcugJT
         b2Z1MYg77R+ojP204YDx+1x/x8CVngzgAOIjxeuLBelPzicrqCvdQ95brVUi/11kUrAt
         XhVRXGudMKv3Id+exKp6aDfEeARUvaH1C0QSPpvUlLozuqgb7zQSPql8caU1A/xd0DB/
         vTS+cvQfnFfAK0hjPagyvtp5EzyFSFGVWh+YwWKgx8HsYzOhqci7qnltu1REIYsQKEkR
         6pgQ==
X-Forwarded-Encrypted: i=1; AL+hErHM6SqqlfwNrNTmjep54Px2eJ5Z+qQ9FVXYp3elDnukhDoPeKj078exPcIJlUYPp4IPMRcmYcMBLjb4te0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FxPoz4GZLRj3Bjru1qplk8lvX5UNiE6EvjpjDNNR6Sq1dIbSV
	Phu/yNdKO5uM/uVSsxG8HCrPMA2j7dyO9dmTfIzny94F2lHpR24FbQAv
X-Gm-Gg: AZFdTZdLh/MVJmyxzzkEHd03KCqwtogPKC8ddbMwMkzZUiMveJZE2AsXMYPOOWZp3ve
	4OAv3pcMptioSVRHwOkcqeUdppgJpYoMhT5DZgd8mEh4ozf6ZvuqU+wXYqOvhqCZzUgvm8vniMQ
	ztPoDQ6bRUW+8788WkbZw5IxSlWV+86l1KvVrBgrz5kj6O2aIQ5LqDElaPnH9wYGIWonoAgWDjj
	Ll+9EvrRZdlPeuqGVRzTnoYXAAah7/WC9NxqtMw0PAe7NWKyLdvm8WYknO0/itTxJ5/zyghaZdD
	ElxyV6FUyMePf/O7O3djtHTSUcDDesYJss0B0KfNYl8r0fXklx44hj4Jazan8/uc8/MzVxPMTD9
	Y81MH+jh9J4u4hdlAvuIzvr3I8SXmJRs/lDvIO22lTnW7hXCED7DeKhk0lz8qKqCVA3wXcj96lC
	EAtF8hZW+kcQANEi28yENM9o6V5NPj8TX3WWiSB0/tv7HBd4j3D81ifbbeeucmbCpmc2i1k4SNw
	CN4DwVkCyX53D9K0dxTmntuPQ+w+Iz7YYe4bxyt5vCoqhnztJytwmmQsstzHhafY/cus95sNUOi
	Nk/XkeyUva1vd6nOq67EP5ITGJ3nRU8N4B76j73+sCIXHlPzjuxCuOo=
X-Received: by 2002:adf:e012:0:10b0:48e:3697:708d with SMTP id ffacd0b85a97d-4abb0d51ab2mr23863330f8f.12.1795601743982;
        Wed, 25 Nov 2026 02:15:43 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm32236192f8f.7.2026.11.25.02.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:15:43 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/4] drm/tilcdc: Implement state readout support
Date: Wed, 25 Nov 2026 11:15:41 +0100
Message-Id: <20261125101541.463585-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <e58a5ff5-9c1b-40cc-a65d-c7fbfdaf18d1@ideasonboard.com>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <20261116142707.1299360-4-maximpedraza@gmail.com> <avs2dagfmQkv00H0@houat> <20261118212114.150992-1-maximpedraza@gmail.com> <20261124141119.441163-1-maximpedraza@gmail.com> <e58a5ff5-9c1b-40cc-a65d-c7fbfdaf18d1@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 24, 2026 at 04:38:43PM +0200, Tomi Valkeinen wrote:
> I felt that approach was a bit odd (and if I recall right, failed with
> my OLDI panel), and in my tidss version I just used the clock rate
> directly from the clk_get_rate() (see dispc_vp_readout_mode):

Thanks, good to know I'm not the only one it didn't work for. v2 does the
same: the functional clock rate divided by the LCDC divider, rounded to
the nearest kHz.

What I added is a 1% tolerance on the pixel clock in tilcdc's CRTC
compare hook. When tilcdc_crtc_set_clk() can't get the exact rate, the
clock read back after a commit differs from the mode by a few kHz: here,
asking for 16941 kHz gets 16940.69 kHz from the display PLL. Out of 20
pixel clocks between 16.9 and 45 MHz, four were off by up to 0.015% and
the exact comparison reported them as mismatches.

Since you know tilcdc: do you know why tilcdc_crtc_mode_fixup() flips the
HSYNC polarity? Its comment says the LCDC aligns VS on the second edge of
HS, but I couldn't find that in the AM335x TRM, where IHS directly sets
the polarity of the HSYNC pin. As it is, a panel needing an active low
HSYNC has to leave hsync-active out of its DT timings.

Thanks,
Màxim
