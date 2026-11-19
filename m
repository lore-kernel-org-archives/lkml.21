Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048899;
	b=A3FmKaStRF1kESmwD3vQkDaqzsSZwLklcoenP+NuA0rzPlSln6nXQGEPbJjlBX9tZSei
	 yPOV6BXnmRTfAbZjTJgji0aDL4dOf1EHfzldfjkvxRGU0taCtw2PqWx3IG4ca9tl5FWAh
	 RsL2UTGB3JZl4Z0Z9Tp9yowPsui/smq8kTgVmkwv2E7Q4Z17JsyHFP9hdPLknDvnZ4ne2
	 5gO+dnUYNftwzgAPv5RonMAoUyVNCZ2GKwpYa40nTnTveUWFwoxNEetzPjMuJJpIIETcD
	 NYBp29MVuSo5Ln2Mj7ZtcEpq9J8lQ28QBCDia9NfAlIuuJo5BRzWulnXvOan58bLi4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
	b=l8bLDemDlC4EM62R/1iIZ4e1NF4iZfuBZW12yEspYg94FP7A16F9Wi0U3V4aPEJmkne7
	 sHJYS9YkkPcHQzOGHowSFqMZFSIonZ5BBVkR1i7SOwpCSkvQpgBWQUz+QDhotS5TdXvkt
	 yaXF018a1eISB4N1S7Y1RaOl3uQHxtfMgwF04LrI8bwE+I8iYYsJAohZQcAeK2+uvi/6R
	 qihpEF3wxIi0y9Emj3WJvmJbMc5+WS1JHtkSQOx1ZFFJwYaUry/A9gipz9n+Ez1vALfdg
	 dcDkAXjA67xZcJWojBLujviMY/8sWGUnFituTjgcpbfT0saCZ4+iDQCK+MtmBkQ9TCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC595606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC595606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GOb+xqyL
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50686daf9cso40594266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048897; x=1795653697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=GOb+xqyLz68ulwX34svmLuibUnhYeJMs1CyRXVUiqptI/WC/pbUF7RIT3eSlVHgdVx
         bboW1nx1d1MzTPJLg8vDngDHQ+uH48Z46LoaHcNovFnEGEFip+CUPxlOzcZERklA2/OL
         nXE/VultkctCKfo21K2EbImQT6/aamY0EuvGAnk6Bjt9YVRE1Aq+v3FJyl+tgbUOB85o
         voyZUA9FKUClvOI9597Kux2e+uN/ghvWdtZTbb8pS7NulrYMpcAtY36GF3Y/ZbfSw3KL
         6rG4gSASL+/We76JNOwN4vn8qlzKOeE3Qu03obXV4OfaOeVrY99ts9oxYJfEJUzdO66a
         LsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048897; x=1795653697;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvBatQBYMyCCrwFYx6ixL2SoWI3yMG92pdP59Av2nhY=;
        b=iNKp7R92endFOFOgS63Wu5y/qqwQWwNhZ1WxRsUTFs/3gA5T0yGJa2yXtNqY41TBGc
         Mp/9dJ+QbJ5bE2Kxoyx9XYESI304N06LLUP65tW7r0iwPUtu7v47BZ2T1wsnsdr8XVKg
         AXvBXtXELFTpb3HknM6AZh3fTcHdC22njgrqZOMjSQb3X0P1mZxfiCpp2rEJ5o5CqxaS
         aC7Xp2E+AGeFSJitthiqid8WELHSYhBfaJUIVum54GfyvBRT9ffjZIIRpypXfmFiSy0Y
         Agr7f13ni0eJ4AEVZgbBqLQWywMCF81qaeewO48WF9BTHlQVcHP5DjEbn8eiTNOmjpUJ
         Wzng==
X-Forwarded-Encrypted: i=1; AL+hErE4Wl2xip+fSaq0u947Bq+gR28C4Pp80acDm1Jtyb/IAY23BxXGN4FRR9Qy0XzMFUA/IhQIuIQduYaqE+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q+QwjYQSmWV7L21QZc7bzZMq7HEZVJ8Z/1hIdhT9iXcJirt83
	RojXvHvwuwYeiH4zDIbza2m7CAyCvl17bNaRgelhb3FFayOB29YiXxAc
X-Gm-Gg: AYBFou0HSWHyzx9jIeYkNBQ7U6Kqsn7XumggCt/VD4/rGeCQml4cXAcJwmdq7vnphky
	7Z2KDr2IFZMOGwZOWOwKr5i74iMJ0APtvB+Wa6oidGz/LWtQGJ2fCz+oBK1xWhACQblY5onMier
	rdXscHTG4efLMCLCkOD2UgddUxBfcJsa0nEix50QUTkPk7LLUDTwnRs93CXJTmqCaTLROoFL/gk
	1rhAula08NStgzJDOY1P1IHoIBlYN8V64mHo+VEM5YGY7DMgaK1SQwv+QNLqvxYyx3FacAuAsxN
	FCK8K9yOfnoXCYykj703SnMzcagahv6eJm+7Mi1fpiLWJrXx2LLYm2jZ0kRM47o7OT71MPSqyVX
	2LQk8SdbLHFFUzwcu60k2LxWrzDFOaUGW9veHgUBwMAnXlG61jop+v1jN2qIjt02OPJyg1/mZ+7
	/XoWDV5PaT6rNmCIrAJhi4b5WjbpZf4RkIfkFNMWtPBC5nETCoKnftTkWpQhaQLg45q6mTxpcD0
	QoVqNuFn39wCTxet0RevZRZt22i9UnmSpwyUn2Tze+rJ5CxX1Csm8XJub5oIKu9UYYxUFrUIxeQ
	ff4Yxf4ajOBHHcBAhjvmSyPSjDb0fwlEH29t55BrSDD55WZh198=
X-Received: by 2002:a17:906:2a12:b0:c51:269e:5c7b with SMTP id a640c23a62f3a-c51269e6306mr85283766b.4.1795048896973;
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.74.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51234d2159sm52803766b.78.2026.11.18.16.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:41:36 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: kuba@kernel.org,
	tianyi@cloudflare.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH net v2] selftests: net: veth: propagate channel-check failures to exit status
Date: Thu, 19 Nov 2026 01:40:56 +0100
Message-ID: <20261119004117.41043-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179486580141.3136.15559598598860423821@kernel.org>
References: <179486580141.3136.15559598598860423821@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Mon, 16 Nov 2026 21:50:01 +0000 netdev-bot+sashiko wrote:
> - [High] The fix is incomplete.

Legitimate, and already addressed: the three bad-setting checks
gained ret=1 in v3 [2/2] (also spotted by Tianyi during review),
restyled to if/else in v4 [2/2].

> - [Medium] Because chk_channels() now sets ret=1, the "setting
>   invalid channels nr" check at
>   tools/testing/selftests/net/veth.sh:467-468…

Good catch. Fixed by [3/3] in v4,
which attempts max_tx + 1 from the kernel-reported maximum
instead of nproc + 1.

pw-bot: cr
