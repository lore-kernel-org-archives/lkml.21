Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011111;
	b=luanZtSMMC+yb+p0NZnfw4UWDVJ00iD9vclPSbAhrU2ORPYY54hTMgtMz5KL6hagMc1A
	 7RAAa2+h5xt/2WDM1nnbEZLT1hdj+XluUWNKXcCHtUXO1CzJWvHmR39UKCn9SMviTCMYE
	 5bGRGYKrxIL+ZhkPlCAhFJ4Ha+t3/rgw2+3VeR4ytViZOA52OE8/rHhtzl3WWnM7/LJ9n
	 kLTKSv8/JAZMIIVn54NRpff+Cnyx34DML96eqg6BTu/JedOvBhw9/DT/opFktuMo2u17e
	 Ke1EKMTy4MsCCNQ0SSGwMO3XB9I7wMmCOXej83UwoaOLy0GtAVOGMUzOBm2DJtniOSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=Rp2mWfoZ0Fr9qmWrwsvI2wZ5ngnq+A8EaS/yiZ5bDPRsvTzVWcqWP1pFCLryuM4otiWS
	 i8YhZuul19OM2htqt7j3JmHLBoijW54Ij16qc+rNeiNWbyVYm3IymFZyBMAPJYBeS0VP/
	 Jcr/754hTh3Y0s+glWVVkpNYu85yKvpeoAWeYYiE0XmbhL1/cdoliRmCxDFSxWc9gPEys
	 lDQ6OYpkg2lwwNCYT8XGzLQJu9MQN9Jnsj6IEYWSR8LV3KAhgHVX4d7k8PySXyzLtkA1Z
	 kUPnbCZfC5ZzZE6vKo+LmAsxb+uUsLVNAuSQFFeC8fq+eO4lMlND1kZxPiRYY352cAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5rSQlMu;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C261460A2610
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C261460A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D5rSQlMu
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso1574939eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795011110; x=1795615910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=D5rSQlMuKLE1uUJvwNLZqV6+Ba0MLRDiUSgHSsO6W02whCYvJFWEnDKlXIqAWWCunf
         pqyG1mAgrqURNAnvFSZnuYKXEAn0XhMYTb03ighN20qXOXEYYcwfpdiRM8laMwLegE+w
         2rBq+voJWnjxTP0xEy9gpbyGQI3FhxqEHkWgeq81Zjcvh0/FE0hedh0jKMmPsxTPTyMd
         N9UXQaQtt6y+bg5DqvNtPKSQxTgWDYZiMVmpMXr69Ef/IRAhHawOGi8e3Vha/XvXroBK
         52FHIsdlQxgkfCJKGFqrhX/fVnG2U+3ul5d4uUiRTO04wuwKKXS1ImLupmJd03MXdjGu
         Kfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795011110; x=1795615910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=hv/7DvCUM+MqJ/CkKbeI6nkXSgJ+ckAoyFw0jRtdnVEQ5ntHwjJczoScmST7mBegX7
         u4mWWVCwlr4CjoTmK3uSrDw806HMTzqClvLnQ6Nw/ZImB1xf390JaxHEMaTTpLRNeJtw
         SrfQcQMpb50+dY/tbluqlU5YYbX2qX/x1zWnGgU/nIoTZRvO7yIcGlIfOf9t+6EyTaje
         1DP+uJnwMsvQ+r09e0GuxoOBqyrsSmAjknwaMN1egR/ySDyQPLWTrOmm5L+GaC12yTsy
         O1qC043H6pY2MvCd6nUn+cbHG3rxbtoiGiXKQ7/y13lCDzLLqJRACK0C9KluYKp88MwK
         +ZFA==
X-Gm-Message-State: APuU4Z/SfpDrD32If5CE/KVvVLrsTmFOPw8wcEjukR6ddXbIYQnL1FCs
	m+vNqWEZwla1JEqGASM9sgyKhE/s1uyHwv+w7FZXqadfIu/ZKekB5++R
X-Gm-Gg: AZFdTZe9bq81Xon4H9I10t7V3touWnuwajTYUEsu9QwLZWY/iJ5HQqIkY6IKbLbPZI2
	brCOqfpSK8nxJnPKj8xxIyJz2XwfhzfgIPri+wjRusMWbWeFuEcCVMNghaI/8lGeVuP+OclMS+r
	gckD00JvL0Yec5yV0PglVH7Sbf7qayfPdvPFqwmQey5aTvG3YU8fqEktg+L+wCeEJaeGyuVKM3P
	Nox22hTcv2aRLN1AiO3mnPQiBTOKJgdV3yZirhHfDNrYHJ6wF7l1nsSTFIiYMtdhxIH/MKg6292
	t6SQTisygtXdkoSBkF+2lDjaHmmA9KNHBqgIGptcomqkcyokeYr2hglUlE/Iu3uL6vgTZLGyk9Q
	J/ME+3Nh8PNfcmg/l1aKBV6A+dhOoUHiQSmXLMn1e/9vieTD8joAyChyWFsU/xE6E/uTlo7wdDs
	BqRhKgbCfanrYIy1eKegjBZRoSDnmnzGeZOOS7QOFJ4LOq/G78lokIjBBWPXrOG+FLOnpqjnhV6
	FjEfOckosVMuSCd0l8i3Mm1rfrbgWVCmuVhPfMtQLTSdl8yCz+O/tVxlc4MMREv4DFo55p/kfXl
	chocvmIwDVc9NW9gRFGY0jldo5RrDrEtnQ8XPhXV1LRvi+zDJTiH
X-Received: by 2002:a05:7300:de4c:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-3828101de20mr2859774eec.20.1795011109256;
        Wed, 18 Nov 2026 06:11:49 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304ff2sm8414678eec.6.2026.11.18.06.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:11:48 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: core: Validate card indices in lookup helpers
Date: Wed, 18 Nov 2026 14:11:14 +0000
Message-ID: <20261118141114.2709-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0aqwbbu.wl-tiwai@suse.de>
References: <87y0aqwbbu.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
