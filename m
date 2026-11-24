Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533253;
	b=vTMaBij1CL6wRJ92GJQRibEB2ReMcZquOkTeV1l5VP4siXcsXU3W8rmJh6UNqunhQ3XX
	 T3pNXRMSIbtSQQF2RuYeC7nRr/BY6o/nMDTp85MnpMlefHis1NxbtZca+vplXAwUvxvTX
	 JD7MIYDpvBdK8bWNdotshVbsti1gpThJPVFCyJinRdL1rOGnYN1S4sIvVg62xiqOh5PwQ
	 m3mz+kB94ULszbfEbbVhZtGHNJcEyQp6GMCyChln99/WuJZXaxaRhjvtZR1YlxcxxtQHU
	 nYXLQ9/Fsc0I7d+SvLroLGX46LazP9MEx1Uk+h+/Ffn2A76E1o1jBIjJP7pM8REA2Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533253;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=G/LXvyy4L1eBU0ZwJpiLjTkZhv8irQ9vdoW7JoGoatk=;
	b=Y2gxrIHUWLmqt3CmT1Jeur4KqmszHSbU9E40cb1W21hqKSmVVtieJm+hfnnw5IW66HK5
	 q2tgQ38a/OWxYA4B9PGZFg9TBrr1Fbof7S5Uggq1uIOLsi4kHZikZHw1+TJfiqQJ4DoTS
	 aZ535gh3Eo4lVAHrQMp2aMyDX74gWUQ9BpgnYtt6ns4gNk9clqpDJqoXCNVYiAyNNJGgQ
	 QUv7kdjD+pRfdR7AULff0kj7+CSFQqRaZ72Dno0/GfLFeiZEQRcK2OA99NtWuvjNkE7AY
	 /8i8dfPh16eJpCVpNV4ZKruJXA8nHWayOSRro83165yC+fD55wOvDdarCehtotfLK/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BWfsSYXx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0EC606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0EC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=BWfsSYXx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3423CC2C661;
	Tue, 24 Nov 2026 15:14:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B42F0601E1;
	Tue, 24 Nov 2026 15:14:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CB2E11E699CF;
	Tue, 24 Nov 2026 16:14:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795533245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=G/LXvyy4L1eBU0ZwJpiLjTkZhv8irQ9vdoW7JoGoatk=;
	b=BWfsSYXxS1HkkK9KQsmFBx8aKtJvhIhmtaq7H8vFB9d9+ueE5Z1CtMHCMPGq3CRhv6NdUY
	OKoCZFXEf5UZUexD+PdSLCWPrOsbxp1xgCRkCEb+QmEt9FzKjr9jNsNB8vVLUoD6o5ftt+
	O/CljaecePy4h6dLtDJDfrGDL1Ls0rVwQrPNUsf77G6ORngz87Lb64xo9JHu4CxgGhLTfn
	qvOlbY2mc6pTO5nx1h2n/p+le/LdduwMXVxSJLDAzuWOAGCrCAo1iz3lN4laO/T2dyGdH0
	ypDx4Npfl28JjVIi+OdXAk/2eWtywSidrlZz0eDx8tThsAgJCxswPff31zT1LQ==
Message-ID: <e28993bc-834b-4ae2-921a-09234e9ec176@bootlin.com>
Date: Tue, 24 Nov 2026 16:14:01 +0100
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
Subject: Re: [PATCH RESEND 1/4] drm/vkms: use the gamma LUT of the state being
 composed
To: Oarora Etimis <oaroraetimis@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Harry Wentland <harry.wentland@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261123-lut-v1-0-5556c89a2ebd@gmail.com>
 <20261123-lut-v1-1-5556c89a2ebd@gmail.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261123-lut-v1-1-5556c89a2ebd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 17:20, Oarora Etimis wrote:
> The worker can fall behind a commit, so crtc->state may be newer than the
> state the frame is built from, and the frame would mix planes of one state
> with the LUT of another. Take the LUT from crtc_state->base.gamma_lut.
> 
> Clear lut_length and channel_value2index_ratio in the else branch as well,
> so that gamma_lut is either complete or entirely empty. Nothing reads them
> while base is NULL - apply_lut() returns on that - but the next patch
> decides whether to rebuild its table from lut_length alone, and a non-zero
> length next to a NULL base would have it build from a NULL LUT.
> 
> A zero-length blob takes that branch too. It used to leave lut_length at 0
> and channel_value2index_ratio at drm_fixp_div(-1, 0xffff), which nothing
> read either.
> 
> Fixes: db1f254f2cfa ("drm/vkms: Add support to 1D gamma LUT")
> Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
