Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795237538;
	b=i3/iCnSGKneZ/amqpD0TxCmxl220LvjAYlJXym9PeKgMTSbSqH4zfCkjWrkjM92tkkvY
	 sWCCCrx13YWyEx0uasFNZ/xkpeIz+fcxaI1oeKqupRGe34Iz/AKSRJsFWh1eUfLzpao+V
	 gXPsEguLDeRq6ySDg4adJa/8XcZLrr9E2Gj31vdgtYh4pj9JOOB0z/9p20yvMGqPHzNil
	 shzMSDQITEZx4Crss24KWfUzEMvVLB6zR/LLlB92J7SjI2pyNy/TMMsqNz4GRlMzpHFwr
	 hStIfvbROI2KY5FNxmlByYlHY6kZg9ZFKbd4FyrHu9Ori0uXGyR3DB+L5kiIpPCTFNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795237538;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=G1FP/mrEv40p41j8+397M2J3HIaMmil9yAF1/nARBgI=;
	b=XL/pz3qcdLM6TJpEQ7KMfQRucNMB3RB1dugMHcihLsCWJYe97s5ZxF7TwRKTWOzmo53t
	 0/w2VuO+WDKApkLbf3lXzB0Lpe92c1dTb1vYqAienqAbwehanCJfdiUjOYq/8or7bEP6I
	 UqN1g1rH+wMN8g4sIwZ//2ofKokRVOrZKYR23E9OZglIqHuYEuZZwBxQuskDH3yCW8gLh
	 zLHLvTL9o7NIkqCj3WecZ28RHeeqDZFXMKlLK2AxSVg6zvbBl7daAN68nJcGVpnowFPpA
	 4jfCfIi+anaCDNMGrdCIXsETYjESQiEFjRjaUq3qdfoRfio8JUIxCs1KmqLEZzKQWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W0tZ/1AJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A7606A6AE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0tZ/1AJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4325F1F000C4;
	Sat, 21 Nov 2026 05:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795237538;
	bh=G1FP/mrEv40p41j8+397M2J3HIaMmil9yAF1/nARBgI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=W0tZ/1AJ/3zHB4BB4M7MvFj/nwBpThOA0foEafTK0YQdGqnTJEHg/iuPvEZNo1RgJ
	 VGxLkd8MvqQhGMPxnJPwT/MHpgdrxvdKaJZx6JS7FoTZUumbzil1BwyJO9wOiNRwL4
	 L8/OaZm1InaX8CAzpMwY23vtd7IvIraQqWBDmRGUA7EhioFDkbY08owuVY89BrhUFu
	 I9rwo8TISMV5LC8kwrQs+/rL/PqfVtzCuTiO9n5ZfUSFL6cTyRJgPA7MD6Rsi4CFJf
	 VZTRvATKwEc4MOCGAsYcChORZ2i4LsfApNBg7QeMcAuxEGKSHfe82BCe2DBCDbFRit
	 PMmZCGzSS+yGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A4D3380AAFE;
	Sat, 21 Nov 2026 05:05:38 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty1FBin9jGz8CoumpTTBOe-LB_Qs5RNn_uMJMbMGTYmyQ@mail.gmail.com>
References: <CAPM=9ty1FBin9jGz8CoumpTTBOe-LB_Qs5RNn_uMJMbMGTYmyQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty1FBin9jGz8CoumpTTBOe-LB_Qs5RNn_uMJMbMGTYmyQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-21
X-PR-Tracked-Commit-Id: ce29b8f9fb606f87014c2d05483a3fef05a11f38
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c44104f3642da720164042623e4832836aefdd8e
Message-Id: <179523753687.934029.387954530225891606.pr-tracker-bot@kernel.org>
Date: Sat, 21 Nov 2026 05:05:36 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The pull request you sent on Sat, 21 Nov 2026 08:35:51 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-11-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c44104f3642da720164042623e4832836aefdd8e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
