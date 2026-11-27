Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821516;
	b=CnVxUapWBmqAewXbbwQGpBz3Pjewei3KBwMC1VluGz8ZSNQ8T0RC7KjFU54/ui5DgxbI
	 zXLiEM8jX4Pydi5LssljdZxFv2IyVX4WhfLxRLJt0wlFCX6hDRVJ63lSZR2PfLmR9mNoJ
	 bR9JrjSVHImnKDwj9QFLDpmr0eL5QXjK7RKYHhWpjaky7EOwGdGjqwEyDtOwaidAd8A4W
	 5Z1Q2P6EkN1XvYx0ObxLJ4PMnoAyaJOkoQzJChSxJhcC5Mo4ZLz197reAn/x3jVoKfwVU
	 efhBYuTvUrveoBf/n74KGOMN+oRhmRTMWYwz53OeedWlE+0D9fgB4Vx9Bi9Jd59x4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=;
	b=Dm8KCMUqZ5r9t5xiVWYFdb/iT8Q052AJffpyD/ERNoieemeXdRA1ZhP3UN8mxnkz1zIy
	 j73KrDVAMP6lEb063qkKnaeWnWW1LQ5ofm4SqUIWPpDQ2Zc+Y8sfTe7ubb7kXsmbtSFSO
	 VDMP4gupaaE+P21MmFJhpS0fsV5Gwnit9p0ZGs0Z3+RvYPpFP4VEcDPx9vERaltk6xOz7
	 jCwiTrLN890swejSop6vJU3g/HGgpfafB1R3ZfxHogebKT/4RDUUrq8i2KqJZg5RVmBZT
	 UYZxp4TMcKYKDULitKxEeMtPZH6MT+omorGpl1DLsgagr3GW9L8JNgPSb9KFVSnZI2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gE2gqa1H;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EA4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EA4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gE2gqa1H
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so6087229f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795821514; x=1796426314; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=;
        b=gE2gqa1HASDlw4HLZWgBBQWSdvUizr9GH8J6QVL8nNPedx6uB61BV+HUrF6Wuyw/BB
         PcA6z+0Uj48zloEWvjEtcqzJ6IyjLWGQdrBFlb9TfOIALwBJmsi9FopHkiOS+kS0Zkuq
         lXR9jkjMff8XjBdzfe9l+t1Ajy7tytED3MNkSNa5U+qORRIxgJl/MZxYtBhsyHaL+hu2
         rfA67xg5fPpRqOtfSCJbWRjoq1vy3/2eACqpJWjP/ndPBC0iOXPGzPDFNi+qvLOYCeIM
         TnX4kg0P9GQQjDzUxH9rCeI2O8r7iWh5FFSvfJ2RcZf1Az9ApjNXvlcgLK5AyXr+P9B/
         WR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821514; x=1796426314;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L68NfkLh2sSnkPajUSfsYj9MfFaavbba0O0y/vWyU0c=;
        b=Y+d5HqBJZb+lFtkqgc9w/9rKQ/gU+5VuIdWXgf+oMC4wye87beM6vB6nhUMQ51P747
         R5slQPWHPMNea9tHSe5WKHqUTYFi7KrOdEfJH8rjvk/C7qiQx5WEpkNUqOUddNp8g0gZ
         BBO0NDOyESfz6oTcTfVeCplCBlxpX4ZxyfZRIXgI12riwi0zqqv5LJUOXfLUIqdBGfOQ
         PpFUd6T+VqaWm/3KPdU+icOLFTHW1b0926YuZKxg8Oob5O/bAK+jDaM9MhhqLFjQGE2C
         ndlLzc2x0PDNkB1byhRZqWD+AJBrh9Gpm4hkLEdVxjKgOVWii9DSJzvYF+al82F3uYsi
         HnRw==
X-Forwarded-Encrypted: i=1; AL+hErECrAb1eYlW1R8Qwx9cLU+XsAJx+6iBh+gG+HgRnz+I6NW68j2OBnSDZSs3OYsPFf5Oll42OrpgDKeg3jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yfiQ7bWgHKARu2v2n9tPJUdXPvFAPA1lsL/3UHPDSrRVFz2lA
	eydLSbxOgZdob7UYEVzLiNuDismK1ZyOwMPcLQy6Jb0PGGkFvAwmYwbzbmME0FG4i7Q=
X-Gm-Gg: AZFdTZebyYCuMMcRFYjy5aNxdaKu7us3IBin+PwxPXIlD7Dhq6MqLR4goL0e5cJvaaE
	ann+WnVWpnwIGWarc6za6XYZvF8OQmfPF1cJU/GE2MKe6tD8Dn8Hoi+TAAKriLz/FWh2NB/3iEL
	cmJ3j3PM5lMXqqAT7/W7gMt4sdtnh2SprXj1UdWFxzSsH1c25Ubzcu+Zcl/l7a8JnzaljlunGL8
	ohnqsfeJHUrWb5+e+8NxpzUjxJ86PzgsS3/PTxOnw4iqTCp7oj1R+2tXbrCAoZXchQKTh8yxgk/
	O/Z7AvAIbDdQp9Tvn1Sk6b7Ucld2Us9Ap6omeZevqu5/VXMoNXeG5tn6OVTBkpgD9kzWq0sAkD/
	z0FWFNsHVkYNmLZ6pfraBEyK3w+fR5sbHjbPQEJxG8c6tLMxbqzjH7uQdOahWs/243dfL9aQoLW
	8/aHbmfM5GLbvMkQvL0kzkCzxrS2AHv78+sWfmvsbql+cE2cgTHGrDa077gQu4oE8WDEiEC8qVC
	QFfnl1g+NNXHiiOKHeDUQmb85W8wpKhTJnTwX70vAu05KmLIGqYlDmM4u4zHb9W6Kt4A1dY4gdb
	Bm1A7KyNgQEq2krvdnEiThxOUe0=
X-Received: by 2002:a05:6000:2b8e:b0:491:45bc:d69a with SMTP id ffacd0b85a97d-4abb3f158c5mr33838415f8f.44.1795821513578;
        Fri, 27 Nov 2026 15:18:33 -0800 (PST)
Received: from [127.0.1.1] ([151.42.79.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm49822762f8f.41.2026.11.27.15.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:18:33 -0800 (PST)
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
Subject: Re: [PATCH 04/13] mmc: meson-gx: Fail request when descriptor
 chain DMA mapping fails
From: Valerio Setti <vsetti@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261123191703.179283-5-lee@kernel.org>
References: <20261123191703.179283-1-lee@kernel.org>
 <20261123191703.179283-5-lee@kernel.org>
Date: Sat, 28 Nov 2026 00:18:21 +0100
Message-Id: <179582150150.1958718.8445295799895434689.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=8BHON/4l5h6q1xjm/WKKH4SM6biaPJLVHJzVeZlzOuU=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDNlc/Ef1ln9ojoqOfGmv63j0Za3rE67Ytoe1i3aea+zbk
 Xl4U/HOjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEykKpHhv/skRnH3ZWsKxTbM
 FxcprJMXFZi7cAO3n97ixSuES+q0PzAyPN0r92Wbun/44eYT/FZf7qt8Piy7m+G/VFx8vqJM/Qc
 PNgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

On Mon, 23 Nov 2026 19:15:48 +0000, Lee Jones <lee@kernel.org> wrote:
> meson_mmc_pre_req() flags eligible transfers with
> SD_EMMC_DESC_CHAIN_MODE before mapping the scatterlist with
> dma_map_sg().  If dma_map_sg() fails and returns 0, meson_mmc_pre_req()
> logs an error but leaves SD_EMMC_DESC_CHAIN_MODE set with
> data->sg_count equal to 0.  When meson_mmc_request() subsequently
> dispatches the transfer to meson_mmc_desc_chain_transfer(), the
> for_each_sg() loop executes zero iterations and
> desc[data->sg_count - 1].cmd_cfg writes to desc[-1], corrupting memory
> immediately preceding the coherent descriptor buffer before starting the
> DMA engine.
> 
> [...]

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
