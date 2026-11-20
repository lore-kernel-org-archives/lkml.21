Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133586;
	b=txpCq6/hUy6MYKFFv3xwechbWIUCoVy4B2fmA0hY1/PImtyUcic2druClIBB93Qt3lrs
	 +LiEySN4q/zuURXg0qbezuDELnbGOmPHanxrc36sPHJhTyQP2oGmgIfFsaCU7WHwpjIgY
	 SDJCmoaiZCFI+MVoarXTL2aBD7GKtlvPTKdUBOHcyQOuA9x4cO/AaDE1cRG3QTmjtcycX
	 E4XmCzUXIEzjzu2vhe1x2kC9c4Uw7BxjjLSzUMnYHVR7nJxc6BN8EBKCooUNkB8+fPBfF
	 uHpcplYMa9VwUT/Q13x5sHbhgl9LIJyruXJSDWU835Xw6iMhtz089VAyWMCPTkXFe0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133586;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9ThgDFYK9tGZvK7toM+BCYsV0M/1u6fAC22KYV1kDyg=;
	b=jeygysMOROo9B9YdjMwmtMRWxrBcdLzC9jqX4pVyVnIepxR6FeZ1E4ZsX+wO9iXW4gtT
	 2Jbdx1d+16gQlxTMvZBc3egYxypq3khRYahjqn0OlnJTbpfaPBaq5HyPthHot1n+XiObG
	 WfRYHF+V5jblQ2n7o2FV+aSGW7RrdHcLQ8rC7cmvdMfdwohuXcD6BaVEmgz8Qts0bGTi2
	 437VikVIPCUo5vhqv/VlDYJv0P1AJ3q1bQapIB/wUgNiu5QBtfhYR7eYThkeX+i5HE7+p
	 bK9tNNK3EHyifCqZyNJkfOrW9Xh+zBHE/Ej0IKUjwyo3bPQfv20+iS3Eozko2mBGbjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E4606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991E4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUCFO-000000002IR-2OSF;
	Fri, 20 Nov 2026 00:12:58 +0000
Date: Fri, 20 Nov 2026 00:12:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 00/14] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <179513343447.61468.17602640569563823153@makrotopia.org>
References: <cover.1795132452.git.daniel@makrotopia.org>
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
In-Reply-To: <cover.1795132452.git.daniel@makrotopia.org>

v9 accidentally went out with the per-patch changelogs stripped.
Their content is covered by the changelog in the cover letter and by the
commit messages, except for two details of patch 13
("drm/bridge: it6505: Add audio support"):

v4: the FIFO-error IRQ probes for audio input and enables audio in a
    single section under audio_lock

v2: audio is enabled and disabled from .mute_stream, as hdmi_codec_ops
    no longer has a .trigger callback

Daniel
