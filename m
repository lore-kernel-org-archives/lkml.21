Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795077432;
	b=Lr8sWeopmHbJNfLvoJ1GPDKk5TuM/aE+x9miVuq7DmRrqQD7ynDexghYHS0IaSxQs0Nv
	 XeEOmhFxrEcFylpmir5JOebs++ZtQFMyjb8L4IGvFvjztrgvpdtqOCRWQ9ZFXVVGbIX97
	 SfLN7p5l3nXrvW5vZ7H6hlE9ktrDVhUNb7GBZCh+/9USL8VHVSzgy4vT/JIg5NR1u53u0
	 6ux/4P6xqiH12oBlBLEiBR5fu7KP8GrW6WaFyBRa+9PCawo4rCQkFRyy6e9dLWiNWxp8T
	 9iMYeAMO6ut+se0Wf2Tj5BuzU6iPtfkIgd7ssZHXL8Nbk+9oyDwFL+kEUj0OlkCrIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795077432;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xl7rcMmTdkbuwHxBzYDs8H/hB1tr+4M2V6k9uKOsHbU=;
	b=5UJ51m9a8mcuvpLgJbBFRZPtzDm+v/jR/wm69P/x6T1lrIH9njAun3/Wr9xKxWeizEEL
	 1JTQsEF4LSmEWxw1YAysarAqsQYgGr7nh7NDDGBmILBER0Os58G2AY+jpDwfYsPwFlPb3
	 rhv4g+6Aemrct1lmewXIZVEROF8lCu0FsPEgYJfM4LuN54QOUX6BDXHzD2tzGD9Rlq+8J
	 B1CmMlV3a1a6Mws3Ogd6VJe+5HcY0XSY62r5lrIKhuLVGl+vgdSi6c+WWDyHOFotQxb8Z
	 PFI8fSeNqXJv1Grm10BxlQL27Yai2Ge5jM4XgT9su8B/vwel/CvwGOANhhB/OeFc0fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mCVDZmL+;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B9606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=mCVDZmL+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795077429; x=1795336629;
	bh=xl7rcMmTdkbuwHxBzYDs8H/hB1tr+4M2V6k9uKOsHbU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mCVDZmL+fy2pFG4vvyjNnh+CdpuVN/gsTVqbJCCqKiobC9JDOmgTzh9J9eJ4dPNV0
	 UdkBOSOSntUrE2nSvPOXzDpJCVNpUjNWaAl+eJLtSKVvGwi/MP1dtXv2cHp/z595MN
	 Z8vrLIOLJwnK2zS/nrgrK8JrMdC6Yhfn3yoPZ+oxCYH8r2oi5AlzKEIcWQjHAWenfK
	 xlvzGhWqrmkzDSSt0iPme8PilxIojjumXroYnYFGegYcv++bpg9W2FsOTJ6Mss+OCh
	 Q0lrMf6IcLhjbPVED8M9i267x2CHRUAKQ9k2PRXCTNJK2U15d4BQkwN02zBLkvuxx+
	 HDTvquVgw58+g==
Date: Thu, 19 Nov 2026 08:37:03 +0000
To: Wayne Lin <Wayne.Lin@amd.com>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: amd-gfx@lists.freedesktop.org, Cooper Morgan <ext-github@cwooper.dev>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, oystersuki <oss@oysterdaisuki.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amd/display: Store the AMD VSDB version for DP sinks without Replay
Message-ID: <ja6uA6zTorLKM5Utwn3SZsVJYS6parDKb8I9AwY2t21BGeMYuiVKfTcnUvYaWc0VMU_wZXB9pGX0jZrXyRJVPD7veKcrRrGFyPMB97NgdQE=@protonmail.com>
In-Reply-To: <20261119032758.3857304-1-Wayne.Lin@amd.com>
References: <20261119032758.3857304-1-Wayne.Lin@amd.com>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: c508f0d8d8269e25b7a576da45d52801e17f0888
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Wayne,

Thanks for the quick fix. It's the same hunk as in Cooper's v1/v2.

I ran the amdgpu_dm KUnit suite on amd-staging-drm-next 8dd68a79583a
with this change plus the i2c_xfer test fix, so the suite runs to the
end. dm_test_fs_caps_dp_vsdb_version passes again, and all 1931 tests
pass. I haven't tested it on a DP monitor above 255 Hz.

Tested-by: Eren =C3=96zen <erenozen@protonmail.com>

Thanks,
Eren

